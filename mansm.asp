<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"%><html>
<head>
<title>功能说明</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center"><h1><font color="0099FF">【功能说明】</font></h1>
<a href="javascript:history.go(0)">刷新</a> </div>
<hr noshade size="1" color=009900>
<b>［你的信息］</b>
<table border="0" align="center" cellpadding="5">
<tr> 
<td>用 户 名:</td>
<td><font color=red><%=nickname%></font></td>
<td>IP地址:</td>
<td><font color=red><%=Request.ServerVariables("REMOTE_ADDR")%></font></td>
<td>等　级:</td>
<td><font color=red><%=grade%> 级</font></td>
</tr>
<tr> 
<td>来访次数:</td>
<td><font color=red><%=Request.Cookies("fy_u_times")%> 次</font></td>
<td>累积分:</td>
<td><font color=red><%=Session("fy_u_value")%> 分</font></td>
<td>月积分:</td>
<td><font color=red><%=Session("fy_u_mvalue")%> 分</font></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<b>［注意事项］</b> <br>
　　⒈ 如果你连续 30 天没有来本聊天室，你注册的用户名将被删除，用户名被删除后，再用此用户登录，将作为新用户对待。若有事外出又担心在 30 天内无法来登录的，可以向站长申请永久保留你的用户名。被永久保留的用户名，登录后，在欢迎页面可以看到自己的用户名前面有一个“<a title='永久保留'><font color='blue' face='Wingdings' style='font-size:12pt;cursor:"hand"'>&lt;</font></a>”。对于那些只用过一次的用户名，只保留 7 天。<br>
　　⒉ 本聊天室的版主指 6 级以上权限的聊友。系统自动根据经验值来给用户升级，但是最高只能升到 5 级。6 级以上权限必须由站长手工分配。<br>
　　⒊ 本聊天室“聊务公开”栏是为了对版主（或拥有高级权限的用户）进行监督，防止版主滥用职权，请广大聊友对版主的行为进行监督、检举。一经查实，我们将依情况对这些版主进行降级直到禁用、删除其帐号。
<hr noshade size="1" color=009900>
<b>［权限说明］</b><br>
　1 级：普通聊友，不能改变聊天室的标题，不能使用贴图。<br>
　2 级：可以使用标题及贴图功能。<br>
　3 级：可以向酷库中加入自创的动作，并可查看聊友进入时间。<br>
　4 级：可以看到聊友的1/2长度的IP，及聊友有多长时间未保存的经验值。<br>
　5 级：可以在聊友查询中查询任何聊友的等级，可看IP地址的前三段。<br>
　6 级：可以踢人，被踢出的用户名在5分钟内无法使用。<br>
　7 级：可以给聊友升级，最高升到 5 级。可看到完整的IP。<br>
　8 级：可以给严重违纪的聊友降级，最低降至 1 级，并可封锁 IP。<br>
　9 级：可以管理留言簿，扔炸弹。 
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
