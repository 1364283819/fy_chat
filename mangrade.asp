<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<7 then Response.Redirect "manerr.asp?id=240"
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
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����������Ͽ���ִ���������������ֻ�ܽ���������������<br>
�����������Ͽ���ִ�н�����������Ϳ��Խ����˽���������<br>
����վ�����������������������������������ĳ���û�����Ϊ����ʱ������û��������á�<br>
����������������������������ԭ�򣬲��ᱻ��¼�����񹫿����С�
<hr noshade size="1" color=009900>
<div align="center"><a href="mangradeup.asp">������������</a><%if grade>=8 then%>��������<a href="mangradedown.asp">������������</a><%end if%><%if grade>=10 then%>��������<a href="manupdowngrade.asp">��ԭ�а������������</a><%end if%></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
