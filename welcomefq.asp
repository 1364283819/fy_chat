<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
if Session("fy_u_nickname")="" then Response.Redirect "login.asp"
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
ver=Application("fy_c_ver")
nickname=Session("fy_u_nickname")%><html>
<head>
<title><%=nickname&" �� "&chatroomname&" ��"%></title>
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
<table border=0 bgcolor=#009900 cellspacing=0 cellpadding=2 width=497>
<tr> 
<td width=482><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>���Ѳ�ѯ - <%=chatroomname%></font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="relogin.asp" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�˳�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table width=497 height=330 border=1 cellspacing=0 bgcolor="FFFFFF">
<tr valign="top"> 
<td>
<table width="100%" border="0" cellpadding="3">
<tr> 
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcome.asp><font color=black>��ӭҳ��</font></a></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcomemy.asp><font color=black>������Ϣ</font></a></td>
<td align="center" bgcolor="#000000" width="16%"><font color=white>���Ѳ�ѯ</font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcomegb.asp><font color=black>�鿴����</font></a></td>
<td width="16%" bgcolor="#CCCCCC" align="center"><a href=welcomeph.asp><font color=black>��������</font></a></td>
<td width="20%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="312" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="5">
<tr valign="middle" align="center"> 
<td>
<p>�����������ѯ�����ѵġ��û�����</p>
<p><iframe name="gb" frameborder="0" scrolling="auto" src="friendquery.asp" height="230" width="470"></iframe></p>
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
