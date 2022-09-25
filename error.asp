<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Select Case id
Case "000"
 nl="对不起，程序所在目录不是虚拟目录，或设置有错误，Global.asa 没有被执行。本程序需要虚拟目录的支持！"
Case "004"
 nl="程序已经过期，请与作者联系！"
Case "002"
nl="对不起，本程序不能在这台服务器上运行，如果你是本程序的合法用户，请立即与作者：稻香居士联系。<br>　　信箱：<a href='mailto:hqtchat@126.com?subject=出现“不能在这台服务器上运行的提示”'>hqtchat@126.com</a><br>　　OICQ：95001"
Case "003"
 nl="数据库尚未打开，可能是站长正在整理压缩数据库，请稍候再来。"
Case "010"
 nl="对不起，本程序专门针对 Internet Explorer 4.0 以上版本的浏览器制作，请使用 IE 浏览器来访问。"
Case "011"
 nl="对不起，请勿通过代理服务器来访问本站。"
Case "100"
 nl="欢迎您的光临，只是站长已经关闭了聊天室的登录功能，现在不能进行登录，请稍后再来。"
Case "101"
 nl="欢迎您的光临，聊天室现在已满，站长限制最多同时在线人数为 <font color=red>" & Application("fy_c_maxpeople") & "</font> 人，请稍后再来。"
Case "102"
 nl="站长禁止新用户名登录，请稍后再来。"
Case "110"
 nl="您现在的 IP：<font color=red>" & Request.ServerVariables("REMOTE_ADDR") & "</font> 被封锁 " & Application("fy_c_iplocktime") & " 分钟，不能进入聊天室。<br>　　离自动解锁时间还有：<font color=red>" & ABS(int(Application("fy_c_iplocktime"))-int(Datediff("s",Request.QueryString("lockdate"),now())/60)) & "</font> 分钟。"
Case "111"
 nl="您现在的 IP：<font color=red>" & Request.ServerVariables("REMOTE_ADDR") & "</font> 被<font color=red>【永久】</font>封锁！不能进入聊天室。请与站长联系。"
Case "120"
 nl="用户名含有非法字符！只能使用中文、英文字母和数字（不能带空格）。"
Case "121"
 nl="密码含有非法字符！只能使用英文字母和数字（不能带空格）。"
Case "122"
 nl="称谓含有非法字符！只能使用中文、英文字母和数字（不能带空格）。"
Case "123"
 nl="新密码含有非法字符！只能使用英文字母和数字（不能带空格）。"
Case "124"
 nl="确认密码含有非法字符！只能使用英文字母和数字（不能带空格）。"
Case "125"
 nl="用户名的长度超过 10 个字符（一个汉字占两个字符）。"
Case "126"
 nl="称谓的长度超过 4 个字符（一个汉字占两个字符）。"
Case "127"
 nl="用户名不能为空。"
Case "128"
 nl="密码不能为空。"
Case "129"
 nl="密码不能和用户名相同。"
Case "130"
 nl="对不起，该用户名为系统所保留，您不能使用这个名字登录。"
Case "131"
 nl="对不起，该用户名含有不雅字眼，您不能使用这个名字登录。"
Case "132"
 nl="对不起，称谓含有不雅字眼，您不能使用这个称谓登录。"
Case "140"
 nl="对不起，该用户名正在使用中，不能完成您所需要的操作。<br>　　如果您是首次使用该用户名登录，则可能是该用户名已经被其他人抢注了，您只能换用其他名字登录。<br>　　如果您以前曾经使用过该用户名登录成功，则可能是您的用户名被其他人盗用。<br>　　另一种可能是：您没有正常退出聊天室（如：掉线、超时与服务器断开连接等），导致用户名被卡在聊天室中，则请您关闭所有浏览器，再重新打开，并等五分钟后再来登录。如果实在不行，请到留言簿给版主留言，请版主为您解决。"
Case "141"
 nl="对不起，密码错误（注意：密码区分大小写），不能完成您所需要的操作。<br>　　如果您是首次使用该用户名登录，则可能是该用户名已经被其他人抢注了，您只能换用其他名字登录。<br>　　如果您以前曾经使用过该用户名登录成功，则可能是您的用户名被其他人盗用，并且盗用者更改了密码。如果是这种情况，请到留言簿给版主留言，请版主为您解决。"
Case "142"
 nl="对不起，该用户名被禁用！请到留言簿给版主留言，请版主为您解决。"
Case "143"
 nl="对不起，该用户名被踢出聊天室，5 分钟内不能使用该用户名登录。还有 <font color=red>" & ABS(300-Datediff("s",Request.QueryString("lastkick"),now())) & "</font> 秒。"
Case "150"
 nl="对不起，该用户名尚未被注册，当然不能修改密码了。"
Case "151"
 nl="对不起，您没有指定“新密码”，怎么修改密码呢？"
Case "152"
 nl="“新密码”与旧密码完全相同，用不着再修改密码啦！"
Case "153"
 nl="“新密码”不能与用户名相同！"
