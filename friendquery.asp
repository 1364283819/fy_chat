<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"%><html>
<head>
<title>���Ѳ�ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="friendqueryok.asp">
<tr align="center">
<td>
<table width="100%" border="0">
<tr> 
<td>�û�����</td>
<td> 
<input type="text" name="username" maxlength="10">
</td>
</tr>
<tr> 
<td>ѡ���</td>
<td>
<input type="radio" name="querytype" value="0" checked>
��ȷ
<input type="radio" name="querytype" value="1">
ģ��</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="Submit" value="��ѯ">
<input type="reset" value="��д">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<table width="300" border="0" align="center" cellpadding="6">
<tr>
<td> 
<p><font color="#FF0000">ѡ��˵����</font><br>
����<font color="#0000FF">����ȷ��</font>��ֻ��ʾ��������û�����ȫƥ����������ϡ�<br>
����<font color="#0000FF">��ģ����</font>����ʾ�����û����а���������ַ������������ϡ� <br>
<font color="#FF0000">ע���⣺</font>ֻ��5�����ϲ��ܿ����Է��ĵȼ��� </p>
</td>
</tr>
</table>
</body>
</html>
