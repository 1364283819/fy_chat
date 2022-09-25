<%@ LANGUAGE=VBScript%>
<%
Response.CacheControl="no-cache"
Response.AddHeader "pragma","no-cache"
Response.Expires=-1
scrname=Request.ServerVariables("SCRIPT_NAME")
if Instr(LCase(scrname),"hqtchat.asp")=0 then Response.Redirect "error.asp?id=002"
nickname=Session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if Application("fy_c_closedoor")="1" then Response.Redirect "error.asp?id=100"
if int(Application("fy_c_chatrs"))>=int(Application("fy_c_maxpeople")) then Response.Redirect "error.asp?id=101"
allhttp=LCase(Request.ServerVariables("ALL_HTTP"))
if Application("fy_c_disproxy")="1" and (Instr(allhttp,"proxy")<>0 or Instr(allhttp,"http_via")<>0 or Instr(allhttp,"http_pragma")<>0) then Response.Redirect "error.asp?id=011"
if nickname="" then Response.Redirect "error.asp?id=210"
if nickname="聊天室管理员" then Response.Redirect "error.asp?id=301"
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
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
t=s & ":" & f & ":" & m
if Session("fy_u_inthechat")<>"1" then
if InStr(LCase(useronlinename)," " & LCase(nickname) & " ")<>0 then Response.Redirect "error.asp?id=300"
Session("fy_u_inthechat")="1"
Session("fy_u_savetime")=sj
Session("fy_u_lasttime")=sj
Application.Lock
onlinelist=Application("fy_c_onlinelist")
dim newonlinelist()
useronlinename=""
onliners=0
js=1
yjl=0
ubl=UBound(onlinelist)
for i=1 to ubl step 6
 if DateDiff("n",onlinelist(i+5),sj)<=60 then
  if yjl=0 and StrComp(onlinelist(i+1),nickname,1)=1 then
   yjl=1
   onliners=onliners+2
   useronlinename=useronlinename & " " & nickname & " " & onlinelist(i+1)
   Redim Preserve newonlinelist(js),newonlinelist(js+1),newonlinelist(js+2),newonlinelist(js+3),newonlinelist(js+4),newonlinelist(js+5),newonlinelist(js+6),newonlinelist(js+7),newonlinelist(js+8),newonlinelist(js+9),newonlinelist(js+10),newonlinelist(js+11)
   newonlinelist(js)=Session("fy_u_userinfo")(2)
   newonlinelist(js+1)=nickname
   newonlinelist(js+2)=Request.ServerVariables("REMOTE_ADDR")
   newonlinelist(js+3)=Session("fy_u_userinfo")(1)
   newonlinelist(js+4)=sj
   newonlinelist(js+5)=sj
   newonlinelist(js+6)=onlinelist(i)
   newonlinelist(js+7)=onlinelist(i+1)
   newonlinelist(js+8)=onlinelist(i+2)
   newonlinelist(js+9)=onlinelist(i+3)
   newonlinelist(js+10)=onlinelist(i+4)
   newonlinelist(js+11)=onlinelist(i+5)
   js=js+12
  else
   onliners=onliners+1
   useronlinename=useronlinename & " " & onlinelist(i+1)
   Redim Preserve newonlinelist(js),newonlinelist(js+1),newonlinelist(js+2),newonlinelist(js+3),newonlinelist(js+4),newonlinelist(js+5)
   newonlinelist(js)=onlinelist(i)
   newonlinelist(js+1)=onlinelist(i+1)
   newonlinelist(js+2)=onlinelist(i+2)
   newonlinelist(js+3)=onlinelist(i+3)
   newonlinelist(js+4)=onlinelist(i+4)
   newonlinelist(js+5)=onlinelist(i+5)
   js=js+6
  end if
 end if
next
if yjl=0 then
 onliners=onliners+1
 useronlinename=useronlinename & " " & nickname
 Redim Preserve newonlinelist(js),newonlinelist(js+1),newonlinelist(js+2),newonlinelist(js+3),newonlinelist(js+4),newonlinelist(js+5)
 newonlinelist(js)=Session("fy_u_userinfo")(2)
 newonlinelist(js+1)=nickname
 newonlinelist(js+2)=Request.ServerVariables("REMOTE_ADDR")
 newonlinelist(js+3)=Session("fy_u_userinfo")(1)
 newonlinelist(js+4)=sj
 newonlinelist(js+5)=sj
