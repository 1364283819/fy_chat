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
<font color="#FF0000">【查询用户名的所有资料】</font></div>
<div align="center"><a href="manacc.asp">返回</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　请输入欲查询的用户名。 
<hr noshade size="1" color=009900>
<div align=center> 
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#E0E0E0" cellpadding="8">
<form method="post" action="manaccqueryok.asp">
<tr align="center"> 
<td> 
<table width="100%" border="0">
<tr> 
<td>用户名：</td>
<td> 
<input type="text" name="username" maxlength="10">
</td>
</tr>
<tr> 
<td>选　项：</td>
<td> 
<input type="radio" name="querytype" value="0" checked>
精确 
<input type="radio" name="querytype" value="1">
模糊 </td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" name="Submit" value="查询">
<input type="reset" value="重写" name="reset">
<input type="button" value="放弃" onclick="javascript:history.go(-1)">
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
