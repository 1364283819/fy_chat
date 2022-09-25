<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Select Case id
Case "100"
 nl="成功修改密码，新密码为 <font color=red>" & Request.QueryString("new") & "</font>，请记牢。"
Case "101"
 nl="自杀操作完成！用户名 <font color=red>" & Request.QueryString("name") & "</font> 已经被删除，该用户名的所有记录及权限均已消失。"
Case "110"
 nl="个人信息已经修改成功。"
Case "200"
 nl="消息已经成功发送给<font color=red>" & Request.QueryString("name") & "</font>。可以在消息列表中查看该消息是否已经被取出。"
Case "210"
 nl="动作已经添加完成。"
Case "300"
 nl="数据库备份完成，请到 backup 目录下载 global.mdb 进行压缩。"
Case "301"
 nl="已经用压缩后的数据库覆盖旧数据库，确认正确后，请删除该备份数据库，以防被他人下载。"
Case "302"
 nl="备份数据库删除完成。"
Case else
 nl="对不起，该类型未被登记。"
End Select
nl="<p>　　" & nl & "</p>"%><html>
<head>
<title>操作成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
<table width="100%" border="0" height="100%">
<tr align="center"> 
<td>
<form method="post" action="">
<table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" bgcolor="E0E0E0">
<tr>
<td>
<table border="0" bgcolor="#009900" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF" face="Wingdings">z</font><font color="FFFFFF">操作成功</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="<%if id="200" then%>javascript:window.close();<%else%>javascript:history.go(-1)<%end if%>" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="返回"><font color="000000">×</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
<td width="59" align="center" valign="top"><font face="Wingdings" color="#FF0000" style="font-size:32pt">J</font></td>
<td width="269">
<%=nl%>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<%if id="200" then
Response.Write "<input type='button' name='ok' value=' 查看列表 ' onclick=javascript:top.location.href='webicqlist.asp'>"
else
Response.Write "<input type='button' name='ok' value='　确 定　' onclick='javascript:history.go(-1)'>"
end if%>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<script Language="JavaScript">
document.forms[0].ok.focus();
</script>
</body>
</html>