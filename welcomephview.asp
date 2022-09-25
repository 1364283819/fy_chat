<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
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
sj2=n & "-" & y & "-01 00:00:00"
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
show=Request.QueryString("show")
if show="" then show=0
if Not(IsNumeric(show)) then show=0
if show<0 then show=0
if show>3 then show=3
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
Select Case show
 Case 0
  sql="SELECT username,times,value,mvalue,regtime,lasttime FROM reginfo WHERE kill='0' ORDER BY value DESC"
  showtype="按“累积分”排名"
 Case 1
  sql="SELECT username,times,value,mvalue,regtime,lasttime FROM reginfo WHERE kill='0' and DateDiff('m',lasttime,#" & sj2 & "#)=0 ORDER BY mvalue DESC"
  showtype="按“月积分”排名，本月未到的不统计"
 Case 2
  sql="SELECT username,times,value,mvalue,regtime,lasttime FROM reginfo WHERE kill='0' ORDER BY times DESC"
  showtype="按“来访次数”排名"
 Case 3
  sql="SELECT username,times,value,mvalue,regtime,lasttime FROM reginfo WHERE kill='0' ORDER BY regtime"
  showtype="按“访问天数”排名"
End Select
rs.open sql,conn,1,1
rs.PageSize=6
totalrec=rs.RecordCount
if totalrec=0 then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=201"
end if
totalpage=rs.PageCount
if page>totalpage then page=totalpage
rs.AbsolutePage=page
rs.CacheSize=rs.PageSize%><html>
<head>
<title>聊神榜</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
a{color:blue;text-decoration:none}
a:hover{color:red;text-decoration:none}
a:active{text-decoration:none}
a:visited{text-decoration:none}
td{font-size:9pt}
body{font-size:9pt}
.l1{color:3366FF;line-height:170%}
</style>
<script Language=JavaScript>
function gop(){url="welcomephview.asp?show="+document.forms[0].show.value+"&page="+document.forms[0].page.value;this.location.href=url;}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false leftmargin="5" topmargin="5" bgcolor=FFFFFF>
<a name="begin"></a> 
<div align=center>
<table width="440" border="0">
<tr>
<td><%=showtype%></td>
<td align=right>刷新时间:<%=sj%></td>
</tr>
</table>
<table width="440" border="0" cellspacing="0">
<form method="post" action="javascript:gop()">
<tr> 
<td> 
<table border="0" width="100%" cellspacing="0">
<tr> 
<td>共 <font color=red><%=totalrec%></font> 个　每页 <%=rs.PageSize%> 个　共 <font color=red><%=totalpage%></font> 页</td>
<td align="right"> 
<input type="text" name="page" size="3" value="<%=page%>">
<input type="submit" name="Submit" value="Go">
<input type="hidden" name="show" value="<%=show%>">
</td>
<td align="right"><%if page-1>0 then%><a href="welcomephview.asp?show=<%=show%>&page=<%=page-1%>">上一页</a><%else%><font color=666666>上一页</font><%end if%>　<%if page+1<=totalpage then%><a href="welcomephview.asp?show=<%=show%>&page=<%=page+1%>">下一页</a><%else%><font color=666666>下一页</font><%end if%>　<a href=javascript:history.go(0) title=刷新本页>第<%=page%>页</a></td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="0" color=009900>
<table width=440 border=1 cellspacing=0 bordercolorlight=#000000 bordercolordark=FFFFFF cellpadding=0 bgcolor=F0F0F0>
<tr>
<td>
<table width="100%" border="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3">
<tr bgcolor="#CCFFCC"> 
<td align=center>名次</td>
<td align=center>用户名</td>
<td align=center<%if show=0 then Response.Write " bgcolor=CCCCFF"%>>累积分</td>
<td align=center<%if show=1 then Response.Write " bgcolor=CCCCFF"%>>月积分</td>
<td align=center<%if show=2 then Response.Write " bgcolor=CCCCFF"%>>次数</td>
<td align=center<%if show=3 then Response.Write " bgcolor=CCCCFF"%>>天数</td>
<td align=center>平均分</td>
</tr><%p=1+(page-1)*rs.PageSize
i=0
Do while (Not rs.Eof) and i<rs.PageSize
i=i+1%><tr>
<td align=center><%=p%></td>
<td><%=rs("username")%></td>
<td><%=rs("value")%></td>
<td><%if DateDiff("m",rs("lasttime"),sj)<>0 then
Response.Write "--"
else
Response.Write rs("mvalue")
end if%></td>
<td><%=rs("times")%></td>
<td><%ts=DateDiff("d",rs("regtime"),sj)
if ts<1 then ts=1
Response.Write ts%></td>
<td><%=int(rs("value")/ts)%></td>
</tr><%rs.MoveNext
p=p+1
Loop
rs.close
conn.close
set rs=nothing
set conn=nothing%></table>
</td>
</tr>
</table>
<table width="440" border="0" cellpadding="5">
<tr>
<td>
<div align=center></div>
<p align=right><%if page-1>0 then%><a href="welcomephview.asp?show=<%=show%>&page=<%=page-1%>">上一页</a><%else%><font color=666666>上一页</font><%end if%>　<%if page+1<=totalpage then%><a href="welcomephview.asp?show=<%=show%>&page=<%=page+1%>">下一页</a><%else%><font color=666666>下一页</font><%end if%>　<a href="#begin">〖回到页首〗</a></p>
</td>
</tr>
</table>
</div>
</body>
</html>
