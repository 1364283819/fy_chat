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
sql="SELECT id FROM actlib WHERE id=" & id
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=261"
end if
rs.close
set rs=nothing
sql="DELETE FROM actlib WHERE id=" & id
conn.Execute(sql)
conn.close
set conn=nothing%><html>
<head>
<title>动作管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【动作管理】</font></h1>
<font color="#FF0000">【删除动作】</font></div>
<hr noshade size="1" color=009900>
<b>［操作完成］</b><br>
　　ID 为 <font color="#FF0000"><%=id%></font> 的动作已经删除!<br><div align=center><a href="javascript:history.go(-2)">返回</a></div>
<div align=center></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
