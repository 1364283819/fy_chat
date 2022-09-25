<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
if Session("fy_u_nickname")="" then Response.Redirect "login.asp"%><html>
<head>
<title>管理<%=Application("fy_c_chatroomname")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head><frameset cols="110,*" rows="*" border=0 frameborder=0 framespacing=0> 
<frame src="manfunc.asp" marginwidth=0 scrolling='no' name="func">
<frame src="mansm.asp" name="main">
</frameset>
</html>
