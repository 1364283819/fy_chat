<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"%><html>
<head>
<title>帐号管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【帐号管理】</font></h1>
<font color="#FF0000">【按级别列出所有帐号】</font></div>
<div align="center"><a href="manacc.asp">返回</a> </div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　请选择要查询的级别。 
<hr noshade size="1" color=009900>
<div align=center> 
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#E0E0E0" cellpadding="8">
<form method="post" action="manaccquerygradeok.asp">
<tr align="center"> 
<td> 
<table width="100%" border="0" cellpadding="4">
<tr> 
<td>要查询的级别：</td>
<td>
<select name="grade">
<option value="0">0 被禁用</option>
<option value="1" selected>1 级</option>
<option value="2">2 级</option>
<option value="3">3 级</option>
<option value="4">4 级</option>
<option value="5">5 级</option>
<option value="6">6 级</option>
<option value="7">7 级</option>
<option value="8">8 级</option>
<option value="9">9 级</option>
<option value="10">10 级</option>
</select>
</td>
</tr>
<tr> 
<td colspan="2" align="center"> 
<input type="submit" name="Submit" value="查询">
<input type="reset" value="重写" name="reset">
<input type="button" value="放弃" onClick="javascript:history.go(-1)" name="button">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
