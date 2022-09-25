<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<7 then Response.Redirect "manerr.asp?id=240"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=241"%><html>
<head>
<title>级别管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【级别管理】</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　７级以上可以执行升级操作，最高只能将别人升到５级；<br>
　　８级以上可以执行降级操作，最低可以将别人降至１级。<br>
　　站长（１０级）可以任意进行升降级，当把某个用户名降为０级时，则该用户名被禁用。<br>
　　所有升降级操作都必须输入原因，并会被记录在聊务公开栏中。
<hr noshade size="1" color=009900>
<div align="center"><a href="mangradeup.asp">【升级操作】</a><%if grade>=8 then%>　　　　<a href="mangradedown.asp">【降级操作】</a><%end if%><%if grade>=10 then%>　　　　<a href="manupdowngrade.asp">【原有版主级别调整】</a><%end if%></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
