<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<9 then Response.Redirect "manerr.asp?id=220"
if inthechat<>"1" and nickname<>"�����ҹ���Ա" then Response.Redirect "manerr.asp?id=221"
bombname=Trim(Request.QueryString("id"))
if bombname="" then Response.Redirect "manerr.asp?id=222"
if CStr(bombname)=CStr(nickname) then Response.Redirect "manerr.asp?id=223"%><html>
<head>
<title>ը������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��ը��������</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>��ע�������</b> <br>
��������������ը����ԭ�����Ͷ��ը������ը�Ķ���Ļ�������ͣ�ص����´��ڣ�ֱ��ϵͳ��Դ�ľ���������<br>
����ը�������ᱻ��¼�ڡ����񹫿������У���������Ѽල����ˣ���������ը�ˣ� 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form method="post" action="manbombok.asp">
<tr>
<td>
<table border="0" cellpadding="4">
<tr> 
<td align="right">��ը�û�����</td>
<td><font color="#FF0000"><%=bombname%> 
<input type="hidden" name="bombname" value="<%=bombname%>">
</font></td>
</tr>
<tr> 
<td align="right">��ը��ԭ��</td>
<td>(&lt;=60�ַ�) </td>
</tr>
<tr> 
<td align="right"> 
<select name="select" onchange="javascript:document.forms[0].bombwhy.value=this.value;document.forms[0].bombwhy.focus();">
<option value="" selected>����</option>
<option value="���ܻ�ӭ�ˡ�">����ӭ</option>
<option value="��ȡ������ʮ�ֲ��š�">����ID</option>
<option value="��ˢ���������ֲ�����">��ˢ��</option>
<option value="��������ɢ�����������µ����ۡ�">������</option>
<option value="������������򣬽�����������">����</option>
<option value="��������ɢ��Υ�����ҷ��ɷ�������ۡ�">Υ��</option>
</select>
��</td>
<td> 
<input type="text" name="bombwhy" maxlength="60" size="50">
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
<input type="submit" name="bombok" value="��ը">
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
