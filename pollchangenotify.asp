<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
Set fs=CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.OpenTextFile(server.mappath("pollnotify.dat"),1,False)
thisline=thisfile.Readline
thisfile.close
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
<font color="#FF0000">【更改站长公告】</font></div>
<hr noshade size="1" color=009900>
<b>[站长公告]</b><br>
　　支持HTML语法，回车换行。 
<hr noshade size="1" color=009900>
<table border="1" align="center" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="4">
<form method="post" action="pollchangenotifyok.asp">
<tr> 
<td> 
<table border="0">
<tr>
<td>
<textarea name="notify" cols="72" rows="11"><%=thisline%></textarea>
</td>
</tr>
<tr align="center"> 
<td> 
<input type="submit" name="Submit" value="更改">
<input type="reset" name="reset" value="重写">
<input type="button" value="放弃" onClick=javascript:history.go(-1) name="button">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
