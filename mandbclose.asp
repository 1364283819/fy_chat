<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
Application.Lock
 Dim nameindex(0)
 useronlinename=" "
 onliners=0
 Application("fy_c_onlinelist")=nameindex
 Application("fy_c_useronlinename")=useronlinename
 Application("fy_c_chatrs")=onliners
Application.UnLock%><html>
<head>
<title>����ѹ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">������ѹ����</font></h1>
<font color="#FF0000">�����������Ա��</font></div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b><br>
�����Ѿ���������Աȫ������� 
<div align=center><a href="javascript:history.go(-1)">����</a></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
