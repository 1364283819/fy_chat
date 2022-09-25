<%@ LANGUAGE=VBScript%>
<%
Response.CacheControl="no-cache"
Response.AddHeader "pragma","no-cache"
Response.Expires=-1
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"
%>
<html><head><meta http-equiv='content-type' content='text/html; charset=gb2312'><title>在线用户列表</title>
<style type='text/css'>
body{font-family:\"宋体\";font-size:10.5pt;line-height:135%;}td{font-family:\"宋体\";font-size:10.5pt;line-height:135%;}.p9{color=FFFF00;font-size:9pt;}A{color:white;text-decoration:none;}A:Hover{color:black;text-decoration:none;}A:Active {color:black}</style>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed" topmargin="20">
<p align="center"><font size="3" color="#FFFFFF">屏蔽讨厌鬼</font></p>
<%
username=Session("fy_u_nickname")
if username="" then Response.Redirect "chaterro.asp"
chatsn=session("chatsn")
masklist=" "&Request.QueryString("masklist")&" "
useronlinename=Application("fy_c_useronlinename")
if username="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&username&" "))=0 then
Session("fy_u_inthechat")="0"
Response.Redirect "chaterr.asp?id=001"
end if
userinfo=session("userinfo")
online=Application("fy_c_onlinelist")
s12=Application("fy_c_noshowuser")
sn=0
for i=1 to ubound(online) step 6
if online(i+1)=username then sn=sn+1
if sn>1 then resposne.redirect "chaterr.asp"
if online(i+1)<>username then 
if instr(1,","&s12&",",","&online(i+1)&",")=0 then
	if instr(masklist," "&online(i+1)&" ")=0 then
		msg=msg&"<input type=checkbox onclick=javascript:parent.mask('"&online(i+1)&"'); id=checkbox1 name=checkbox1> <font color=#ffffff>"&online(i+1)&"</font><br>"
	else
		msg=msg&"<input type=checkbox onclick=javascript:parent.mask('"&online(i+1)&"'); checked id=checkbox1 name=checkbox1> <font color=#ffffff>"&online(i+1)&"</font><br>"
	end if	
end if	
end if
next
Response.Write msg
%>
