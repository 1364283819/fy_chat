<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=255"
gbtop=Trim(Request.Form("gbtop"))
if gbtop="" then Response.Redirect "manerr.asp?id=256"
html=Trim(Request.Form("html"))
if html<>"1" then gbtop=Server.HTMLEncode(gbtop)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT gbtop FROM gbooktop"
rs.open sql,conn,1,3
rs("gbtop")=gbtop
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>վ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��վ�����桿</font></h1>
</div>
<div align="center"><font color="#FF0000">���������Բ������桿</font></div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b><br>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<tr>
<td><font color="#FF9933">�Ѿ������Բ������������Ϊ��</font><br>
<br><%=gbtop%><br><br><div align=center><a href="javascript:history.go(-1)">����</a></div></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
