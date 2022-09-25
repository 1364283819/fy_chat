<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"%><html>
<head>
<title>聊友查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="friendqueryok.asp">
<tr align="center">
<td>
<table width="100%" border="0">
<tr> 
<td>用户名：</td>
<td> 
<input type="text" name="username" maxlength="10">
</td>
</tr>
<tr> 
<td>选　项：</td>
<td>
<input type="radio" name="querytype" value="0" checked>
精确
<input type="radio" name="querytype" value="1">
模糊</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="Submit" value="查询">
<input type="reset" value="重写">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<table width="300" border="0" align="center" cellpadding="6">
<tr>
<td> 
<p><font color="#FF0000">选项说明：</font><br>
　　<font color="#0000FF">“精确”</font>：只显示与输入的用户名完全匹配的聊友资料。<br>
　　<font color="#0000FF">“模糊”</font>：显示所有用户名中包含输入的字符串的聊友资料。 <br>
<font color="#FF0000">注　意：</font>只有5级以上才能看到对方的等级。 </p>
</td>
</tr>
</table>
</body>
</html>
