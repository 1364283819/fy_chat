<%@ LANGUAGE=VBScript%>
<%'On Error Resume Next
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
dt1=Trim(Request("date1"))
dt2=Trim(Request("date2"))
tp=Trim(Request("type"))
if dt1="" or dt2="" then Response.Redirect "manerr.asp?id=102"
if Not(IsDate(dt1) and IsDate(dt2)) then Response.Redirect "manerr.asp?id=311"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
if tp="1" then
 sql="SELECT username,grade,times,value,regtime,lastip,lasttime FROM reginfo WHERE kill='0' AND regtime>'" & dt1 & "' AND regtime<'" & dt2 & "'"
else
 sql="SELECT username,grade,times,value,regtime,lastip,lasttime FROM reginfo WHERE kill='0' AND lasttime>'" & dt1 & "' AND lasttime<'" & dt2 & "'"
end if
rs.open sql,conn,1,1
rs.PageSize=15
totalrec=rs.RecordCount
totalpage=rs.PageCount
if page>totalpage then page=totalpage
if totalrec>0 then
 rs.AbsolutePage=page
 p=1+(page-1)*rs.PageSize
 Dim show()
 i=0
 j=1
 Do while (Not rs.Eof) and (i<rs.PageSize)
  Redim Preserve show(j),show(j+1),show(j+2),show(j+3),show(j+4),show(j+5),show(j+6)
  show(j)=rs("username")
  show(j+1)=rs("grade")
  show(j+2)=rs("times")
  show(j+3)=rs("value")
  show(j+4)=rs("regtime")
  show(j+5)=rs("lastip")
  show(j+6)=rs("lasttime")
  i=i+1
  j=j+7
 rs.MoveNext
 Loop
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
dt3=server.URLEncode(dt1)
dt4=server.URLEncode(dt2)%><html>
<head>
<title>�ʺŹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ʺŹ���</font></h1>
<font color="#FF0000">�������ڲ�ѯ�ʺš�</font> <br>
<a href="manacc.asp">����</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����ҵ� <font color=red><%=totalrec%></font> ���ʺŷ��ϴ����ڣ�<font color=red><%=dt1%></font> �����ڣ�<font color=red><%=dt2%></font>��<%if totalrec>0 then%> 
<hr noshade size="1" color=009900>
<div align=center>
<%for i=1 to totalpage
if page=i then
 Response.Write " [" & i & "]"
else
 Response.Write " <a href=manaccquerydateok.asp?type=" & tp & "&date1=" & dt3 & "&date2=" & dt4 & "&page=" & i & ">[" & i & "]</a>"
end if
next%></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="6" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<tr bgcolor="#3399FF"> 
<td><font color="#FFFFFF">��</font></td>
<td><font color="#FFFFFF">�û���</font></td>
<td><font color="#FFFFFF">�ȼ�</font></td>
<td><font color="#FFFFFF">����</font></td>
<td><font color="#FFFFFF">ע��ʱ��</font></td>
<td><font color="#FFFFFF">���ɣ�</font></td>
<td><font color="#FFFFFF">���ʱ��</font></td>
</tr>
<%for i=1 to UBound(show) step 7%> 
<tr> 
<td><%=(page-1)*15+(i+6)/7%></td>
<td><%=show(i)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i+2)%></td>
<td><%=show(i+4)%></td>
<td><%=show(i+5)%></td>
<td><%=show(i+6)%></td>
</tr>
<%next%> 
</table>
<%end if%>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
