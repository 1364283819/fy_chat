<%@ LANGUAGE=VBScript%>
<%On Error Resume Next
Response.Expires=0
nickname=Session("fy_u_nickname")
usergrade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "error.asp?id=210"
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
 sql="SELECT username,grade,times,value,mvalue,regtime,lasttime,address,email,homepage,intro FROM reginfo WHERE username='" & name & "' and kill='0'"
else
 sql="SELECT username,grade,times,value,mvalue,regtime,lasttime,address,email,homepage,intro FROM reginfo WHERE username LIKE '%" & name & "%' and kill='0'"
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
rs.CacheSize=rs.PageSize
username=rs("username")
grade=rs("grade")
times=rs("times")
value=rs("value")
mvalue=rs("mvalue")
regtime=rs("regtime")
lasttime=rs("lasttime")
address=rs("address")
email=rs("email")
homepage=rs("homepage")
intro=rs("intro")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="0" align="center" cellpadding="6">
<tr align="center"> 
<td>���ҵ�<font color=red><%=totalrec%></font>������<font color=red><%=page%></font>����<%if page-1>0 then%><a href=friendqueryview.asp?name=<%=server.URLEncode(name)%>&querytype=<%=querytype%>&page=<%=page-1%>>��һ��</a><%else%>��һ��<%end if%>��<%if page+1<=totalpage then%><a href=friendqueryview.asp?name=<%=server.URLEncode(name)%>&querytype=<%=querytype%>&page=<%=page+1%>>��һ��</a><%else%>��һ��<%end if%>��<a href="friendquery.asp">�����ء�</a></td>
</tr>
</table>
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="F0F0F0" cellpadding="4">
<tr align="center"> 
<td>
<table border="0" cellpadding="3">
<tr> 
<td>�� �� ��:</td>
<td><font color=red><%=username%></font></td>
<td>�ȡ���:</td>
<td><font color=red><%if usergrade>=5 then
Response.Write grade
else
Response.Write "��Ȩ�鿴"
end if%></font></td>
</tr>
<tr> 
<td>�Ρ�����:</td>
<td><font color=red><%=times%></font></td>
<td>�»���:</td>
<td><font color=red><%if DateDiff("m",lasttime,now())<>0 then
Response.Write "ȱϯ"
else
Response.Write mvalue
end if%></font></td>
</tr>
<tr> 
<td>�ۻ�����:</td>
<td><font color=red><%=value%></font></td>
<td colspan="2"><%if email<>"" then%><a href=mailto:<%=email%>>����</a><%end if%>��<%if homepage<>"" then%><a href=<%=homepage%> target=_blank>��ҳ</a><%end if%></td>
</tr>
<tr> 
<td>ע��ʱ��:</td>
<td colspan="3"><font color=red><%=regtime%></font></td>
</tr>
<tr> 
<td>���ʱ��:</td>
<td colspan="3"><font color=red><%=lasttime%></font></td>
</tr>
<tr> 
<td>�ء���ַ:</td>
<td colspan="3"><font color=red><%=address%></font></td>
</tr>
<tr> 
<td>���˼��:</td>
<td colspan="3"><font color=red><%=intro%></font></td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>
