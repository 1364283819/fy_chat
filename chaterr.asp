<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Session.Abandon
Select Case id
Case "000"
 nl="�����Բ��𣬳�������Ŀ¼��������Ŀ¼���������д���Global.asa û�б�ִ�С���������Ҫ����Ŀ¼��֧�֣�"
Case "001"
 nl="�����ڼ������رա�<br><br>��ɴ������ԭ����Ҫ�У�<br>�������������紫�����⣬������Ļ���������������������޷��������ݣ�ϵͳ������Ϊ��ʱ���Ͽ������ӣ�<br>�����������ˡ�������¼���ػص�¼ҳ�棬��û���ȹرմ˴��ڣ�<br>�������㱻�߳��������ҡ�<br>�����������ʹ�ñ����ڽ��벻�����������⣬�����´��ڽ���ͳ����������Ļ�������ͳ�����Ļ������Ե������´����޷��̳��ϼ����ڵ�ֵ��<br><br>���������<br>�����رմ˴��ڣ����µ���¼ҳ�������û�����������е�¼��������Ǳ��߳������ң����㷽�����õ��û����� 5 �����ڲ���ʹ�á�����ǵڣ��������������������ɣŵ���ʱ�ļ���Ȼ����������������"
Case "002"
 nl="�����ڼ������رա�<br><br>ԭ��<br>�����㳬�� " & Application("fy_c_maxtimeout") & " ����û�з��ԣ�Ϊ���������������ϵͳ�Զ��������ռ�õ���Դ��<br><br>���������<br>�����رմ˴��ڣ����µ���¼ҳ�������û�����������е�¼��"
Case else
 nl="�����Բ��𣬸ó�������δ���Ǽǡ�"
End Select
nl="<p>" & nl & "</p>"%><html>
<head>
<title>������ʾ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<script LANGUAGE="JavaScript">if(window!=window.top)top.location.href=location.href;</script>
<table width="100%" border="0" height="100%">
<tr align="center"> 
<td>
<form method="post" action="">
<table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" bgcolor="E0E0E0">
<tr>
<td>
<table border="0" bgcolor="#FF0099" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF">�������ʾ</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="javascript:window.close()" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�ر�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
<td width="59" align="center" valign="top"><font face="Wingdings" color="#FF0000" style="font-size:32pt">L</font></td>
<td width="269">
<%=nl%>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<input type="button" name="ok" value="��ȷ ����" onclick=javascript:window.close()>
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
