<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
username=server.HTMLEncode(Trim(Request.Form("username")))
newpass=server.HTMLEncode(Trim(Request.Form("newpass")))
if username="" or newpass="" then Response.Redirect "manerr.asp?id=142"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT password FROM reginfo WHERE kill='0' AND username='" & username & "'"
rs.open sql,conn,1,3
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=137"
end if
temppass=StrReverse(newpass)
templen=len(newpass)
mmpassword=""
for j=1 to templen
 mmpassword=mmpassword+chr(asc(mid(temppass,j,1))-templen+int(j*1.1))
next
rs("password")=mmpassword
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ�����</font></h1>
<font color="#FF0000">���������롿</font></div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b><br>
�����Ѿ����û�����<font color=red><%=username%></font> ���������Ϊ <font color=red><%=newpass%></font> ��<br>
������֪ͨ���û�ʹ����������е�¼����������ҳ�á��޸����롱�����޸��Լ������롣 
<div align=center><a href="javascript:history.go(-1)">����</a></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>