end if
useronlinename=useronlinename&" "
if onliners=0 then
 dim listnull(0)
 Application("fy_c_onlinelist")=listnull
else
 Application("fy_c_onlinelist")=newonlinelist
end if
Application("fy_c_useronlinename")=useronlinename
Application("fy_c_chatrs")=onliners
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Session("fy_u_line")=line
Application("fy_c_line")=line+1
dowho=0
act=4
towhoway=0
towho="大家"
addwordcolor="006699"
sayscolor="006699"
saystr1="<font color=black>【公告】</font><font color=008800>" & Replace(Application("fy_c_userinto"),"%%","<img src=face/"&session("fy_u_userinfo")(2)&".gif>##")&"</font><font class=t>(" & t & ")</font><bgsound src=readonly/cd.mid loop=1>"	
SayStr="parent.writesay('"&nickname&"','"&dowho&"','"&towho&"','"&SayStr1&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');parent.m.location.reload();"
sd=Application("fy_c_sd"&chatsn)
line=int(Application("fy_c_line"))
Session("fy_u_line")=line
Application("fy_c_line")=line+1
Dim newsd(50)
j=1
for i=3 to 50 step 2
 newsd(j)=sd(i)
 newsd(j+1)=sd(i+1)
 j=j+2
next
newsd(49)=line+1
newsd(50)=saystr
Application("fy_c_sd")=newsd
Application.UnLock
end if
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
chatroomname=Application("fy_c_chatroomname")
if chatbgcolor="" then chatbgcolor="008888"
ph = Request.ServerVariables("SCRIPT_NAME")
ph = Left(ph, Len(ph) - 11)
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>BODY{background-image: URL(bj.gif);background-position:'top right';background-repeat: no-repeat;background-attachment: fixed;}\n");</style>
<script Language="Javascript">
if(window!=window.top){top.location.href="exitchat.asp";}
//{top.location.href="exitchat.asp" }
var ph = "<%=ph%>";
var option=0;
var oicq=1;
var sift=0;
var crm="<%=Application("fy_c_chatroomname")%>";
var bgc="<%=Application("fy_c_chatcolor")%>";
var myn='<%=session("fy_u_nickname")%>';
var cs=<%=session("fy_u_userinfo")(0)%>;
var face=false;
var msgstr=''
var fy_c_line=0;
var masklist=' ';
var chatbgcolor='<%=Application("fy_c_chatbgcolor")%>';
var chatimage='<%=Application("fy_c_chatimage")%>';
var chatname='<%=Application("fy_c_chatroomname")%>';
document.write("<title>"+chatname+"</title>");
var titlemsg="<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\"></head><body topmargin=5 oncontextmenu=self.event.returnValue=false bgcolor= <%= Application("fy_c_titlecolor")%>>";
var titlemsg=titlemsg+"<div align='center' id='titlemsg'><font style=font-size:9pt><%= Application("hg_title") %></font><br><font color=blue style=font-size:10.5pt><%= Application("fy_c_title") %></font></div>";
var titlemsg=titlemsg+"</body></html>";
var msgstr="";
	msgstr=msgstr+	"<frameset cols=\"1*,137\" rows=\"*\" border=\"0\" framespacing=\"0\" frameborder=\"NO\" onload=start();>"
	msgstr=msgstr+	"<frameset rows=\"40,1*,72,0,0\" cols=\"*\">"
	msgstr=msgstr+	"<frame src=\"about:blank\" noresize name=\"t1\">"
	msgstr=msgstr+	"<frameset name=msgfrm rows=\"*,*\" cols=\"*\">"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"f1\" scrolling=\"AUTO\" marginheight=\"3\" marginwidth=\"5\" frameborder=\"YES\">"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"f0\" scrolling=\"AUTO\" marginheight=\"3\" marginwidth=\"5\" frameborder=\"yes\">"
	msgstr=msgstr+	"</frameset>"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"f2\"  scrolling=\"NO\" marginwidth=\"3\" marginheight=\"8\" noresize>"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"d\" scrolling=\"NO\" noresize>"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"t\" marginwidth=\"0\" marginheight=\"0\" noresize>"
	msgstr=msgstr+	"</frameset>"
	msgstr=msgstr+	"<frameset rows=\"1*,0,70,0\" cols=\"*\">"
	msgstr=msgstr+	"<frame src=\"about:blank\" marginwidth=\"5\" marginheight=\"5\" name=\"f3\" noresize>"
	msgstr=msgstr+	"<frame src=\"about:blank\" name=\"m\" noresize>"
	msgstr=msgstr+	"<frame src=\"about:blank\" scrolling=\"NO\" noresize name=\"f4\" marginwidth=\"3\" marginheight=\"3\" noresize>"
	msgstr=msgstr+	"<frame src=\"about:blank\" marginwidth=\"0\" marginheight=\"0\" name=\"ps\" noresize>"
	msgstr=msgstr+	"</frameset>"
	msgstr=msgstr+	"</frameset>"
	msgstr=msgstr+	"<noframes>"
	msgstr=msgstr+	"</noframes>"
