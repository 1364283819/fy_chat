<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"%><html>
<head>
<title>帐号管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【帐号管理】</font></h1>
<font color="#FF0000">【更改密码】</font></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　本聊天室不提供查看用户密码的功能，当用户遗忘自己的密码时，站长可以给该用户名设定一个新的密码，然后再通知对方用这个新密码登录。<br>
　　新密码只能用<font color="#FF0000">英文字母（a-z、A-Z）</font>和<font color="#FF0000">数字（0-9）</font>，<font color="#FF0000">不能带空格</font>，否则将导致该用户名无法登录。 
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccregcpassok.asp">
<tr> 
<td> 
<table border="0" cellpadding="5">
<tr> 
<td>用户名：</td>
<td> 
<input type="text" name="username" maxlength="10" size="10">
</td>
</tr>
<tr> 
<td>新密码：</td>
<td> 
<input type="text" name="newpass" maxlength="10" size="10">
</td>
</tr>
<tr align="center"> 
<td colspan="2"> 
<input type="submit" name="Submit" value="提交">
<input type="reset" value="重写" name="reset">
<input type="button" value="放弃" onClick="javascript:history.go(-1)" name="button">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
