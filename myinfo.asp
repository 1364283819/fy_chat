<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT address,email,homepage,intro FROM reginfo WHERE username='" & nickname & "' and kill='0'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=229"
end if
address=rs("address")
email=rs("email")
homepage=rs("homepage")
intro=rs("intro")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="myinfook.asp">
<tr align="center"> 
<td> 
<table border="0">
<tr> 
<td align="right">用 户 名：</td>
<td><%=Session("fy_u_nickname")%></td>
</tr>
<tr> 
<td align="right">来自何方：</td>
<td>
<input type="text" name="address" maxlength="30" size="20" value="<%=address%>">
<font color="#FFFFFF">&lt;=30字符(1汉字=2)</font></td>
</tr>
<tr> 
<td align="right">E - Mail：</td>
<td>
<input type="text" name="email" maxlength="50" size="30" value="<%=email%>">
<font color="#FFFFFF">&lt;=50字符</font></td>
</tr>
<tr> 
<td align="right">主页地址：</td>
<td>
<input type="text" name="homepage" maxlength="50" size="30" value="<%if homepage<>"" then
Response.Write homepage
else
Response.Write "http://"
end if%>">
<font color="#FFFFFF">&lt;=50字符</font></td>
</tr>
<tr> 
<td align="center"> 
<p>个人简介：<br>
&lt;=200字符</p>
</td>
<td> 
<textarea name="intro" rows="3" cols="40"><%=intro%></textarea>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="center"> 
<input type="submit" name="Submit" value="修改">
<input type="reset" value="重写" name="reset">
<input type="button" value="刷新" onclick=javascript:history.go(0)>
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</body>
</html>
