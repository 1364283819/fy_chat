<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
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
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align=center><h1><font color="0099FF">【投票系统】</font></h1>
<a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>[站长公告]</b> 
<hr noshade size="1" color=009900>
<table width="100%" border="0" align="center">
<tr>
<td class=p150> <%=thisline%></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<blockquote> 
● <a href="pollview.asp">投票 / 查看投票结果</a><br>
<%if grade>9 then%> ● <a href="polluser.asp">查阅已投票者</a><br>
● <a href="pollchangenotify.asp">更改站长公告</a><br>
● <a href="polltime.asp">设置投票起止时间</a><br>
● <a href="pollvalue.asp">设置用户投票最低经验值</a><br>
● <a href="pollcand.asp">候选人管理</a><br>
● <a href="manupdowngrade.asp">原有版主级别调整</a><br>
● <a href="pollclear.asp">清除所有候选人的得票数，重新投票</a><br>
● <a href="pollreset.asp">复位投票系统，清除数据</a>
<%end if%></blockquote>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
