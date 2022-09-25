<%@ LANGUAGE=VBScript%>
<%
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
dim s(23)
sql="SELECT name,value FROM counthour"
rs.open sql,conn,1,1
Do while Not rs.Eof
 Select Case rs("name")
  Case "0"
   s(0)=rs("value")
  Case "1"
   s(1)=rs("value")
  Case "2"
   s(2)=rs("value")
  Case "3"
   s(3)=rs("value")
  Case "4"
   s(4)=rs("value")
  Case "5"
   s(5)=rs("value")
  Case "6"
   s(6)=rs("value")
  Case "7"
   s(7)=rs("value")
  Case "8"
   s(8)=rs("value")
  Case "9"
   s(9)=rs("value")
  Case "10"
   s(10)=rs("value")
  Case "11"
   s(11)=rs("value")
  Case "12"
   s(12)=rs("value")
  Case "13"
   s(13)=rs("value")
  Case "14"
   s(14)=rs("value")
  Case "15"
   s(15)=rs("value")
  Case "16"
   s(16)=rs("value")
  Case "17"
   s(17)=rs("value")
  Case "18"
   s(18)=rs("value")
  Case "19"
   s(19)=rs("value")
  Case "20"
   s(20)=rs("value")
  Case "21"
   s(21)=rs("value")
  Case "22"
   s(22)=rs("value")
  Case "23"
   s(23)=rs("value")
 End Select
rs.MoveNext
Loop
rs.close
conn.close
set rs=nothing
set conn=nothing
zzz=-1
zfw=0
for i=0 to 23
 zfw=zfw+s(i)
 if s(i)="" then s(i)=0
 if s(i)>zzz then zzz=s(i)
next
h=Hour(time())
if h+1>=24 then
 hbegin=0
else
 hbegin=h+1
end if
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")%><html>
<head>
<title><%=Application("fy_c_chatroomname")%>24小时流量统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
td{font-size:9pt;line-height:140%}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<div align=center style="font-size:28pt"><font color="#FF0000" face="楷体_GB2312"><%=Application("fy_c_chatroomname")%><font face="Times New Roman, Times, serif">24</font>小时流量分析</font></div>
<table border="1" align="center" bordercolorlight="#000000" bordercolordark="#000000">
<tr>
<td>
<table border="1" align="center" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
<tr align="center" valign="bottom"><%for i=hbegin to 23%>
<td height=230 width=18><font size=1><%=s(i)%></font><%if s(i)>0 then%><br><img src="readonly/cbg.gif" width="18" height="<%=int(200*s(i)/zzz)%>"><%end if%></td>
<%next
if h<23 then
for i=0 to h%>
<td height=230 width=18><font size="1"><%=s(i)%></font><%if s(i)>0 then%><br><img src="readonly/cbg.gif" width="18" height="<%=int(200*s(i)/zzz)%>"><%end if%></td>
<%next
end if%> </tr>
<tr align="center" bgcolor="#0066FF"><%for i=hbegin to 23%>
<td><font color="FFFFFF"><%=i%></font></td>
<%next
if h<23 then
for i=0 to h%>
<td><font color="FFFFFF"><%=i%></font></td>
<%next
end if%></tr>
</table>
</td>
</tr>
</table>
<div align="center">
<table border="0">
<tr>
<td><a href="javascript:history.go(0)">最近24小时总访问量：<font color=FF0000><%=zfw%></font>　刷新于：<font color=FF0000><%=now%></font>　点击此处更新数据</a></td>
</tr>
</table>
</div>
</body>
</html>
