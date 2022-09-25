<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<3 then Response.Redirect "manerr.asp?id=101"
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")%><html>
<head>
<title>添加新动作</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%>" background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
<table width="100%" border="0" height="100%">
<tr>
<td>
<table width=350 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<tr valign="top"> 
<td> 
<table border=0 bgcolor=#9999FF cellspacing=0 cellpadding=2 width=344>
<tr> 
<td width=326><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>添加新动作</font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="javascript:window.close()" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="退出"><font color="000000">×</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table width="100%" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="FFFFFF" cellpadding="0">
<tr valign="middle" align="center"> 
<td class=p9>
<table width="100%" border="0" cellpadding="3">
<tr align="center"> 
<td width="25%" bgcolor="E0E0E0"><a href=actaddform.asp><font color="black">添加动作</font></a></td>
<td width="25%" bgcolor="#000000"><font color="FFFFFF">帮助文件</font></td>
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="200" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0">
<form>
<tr>
<td>
<textarea name="help" cols="50" rows="12" readonly style="background-color=FFCC99">
　　1.添加新动作前请先搜索是否已经有相同的动作，如果有则不要再重复添加。对于重复的动作或内容不雅的动作，将一律删除。
　　2.添加时，请选择好动作的类型，是“对自己”的还是“对别人”的动作。
　　3.“动作名称”最多只能四个字符，用来概括这个动作的意义，如：再见、祝福、生日等。
　　4.自定义动作指令是以“//”开头的语句，语句最长 100 个字符。语句中，用“##”代替自己的名字，用“%%”代替对方的名字。
　　5.“//”会被自动替换为发言者姓名，因此，不要输入类似这样的“//##”格式。
-------------------------------------------------
　　例如：
-------------------------------------------------
　　//激动地握住%%的手，对天发誓：“我##一定不会让你失望的！”
-------------------------------------------------
　　假设发言者为：峰峰，对象为：山山，则发言后就会变成：
-------------------------------------------------
　　峰峰激动地握住山山的手，对天发誓：“我峰峰一定不会让你失望的！”
-------------------------------------------------
</textarea>
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>