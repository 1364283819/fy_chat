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
<title>站长公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【站长公告】</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　本功能用于更改留言簿最上面的“站长公告”及聊天室标题区的顶行内容。 
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<form method="post" action="manggtitle.asp">
<tr>
<td> 
<table border="0" cellpadding="3">
<tr> 
<td>聊天室标题行：</td>
<td> 
<textarea name="title" cols="70" rows="4"><%=Application("hg_title")%></textarea>
</td>
</tr>
<tr> 
<td>是否使用HTML：</td>
<td> 
<input type="radio" name="html" value="0" checked>
不使用HTML 
<input type="radio" name="html" value="1">
使用HTML </td>
</tr>
<tr> 
<td colspan="2" align="center">
<input type="submit" value="修改">
<input type="button" value="清空"onClick="javascript:document.forms[0].title.value=''">
<input type="reset" value="还原">
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
<td>留言簿顶公告：</td>
<td> 
<textarea name="gbtop" cols="70" rows="4"><%=gbtop%></textarea>
</td>
</tr>
<tr> 
<td>是否使用HTML：</td>
<td> 
<input type="radio" name="html" value="0" checked>
不使用HTML 
<input type="radio" name="html" value="1">
使用HTML </td>
</tr>
<tr> 
<td colspan="2" align="center">
<input type="submit" value="修改">
<input type="button" value="清空"onClick="javascript:document.forms[1].gbtop.value=''">
<input type="reset" value="还原">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
