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
<font color="#FF0000">【取消永久保留用户名】</font></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　请输入欲取消永久保留的用户名。 
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccyjdelok.asp">
<tr> 
<td> 
<table border="0" cellpadding="8">
<tr> 
<td>用户名：</td>
<td> 
<input type="text" name="username" maxlength="10" size="10">
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
