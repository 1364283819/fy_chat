<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
notify=RTrim(Request.Form("notify"))
notify=Replace(notify,chr(13)&chr(10),"<br>")
Set fs=CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.CreateTextFile(server.mappath("pollnotify.dat"))
thisfile.WriteLine notify
thisfile.close
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>更改站长公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【更改站长公告】</font></div>
<hr noshade size="1" color=009900>
<b>[操作完成]</b> <br>
　　已经将站长公告更改为：<a href="javascript:history.go(-2)">【返回】</a> 
<hr noshade size="1" color=009900>
<table width="96%" border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" cellpadding="6">
<tr> 
<td class=p150><%=notify%></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>