<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
sername=Request.ServerVariables("SERVER_NAME")
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
page=int(page)
totalrec=Application("fy_c_chatrs")
if totalrec/10=Int(totalrec/10) then
 totalpage=Int(totalrec/10)
else
 totalpage=Int(totalrec/10)+1
end if
if page<1 then page=1
p=(page-1)*10+1
onbeg=(page-1)*60+1
onend=onbeg+59
onlinelist=Application("fy_c_onlinelist")
if onend>UBound(onlinelist) then onend=UBound(onlinelist)
dim show()
js=1
for i=onbeg to onend step 6
 Redim Preserve show(js),show(js+1),show(js+2),show(js+3)
 show(js)=onlinelist(i+1)
 show(js+1)=onlinelist(i+2)
 show(js+2)=onlinelist(i+4)
 show(js+3)=onlinelist(i+5)
 js=js+4
next
set onlinelist=nothing
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
<title>聊友信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【聊友信息】</font></h1>
<a href="javascript:history.go(0)">刷新</a> </div>
<hr noshade size="1" color=009900>
<table width="100%" border="0">
<form method="post" action="maninfogo.asp" target="_blank">
<tr>
<td> <b>［在线人员］</b>　共 <font color=red><%=totalrec%></font> 人　　　 用户昵称：
<input type="text" name="name" maxlength="10" size="10">
<input type="submit" name="op" value="查找">
<%if grade>5 then%><input type="submit" name="op" value="踢人">
<input type="submit" name="op" value="炸弹"><%end if%>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center>本页刷新时间：<font color="#FF0000"><%=sj%></font><br><%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=maninfo.asp?page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<table border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="4" bgcolor="E0E0E0" align="center">
<tr bgcolor="#3399FF"> 
<td><font color="#FFFFFF">序号</font></td>
<td><font color="#FFFFFF">用 户 昵 称</font></td>
<td><font color="#FFFFFF">ＩＰ 地　址</font></td>
<td><font color="#FFFFFF">进 入 时 间</font></td>
<td><font color="#FFFFFF">未存点</font></td>
<td><font color="#FFFFFF">踢人</font></td>
<td><font color="#FFFFFF">封锁</font></td>
<td><font color="#FFFFFF">炸弹</font></td>
</tr>
<%if grade<3 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%><tr>
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr><%next
end if
end if
if grade=3 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%>
<tr> 
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td>&nbsp;</td>
<td><%=show(i+2)%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<%next
end if
end if
if grade=4 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%>
<tr> 
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td><%=Left(show(i+1),Int(len(show(i+1))/2+1))%></td>
<td><%=show(i+2)%></td>
<td><%=DateDiff("n",show(i+3),sj)%> 分</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<%next
end if
end if
if grade=5 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%>
<tr> 
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td><%=Left(show(i+1),InstrRev(show(i+1),"."))%></td>
<td><%=show(i+2)%></td>
<td><%=DateDiff("n",show(i+3),sj)%> 分</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<%next
end if
end if
if grade=6 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%>
<tr> 
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td><%=Left(show(i+1),InstrRev(show(i+1),"."))%></td>
<td><%=show(i+2)%></td>
<td><%=DateDiff("n",show(i+3),sj)%> 分</td>
<td><a href="mankick.asp?id=<%=server.URLEncode(show(i))%>">Ｋ</a></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<%next
end if
end if
if grade>6 then
if totalrec>0 then
j=0
for i=1 to UBound(show) step 4%>
<tr> 
<td><%Response.Write p+j
j=j+1%></td>
<td><%=show(i)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i+2)%></td>
<td><%=DateDiff("n",show(i+3),sj)%> 分</td>
<td><a href="mankick.asp?id=<%=server.URLEncode(show(i))%>">Ｋ</a></td>
<td><a href="manlock.asp?id=<%=server.URLEncode(show(i))%>&ip=<%=show(i+1)%>">Ｌ</a></td>
<td><a href="manbomb.asp?id=<%=server.URLEncode(show(i))%>&ip=<%=show(i+1)%>">Ｂ</a></td>
</tr>
<%next
end if
end if%>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
