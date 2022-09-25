<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT id,acttype,name,act FROM actlib"
rs.open sql,conn,1,1
rs.PageSize=20
totalrec=rs.RecordCount
totalpage=rs.PageCount
if page>totalpage then page=totalpage
if totalrec>0 then
 rs.AbsolutePage=page
 p=1+(page-1)*rs.PageSize
 Dim show()
 i=0
 j=1
 Do while (Not rs.Eof) and (i<rs.PageSize)
  Redim Preserve show(j),show(j+1),show(j+2),show(j+3)
  show(j)=rs("id")
  show(j+1)=rs("acttype")
  show(j+2)=rs("name")
  show(j+3)=rs("act")
  i=i+1
  j=j+4
 rs.MoveNext
 Loop
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m%><html>
<head>
<title>动作管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【动作管理】</font></h1>
<a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>［动作管理］</b>　共有 <font color=red><%=totalrec%></font> 条动作　　　本页刷新时间：<font color="#FF0000"><%=sj%></font>　　　　<a href=actaddlog.asp target=blank>〖日志〗</a><br>
<div align=center><%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=manact.asp?page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#999999" bordercolordark="#FFFFFF" align="center" bgcolor="E0E0E0">
<tr bgcolor="#3399FF">
<td><font color="#FFFFFF">删除</font></td>
<td><font color="#FFFFFF">ID</font></td>
<td><font color="#FFFFFF">类型</font></td>
<td><font color="#FFFFFF">名称</font></td>
<td><font color="#FFFFFF">内容</font></td>
<td><font color="#FFFFFF">编辑</font></td>
</tr>
<%for i=1 to UBound(show) step 4%> 
<tr>
<td><a href="manactdel.asp?id=<%=show(i)%>">×</a></td>
<td><%=show(i)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i+2)%></td>
<td><%=show(i+3)%></td>
<td><a href="manactedit.asp?id=<%=show(i)%>">Ｅ</a></td>
</tr>
<%next%> 
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
