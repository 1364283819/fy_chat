<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<6 then Response.Redirect "manerr.asp?id=200"
if inthechat<>"1" and nickname<>"�����ҹ���Ա" then Response.Redirect "manerr.asp?id=201"
kickname=Trim(Request.QueryString("id"))
if kickname="" then Response.Redirect "manerr.asp?id=202"
if CStr(kickname)=CStr(nickname) then Response.Redirect "manerr.asp?id=205"%><html>
<head>
<title>���˲���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">�����˲�����</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>��ע�������</b> <br>
���������������˵�ԭ����ܽ������߳������ң����߳��ġ��û������� 5 �����ڲ���ʹ�á�<br>
�������˲����ᱻ��¼�ڡ����񹫿������У���������Ѽල����ˣ������������ˣ� 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form method="post" action="mankickok.asp">
<tr>
<td>
<table border="0" cellpadding="4">
<tr> 
<td align="right">�߳��û�����</td>
<td><font color="#FF0000"><%=kickname%> 
<input type="hidden" name="kickname" value="<%=kickname%>">
</font></td>
</tr>
<tr> 
<td align="right">���˵�ԭ��</td>
<td>(&lt;=60�ַ�) </td>
</tr>
<tr> 
<td align="right"> 
<select name="select" onchange="javascript:document.forms[0].kickwhy.value=this.value;document.forms[0].kickwhy.focus();">
<option value="" selected>����</option>
<option value="����֤�Ѿ����ߣ����ֿ����������С�">�ѵ���</option>
<option value="��ȡ������ʮ�ֲ��š�">����ID</option>
<option value="��ˢ���������ֲ�����">��ˢ��</option>
<option value="��������ɢ�����������µ����ۡ�">������</option>
<option value="������������򣬽�����������">����</option>
<option value="��������ɢ��Υ�����ҷ��ɷ�������ۡ�">Υ��</option>
</select>
��</td>
<td> 
<input type="text" name="kickwhy" maxlength="60" size="50">
</td>
</tr><%if nickname="�����ҹ���Ա" then%>
<tr>
<td align="right">����Աѡ�</td>
<td>
<input type="radio" name="logok" value="1" checked>�������񹫿���
<input type="radio" name="logok" value="0">���������񹫿���</td>
</tr><%end if%>
</table>
<div align="center">
<input type="submit" name="kickok" value="�߳�">
<input type="button" value="����" onclick="javascript:history.go(-1)">
</div>
</td>
</tr>
</form>
</table>
<br>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
