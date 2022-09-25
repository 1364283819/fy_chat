<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
if Session("fy_u_nickname")="" then
 Response.Write "<" & "Script Language=Javascript>top.location.href='login.asp';</" & "Script>"
end if
grade=Session("fy_u_userinfo")(0)
%><html>
<head>
<title>高级功能菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
.p12{font-size:12pt;line-height:150%}
.p9{font-size:9pt;line-height:150%}
td{font-size:12pt;line-height:160%}
A:Hover{color:#FFFFFF;text-decoration:none;background-color:#0000FF}
A:Active{color:#FFFFFF;text-decoration:none;background-color:#FF0000}
a:visited{text-decoration:none}
a:link{text-decoration:none}
</style>
<base target="main">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="008888" class=p12 text="#FFFFFF" vlink="#FFFFFF" link="#FFFFFF">
<table width="100%" border="0" height="100%">
<tr valign="middle"> 
<td> 
<p align="center"><b><font color="FFFF00">高级功能区</font></b></p>
      <p align="center"><a href="mansm.asp">[功能说明]</a><br>
        <a href="manlog.asp?page=1">[聊务公开]</a><br>
        <a href="poll.asp">[投票系统]</a><br>
        <a href="maninfo.asp?page=1">[聊友信息]</a> 
        <%if grade>6 then%>
        <br>
        <a href="mangrade.asp">[级别管理]</a><br>
        <a href="manlock.asp">[ＩＰ管理]</a><br>
        <a href="manly.asp?page=1">[留言管理]</a> 
        <%end if
if grade>9 then%>
        <br>
        <a href="manacc.asp">[帐号管理]</a><br>
        <a href="manip.asp">[永久封锁]</a><br>
        <a href="mangg.asp">[站长公告]</a><br>
        <a href="manact.asp?page=1">[动作管理]</a><br>
        <a href="mandb.asp">[数据压缩]</a><br>
        <a href="mansys.asp">[系统参数]</a><br>
        <a href="relogin.asp" target="_top">[离开管理]</a><br>
        <%end if%>
</td>
</tr>
</table>
</body>
</html>
