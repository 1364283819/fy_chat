<%@ LANGUAGE=VBScript%>
<%
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type='text/css'>
body{font-size:9pt;}
td{font-size:9pt;}
input{font-size:9pt;}
a{font-size:9pt; color:black;text-decoration:none;}
a:hover{color:red;text-decoration:none;}
</style>
<script Language="Javascript">
exit="exitchat.asp";
if(parent.document.URL.indexOf("file:")>=0||parent.f2.document.URL.indexOf("file:")>=0){parent.location.href='chaterr.asp?id=001';}function showname(){if(parent.m.location.href=="about:blank"){parent.m.location.href="f3.asp";}else{parent.m.location.reload();}}
function ex(){
if(confirm("您真的要退出聊天室？")){parent.t.location.href='about:blank';setTimeout('top.location.href=exit',500);return true;
}}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<table width="100%" border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#CCCCCC" cellpadding="2">
<tr align="center"> 
<td><a href="savevalue.asp" onMouseOver="window.status='立即保存经验值，并显示当前状态。';return true" onMouseOut="window.status='';return true" target="f3">存点</a></td>
<td><a href="#" onMouseOver="window.status='立即更新在线聊友名单。';return true" onMouseOut="window.status='';return true" onclick="javascript:showname();">名单</a></td>
<td><a href="mask.asp" onMouseOver="window.status='不显示某些聊友的发言。';return true" onMouseOut="window.status='';return true" target="f3">屏蔽</a></td>
</tr>
<tr align="center"> 
<td><a href="#" onMouseOver="window.status='启用分屏功能。';return true" onMouseOut="window.status='';return true" onclick="javascript:parent.tbclutch();">分屏</a></td>
<td><a href="song.asp" onMouseOver="window.status='点歌给自己或其他聊友。';return true" onMouseOut="window.status='';return true" target="f3">点歌</a></td>
<td><a href="#" onMouseOver="window.status='发送 Web ICQ 消息。';return true" onMouseOut="window.status='';return true" onclick="javascript:window.open('webicq.asp','hqtwebicq','width=380,height=320')">呼叫</a></td>
</tr>
<tr align="center"> 
<td><a href="#" onclick="javascript:parent.qp()" onMouseOver="window.status='清除对话区的所有对话。';return true" onMouseOut="window.status='';return true">清屏</a></td>
<td><a href="manage.asp" onMouseOver="window.status='进入聊天室管理区。';return true" onMouseOut="window.status='';return true" target="_blank">管理</td>
<td><a href="#" onMouseOver="window.status='退出聊天室，并自动保存经验值。';return true" onMouseOut="window.status='';return true" onclick="javascript:ex()">离开</a></td>
</tr>
</table>
</body>
</html>
