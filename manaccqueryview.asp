<%@ LANGUAGE=VBScript%>
<%
On Error Resume Next
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
name=Trim(Request.QueryString("name"))
querytype=Trim(Request.QueryString("querytype"))
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
if name="" then Response.Redirect "error.asp?id=230"
Select Case querytype
 Case "0"
  querytype=0
 Case "1"
  querytype=1
 Case else
  querytype=0
End Select
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
if querytype=0 then
 sql="SELECT username,grade,times,value,mvalue,regtime,regip,lasttime,lastip,lastkick,address,email,homepage,intro FROM reginfo WHERE username='" & name & "' and kill='0'"
else
 sql="SELECT username,grade,times,value,mvalue,regtime,regip,lasttime,lastip,lastkick,address,email,homepage,intro FROM reginfo WHERE username LIKE '%" & name & "%' and kill='0'"
end if
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=231&name="&server.URLEncode(name)
end if
rs.PageSize=1
totalpage=rs.PageCount
totalrec=rs.RecordCount
if int(page)>int(totalpage) then page=totalpage
rs.AbsolutePage=page
showusername=rs("username")
showgrade=rs("grade")
showtimes=rs("times")
showvalue=rs("value")
showmvalue=rs("mvalue")
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
<font color="#FF0000">����ѯ�û������������ϡ�</font><br>
</div>
<hr noshade size="1" color=009900>
<table border="0" align="center" cellpadding="6">
<tr align="center"> 
<td>���ҵ�<font color=red><%=totalrec%></font>������<font color=red><%=page%></font>����<%if page-1>0 then%><a href=manaccqueryview.asp?name=<%=server.URLEncode(name)%>&querytype=<%=querytype%>&page=<%=page-1%>>��һ��</a><%else%>��һ��<%end if%>��<%if page+1<=totalpage then%><a href=manaccqueryview.asp?name=<%=server.URLEncode(name)%>&querytype=<%=querytype%>&page=<%=page+1%>>��һ��</a><%else%>��һ��<%end if%>��<a href="manaccquery.asp">�����ء�</a></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center> 
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#E0E0E0" cellpadding="4">
<tr align="center"> 
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>�� �� ��:</td>
<td><font color=red><%=showusername%></font></td>
<td>�ȡ���:</td>
<td><font color=red><%=showgrade%></font></td>
</tr>
<tr> 
<td>�Ρ�����:</td>
<td><font color=red><%=showtimes%></font></td>
<td>�»���:</td>
<td><font color=red><%if DateDiff("m",showlasttime,now())<>0 then
Response.Write "ȱϯ"
else
Response.Write showmvalue
end if%></font></td>
</tr>
<tr> 
<td>�ۻ�����:</td>
<td><font color=red><%=showvalue%></font></td>
<td colspan="2"><%if showemail<>"" then%><a href=mailto:<%=showemail%>>����</a><%end if%>��<%if showhomepage<>"" then%><a href=<%=showhomepage%> target=_blank>��ҳ</a><%end if%></td>
</tr>
<tr> 
<td>ע��ʱ��:</td>
<td colspan="3"><font color=red><%=showregtime%></font></td>
</tr>
<tr> 
<td>ע��ɣ�:</td>
<td colspan="3"><font color=red><%=showregip%></font></td>
</tr>
<tr> 
<td>���ʱ��:</td>
<td colspan="3"><font color=red><%=showlasttime%></font></td>
</tr>
<tr> 
<td>���ɣ�:</td>
<td colspan="3"><font color=red><%=showlastip%></font></td>
</tr>
<tr>
<td>�����:</td>
<td colspan="3"><font color=red><%=showlastkick%></font></td>
</tr>
<tr> 
<td>�ء���ַ:</td>
<td colspan="3"><font color=red><%=showaddress%></font></td>
</tr>
<tr> 
<td>���˼��:</td>
<td colspan="3"><font color=red><%=showintro%></font></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
