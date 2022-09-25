<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"%><html>
<head>
<title>帐号管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【帐号管理】</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　帐号即ID，是用户进入聊天室时取的昵称。本功能用于清理３０天未用的帐号、７天来只用过一次的帐号、已经自杀的用户名；设定/解除永久保留某些用户名；更改某个用户名的密码（用于用户遗忘密码时，站长将其密码重新设定，然后通知该用户新密码）；查询某个用户名的全部资料；按级别列出所有用户名。 
<hr noshade size="1" color=009900>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">清理帐号</font></td>
</tr>
<tr>
<td class=p150 width="388"> 　◇ <a href="manaccdel30.asp?page=1">清理３０天未用的帐号</a><br>
　◇ <a href="manaccdel7.asp?page=1">清理７天内只用过一次的帐号</a> <br>
　◇ <a href="manaccdelkill.asp?page=1">清理已经自杀的帐号</a><br>
　◇ <a href="manaccdelre.asp">恢复帐号</a><br>
　◇ <a href="manaccdel.asp">删除帐号</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">永久保留</font></td>
</tr>
<tr> 
<td class=p150 width="388"> 　◇ <a href="manaccyjlist.asp?page=1">列出目前永久保留的用户名</a><br>
　◇ <a href="manaccyjadd.asp">添加永久保留用户名</a><br>
　◇ <a href="manaccyjdel.asp">取消永久保留用户名</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">更改注册资料</font></td>
</tr>
<tr> 
<td class=p150 width="388"> 　◇ <a href="manaccregrename.asp">帐号改名</a><br>
　◇ <a href="manaccregcpass.asp">更改密码</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">帐号查询</font></td>
</tr>
<tr> 
<td class=p150 width="388"> 　◇ <a href="manaccquery.asp">查询用户名的所有资料</a><br>
　◇ <a href="manaccqueryip.asp">按ＩＰ查询帐号</a><br>
　◇ <a href="manaccquerydate.asp">按日期查询帐号</a><br>
　◇ <a href="manaccqueryvalue.asp?page=1">按累积分列出帐号</a><br>
　◇ <a href="manaccquerymvalue.asp?page=1">按月积分列出帐号</a><br>
　◇ <a href="manaccquerygrade.asp">按级别列出所有帐号</a><br>
　◇ <a href="manaccquerymyinfo.asp?page=1">列出个人资料非空的帐号</a><br>
　◇ <a href="manaccquerykick.asp?page=1">列出曾经被踢过的帐号</a></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
