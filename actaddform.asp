<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<3 then Response.Redirect "manerr.asp?id=101"
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")%><html>
<head>
<title>����¶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
<table width="100%" border="0" height="100%">
<tr>
<td>
<table width=350 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<tr valign="top"> 
<td> 
<table border=0 bgcolor=#9999FF cellspacing=0 cellpadding=2 width=344>
<tr> 
<td width=326><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>����¶���</font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="javascript:window.close()" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�˳�"><font color="000000">��</font></a></b></td>
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
<td width="25%" bgcolor="#000000"><font color="FFFFFF">��Ӷ���</font></td>
<td width="25%" bgcolor="E0E0E0"><a href=actaddhelp.asp><font color="black">�����ļ�</font></a></td>
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="200" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0">
<form method="post" action="actadd.asp">
<tr>
<td> 
<table border="0" align="center">
<tr> 
<td>���ƣ�</td>
<td> 
<input type="text" name="actname" maxlength="4" size="8">
</td>
<td colspan="2" align="right">��Χ�� 
<select name="range">
<option value="0" selected>0 ���Լ�</option>
<option value="1">1 �Ա���</option>
</select>
</td>
</tr>
<tr> 
<td>���ݣ�</td>
<td colspan="3"> 
<input type="text" name="act" size="40" maxlength="98" value="//">
</td>
</tr>
<tr> 
<td colspan="4" align="center"> 
<input type="submit" name="Submit" value="���">
<input type="reset" value="��д">
</td>
</tr>
</table>
<div align="center"></div>
<p align="center">## �����Լ� %% �������<br>
��ϸ����������ļ� </p>
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