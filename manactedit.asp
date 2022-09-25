<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
id=Request.QueryString("id")
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT id,acttype,name,act FROM actlib WHERE id=" & id
rs.open sql,conn,1,1
Dim show(4)
show(1)=rs("id")
show(2)=rs("acttype")
show(3)=rs("name")
show(4)=rs("act")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>动作管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【动作管理】</font></h1>
<font color="#FF0000">【编辑动作】</font></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　请按需要修改下面的动作。<br>
<div align=center></div>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manacteditok.asp">
<tr> 
<td> 
<table border="0" align="center">
<tr> 
<td>名称：</td>
<td> 
<input type="text" name="actname" maxlength="4" size="8" value="<%=show(3)%>">
<input type="hidden" name="id" value="<%=id%>">
</td>
<td colspan="2" align="right">范围：
<select name="range">
<option value="0"<%if show(2)="0" then Response.Write " Selected"%>>0 对自己</option>
<option value="1"<%if show(2)="1" then Response.Write " Selected"%>>1 对别人</option>
</select>
</td>
</tr>
<tr> 
<td>内容：</td>
<td colspan="3"> 
<input type="text" name="act" size="40" maxlength="98" value="<%=show(4)%>">
</td>
</tr>
<tr> 
<td colspan="4" align="center"> 
<input type="submit" name="Submit" value="修改">
<input type="reset" value="还原" name="reset">
<input type="button" value="放弃" onclick="javascript:history.go(-1)">
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
