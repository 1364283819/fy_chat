<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
userip=Request.ServerVariables("REMOTE_ADDR")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<6 then Response.Redirect "manerr.asp?id=200"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=201"
kickname=Server.HTMLEncode(Trim(Request.Form("kickname")))
kickwhy=Server.HTMLEncode(Trim(Request.Form("kickwhy")))
logok=Trim(Request.Form("logok"))
if nickname<>"聊天室管理员" then logok="1"
if logok<>"0" then logok="1"
if kickname="" then Response.Redirect "manerr.asp?id=202"
if kickwhy="" then Response.Redirect "manerr.asp?id=203"
if CStr(kickname)=CStr(nickname) then Response.Redirect "manerr.asp?id=205"
if len(kickwhy)>60 then kickwhy=Left(kickwhy,60)
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
t=s & ":" & f & ":" & m
sj=n & "-" & y & "-" & r & " " & t
Application.Lock
onlinelist=Application("fy_c_onlinelist")
dim newonlinelist()
useronlinename=""
onliners=0
js=1
for i=1 to UBound(onlinelist) step 6
 if CStr(onlinelist(i+1))<>CStr(kickname) then
  onliners=onliners+1
  useronlinename=useronlinename & " " & onlinelist(i+1)
  Redim Preserve newonlinelist(js),newonlinelist(js+1),newonlinelist(js+2),newonlinelist(js+3),newonlinelist(js+4),newonlinelist(js+5)
  newonlinelist(js)=onlinelist(i)
  newonlinelist(js+1)=onlinelist(i+1)
  newonlinelist(js+2)=onlinelist(i+2)
  newonlinelist(js+3)=onlinelist(i+3)
  newonlinelist(js+4)=onlinelist(i+4)
  newonlinelist(js+5)=onlinelist(i+5)
  js=js+6
 else
  kickip=onlinelist(i+2)
 end if
next
useronlinename=useronlinename&" "
if kickip<>"" then
 if onliners=0 then
  dim listnull(0)
  Application("fy_c_onlinelist")=listnull
 else
  Application("fy_c_onlinelist")=newonlinelist
 end if
 Application("fy_c_useronlinename")=useronlinename
 Application("fy_c_chatrs")=onliners
else
 Application.UnLock
 Response.Redirect "manerr.asp?id=204&kickname=" & server.URLEncode(kickname)
end if
Application.UnLock
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT lastkick FROM reginfo WHERE kill='0' and username='" & kickname & "'"
rs.open sql,conn,1,3
if Not(rs.Eof and rs.Bof) then
 rs("lastkick")=sj
 rs.Update
end if
rs.close
set rs=nothing
kicklog="把 <font color=red>" & kickname & "</font>(<font color=blue>" & kickip & "</font>) 请出聊天室！<br><font color=009900>【原因：" & kickwhy & "】</font>"
if logok="1" then
 Function SqlStr(data)
  SqlStr="'" & Replace(data,"'","''") & "'"
 End Function
 sql="INSERT INTO logdata (logtime,name,ip,opertion) VALUES ("
 sql=sql & SqlStr(sj) & ","
 sql=sql & SqlStr(nickname) & ","
 sql=sql & SqlStr(userip) & ","
 sql=sql & SqlStr(kicklog) & ")"
 conn.Execute sql
end if
conn.close
set conn=nothing
Session("fy_u_lasttime")=sj
Application.Lock
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Application("fy_c_line")=line+1
dowho=0
act=4
towhoway=0
towho="大家"
addwordcolor="006699"
sayscolor="006699"
saystr="<font color=black>【出局】</font><font color=8800FF><font color=red>" & nickname & "</font>恭恭敬敬地把<font color=red>" & kickname & "</font>请出了聊天室……〖原因：" & kickwhy & "〗</font><font class=t>(" & t & ")</font>"
SayStr="parent.writesay('"&nickname&"','"&dowho&"','"&towho&"','"&saystr&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');"
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Session("fy_u_line")=line
Application("fy_c_line")=line+1
Dim newsd(50)
j=1
for i=3 to 50 step 2
 newsd(j)=sd(i)
 newsd(j+1)=sd(i+1)
 j=j+2
next
newsd(49)=line+1
newsd(50)=saystr
Application("fy_c_sd")=newsd
Application.UnLock%><html>
<head>
<title>踢人操作</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【踢人操作】</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>［操作完成］</b> <br>
　　已经将对象踢出聊天室，其用户名在 5 分钟内无法使用。你刚才的操作<%if logok="0" then Response.Write "<font color=red>没有</font>"%>被记录在公开栏中。 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form>
<tr>
<td>
<p><%=sj%></p>
<p><%=nickname&"("&userip&")"%></p>
<p><%=kicklog%></p>
<div align="center">
<input type="button" value="返回" onclick="javascript:history.go(-2)">
</div>
</td>
</tr>
</form>
</table>
<br>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
