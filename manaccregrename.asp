<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ���</font></h1>
<font color="#FF0000">���ʺŸ�����</font></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�������������ڶ��Լ������ǳƲ����⣬��������û��������¿�������Ҫԭ�������ֺ������֡�<br>
�������û���ֻ����<font color=red>Ӣ����ĸ��a-z��A-Z�������֣�0-9��������</font>������<font color=red>����ʹ�ÿո�</font>�����ȱ���<font color=red>С�� 10 ���ַ�</font>���������֣������ַ��������򽫵�������û����޷���¼��
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccregrenameok.asp">
<tr> 
<td> 
<table border="0" cellpadding="5">
<tr> 
<td>���û�����</td>
<td> 
<input type="text" name="username" maxlength="10" size="10">
</td>
</tr>
<tr> 
<td>���û�����</td>
<td> 
<input type="text" name="newusername" maxlength="10" size="10">
</td>
</tr>
<tr align="center"> 
<td colspan="2"> 
<input type="submit" name="Submit" value="�ύ">
<input type="reset" value="��д" name="reset">
<input type="button" value="����" onClick="javascript:history.go(-1)" name="button">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
