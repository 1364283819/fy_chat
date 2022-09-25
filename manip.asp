<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=310"
dieip=Application("fy_c_dieip")
if left(dieip,1)=";" then dieip=Right(dieip,len(dieip)-1)
if Right(dieip,1)=";" then dieip=left(dieip,len(dieip)-1)%><html>
<head>
<title>永久封锁</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【永久封锁】</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　本功能用于永久封锁ＩＰ或ＩＰ段。被封锁的ＩＰ或ＩＰ段将永远无法登录进入聊天室。要解除封锁请在下表中删除对应ＩＰ（段）即可。ＩＰ格式如下：比如要封锁“<font color="#FF0000">10.255.255.1</font>”和“<font color="#FF0000">255.*.*.*</font>”的ＩＰ，就在下框中输入“<font color="#FF0000">10.255.255.1;255.*.*.*;</font>”即：每个ＩＰ（段）用半角的分号隔开，不能出现空格，也不能按回车。ＩＰ段不能出现这种格式：<font color="#FF0000">255.*.*.255</font>。 
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<form method="post" action="manipok.asp">
<tr>
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>永久封锁IP：</td>
<td> 
<textarea name="dieip" cols="70" rows="10"><%=dieip%></textarea>
</td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" value="修改">
<input type="button" value="清空"onClick="javascript:document.forms[0].title.value=''">
<input type="reset" value="还原">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
