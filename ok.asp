<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Select Case id
Case "100"
 nl="�ɹ��޸����룬������Ϊ <font color=red>" & Request.QueryString("new") & "</font>������Ρ�"
Case "101"
 nl="��ɱ������ɣ��û��� <font color=red>" & Request.QueryString("name") & "</font> �Ѿ���ɾ�������û��������м�¼��Ȩ�޾�����ʧ��"
Case "110"
 nl="������Ϣ�Ѿ��޸ĳɹ���"
Case "200"
 nl="��Ϣ�Ѿ��ɹ����͸�<font color=red>" & Request.QueryString("name") & "</font>����������Ϣ�б��в鿴����Ϣ�Ƿ��Ѿ���ȡ����"
Case "210"
 nl="�����Ѿ������ɡ�"
Case "300"
 nl="���ݿⱸ����ɣ��뵽 backup Ŀ¼���� global.mdb ����ѹ����"
Case "301"
 nl="�Ѿ���ѹ��������ݿ⸲�Ǿ����ݿ⣬ȷ����ȷ����ɾ���ñ������ݿ⣬�Է����������ء�"
Case "302"
 nl="�������ݿ�ɾ����ɡ�"
Case else
 nl="�Բ��𣬸�����δ���Ǽǡ�"
End Select
nl="<p>����" & nl & "</p>"%><html>
<head>
<title>�����ɹ�</title>
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
<table border="0" bgcolor="#009900" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF" face="Wingdings">z</font><font color="FFFFFF">�����ɹ�</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="<%if id="200" then%>javascript:window.close();<%else%>javascript:history.go(-1)<%end if%>" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="����"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
<td width="59" align="center" valign="top"><font face="Wingdings" color="#FF0000" style="font-size:32pt">J</font></td>
<td width="269">
<%=nl%>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<%if id="200" then
Response.Write "<input type='button' name='ok' value=' �鿴�б� ' onclick=javascript:top.location.href='webicqlist.asp'>"
else
Response.Write "<input type='button' name='ok' value='��ȷ ����' onclick='javascript:history.go(-1)'>"
end if%>
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