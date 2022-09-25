<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"%><html>
<head>
<title>聊友查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="welcomegbscok.asp">
<tr align="center">
<td>
<table width="100%" border="0">
<tr> 
<td>关键词：</td>
<td> 
<input type="text" name="keyword" size="16">
</td>
</tr>
<tr> 
<td>范　围：</td>
<td>
<select name="fw">
<option value="0" selected>姓名&amp;主题&amp;内容</option>
<option value="1">留言的时间</option>
<option value="2">收留言者姓名</option>
<option value="3">留言者的姓名</option>
<option value="4">留言者的地址</option>
<option value="5">留言者的信箱</option>
<option value="6">留言者的主页</option>
</select>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="Submit" value="搜索">
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
<br><p><font color="#FF0000">功能说明：</font><br>
　　<font color="#0000FF">“关键词”</font>：只要留言中出现此关键词就显示出来。<br>
　　<font color="#0000FF">“范围”</font>：限制查找的字段，以便更准确、更快速地找到所要的留言。</p>
</td>
</tr>
</table>
</body>
</html>
