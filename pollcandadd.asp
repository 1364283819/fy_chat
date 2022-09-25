<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
addname=Server.HTMLEncode(Trim(Request.Form("addname")))
if addname="" then Response.Redirect "manerr.asp?id=305"
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
hxrcz=0
for i=6 to count-1 step 2
 if poll(i)=addname then
  hxrcz=1
  exit for
 end if
next
if hxrcz=1 then
 Set thisfile=nothing
 Set fs=nothing
 Response.Redirect "manerr.asp?id=306"
end if
set thisfile=fs.CreateTextFile(pollfile)
for i=0 to count-1
 thisfile.WriteLine poll(i)
next
thisfile.WriteLine addname
thisfile.WriteLine "0"
thisfile.Close
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>添加候选人</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【添加候选人】</font></div>
<hr noshade size="1" color=009900>
<b>[操作完成]</b> <br>
　　已经添加候选人：<font color="#FF0000"><%=addname%></font> ！
<div align=center><a href="javascript:history.go(-1)">【返回】</a></div>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
