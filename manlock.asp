<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<8 then Response.Redirect "manerr.asp?id=210"
if inthechat<>"1" and nickname<>"�����ҹ���Ա" then Response.Redirect "manerr.asp?id=211"
lockname=Trim(Request.QueryString("id"))
lockip=Trim(Request.QuerySTring("ip"))
if lockname<>"" and lockip="" then Response.Redirect "manerr.asp?id=212"
if CStr(lockname)=CStr(nickname) then Response.Redirect "manerr.asp?id=213"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT ip,lockdate,locker FROM iplocktemp"
rs.open sql,conn,1,1
totalrec=rs.RecordCount
if totalrec>0 then
 Dim show()
 i=1
 Do while Not rs.Eof
  Redim Preserve show(i),show(i+1),show(i+2)
  show(i)=rs("ip")
  show(i+1)=rs("lockdate")
  show(i+2)=rs("locker")
  i=i+3
 rs.MoveNext
 Loop
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
t=s & ":" & f & ":" & m
sj=n & "-" & y & "-" & r & " " & t%><html>
<head>
<title>�ɣй���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<Script Language=JavaScript>function ulk(ip){document.forms[1].unlockip.value=ip;document.forms[1].unlockwhy.focus();}</Script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">���ɣй�����</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>��ע�������</b> <br>
�������������� IP �Ĳ����ᱻ��¼�ڡ����񹫿������У���������Ѽල��<br>
������������ IP �� <font color=red><%=Application("fy_c_iplocktime")%></font> �����ڲ��ܵ�¼��֮��ϵͳ���Զ������� IP�� 
<hr noshade size="1" color=009900>
<table border="1" cellpadding="5" cellspacing="0" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form method="post" action="manlockok.asp">
<tr>
<td>
<table border="0">
<tr> 
<td>�����ɣУ�</td>
<td> 
<input type="text" name="lockip" value="<%=lockip%>" size="15" maxlength="15"<%if lockname<>"" then Response.Write " readonly"%>>
<%if lockname<>"" then Response.Write " <font color=red>(" & lockname & ")</font>"%> 
<input type="hidden" name="lockname" value="<%=lockname%>">
</td>
</tr>
<tr> 
<td>����ԭ��</td>
<td>(&lt;=60�ַ�)</td>
</tr>
<tr> 
<td> 
<select name="select" onChange="javascript:document.forms[0].lockwhy.value=this.value;document.forms[0].lockwhy.focus();">
<option value="" selected>����</option>
<option value="���ܻ�ӭ�ˡ�">����ӭ</option>
<option value="��ȡ������ʮ�ֲ��š�">����ID</option>
<option value="��ˢ���������ֲ�����">��ˢ��</option>
<option value="��������ɢ������������µ����ۡ�">������</option>
<option value="������������򣬽�������������">����</option>
<option value="��������ɢ��Υ�����ҷ��ɷ�������ۡ�">Υ��</option>
</select>
</td>
<td> 
<input type="text" name="lockwhy" maxlength="60" size="50">
</td>
</tr><%if nickname="�����ҹ���Ա" then%>
<tr>
<td>ѡ�����</td>
<td>
<input type="radio" name="logok" value="1" checked>�������񹫿���
<input type="radio" name="logok" value="0">���������񹫿���</td>
</tr><%end if%>
</table>
<div align="center">
<input type="submit" name="Submit" value="����">
<input type="reset" name="reset" value="��д">
<input type="button" value="����" onclick="javascript:history.go(-1)">
</div>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<table border="1" cellpadding="5" cellspacing="0" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form method="post" action="manunlockok.asp">
<tr>
<td>
<table border="0">
<tr> 
<td>�����ɣУ�</td>
<td> 
<input type="text" name="unlockip" size="15" maxlength="15" readonly>
</td>
</tr>
<tr> 
<td>����ԭ��</td>
<td>(&lt;=60�ַ�)</td>
</tr>
<tr> 
<td> 
<select name="select" onChange="javascript:document.forms[1].unlockwhy.value=this.value;document.forms[1].unlockwhy.focus();">
<option value="" selected>����</option>
<option value="����ʱ��С�ĸ���ˡ�">�����</option>
<option value="�Է��Ѿ��Ĺ����������IP��">�ڹ�</option>
<option value="���IP�����ɵģ��������ϲ����ˡ�">����</option>
<option value="���IP�Ǵ�����ַ���������ϲ����ˡ�">����</option>
</select>
</td>
<td> 
<input type="text" name="unlockwhy" maxlength="60" size="50">
</td>
</tr><%if nickname="�����ҹ���Ա" then%>
<tr>
<td>ѡ�����</td>
<td> 
<input type="radio" name="logok" value="1" checked>�������񹫿���
<input type="radio" name="logok" value="0">���������񹫿���</td>
</tr><%end if%>
</table>
<div align="center">
<input type="submit" name="Submit" value="����">
<input type="reset" name="reset" value="��д">
<input type="button" value="����" onclick="javascript:history.go(-1)">
</div>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center>�� <font color=red><%=totalrec%></font> ����<a href=javascript:history.go(0)>ˢ��</a></div>
<table border="1" cellpadding="4" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<tr bgcolor="#0099FF"> 
<td><font color="#FFFFFF">���</font></td>
<td><font color="#FFFFFF">�� �� ��</font></td>
<td><font color="#FFFFFF">�� �� ʱ ��</font></td>
<td><font color="#FFFFFF">��������IP��ַ</font></td>
<td><font color="#FFFFFF">�ѷ���ʱ��</font></td>
<td><font color="#FFFFFF">��������</font></td>
</tr><%if totalrec>0 then
for i=1 to UBound(show) step 3%><tr>
<td><%=(i+2)/3%></td>
<td><%=show(i+2)%></td>
<td><%=show(i+1)%></td>
<td><%=show(i)%></td>
<td><%=DateDiff("n",show(i+1),sj)&" "%>����</td>
<td><a href="javascript:ulk('<%=show(i)%>')">��</a></td>
</tr><%next
end if%></table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>