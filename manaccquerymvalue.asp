<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
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
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username,grade,times,mvalue,regip,lastip,lasttime FROM reginfo WHERE kill='0' AND DateDiff('m',lasttime,#" & sj & "#)=0 ORDER BY mvalue DESC"
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
  Redim Preserve show(j),show(j+1),show(j+2),show(j+3),show(j+4),show(j+5),show(j+6)
  show(j)=rs("username")
  show(j+1)=rs("grade")
  show(j+2)=rs("times")
  show(j+3)=rs("mvalue")
  show(j+4)=rs("regip")
  show(j+5)=rs("lastip")
  show(j+6)=rs("lasttime")
  i=i+1
  j=j+7
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
<font color="#FF0000">【按月积分列出帐号】</font> <br>
<a href="manacc.asp">返回</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　共找到 <font color=red><%=totalrec%></font> 个帐号，本月缺席的不列出。<%if totalrec>0 then%> 
<hr noshade size="1" color=009900>
<div align=center>
<%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=manaccquerymvalue.asp?page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="6" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<tr bgcolor="#3399FF"> 
<td><font color="#FFFFFF">序</font></td>
<td><font color="#FFFFFF">用户名</font></td>
<td><font color="#FFFFFF">等级</font></td>
<td><font color="#FFFFFF">次数</font></td>
<td bgcolor="FF6666"><font color="#FFFFFF">月积分</font></td>
<td><font color="#FFFFFF">注册ＩＰ</font></td>
<td><font color="#FFFFFF">最后ＩＰ</font></td>
<td><font color="#FFFFFF">最后时间</font></td>
</tr>
<%for i=1 to UBound(show) step 7%> 
<tr> 
<td><%=(page-1)*15+(i+6)/7%></td>
<td><%=show(i)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i+2)%></td>
<td><%=show(i+3)%></td>
<td><%=show(i+4)%></td>
<td><%=show(i+5)%></td>
<td><%=show(i+6)%></td>
</tr>
<%next%> 
</table>
<%end if%>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
