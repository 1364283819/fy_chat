<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
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
Set fs=CreateObject("Scripting.FileSystemObject")
pollfile=Server.Mappath("pollending.asp")
Set thisfile = fs.OpenTextFile(pollfile,1,False)
Dim poll()
count=0
do while not thisfile.AtEndOfStream
 thisline=thisfile.Readline
 Redim preserve poll(count)
 poll(count)=thisline
 count=count+1
loop
thisfile.close
if value<int(poll(3)) then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=301"
end if
if Instr(LCase(poll(5))," "&LCase(nickname)&" ")<>0 then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=301"
end if
if CDate(poll(1))>CDate(sj) then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=301"
end if
if CDate(poll(2))<CDate(sj) then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=301"
end if
p=Server.HTMLEncode(Trim(Request.Form("poll")))
if p="" then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=303"
end if
hxrcz=0
for i=6 to count-1 step 2
 if poll(i)=p then
  hxrcz=1
  exit for
 end if
next
if hxrcz=0 then
 set thisfile=nothing
 set fs=nothing
 Response.Redirect "manerr.asp?id=304"
end if
set thisfile=fs.CreateTextFile(pollfile)
for i=0 to 3
 thisfile.WriteLine poll(i)
next
thisfile.WriteLine poll(4)+1
thisfile.WriteLine poll(5)&nickname&" "
for i=6 to count-1 step 2
 if poll(i)=p then
  thisfile.WriteLine poll(i)
  thisfile.WriteLine poll(i+1)+1
 else
  thisfile.WriteLine poll(i)
  thisfile.WriteLine poll(i+1)
 end if
next
set thisfile=nothing
set fs=nothing%><html>
<head>
<title>投票系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<h1 align="center"><font color="0099FF">【投票结果】</font></h1>
<hr noshade size="1" color=009900>
<b>[操作完成]</b> <br>
<br>
　　感谢您投出这神圣的一票，您支持的是：<font color="#FF0000"><%=p%></font> <a href=javascript:history.go(-1)>【返回】</a> 
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
