<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
username=server.HTMLEncode(Trim(Request.Form("username")))
if username="" then Response.Redirect "manerr.asp?id=135"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username,grade,times,value,regtime,regip,lasttime,lastip,lastkick,address,email,homepage,intro FROM reginfo WHERE kill='0' AND leave='0' AND username='" & username & "'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=136"
end if
showusername=rs("username")
showgrade=rs("grade")
showtimes=rs("times")
showvalue=rs("value")
showregtime=rs("regtime")
showregip=rs("regip")
showlasttime=rs("lasttime")
showlastip=rs("lastip")
showlastkick=rs("lastkick")
showaddress=rs("address")
showemail=rs("email")
showhomepage=rs("homepage")
showintro=rs("intro")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ���</font></h1>
<font color="#FF0000">��ɾ���ʺš�</font><br>
</div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����Ѿ��ҵ����û����������Ǹ��û�����ע�����ϣ���ȷ���Ƿ�Ҫɾ���� 
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccdel1ok.asp">
<tr> 
<td> 
<table width="100%" border="0">
<tr> 
<td>�� �� ����</td>
<td> <font color="#FF0000"> 
<input type="hidden" name="username" value="<%=username%>">
<%=showusername%></font></td>
</tr>
<tr> 
<td>�ȡ�������</td>
<td><font color="#FF0000"><%=showgrade%></font></td>
</tr>
<tr> 
<td>���ô�����</td>
<td><font color="#FF0000"><%=showtimes%></font></td>
</tr>
<tr> 
<td>�� �� ֵ��</td>
<td><font color="#FF0000"><%=showvalue%></font></td>
</tr>
<tr> 
<td>ע��ʱ�䣺</td>
<td><font color="#FF0000"><%=showregtime%></font></td>
</tr>
<tr> 
<td>ע��ɣУ�</td>
<td><font color="#FF0000"><%=showregip%></font></td>
</tr>
<tr> 
<td>���ʱ�䣺</td>
<td><font color="#FF0000"><%=showlasttime%></font></td>
</tr>
<tr> 
<td>���ɣУ�</td>
<td><font color="#FF0000"><%=showlastip%></font></td>
</tr>
<tr> 
<td>����ߣ�</td>
<td><font color="#FF0000"><%=showlastkick%></font></td>
</tr>
<tr> 
<td>����ʡ�У�</td>
<td><font color="#FF0000"><%=showaddress%></font></td>
</tr>
<tr> 
<td>�������䣺</td>
<td><font color="#FF0000"><%=showemail%></font></td>
</tr>
<tr> 
<td>��ҳ��ַ��</td>
<td><font color="#FF0000"><%=showhomepage%></font></td>
</tr>
<tr> 
<td>���˼�飺</td>
<td><font color="#FF0000"><%=showintro%></font></td>
</tr>
<tr> 
<td colspan="2" align="center">
<input type="submit" name="Submit" value="ɾ��">
<input type="button" value="����" onclick="javascript:history.go(-1)">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
