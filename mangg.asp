<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=255"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT gbtop FROM gbooktop"
rs.open sql,conn,1,1
gbtop=rs("gbtop")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>վ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��վ�����桿</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">ˢ��</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�������������ڸ������Բ�������ġ�վ�����桱�������ұ������Ķ������ݡ� 
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<form method="post" action="manggtitle.asp">
<tr>
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>�����ұ����У�</td>
<td> 
<textarea name="title" cols="70" rows="4"><%=Application("hg_title")%></textarea>
</td>
</tr>
<tr> 
<td>�Ƿ�ʹ��HTML��</td>
<td> 
<input type="radio" name="html" value="0" checked>
��ʹ��HTML 
<input type="radio" name="html" value="1">
ʹ��HTML </td>
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
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<form method="post" action="mangggbtop.asp">
<tr> 
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>���Բ������棺</td>
<td> 
<textarea name="gbtop" cols="70" rows="4"><%=gbtop%></textarea>
</td>
</tr>
<tr> 
<td>�Ƿ�ʹ��HTML��</td>
<td> 
<input type="radio" name="html" value="0" checked>
��ʹ��HTML 
<input type="radio" name="html" value="1">
ʹ��HTML </td>
</tr>
<tr> 
<td colspan="2" align="center">
<input type="submit" value="�޸�">
<input type="button" value="���"onClick="javascript:document.forms[1].gbtop.value=''">
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