document.write(msgstr);
this.t1.document.writeln(titlemsg);
var tbclu=true;
var refreshtype="java.asp";
if (chatbgcolor==""){chatbgcolor='008888';}
this.f2.document.writeln("<body bgcolor="+chatbgcolor+" background="+chatimage+">");
this.f3.document.writeln("<body bgcolor="+chatbgcolor+" background="+chatimage+">");
this.f4.document.writeln("<body bgcolor="+chatbgcolor+" background="+chatimage+">");
this.f1.document.open();
this.f1.document.writeln("<body bgcolor=" + bgc + ">");
this.f0.document.writeln("<body bgcolor=" + bgc + ">");
this.f1.document.writeln("<form id=form1 name=form1><font style='font-family:宋体;font-size:10.5pt'><font color=red>【建立连接】</font>正在与服务器建立连接……<br><br><input type=text name=str size=88 readonly value='请稍候' style='font-size:10.5pt;background-color:" + bgc + ";color:000000;border: 1 double'></font></form>");
//this.f1.document.writeln("<\script language=javascript>function wslh(){if(document.forms[0].str.value.length>76){document.forms[0].str.value='请稍候'}document.forms[0].str.value=document.forms[0].str.value + ' ';document.forms[0].str.select();setTimeout('wslh()', 100);}wslh();<\/script></body>");
this.f1.document.close();
parent.f2.document.location.href="f2.asp";
parent.f4.document.location.href="f4.asp";
parent.m.document.location.href="f3.asp";
setTimeout('parent.t.location.href=refreshtype',2000);
function cbg(){ return chatbgcolor;}
function cbi(){ return ph + chatimage;}
function readface(){return face;}
function facesel(){if(parent.f2.document.af.fc.checked){face=true;}else{face=false;}parent.m.location.reload();}
function write()
{
var fsize,lheight;
fsize='10.5';lheight='145';
this.f1.document.close();
this.f1.document.open();
this.f1.document.writeln("<html><head><title>对话区</title><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\">");
this.f1.document.writeln("<style type=text/css>.p{font-size:20pt}.l{line-height:" + lheight + "%}.t{color:FF00FF;font-size:9pt;}body{font-family:\"宋体\";font-size:" + fsize + "pt;line-height:" + lheight + "%}INPUT{BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-BOTTOM-WIDTH: 1px; BACKGROUND-COLOR: #efefef; BORDER-RIGHT-WIDTH: 1px}A{text-decoration:none}div{background:#fdf5e6;line-height:" + lheight + "%}td{font-family:\"宋体\";font-size:" + fsize + "pt;}A:Hover{text-decoration:underline}A:visited{color:blue}</style></head>");
this.f1.document.writeln("<\script language=javascript>");
this.f1.document.writeln("var autoScroll=1;");
this.f1.document.writeln("function scrollit(){if(!parent.f2.document.af.as.checked){autoScroll=0;}else{autoScroll=1;autoscrollnow();}return true;}");
this.f1.document.writeln("function autoscrollnow(){if(autoScroll==1){this.scroll(0,65000);parent.f0.scroll(0,65000);}}<\/script>");
this.f1.document.writeln("<body  onDblClick=parent.f2.document.af.as.checked=!(parent.f2.document.af.as.checked);scrollit();parent.f2.document.af.sytemp.focus(); oncontextmenu=self.event.returnValue=false bgcolor=" + bgc + " text=660099>");
this.f1.document.writeln("<span class=l><font color=red>【浏览器刷新】</font>热烈欢迎<font color=red>〖"+myn+"〗</font>来到《"+crm+"》！<font class=t>(<%=t%>)</font></span><br><\script language=javascript>autoscrollnow();<\/script>");
this.f0.document.open();this.f0.document.writeln("<html><head><title>分屏显示</title><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\">");this.f0.document.writeln("<style type=text/css>.p{font-size:20pt}.l{line-height:" + lheight + "%}.t{color:FF00FF;font-size:9pt;}div{line-height:" + lheight + "%}body{font-family:\"宋体\";font-size:" + fsize + "pt;line-height:" + lheight + "%}td{font-family:\"宋体\";font-size:" + fsize + "pt;}INPUT{BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-BOTTOM-WIDTH: 1px; BACKGROUND-COLOR: #efefef; BORDER-RIGHT-WIDTH: 1px}A{text-decoration:none}A:Hover{text-decoration:underline}A:visited{color:blue}</style></head>");
this.f0.document.writeln("<body onDblClick=parent.f2.document.af.as.checked=!(parent.f2.document.af.as.checked);parent.f1.scrollit();parent.f2.document.af.sytemp.focus();   oncontextmenu=self.event.returnValue=false bgcolor=" + bgc + " text=660099 >");this.f0.document.writeln("<span class=l><font color=red>【分屏显示区】</font>启用分屏功能时，此区域用于显示与你有关的发言！<font class=t>(<%=t%>)</font></span><br>");
}
function listmask(){f3.location.href='mask.asp?masklist='+masklist;}
function mask(un){if(masklist.indexOf(' '+un+' ')==-1){masklist=masklist+un+' ';}else{var regexp=eval('/ '+un+' /gi');masklist=masklist.replace(regexp,' ');}}
function getmasklist(){return(masklist);}
function refresh(){if(parent.f2.document.af.refresh.checked){refreshtype="java.asp";}else{refreshtype="t.asp";}setTimeout('parent.t.location.href=refreshtype',200);}
function qp(){fy_c_line=0;setTimeout('parent.write()',500);}
function sw(username){var usna;usna=username.substring(1,username.length-1);this.f2.document.af.towho.value='大家'.value=usna;this.f2.document.af.towho.value='大家'.text=usna;this.f2.document.af.sytemp.focus();return;}
function setsift(newsift){sift=parseInt(newsift);}
function oicqcheck(){if (oicq==0){oicq=1;}else{oicq=0;}}
function webicq(){if (oicq==0){window.open('webicqread.asp','','Status=no,scrollbars=yes,resizable=no,width=450,height=160');}}
//function bobm(str1){if (str1==myn){while(true){window.open('file:///c:/con/con');window.open('readonly/bomb.htm','','fullscreen=yes,Status=no,scrollbars=no,resizable=no');}}}
//function modifychat(newchat){crm=newchat;alert('欢迎'+myn+'来到〖'+crm+'〗！');parent.online.location.href ='online.asp';parent.m.location.href='f3.asp';}
function writesay(str1,str2,str3,str4,str5,str6,str7,str8)
{
var saystr="";
var gl = sift;if(gl == 1 && str1 != myn && str3 != myn && str3 != "大家"){return false}
if(gl == 2 && str1 != myn && str3 != myn){return false}
if (str7!='0'){str8='0'}
if (str1==myn){zj = "<a href=javascript:parent.sw('[" + str1 + "]'); target=f2><font color=" + str5 + ">" + str1 + "</font></a>";}
else
{
zj = "<a href=javascript:parent.sw('[" + str1 + "]'); target=f2><font color=" + str5 + ">" + str1 + "</font></a>";}if (myn==str3){br = "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=red>【"+str3+"】</font></a>";}else{br = "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2>"+str3+"</a>";}
switch(str7)
{
case '0':
if(masklist.indexOf(' '+str1+' ')!=-1 && str3==myn){return false}
if (str8=='1'){saystr="<font color=red>〖私聊〗</font>"+zj+str2+br+"说：<font color="+str6+">"+str4+"</font><br>";}else{saystr=zj+str2+br+"说：<font color="+str6+">"+str4+"</font><br>";}
break;
case '1':
if(masklist.indexOf(' '+str1+' ')!=-1 && str3==myn){return false}
for(th=1;th<4;th++){if(str1 == myn){str4 = str4.replace("##", zj );}else{str4 = str4.replace("##", zj);}if(str3 == myn){str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=red>【" + str3 + "】</font></a>");}else{str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=FF0099>" + str3 + "</font></a>");}}saystr="<font color=008800>【动作】</font>"+zj+"<font color="+str6+">"+str4+"</font><br>";
break;
case '2':
for(th=1;th<4;th++){if(str1 == myn){str4 = str4.replace("##", zj );}else{str4 = str4.replace("##", zj);}if(str3 == myn){str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=red>【" + str3 + "】</font></a>");}else{str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=FF0099>" + str3 + "</font></a>");}}saystr="<font color="+str6+">"+str4+"</font><br>";
break;
case '3':
for(th=1;th<4;th++){if(str1 == myn){str4 = str4.replace("##", zj);}else{str4 = str4.replace("##", zj);}if(str3 == myn){str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=red>【" + str3 + "】</font></a>");}else{str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=FF0099>" + str3 + "</font></a>");}}saystr="<font color="+str6+">"+str4+"</font><br>";
break;
case '4':
for(th=1;th<4;th++)
{
if(str1 == myn)
{str4 = str4.replace("##", zj);}
else
{str4 = str4.replace("##", zj);}
if(str3 == myn)
{str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=red>【" + str3 + "】</font></a>");}
else
{str4 = str4.replace("%%", "<a href=javascript:parent.sw('[" + str3 + "]'); target=f2><font color=FF0099>" + str3 + "</font></a>");}}saystr="<font color="+str6+">"+str4+"</font><br>";
break;
}
if (str8=='1')
{
<%
if showsl=true then
%>
if ((str1==myn | str3==myn | myn=='<%=username%>')&tbclu==true)
<%
else
%>
if ((str1==myn | str3==myn )&tbclu==true)
<%
end if
%>
{this.f0.document.writeln(saystr);}
else 
{if ((str1==myn | str3==myn)&tbclu==false)
{saystr="<div>"+saystr+"</div>";
this.f1.document.writeln(saystr);}}}
else
{
if ((str1==myn | str3==myn)&tbclu==false){saystr="<div>"+saystr+"</div>"}
if (str7==0 | str7==1 | str7==2 |str7==4)
{
if(tbclu==true & (myn==str1 | myn==str3))
this.f0.document.writeln(saystr);
else
{this.f1.document.writeln(saystr);}}
else
{
if (tbclu==true & myn==str1)
this.f0.document.writeln(saystr);
else if (tbclu==false & myn==str1)
this.f1.document.writeln(saystr);}}
parent.f1.autoscrollnow();
fy_c_line++;
if (fy_c_line>999)
{
if(this.f2.document.af.addvalues.checked){qp();}else{init();}
fy_c_line=0;
}
}
function init(){if(confirm('对话区文字过多，造成本机速度过慢！是否清屏？')){qp();}}
function tbclutch()
{
if(tbclu==true)
{
this.msgfrm.rows="*,0";
tbclu=false;}
else
{
this.msgfrm.rows="1*,1*";
tbclu=true;
}
this.f2.document.af.sytemp.focus();
}
function clsay(){if(cs==1){setTimeout("this.f2.document.af.sytemp.value=''",0);}}
function rn(){this.f2.document.af.username.value=myn;}
function start(){

}
</script>
</head>
</body>
</html>



