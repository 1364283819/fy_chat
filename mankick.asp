<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<6 then Response.Redirect "manerr.asp?id=200"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=201"
kickname=Trim(Request.QueryString("id"))
if kickname="" then Response.Redirect "manerr.asp?id=202"
if CStr(kickname)=CStr(nickname) then Response.Redirect "manerr.asp?id=205"%><html>
<head>
<title>踢人操作</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【踢人操作】</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b> <br>
　　必须输入踢人的原因才能将对象踢出聊天室，被踢出的“用户名”在 5 分钟内不能使用。<br>
　　踢人操作会被记录在“聊务公开”栏中，供广大聊友监督，因此，请勿随意踢人！ 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form method="post" action="mankickok.asp">
<tr>
<td>
<table border="0" cellpadding="4">
<tr> 
<td align="right">踢出用户名：</td>
<td><font color="#FF0000"><%=kickname%> 
<input type="hidden" name="kickname" value="<%=kickname%>">
</font></td>
</tr>
<tr> 
<td align="right">踢人的原因：</td>
<td>(&lt;=60字符) </td>
</tr>
<tr> 
<td align="right"> 
<select name="select" onchange="javascript:document.forms[0].kickwhy.value=this.value;document.forms[0].kickwhy.focus();">
<option value="" selected>自填</option>
<option value="经验证已经掉线，名字卡在聊天室中。">已掉线</option>
<option value="所取的名字十分不雅。">不雅ID</option>
<option value="乱刷屏，警告又不听。">乱刷屏</option>
<option value="在聊天室散布有悖伦理道德的言论。">不道德</option>
<option value="不遵守聊天规则，进行人身攻击。">骂人</option>
<option value="在聊天室散布违反国家法律法规的言论。">违法</option>
</select>
：</td>
<td> 
<input type="text" name="kickwhy" maxlength="60" size="50">
</td>
</tr><%if nickname="聊天室管理员" then%>
<tr>
<td align="right">管理员选项：</td>
<td>
<input type="radio" name="logok" value="1" checked>记入聊务公开栏
<input type="radio" name="logok" value="0">不记入聊务公开栏</td>
</tr><%end if%>
</table>
<div align="center">
<input type="submit" name="kickok" value="踢出">
<input type="button" value="放弃" onclick="javascript:history.go(-1)">
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
