<html>
<head>
<title>�һ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script Language=Javascript>
function check(){if((document.forms[0].username.value=="")||(document.forms[0].pwd.value=="")){alert('�������û�������ʱ���롣');return false;}else{return true}}
</script>
</head>

<body oncontextmenu=self.event.returnValue=false bgcolor="#FFCC99">
<div align="center"><b><a href="mailpwd.asp">[��һ��]</a>�� [�ڶ���]</b></div>
<br>
<table bgcolor="F0F0F0" bordercolorlight="#000000" bordercolordark="#FFFFFF" border="1" cellspacing="0" cellpadding="8" align="center">
<form method="post" action="mailchgpwdok.asp" onsubmit='return(check());'>
<tr>
<td> 
<table width="100%">
<tr> 
<td>�� �� ��: 
<input type="text" name="username" maxlength="10" size="12" tabindex='0'>
</td>
<td> 
<input type="submit" value="�ύ" name="submit" tabindex='2'>
</td>
</tr>
<tr> 
<td>��ʱ����: 
<input type="password" name="pwd" maxlength="10" size="12" tabindex='1'>
</td>
<td>
<input type="reset" value="��д" name="reset" tabindex='3'>
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<div align="center"><br>
�������һ����ɺ����յ����û�������ʱ���룬�ύ��ϵͳ���Զ�Ϊ������������</div>
</body>
</html>
