<%@ LANGUAGE=VBScript%>
<%
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
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%>" background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
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
<td width="25%" bgcolor="E0E0E0"><a href=actaddform.asp><font color="black">��Ӷ���</font></a></td>
<td width="25%" bgcolor="#000000"><font color="FFFFFF">�����ļ�</font></td>
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="200" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0">
<form>
<tr>
<td>
<textarea name="help" cols="50" rows="12" readonly style="background-color=FFCC99">
����1.����¶���ǰ���������Ƿ��Ѿ�����ͬ�Ķ������������Ҫ���ظ���ӡ������ظ��Ķ��������ݲ��ŵĶ�������һ��ɾ����
����2.���ʱ����ѡ��ö��������ͣ��ǡ����Լ����Ļ��ǡ��Ա��ˡ��Ķ�����
����3.���������ơ����ֻ���ĸ��ַ�����������������������壬�磺�ټ���ף�������յȡ�
����4.�Զ��嶯��ָ�����ԡ�//����ͷ����䣬���� 100 ���ַ�������У��á�##�������Լ������֣��á�%%������Է������֡�
����5.��//���ᱻ�Զ��滻Ϊ��������������ˣ���Ҫ�������������ġ�//##����ʽ��
-------------------------------------------------
�������磺
-------------------------------------------------
����//��������ס%%���֣����췢�ģ�����##һ����������ʧ���ģ���
-------------------------------------------------
�������跢����Ϊ����壬����Ϊ��ɽɽ�����Ժ�ͻ��ɣ�
-------------------------------------------------
������弤������סɽɽ���֣����췢�ģ����ҷ��һ����������ʧ���ģ���
-------------------------------------------------
</textarea>
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