<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=120"
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
sql="SELECT logtime,name,ip,opertion FROM logdata WHERE DateDiff('d',logtime,#" & sj & "#)>7 ORDER BY logtime DESC"
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
  Redim Preserve show(j),show(j+1),show(j+2),show(j+3)
  show(j)=rs("logtime")
  show(j+1)=rs("name")
  show(j+2)=rs("ip")
  show(j+3)=rs("opertion")
  i=i+1
  j=j+4
 rs.MoveNext
 Loop
end if
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>聊务公开</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【聊务公开】</font></h1>
<font color="#FF0000">【清理７天前的记录】</font>
<br><a href="manlog.asp?page=1">返回</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　以下 <font color=red><%=totalrec%></font> 条记录已经超过７天<%if totalrec>0 then%>，是否清除？　<a href="manlogdelok.asp">是(Yes)</a>　<a href="javascript:history.go(-1)">否(No)</a><%end if
if totalrec>0 then%> 
<hr noshade size="1" color=009900>
<div align=center> <%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=manlogdel.asp?page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<hr noshade size="1" color=009900>
<%if grade>=10 then
 j=0
 for i=1 to UBound(show) step 4
 Response.Write "<p><font color=999999>第 " & p+j & " 条</font>　" & show(i) & " <font color=red>" & show(i+1) & "</font>(<font color=blue>" & show(i+2) & "</font>) " & show(i+3) & "</p>"
 j=j+1
 next
else
 j=0
 for i=1 to UBound(show) step 4
 Response.Write "<p><font color=999999>第 " & p+j & " 条</font>　" & show(i) & " <font color=red>" & show(i+1) & "</font> " & show(i+3) & "</p>"
 j=j+1
 next
end if
end if%>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
