<html>
<head>
<title>找回密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script Language=Javascript>
function check(){if(document.forms[0].username.value==""){alert('请输入用户名。');return false;}else{return true}}
</script>
</head>

<body oncontextmenu=self.event.returnValue=false bgcolor="#FFCC99">
<div align="center"><b>[第一步]　 <a href="mailchgpwd.asp">[第二步]</a></b></div>
<br>
<table bgcolor="F0F0F0" bordercolorlight="#000000" bordercolordark="#FFFFFF" border="1" cellspacing="0" cellpadding="8" align="center">
<form method="post" action="mailpwdok.asp" onsubmit='return(check());'>
<tr>
<td> 用户名:
<input type="text" name="username" maxlength="10" size="12">
<input type="submit" value="提交">
</td>
</tr>
</form>
</table>
<div align="center"><br>
遗忘密码时，可以在此处输入用户名，点击提交后系统将生成一个临时密码发送到该用户名的注册信箱（前提是该用户名已经在个人资料中填写了自己的信箱）。收到了临时密码后，再到“第二步”中修改自己的登录密码</div>
</body>
</html>
