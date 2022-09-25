<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
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
begintime=Trim(Request.Form("begintime"))
endtime=Trim(Request.Form("endtime"))
if IsDate(begintime)=false or len(begintime)<>19 then Response.Redirect "manerr.asp?id=302"
if IsDate(endtime)=false or len(endtime)<>19 then Response.Redirect "manerr.asp?id=302"
if CDate(endtime)<=CDate(begintime) then Response.Redirect "manerr.asp?id=302"
set thisfile=fs.CreateTextFile(pollfile)
thisfile.WriteLine poll(0)
thisfile.WriteLine begintime
thisfile.WriteLine endtime
for i=3 to count-1
 thisfile.WriteLine poll(i)
next
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>更改投票起止时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【更改投票起止时间】</font></div>
<hr noshade size="1" color=009900>
<b>[操作完成]</b><br>
　　已经将投票时间更改为：<a href="javascript:history.go(-2)">【返回】</a><br>
　　开始投票时间：<font color=FF0000><%=begintime%></font><br>
　　终止投票时间：<font color=FF0000><%=endtime%></font>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
