<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
useronlinename=Application("fy_c_useronlinename")
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(useronlinename," "&nickname&" ")=0 then Response.Redirect "chaterr.asp?id=001"
who=Trim(Request.QueryString("who"))
if who="" then who=nickname
show=Split(Trim(useronlinename)," ",-1)
x=UBound(show)
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")%><html>
<head>
<title>呼叫聊友</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script Language=JavaScript>
function check(){if(document.forms[0].intro.value==""){alert("消息内容不能为空！");return false;}document.forms[0].Submit.disabled=1;return true;}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
<table width="100%" border="0" height="100%">
<tr>
<td>
<table width=350 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<tr valign="top"> 
<td> 
<table border=0 bgcolor=#3399FF cellspacing=0 cellpadding=2 width=344>
<tr> 
<td width=326><font color=FFFFFF face=Wingdings>*</font><font color=FFFFFF>发送 Web ICQ 消息</font></td>
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
<td width="25%" bgcolor="#000000"><font color="FFFFFF">发送消息</font></td>
<td width="25%" bgcolor="E0E0E0"><a href=webicqlist.asp><font color="black">消息列表</font></a></td>
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="200" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0">
<form method="post" action="webicqsend.asp" onsubmit='return(check());'>
<tr>
<td> 
<div align="center"><font color="#FF0000">消息的长度必须小于1024字符<br>
</font><br>
</div>
<table border="0" align="center">
<tr> 
<td>对象：</td>
<td> 
<select name="towho"><%for i=0 to x%>
<option value="<%=show(i)%>"<%if CStr(show(i))=CStr(who) then Response.Write " selected"%>><%=show(i)%></option>
<%next%></select>　共 <font color=red><%=x+1%></font> 人 (ALT+S=发送)
</td>
</tr>
<tr> 
<td>消息：</td>
<td> 
<textarea name="intro" cols="40" rows="5"></textarea>
</td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" name="Submit" value="发送" accesskey='s'>
<input type="reset" value="重写">
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
</td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>