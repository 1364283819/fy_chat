<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=310"
dieip=Application("fy_c_dieip")
if left(dieip,1)=";" then dieip=Right(dieip,len(dieip)-1)
if Right(dieip,1)=";" then dieip=left(dieip,len(dieip)-1)%><html>
<head>
<title>���÷���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">�����÷�����</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">ˢ��</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����������������÷����ɣл�ɣжΡ��������ģɣл�ɣжν���Զ�޷���¼���������ҡ�Ҫ������������±���ɾ����Ӧ�ɣУ��Σ����ɡ��ɣи�ʽ���£�����Ҫ������<font color="#FF0000">10.255.255.1</font>���͡�<font color="#FF0000">255.*.*.*</font>���ģɣУ������¿������롰<font color="#FF0000">10.255.255.1;255.*.*.*;</font>������ÿ���ɣУ��Σ��ð�ǵķֺŸ��������ܳ��ֿո�Ҳ���ܰ��س����ɣжβ��ܳ������ָ�ʽ��<font color="#FF0000">255.*.*.255</font>�� 
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<form method="post" action="manipok.asp">
<tr>
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>���÷���IP��</td>
<td> 
<textarea name="dieip" cols="70" rows="10"><%=dieip%></textarea>
</td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" value="�޸�">
<input type="button" value="���"onClick="javascript:document.forms[0].title.value=''">
<input type="reset" value="��ԭ">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
