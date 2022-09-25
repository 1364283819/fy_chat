<%@ LANGUAGE=VBScript%>
<%
Response.Buffer=true
Response.CacheControl="no-cache"
Response.AddHeader "pragma","no-cache"
Response.Expires=-1
username=Session("fy_u_nickname")
if username="" then Response.Redirect "chaterro.asp"
useronlinename=Application("fy_c_useronlinename")
if username="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&username&" "))=0 then
Session("fy_u_inthechat")="0"
Response.Redirect "chaterr.asp?id=001"
end if
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
t=s & ":" & f & ":" & m
sj=n & "-" & y & "-" & r & " " & t
savetime=Session("fy_u_savetime")
if DateDiff("n",savetime,sj)>=15 then
Response.Write "<script Language=Javascript>parent.f3.location.href='savevalue.asp';</script>"
Response.End
end if
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"
%>
<script Language="JavaScript">
var winbgcolor = parent.cbg();
var winbgimage = parent.cbi();
var f3href=parent.f3.location.href
var face = parent.readface();
var showname=true
var http='http://<%=Request.Cookies ("http")%>f3.asp'
if (f3href!=http){
var showname=false
}
if (showname==false) {
if(parent.document.URL.indexOf("file:")>=0||parent.f2.document.URL.indexOf("file:")>=0){parent.location.href='chaterr.asp?id=001';}
var crm="<%=Application("fy_c_chatroomname")%>";
parent.f3.document.writeln("<html><head><meta http-equiv='content-type' content='text/html; charset=gb2312'><title>在线用户列表</title><style type='text/css'>");
parent.f3.document.writeln("body{font-family:\"宋体\";font-size:10.5pt;line-height:135%;}td{font-family:\"宋体\";font-size:10.5pt;line-height:135%;}.p9{color=FFFF00;font-size:9pt;}A{color:white;text-decoration:none;}A:Hover{color:black;text-decoration:none;}A:Active {color:black}</style>");
parent.f3.document.writeln("<\script language=\"JavaScript\">var NS4=(document.layers);var IE4=(document.all);var win=window;var n=0;function findInPage(str){var txt,i,found;if(str==\"\"){return false;}if(NS4){if(!win.find(str))while(win.find(str,false,true))n++;else{n++;}if(n==0)alert(\"您要的名字没有找到！\");}if(IE4){txt=win.document.body.createTextRange();for(i=0;i<=n&&(found=txt.findText(str))!=false;i++){txt.moveStart(\"character\",1);txt.moveEnd(\"textedit\");}if(found){txt.moveStart(\"character\",-1);txt.findText(str);txt.select();txt.scrollIntoView();n++;}else{if(n>0){n=0;findInPage(str);}else{alert(\"您要的名字没有找到！\");}}}return false;}<\/script>");
parent.f3.document.writeln("</head>");
parent.f3.document.writeln("<body bgcolor=" + winbgcolor + " background=" + winbgimage + " bgproperties=fixed>");
parent.f3.document.writeln("<div align=\"center\"><font color=\"#FFFFFF\">"+crm+"</font><hr size=1 color=FFFF00><div align='center' id='UserMsg'><FONT color=red><B>0</B></FONT><FONT style='FONT-SIZE: 10.5pt' color=blue><SPAN class=p9>(0)</SPAN><font color=#ffffff>人在线</font></FONT></div></div>");
parent.f3.document.writeln("<table width=100% border='0' cellspacing='0' cellpadding='0' align='center'><tr></td><form name='search' onSubmit='return findInPage(this.string.value);'><input name='string' type='text' size=10 onChange='n=0;' style='font-family:宋体;font-size:9pt;background-color:008800;color:FFFFFF;border: 1 double'> <input type='submit' value='查找' style='font-size:9pt;background-color:FF9900;color:FFFFFF;border: 1 double' id='submit'1 name='submit'1></form>");
parent.f3.document.writeln("</td><td id='showlist'>");
}
var msg='';
var onlinesn=0;
if (face==false)
{
msg=msg+"<a href=javascript:parent.sw('[大家]');>大家</a><br>";
}
else{
msg=msg+"<img src=face/1.gif> <a href=javascript:parent.sw('[大家]');>大家</a><br>";
}
function tm(str1,str2,str3,str4,str5)
{
if(face==false)
{
msg=msg+"<a href=javascript:parent.sw('["+str2+"]');>"+str2+"</a> <font class=p9 size=1>"+str4+"</font><br>";
}
else
{
msg=msg+"<img src=face/"+str1+".gif> <a href=javascript:parent.sw('["+str2+"]');>"+str2+"</a><br>";
}
}
function md3(str,str2)
{
parent.f3.UserMsg.innerHTML="<FONT color=red><B>"+str+"</B></FONT><FONT style='FONT-SIZE: 10.5pt' color=blue><SPAN class=p9>("+str2+")</SPAN><font color=#fffffff>人在线</font></FONT>"
if (showname==false){
parent.f3.document.writeln("</td></tr></table></body></html>");parent.f3.document.close();

}
}
<%
online=Application("fy_c_onlinelist")
sn=0
for i=1 to ubound(online) step 6
if online(i+1)=username then sn=sn+1
if sn>1 then resposne.redirect "chaterr.asp?id=001"
%>
tm('<%=online(i)%>','<%=online(i+1)%>','<%=online(i+2)%>','<%=online(i+3)%>','<%=online(i+4)%>');
<%
next
%>
md3('<%=Application("fy_c_chatrs")%>','<%=Application("fy_c_active")%>');
parent.f3.showlist.innerHTML=msg
setTimeout("this.location.reload();",128000);
</script>
