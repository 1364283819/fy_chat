<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ���</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����ʺż�ID�����û�����������ʱȡ���ǳơ�������������������δ�õ��ʺš�������ֻ�ù�һ�ε��ʺš��Ѿ���ɱ���û������趨/������ñ���ĳЩ�û���������ĳ���û��������루�����û���������ʱ��վ���������������趨��Ȼ��֪ͨ���û������룩����ѯĳ���û�����ȫ�����ϣ��������г������û����� 
<hr noshade size="1" color=009900>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">�����ʺ�</font></td>
</tr>
<tr>
<td class=p150 width="388"> ���� <a href="manaccdel30.asp?page=1">��������δ�õ��ʺ�</a><br>
���� <a href="manaccdel7.asp?page=1">��������ֻ�ù�һ�ε��ʺ�</a> <br>
���� <a href="manaccdelkill.asp?page=1">�����Ѿ���ɱ���ʺ�</a><br>
���� <a href="manaccdelre.asp">�ָ��ʺ�</a><br>
���� <a href="manaccdel.asp">ɾ���ʺ�</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">���ñ���</font></td>
</tr>
<tr> 
<td class=p150 width="388"> ���� <a href="manaccyjlist.asp?page=1">�г�Ŀǰ���ñ������û���</a><br>
���� <a href="manaccyjadd.asp">������ñ����û���</a><br>
���� <a href="manaccyjdel.asp">ȡ�����ñ����û���</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">����ע������</font></td>
</tr>
<tr> 
<td class=p150 width="388"> ���� <a href="manaccregrename.asp">�ʺŸ���</a><br>
���� <a href="manaccregcpass.asp">��������</a></td>
</tr>
</table>
<br>
<table width="390" border="1" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" align="center">
<tr bgcolor="#0099FF"> 
<td width="388"><font face="Wingdings" color="#FFFFFF">1</font><font color="#FFFFFF">�ʺŲ�ѯ</font></td>
</tr>
<tr> 
<td class=p150 width="388"> ���� <a href="manaccquery.asp">��ѯ�û�������������</a><br>
���� <a href="manaccqueryip.asp">���ɣв�ѯ�ʺ�</a><br>
���� <a href="manaccquerydate.asp">�����ڲ�ѯ�ʺ�</a><br>
���� <a href="manaccqueryvalue.asp?page=1">���ۻ����г��ʺ�</a><br>
���� <a href="manaccquerymvalue.asp?page=1">���»����г��ʺ�</a><br>
���� <a href="manaccquerygrade.asp">�������г������ʺ�</a><br>
���� <a href="manaccquerymyinfo.asp?page=1">�г��������Ϸǿյ��ʺ�</a><br>
���� <a href="manaccquerykick.asp?page=1">�г��������߹����ʺ�</a></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
