<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
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
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>查阅已投票者</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【查阅已投票者】</font></div>
<hr noshade size="1" color=009900>
<b>[功能说明]</b><br>
<div align=center>下列用户已经投票，共 <font color=red><%=poll(4)%></font> 人。<a href="javascript:history.go(0)">【刷新】</a>　<a href="javascript:history.go(-1)">【返回】</a></div>
<hr noshade size="1" color=009900>
<table width="95%" border="1" align="center" cellspacing="0" cellpadding="4" bordercolorlight="#FF9999" bordercolordark="#FFFFFF">
<tr>
<td class=p150><%=poll(5)%></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
