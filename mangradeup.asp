<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<7 then Response.Redirect "manerr.asp?id=242"
if inthechat<>"1" and nickname<>"�����ҹ���Ա" then Response.Redirect "manerr.asp?id=241"%><html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���������</font></h1>
</div>
<div align="center"><font color="#FF0000">������������</font></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b> <br>
�������������������û������û�������С�ڣ������ַ����������֣��� 
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="mangradeup1.asp">
<tr> 
<td> 
<table border="0" cellpadding="8">
<tr> 
<td>�û�����</td>
<td>
<input type="text" name="username" maxlength="10" size="10">
</td>
</tr>
<tr align="center"> 
<td colspan="2">
<input type="submit" name="Submit" value="�ύ">
<input type="reset" value="��д">
<input type="button" value="����" onclick="javascript:history.go(-1)">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
