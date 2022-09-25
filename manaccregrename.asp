<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
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
<font color="#FF0000">【帐号改名】</font></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　本功能用于对自己现有昵称不满意，想改名的用户。请在下框中输入要原来的名字和新名字。<br>
　　新用户名只能用<font color=red>英文字母（a-z、A-Z）、数字（0-9）、中文</font>，并且<font color=red>不能使用空格</font>，长度必须<font color=red>小于 10 个字符</font>（１个汉字＝两个字符）！否则将导致这个用户名无法登录！
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccregrenameok.asp">
<tr> 
<td> 
<table border="0" cellpadding="5">
<tr> 
<td>旧用户名：</td>
<td> 
<input type="text" name="username" maxlength="10" size="10">
</td>
</tr>
<tr> 
<td>新用户名：</td>
<td> 
<input type="text" name="newusername" maxlength="10" size="10">
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
