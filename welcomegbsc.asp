<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"%><html>
<head>
<title>���Ѳ�ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="welcomegbscok.asp">
<tr align="center">
<td>
<table width="100%" border="0">
<tr> 
<td>�ؼ��ʣ�</td>
<td> 
<input type="text" name="keyword" size="16">
</td>
</tr>
<tr> 
<td>����Χ��</td>
<td>
<select name="fw">
<option value="0" selected>����&amp;����&amp;����</option>
<option value="1">���Ե�ʱ��</option>
<option value="2">������������</option>
<option value="3">�����ߵ�����</option>
<option value="4">�����ߵĵ�ַ</option>
<option value="5">�����ߵ�����</option>
<option value="6">�����ߵ���ҳ</option>
</select>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="Submit" value="����">
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
<br><p><font color="#FF0000">����˵����</font><br>
����<font color="#0000FF">���ؼ��ʡ�</font>��ֻҪ�����г��ִ˹ؼ��ʾ���ʾ������<br>
����<font color="#0000FF">����Χ��</font>�����Ʋ��ҵ��ֶΣ��Ա��׼ȷ�������ٵ��ҵ���Ҫ�����ԡ�</p>
</td>
</tr>
</table>
</body>
</html>
