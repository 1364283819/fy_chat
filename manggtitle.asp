<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=255"
title=Trim(Request.Form("title"))
if title="" then Response.Redirect "manerr.asp?id=256"
html=Trim(Request.Form("html"))
if html<>"1" then title=Server.HTMLEncode(title)
Application.Lock
 Application("hg_title")=title
Application.UnLock%><html>
<head>
<title>վ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��վ�����桿</font></h1>
</div>
<div align="center"><font color="#FF0000">�����������ұ����С�</font></div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b><br>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<tr>
<td><font color="#FF9933">�Ѿ��������ұ����и���Ϊ��</font><br>
<br><%=title%><br><br><div align=center><a href="javascript:history.go(-1)">����</a></div></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
