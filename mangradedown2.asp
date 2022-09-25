<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
userip=Request.ServerVariables("REMOTE_ADDR")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<8 then Response.Redirect "manerr.asp?id=243"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=241"
username=Server.HTMLEncode(Trim(Request.Form("username")))
if username="" then Response.Redirect "manerr.asp?id=244"
why=Server.HTMLEncode(Trim(Request.Form("why")))
if why="" then Response.Redirect "manerr.asp?id=248"
oldval=Request.Form("oldval")
newval=Request.Form("newval")
if CStr(oldval)=CStr(newval) then Response.Redirect "manerr.asp?id=231"
if Not(IsNumeric(newval)) then Response.Redirect "manerr.asp?id=247"
if Int(newval)<1 and grade<10 then Response.Redirect "manerr.asp?id=247"
if Int(newval)>9 and grade<10 then Response.Redirect "manerr.asp?id=247"
if Int(oldval)<Int(newval) then Response.Redirect "manerr.asp?id=247"
newval=Int(newval)
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
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username,grade FROM reginfo WHERE kill='0' and username='" & username & "'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=245&username=" & server.URLEncode(username)
end if
showusername=rs("username")
showgrade=Int(rs("grade"))
rs.close
if showgrade>=grade and grade<10 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=246"
end if
if showgrade<=newval then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=244"
end if
sql="SELECT grade FROM reginfo WHERE kill='0' and username='" & username & "'"
rs.open sql,conn,1,3
rs("grade")=newval
rs.Update
rs.close
set rs=nothing
gradelog="把 <font color=blue>" & showusername & "</font> 从 <font color=red>" & showgrade & "</font> 级降至 <font color=red>" & newval & "</font> 级！<br><font color=009900>【原因：" & why & "】</font>"
Function SqlStr(data)
 SqlStr="'" & Replace(data,"'","''") & "'"
End Function
sql="INSERT INTO logdata (logtime,name,ip,opertion) VALUES ("
sql=sql & SqlStr(sj) & ","
sql=sql & SqlStr(nickname) & ","
sql=sql & SqlStr(userip) & ","
sql=sql & SqlStr(gradelog) & ")"
conn.Execute sql
conn.close
set conn=nothing%><html>
<head>
<title>级别管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【级别管理】</font></h1>
</div>
<div align="center"><font color="#FF0000">【降级操作】</font></div>
<hr noshade size="1" color=009900>
<b>［操作完成］</b> <br>
　　你刚才的操作被记录在聊务公开栏中! 
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="10" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
<form>
<tr> 
<td> 
<p><%=sj%></p>
<p><%=nickname&"("&userip&")"%></p>
<p><%=gradelog%></p>
<div align="center"> 
<input type="button" value="返回" onClick="javascript:history.go(-2)" name="button">
</div>
</td>
</tr>
</form>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
