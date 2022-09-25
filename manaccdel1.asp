<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=130"
username=server.HTMLEncode(Trim(Request.Form("username")))
if username="" then Response.Redirect "manerr.asp?id=135"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT username,grade,times,value,regtime,regip,lasttime,lastip,lastkick,address,email,homepage,intro FROM reginfo WHERE kill='0' AND leave='0' AND username='" & username & "'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=136"
end if
showusername=rs("username")
showgrade=rs("grade")
showtimes=rs("times")
showvalue=rs("value")
showregtime=rs("regtime")
showregip=rs("regip")
showlasttime=rs("lasttime")
showlastip=rs("lastip")
showlastkick=rs("lastkick")
showaddress=rs("address")
showemail=rs("email")
showhomepage=rs("homepage")
showintro=rs("intro")
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>帐号管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【帐号管理】</font></h1>
<font color="#FF0000">【删除帐号】</font><br>
</div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　已经找到该用户名，下面是该用户名的注册资料，请确认是否要删除。 
<hr noshade size="1" color=009900>
<div align=center>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="manaccdel1ok.asp">
<tr> 
<td> 
<table width="100%" border="0">
<tr> 
<td>用 户 名：</td>
<td> <font color="#FF0000"> 
<input type="hidden" name="username" value="<%=username%>">
<%=showusername%></font></td>
</tr>
<tr> 
<td>等　　级：</td>
<td><font color="#FF0000"><%=showgrade%></font></td>
</tr>
<tr> 
<td>来访次数：</td>
<td><font color="#FF0000"><%=showtimes%></font></td>
</tr>
<tr> 
<td>经 验 值：</td>
<td><font color="#FF0000"><%=showvalue%></font></td>
</tr>
<tr> 
<td>注册时间：</td>
<td><font color="#FF0000"><%=showregtime%></font></td>
</tr>
<tr> 
<td>注册ＩＰ：</td>
<td><font color="#FF0000"><%=showregip%></font></td>
</tr>
<tr> 
<td>最后时间：</td>
<td><font color="#FF0000"><%=showlasttime%></font></td>
</tr>
<tr> 
<td>最后ＩＰ：</td>
<td><font color="#FF0000"><%=showlastip%></font></td>
</tr>
<tr> 
<td>最后被踢：</td>
<td><font color="#FF0000"><%=showlastkick%></font></td>
</tr>
<tr> 
<td>所在省市：</td>
<td><font color="#FF0000"><%=showaddress%></font></td>
</tr>
<tr> 
<td>电子信箱：</td>
<td><font color="#FF0000"><%=showemail%></font></td>
</tr>
<tr> 
<td>主页地址：</td>
<td><font color="#FF0000"><%=showhomepage%></font></td>
</tr>
<tr> 
<td>个人简介：</td>
<td><font color="#FF0000"><%=showintro%></font></td>
</tr>
<tr> 
<td colspan="2" align="center">
<input type="submit" name="Submit" value="删除">
<input type="button" value="放弃" onclick="javascript:history.go(-1)">
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
