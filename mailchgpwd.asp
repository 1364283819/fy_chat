<html>
<head>
<title>找回密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script Language=Javascript>
function check(){if((document.forms[0].username.value=="")||(document.forms[0].pwd.value=="")){alert('请输入用户名和临时密码。');return false;}else{return true}}
</script>
</head>

<body oncontextmenu=self.event.returnValue=false bgcolor="#FFCC99">
<div align="center"><b><a href="mailpwd.asp">[第一步]</a>　 [第二步]</b></div>
<br>
<table bgcolor="F0F0F0" bordercolorlight="#000000" bordercolordark="#FFFFFF" border="1" cellspacing="0" cellpadding="8" align="center">
<form method="post" action="mailchgpwdok.asp" onsubmit='return(check());'>
<tr>
<td> 
<table width="100%">
<tr> 
<td>用 户 名: 
<input type="text" name="username" maxlength="10" size="12" tabindex='0'>
</td>
<td> 
<input type="submit" value="提交" name="submit" tabindex='2'>
</td>
</tr>
<tr> 
<td>临时密码: 
<input type="password" name="pwd" maxlength="10" size="12" tabindex='1'>
</td>
<td>
<input type="reset" value="重写" name="reset" tabindex='3'>
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<div align="center"><br>
请输入第一步完成后你收到的用户名和临时密码，提交后系统将自动为你设置新密码</div>
</body>
</html>
