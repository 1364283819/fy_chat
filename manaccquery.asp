<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
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
<font color="#FF0000">����ѯ�û������������ϡ�</font></div>
<div align="center"><a href="manacc.asp">����</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
��������������ѯ���û����� 
<hr noshade size="1" color=009900>
<div align=center> 
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#E0E0E0" cellpadding="8">
<form method="post" action="manaccqueryok.asp">
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
ģ�� </td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" name="Submit" value="��ѯ">
<input type="reset" value="��д" name="reset">
<input type="button" value="����" onclick="javascript:history.go(-1)">
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
