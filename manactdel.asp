<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
id=Request.QueryString("id")
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT id,acttype,name,act FROM actlib WHERE id=" & id
rs.open sql,conn,1,1
Dim show(4)
show(1)=rs("id")
show(2)=rs("acttype")
show(3)=rs("name")
show(4)=rs("act")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">����������</font></h1>
<font color="#FF0000">��ɾ��������</font></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�������Ҫɾ������Ķ����𣿡�<a href="manactdelok.asp?id=<%=id%>">��(Yes)</a>��<a href="javascript:history.go(-1)">��(No)</a><br>
<div align=center></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#999999" bordercolordark="#FFFFFF" align="center" bgcolor="E0E0E0">
<tr bgcolor="#3399FF"> 
<td><font color="#FFFFFF">ID</font></td>
<td><font color="#FFFFFF">����</font></td>
<td><font color="#FFFFFF">����</font></td>
<td><font color="#FFFFFF">����</font></td>
</tr>
<tr> 
<td><%=show(1)%></td>
<td><%=show(2)%></td>
<td><%=show(3)%></td>
<td><%=show(4)%></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
