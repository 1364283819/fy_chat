<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Session.Abandon
Select Case id
Case "000"
 nl="　　对不起，程序所在目录不是虚拟目录，或设置有错误，Global.asa 没有被执行。本程序需要虚拟目录的支持！"
Case "001"
 nl="本窗口即将被关闭。<br><br>造成此现象的原因主要有：<br>　　⑴由于网络传输问题，导致你的机器与服务器在三分钟内无法传递数据，系统将你作为超时而断开了连接；<br>　　⑵你点击了“换名登录”重回登录页面，又没有先关闭此窗口；<br>　　⑶你被踢出了聊天室。<br>　　⑷如果你使用本窗口进入不会出现这个问题，而用新窗口进入就出现这个问题的话，问题就出在你的机器：对弹出的新窗口无法继承上级窗口的值。<br><br>解决方法：<br>　　关闭此窗口，重新到登录页面输入用户名和密码进行登录。如果你是被踢出聊天室，则你方才所用的用户名在 5 分钟内不能使用。如果是第４种情况，可以试着清除ＩＥ的临时文件，然后重新启动机器。"
Case "002"
 nl="本窗口即将被关闭。<br><br>原因：<br>　　你超过 " & Application("fy_c_maxtimeout") & " 分钟没有发言，为减轻服务器负担，系统自动清除你所占用的资源。<br><br>解决方法：<br>　　关闭此窗口，重新到登录页面输入用户名和密码进行登录。"
Case else
 nl="　　对不起，该出错类型未被登记。"
End Select
nl="<p>" & nl & "</p>"%><html>
<head>
<title>出错提示</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<script LANGUAGE="JavaScript">if(window!=window.top)top.location.href=location.href;</script>
<table width="100%" border="0" height="100%">
<tr align="center"> 
<td>
<form method="post" action="">
<table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" bgcolor="E0E0E0">
<tr>
<td>
<table border="0" bgcolor="#FF0099" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF">¤出错提示</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="javascript:window.close()" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="关闭"><font color="000000">×</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
<td width="59" align="center" valign="top"><font face="Wingdings" color="#FF0000" style="font-size:32pt">L</font></td>
<td width="269">
<%=nl%>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<input type="button" name="ok" value="　确 定　" onclick=javascript:window.close()>
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
