<%@ LANGUAGE=VBScript%>
<%
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
visitor=Application("fy_c_visitor")
chatroomname=Application("fy_c_chatroomname")
user=Application("fy_c_user")
sn=Application("fy_c_sn")
copyright=Application("fy_c_copyright")
chatroombgimage=Application("fy_c_chatroombgimage")
homepageurl=Application("fy_c_homepageurl")
opendate=Application("fy_c_opendate")
chatroombgcolor=Application("fy_c_chatroombgcolor")
logo=Application("fy_c_logo")
ver=Application("fy_c_ver")%><html>
<head>
<title><%=chatroomname&" "&ver%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<table width=100% border=0 height=100%>
<tr>
<td>
<table width=500 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<form>
<tr> 
<td>
<table border=0 bgcolor=#0066FF cellspacing=0 cellpadding=2 width=497>
<tr> 
<td width=482><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>登录说明 - <%=chatroomname&" "&ver%></font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="<%=homepageurl%>" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="退出"><font color="000000">×</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table width=497 height=330 border=1 cellspacing=0 bgcolor=FFFFFF>
<tr valign="top"> 
<td>
<table width="100%" border="0" cellpadding="3">
<tr> 
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=login.asp><font color=black>登录窗口</font></a></td>
<td align="center" bgcolor="#000000" width="16%"><font color=white>登录说明</font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=logingb.asp><font color=black>留 言 簿</font></a></td>
                        <td width="16%" align="center" bgcolor="#cccccc"><a href="copyright.asp"><font color="#000000">版权声明</font></a></td>
<td width="16%">&nbsp;</td>
<td width="20%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="312" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="5">
<tr valign="middle"> 
<td> 
<p>　　请认真阅读本说明：</p>
<p align="center"> 
<textarea name=sm cols=65 rows=16 readonly style="background-color:FFCC99">
===============================================================
                     注    意    事    项
---------------------------------------------------------------
1.请遵守中华人民共和国有关法律法规，不得在聊天室及留言簿中发表
  有违法规、有悖道德的言论。
2.请尊重他人，开玩笑也不可太过火，更不能进行人身攻击，让我们共
  同创造一个优雅、富有人情味的聊天环境。
---------------------------------------------------------------
                     使    用    说    明
---------------------------------------------------------------
■ 只有使用 Internet Explorer 4.0 以上版本才能获得最佳效果
　 强烈推荐使用 Internet Explorer 5.0。

⒈本聊天室不需要专门进行注册，只需要输入“用户名”及“密码”就
　可以进入，此时系统将自动完成注册过程，因此请你记牢密码。如果
　遗忘密码，请给站长留言或来信，由站长为你设置新密码（注意：站
　长也不能看到用户的密码）。
⒉用户名最长只能10个字符（每个汉字占两个字符），只能使用中文、
　英文字母、数字。称谓最长只能4个字符（也可以不填）。密码最长
　为10位，只能用英文字母、数字。另：所有这些均不能带有空格。
⒊在聊天室中，如果你要离开，最好使用“离开”功能，这样聊友们才
　知道你已经离开了。如果你直接关闭聊天室窗口，三分钟后，系统将
　显示“‘砰’的一声，XXX重重地摔了下去……”表示你已经掉线或
　超时断开连接了。
⒋如果在聊天室中掉线，重新拨号上来，登录时显示“该用户名正在使
　用”中，则请你关闭浏览器，并等五分钟后再登录。
⒌如果在聊天室中潜水（不发言）时间超过<%=Application("fy_c_maxtimeout")%>分钟，系统将自动删除该
　用户，并显示：XXX由于潜水时间过长，不幸沉入海底……
⒍如果你超过30天没有来，你的用户名将被系统自动删除，删除后，原
　来的用户名所有的权限都将消失，再用该用户名进来时，系统将作为
　新用户处理：经验值0分、等级1级。对于那些只使用 1 次的用户名，
　只为其保留 7 天的时间。
⒎本聊天室使用经验值等级制，刚进来的聊友经验值为0分，等级为一
　级，一级聊友不能改变聊天室的标题。当你的经验值达到<%=Application("fy_c_level1to2")%>分时系统
　将自动把你升为二级，达到<%=Application("fy_c_level2to3")%>分时升级三级，达到<%=Application("fy_c_level3to4")%>分时升为四
　级，达到<%=Application("fy_c_level4to5")%>分时升至五级。升级后，用户只需点“存点”，新级别
　即可生效，无需重新登录。对于严重违反聊天室规则的用户，版主将
　禁用直至删除该聊友的用户名，则此用户名的所有权限全部被取消。
⒏用户名被踢出聊天室后，该用户名在 5 分钟内不能使用。
⒐用户在聊天室中每停留 1 分钟，经验值将增加 1 分。可以随时用
　“存点”功能将经验值存起来。如果掉线或潜水超时而被清除，则新
　增长的经验值不会加入。
⒑本聊天室启用监督机制，即所有版主（或拥有高级权限的聊友）的操
　作，比如清屏、踢人、升级、降级等操作均会被系统自动记录下来，
　任何用户均可以查看这些记录，如果你发现某些版主有不公平、不合
　理的行为，请给站长留言或来信，站长将对这些版主的帐号进行降级
　或禁用。这些记录只保留 7 天。
⒒本聊天室的留言簿支持“悄悄话”功能，并且支持密码验证，即：当
　你使用已经在本聊天室注册的用户名进行留言时，必须输入注册时的
　密码才能进行，这样可以防止有人冒名留言。当使用“悄悄话”功能
　时，该留言就只有你和对方才能看到。要看到“悄悄话”必须先登录
　进入聊天室后，方可看到。
⒓进入聊天室后，你会看到类似这样的留言提示：7/29/253。这表示：
　你现在能看到的留言有253条，其中29条是和你有关的（你写的或别
　别人写给你的），里面又有7条是“悄悄话”。
⒔留言簿只保留最近30天的留言内容。
⒕如果你想让聊友更多的了解自己，可以在登录后的“个人信息”中输
　入自己的地址、电子信箱、主页地址及个人简介，方便大家的联系，
　同时你还可以在“聊友查询”中查找对方的个人信息。
⒖如果用户在聊天室中未保存的经验值超过 60 分，则系统将自动清除
　该用户，因为该用户可能是已经掉线而名字又被卡在聊天室中。所以
　请聊友们要经常用“存点”保存一下自己的经验值。
⒗本聊天室Web ICQ可用于给在线的聊友发送短消息，也可以用来判断
　对方是否还在聊天室中。你只需要使用“呼叫”功能，给对方发一条
　消息，然后打开消息列表，看看两分钟内这条消息有没有被取走，如
　果没有，则说明该用户已经不在聊天室中，他的名字是挂在聊天室中。
　对没有被收取的消息，只保留 10 分钟。
===============================================================
　<%=chatroomname%>
　<%=opendate%>
　END
</textarea>
</p>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width=100% border=0 cellspacing=0>
<tr>
<td>
<input type="text" name="user" readonly value="<%=user%>" size="35" style="background-color:E0E0E0">
</td>
<td>
<input type="text" name="sn" readonly value="SN:<%=sn%>" size="19" style="background-color:E0E0E0">
</td>
<td align="right">
<input type="text" name="copyright" readonly value="<%=copyright%>" size="22" style="background-color:E0E0E0">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
</body>
</html>
