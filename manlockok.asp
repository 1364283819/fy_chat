<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
userip=Request.ServerVariables("REMOTE_ADDR")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<8 then Response.Redirect "manerr.asp?id=200"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=211"
lockname=Server.HTMLEncode(Trim(Request.Form("lockname")))
lockip=Server.HTMLEncode(Trim(Request.Form("lockip")))
if lockip="" then Response.Redirect "manerr.asp?id=212"
lockwhy=Server.HTMLEncode(Trim(Request.Form("lockwhy")))
logok=Trim(Request.Form("logok"))
if nickname<>"聊天室管理员" then logok="1"
if logok<>"0" then logok="1"
if lockwhy="" then Response.Redirect "manerr.asp?id=214"
if CStr(lockname)=CStr(nickname) then Response.Redirect "manerr.asp?id=213"
if len(lockwhy)>60 then lockwhy=Left(lockwhy,60)
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
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT ip FROM iplocktemp WHERE ip='" & lockip & "'"
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=215"
end if
rs.close
if lockname<>"" then
 Application.Lock
 onlinelist=Application("fy_c_onlinelist")
 dim newonlinelist()
 useronlinename=""
 onliners=0
 js=1
 for i=1 to UBound(onlinelist) step 6
  if CStr(onlinelist(i+1))<>CStr(lockname) then
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
 if kickip=lockip then
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
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "manerr.asp?id=219"
 end if
 Application.UnLock
 sql="SELECT lastkick FROM reginfo WHERE kill='0' and username='" & lockname & "'"
 rs.open sql,conn,1,3
 if Not(rs.Eof and rs.Bof) then
  rs("lastkick")=sj
  rs.Update
 end if
 rs.close
end if
set rs=nothing
Function SqlStr(data)
 SqlStr="'" & Replace(data,"'","''") & "'"
End Function
sql="INSERT INTO iplocktemp (ip,lockdate,locker) VALUES ("
sql=sql & SqlStr(lockip) & ","
sql=sql & SqlStr(sj) & ","
sql=sql & SqlStr(nickname) & ")"
conn.Execute sql
locklog="封锁IP：<font color=red>" & lockip & "</font>(<font color=blue>" & lockname & "</font>)！<br><font color=009900>【原因：" & lockwhy & "】</font>"
if logok="1" then
 sql="INSERT INTO logdata (logtime,name,ip,opertion) VALUES ("
 sql=sql & SqlStr(sj) & ","
 sql=sql & SqlStr(nickname) & ","
 sql=sql & SqlStr(userip) & ","
 sql=sql & SqlStr(locklog) & ")"
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
saystr="<font color=black>【封锁】</font><font color=8800FF><font color=red>" & nickname & "</font>封锁IP：<font color=red>" & lockip & "</font>(" & lockname & ")……〖原因：" & lockwhy & "〗</font><font class=t>(" & t & ")</font>"
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
<title>封锁ＩＰ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【封锁ＩＰ】</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>［操作完成］</b> <br>
　　被封锁的 IP 在 <font color=red><%=Application("fy_c_iplocktime")%></font> 分钟内不能登录。你刚才的操作<%if logok="0" then Response.Write "<font color=red>没有</font>"%>被记录在公开栏中。 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form>
<tr>
<td>
<p><%=sj%></p>
<p><%=nickname&"("&userip&")"%></p>
<p><%=locklog%></p>
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
