<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
userip=Request.ServerVariables("REMOTE_ADDR")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<9 then Response.Redirect "manerr.asp?id=270"
id=Request.QueryString("id")
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
sj=n & "-" & y & "-" & r & " " & t
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT id,fromwho,towho,writetime,title FROM gbook WHERE id=" & id
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=271"
end if
showid=rs("id")
showfromwho=rs("fromwho")
showtowho=rs("towho")
showwrite=rs("writetime")
showtitle=rs("title")
rs.close
set rs=nothing
sql="DELETE FROM gbook WHERE id=" & id
conn.Execute(sql)
kicklog="ɾ��IDΪ <font color=red>" & showid & "</font> ������!<br><font color=009900>[" & showwrite & "] <font color=red>" & showfromwho & "</font> д�� <font color=red>" & showtowho & "</font> ���⣺<font color=red>" & showtitle & "</font></font>"
Function SqlStr(data)
 SqlStr="'" & Replace(data,"'","''") & "'"
End Function
sql="INSERT INTO logdata (logtime,name,ip,opertion) VALUES ("
sql=sql & SqlStr(sj) & ","
sql=sql & SqlStr(nickname) & ","
sql=sql & SqlStr(userip) & ","
sql=sql & SqlStr(kicklog) & ")"
conn.Execute sql
conn.close
set conn=nothing
Session("fy_u_lasttime")=sj%><html>
<head>
<title>���Թ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">�����Թ���</font></h1>
</div>
<hr noshade size="1" color=009900>
<b>�۲�����ɣ�</b> <br>
����ID Ϊ������ <font color="#FF0000"><%=id%></font> �Ѿ�ɾ������ղŵĲ�������¼�ڹ������С� 
<hr noshade size="1" color=009900>
<br>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form>
<tr>
<td>
<p><%=sj%></p>
<p><%=nickname&"("&userip&")"%></p>
<p><%=kicklog%></p>
<div align="center">
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
