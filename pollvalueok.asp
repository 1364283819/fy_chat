<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
downvalue=Trim(Request.Form("downvalue"))
if IsNumeric(downvalue)=false then Response.Redirect "manerr.asp?id=302"
if downvalue="" then downvalue=0
if downvalue<0 then Response.Redirect "manerr.asp?id=302"
Set fs=CreateObject("Scripting.FileSystemObject")
pollfile=Server.Mappath("pollending.asp")
Set thisfile=fs.OpenTextFile(pollfile,1,False)
Dim poll()
count=0
do while not thisfile.AtEndOfStream
 thisline=thisfile.Readline
 Redim preserve poll(count)
 poll(count)=thisline
 count=count+1
loop
thisfile.close
set thisfile=fs.CreateTextFile(pollfile)
thisfile.WriteLine poll(0)
thisfile.WriteLine poll(1)
thisfile.WriteLine poll(2)
thisfile.WriteLine downvalue
for i=4 to count-1
 thisfile.WriteLine poll(i)
next
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>投票系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【更改投票最低经验值】</font></div>
<hr noshade size="1" color=009900>
<b>[操作完成]</b> <br>
　　已经将投票最低经验值更改为：<font color=FF0000><%=downvalue%></font>
<div align=center><a href="javascript:history.go(-2)">【返回】</a></div>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