Case "160"
 nl="对不起，该用户名尚未被注册，当然不能“自杀”了。"
Case "161"
 nl="“确认密码”为空，不能执行自杀操作。"
Case "162"
 nl="“确认密码”与“密码”不一致，不能执行自杀操作。"
Case "163"
 nl="该用户名被永久保留，不能执行自杀操作。"
Case "001"
 nl="该程序执行了非法操作，请立即停止使用，否则可能引起不可预测的后果，请立即与作者：稻香居士取得联系。<br>　　信箱：<a href='mailto:hqtchat@126.com?subject=聊天室程序执行了非法操作'>hqtchat@126.com</a><br>　　OICQ：95001"
Case "200"
 nl="没有此类可供显示的留言数据，不能查看。"
Case "201"
 nl="没有此类可供显示的数据，不能查看。"
Case "210"
 nl="你尚未登录，或已经超时断开了连接，请重新登录。"
Case "220"
 nl="“来自何方”含有非法字符，也不能使用HTML语法！"
Case "221"
 nl="“E-Mail”地址含有非法字符，也不能使用HTML语法！"
Case "222"
 nl="“主页地址”含有非法字符，也不能使用HTML语法！"
Case "223"
 nl="“来自何方”长度超过30字符，1个汉字占2字符。"
Case "224"
 nl="“E-mail”长度超过50字符。"
Case "225"
 nl="“主页地址”长度超过50字符 。"
Case "226"
 nl="“个人简介”长度超过200字符 。"
Case "227"
 nl="“E-mail”地址格式有误。"
Case "228"
 nl="“主页地址”格式有误 。"
Case "229"
 nl="用户名不存在，不能修改个人信息。"
Case "230"
 nl="请输入要查询的用户名。"
Case "231"
 nl="用户名：<font color=red>" & Request.QueryString("name") & "</font> 不存在。"
Case "240"
 nl="关键词为空，不能搜索。"
Case "250"
 nl="所有“红色”的项目均为必填项目，请填写完整。"
Case "251"
 nl="用户名：<font color=red>" & Request.QueryString("name") & "</font> 不存在，不能使用“悄悄话”方式。"
Case "252"
 nl="密码为空，不能使用用户名：<font color=red>" & Request.QueryString("name") & "</font> 进行留言。"
Case "253"
 nl="密码错误，不能使用用户名：<font color=red>" & Request.QueryString("name") & "</font> 进行留言。"
Case "254"
 nl="“写给”的长度超过20个字符（1个汉字=2个字符）。"
Case "255"
 nl="“主题”的长度超过40个字符（1个汉字=2个字符）。"
Case "256"
 nl="“内容”的长度超过1024个字。"
Case "257"
 nl="“姓名”的长度超过20个字符（1个汉字=2个字符）。"
Case "258"
 nl="“地址”的长度超过20个字符（1个汉字=2个字符）。"
Case "259"
 nl="“信箱”的长度超过50个字符（1个汉字=2个字符）。"
Case "260"
 nl="“主页名称”的长度超过24个字符（1个汉字=2个字符）。"
Case "261"
 nl="“主页地址”的长度超过50个字符。"
Case "262"
 nl="“信箱”的格式有误。"
Case "263"
 nl="“主页地址”的格式有误。"
Case "264"
 nl="留言“内容”中不能出现连续的空白行。"
Case "265"
 nl="不能重复粘贴相同的留言。"
Case "266"
 nl="“主题”不能包含半角的“" & chr(34) & "”“'”引号。"
Case "300"
 nl="该用户名已经在聊天室中，不能重复进入。"
Case "301"
 nl="不能以“聊天室管理员”的名称进入聊天室中，请重回登录页面换名登录。"
Case "400"
 nl="对象：<font color=red>" & Request.QueryString("name") & "</font> 不在聊天室中，不能发送消息。"
Case "401"
 nl="消息的长度必须小于 1024 个字符。"
Case "402"
 nl="消息中不能出现连续的空白行。"
Case "403"
 nl="消息不能为空。"
Case "410"
 nl="对象：<font color=red>" & Request.QueryString("name") & "</font> 不在聊天室中，不能为其点歌。"
Case "420"
 nl="对不起：您要注册的名字和机器人同名。"
Case "421"
 nl="对不起：您要注册的名字和机器人同名。"
Case "422"
 nl="对不起：用户别区分大小写及全角半角。"
Case "423"
nl="对不起：不永许在同一时间多次注册用户名。如果想注册新的用户名,请关闭浏览器重新注册!"
Case else
 nl="错误：版权信息出错，请清空缓存重新来过"
End Select
nl="<p>　　" & nl & "</p>"%><html>
<head>
<title>出错提示</title>
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
<table border="0" bgcolor="#FF0099" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF">¤出错提示</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="javascript:history.go(-1)" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="关闭"><font color="000000">×</font></a></b></td>
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
<input type="button" name="ok" value="　确 定　" onclick=javascript:history.go(-1)>
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
