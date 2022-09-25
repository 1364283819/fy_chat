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
                        <td align="center" bgcolor="#cccccc" width="16%"><font color=white><a href="loginsm.asp"><font color="#000000">登录说明</font></a></font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=logingb.asp><font color=black>留 言 簿</font></a></td>
                        <td width="16%" align="center" bgcolor="#000000"><font color="#FFFFFF">版权声明</font></td>
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
                     更    新    说    明
---------------------------------------------------------------
■ 只有使用 Internet Explorer 4.0 以上版本才能获得最佳效果
　 强烈推荐使用 Internet Explorer 5.5。

⒈本聊天室界面采部分代码采用红蜻蜒聊天室3.0版,原始版权为稻香居
  虽界面相同,但聊天室中最主要的取话和发话己全部重写,所以:风云
  聊天室归www.21jm.net。
⒉本聊天室部分全部采用了最新风云II的发言机制,具有发言速度快,占
  用系统资源低的特点。
⒊本聊天室采用两种刷新方法,一种是原始的框架刷新方式,一种是Java
  刷新方式。
⒋本聊天室新增头像功能。
⒌本聊天室全部改进过滤,屏蔽,名单刷新,标题刷新.在不影响安全的情
  下,部分属性采用了Cookie来实现,去除了大量的Session,名单刷新全
  自动实现,名单区采用最新的显示方式,页面静止,无刷新感受!标题栏
  也一样实现无刷新方式显示
⒍改进登陆检测,防止在线探测用户密码。
⒎改进后台管理方式,去除大量重复的文件。
⒏改进数据库结构。
⒐新增泡点功能。
⒑双击滚/停屏方式。
⒒公用对话区对话背影显示方式。
⒓修正了用全角和半角同时进聊天室的Bug。
===============================================================
　程序作者:天机
　2002年8月1日
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
