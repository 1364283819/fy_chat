<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
username=server.HTMLEncode(Trim(Request.Form("username")))
if username="" then Response.Redirect "manerr.asp?id=135"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username FROM reginfo WHERE kill='0' AND leave='0' AND username='" & username & "'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=136"
end if
showusername=rs("username")
rs.close
set rs=nothing
sql="DELETE FROM reginfo WHERE kill='0' AND leave='0' AND username='" & username & "'"
conn.Execute(sql)
conn.close
set conn=nothing%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ���</font></h1>
<font color="#FF0000">��ɾ���ʺš�</font></div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b><br>
�����Ѿ�ɾ���ʺţ�<font color=red><%=username%></font>��
<div align=center><a href="javascript:history.go(-2)">����</a></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
