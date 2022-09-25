<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username,grade,times,value,lasttime,lastip FROM reginfo WHERE kill='0' AND leave='1'"
rs.open sql,conn,1,1
rs.PageSize=15
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
  Redim Preserve show(j),show(j+1),show(j+2),show(j+3),show(j+4),show(j+5)
  show(j)=rs("username")
  show(j+1)=rs("grade")
  show(j+2)=rs("times")
  show(j+3)=rs("value")
  show(j+4)=rs("lasttime")
  show(j+5)=rs("lastip")
  i=i+1
  j=j+6
 rs.MoveNext
 Loop
end if
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>帐号管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【帐号管理】</font></h1>
<font color="#FF0000">【永久保留的用户名列表】</font> <br>
<a href="manacc.asp">返回</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　以下 <font color=red><%=totalrec%></font> 个用户名被永久保留，这些用户名将不会被“自杀”、“删除”。 <%if totalrec>0 then%>
<hr noshade size="1" color=009900>
<div align=center>
<%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=manaccyjlist.asp?page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="6" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<tr bgcolor="#3399FF"> 
<td><font color="#FFFFFF">序</font></td>
<td><font color="#FFFFFF">用户名</font></td>
<td><font color="#FFFFFF">等级</font></td>
<td><font color="#FFFFFF">次数</font></td>
<td><font color="#FFFFFF">经验值</font></td>
<td><font color="#FFFFFF">最后时间</font></td>
<td><font color="#FFFFFF">最后ＩＰ</font></td>
</tr>
<%for i=1 to UBound(show) step 6%>
<tr> 
<td><%=(page-1)*15+(i+5)/6%></td>
<td><%=show(i)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i+2)%></td>
<td><%=show(i+3)%></td>
<td><%=show(i+4)%></td>
<td><%=show(i+5)%></td>
</tr>
<%next%>
</table><%end if%>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
