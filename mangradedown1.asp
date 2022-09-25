<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<8 then Response.Redirect "manerr.asp?id=243"
if inthechat<>"1" and nickname<>"聊天室管理员" then Response.Redirect "manerr.asp?id=241"
username=Server.HTMLEncode(Trim(Request.Form("username")))
if username="" then Response.Redirect "manerr.asp?id=244"
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
sql="SELECT username,grade,times,value,mvalue,regtime,lasttime,lastkick FROM reginfo WHERE kill='0' and username='" & username & "'"
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
showtimes=Int(rs("times"))
showvalue=Int(rs("value"))
showmvalue=Int(rs("mvalue"))
showregtime=rs("regtime")
showlasttime=rs("lasttime")
showlastkick=rs("lastkick")
rs.close
conn.close
set rs=nothing
set conn=nothing
if showgrade>=grade and grade<10 then Response.Redirect "manerr.asp?id=246"
if DateDiff("m",showlasttime,sj)<>0 then showmvalue="本月缺席"%><html>
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
<b>［注意事项］</b> <br>
　　用户名已经找到，以下是该用户名的注册资料，请选择要降到哪个级别，并输入降级的原因。<br>
　　被踢时间指该用户名在聊天室中最后被踢出的时间，表明该用户名曾被踢过。
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<tr> 
<td>
<table border="0" cellpadding="2">
<tr> 
<td>用 户 名：</td>
<td><font color="#FF0000"><%=showusername%></font></td>
</tr>
<tr> 
<td>当前级别：</td>
<td><font color="#FF0000"><%=showgrade%></font></td>
</tr>
<tr> 
<td>来访次数：</td>
<td><font color="#FF0000"><%=showtimes%></font></td>
</tr>
<tr> 
<td>累 积 分：</td>
<td><font color="#FF0000"><%=showvalue%></font></td>
</tr>
<tr> 
<td>月 积 分：</td>
<td><font color="#FF0000"><%=showmvalue%></font></td>
</tr>
<tr> 
<td>注册时间：</td>
<td><font color="#FF0000"><%=showregtime%></font></td>
</tr>
<tr> 
<td>最后时间：</td>
<td><font color="#FF0000"><%=showlasttime%></font></td>
</tr>
<tr> 
<td>被踢时间：</td>
<td><font color="#FF0000"><%=showlastkick%></font></td>
</tr>
</table>
</td>
</tr>
</table>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" align="center">
<form method="post" action="mangradedown2.asp">
<tr> 
<td> 
<table width="100%" border="0" cellpadding="2">
<tr> 
<td>指定新级别：</td>
<td> 
<input type="hidden" name="oldval" value="<%=showgrade%>">
<input type="hidden" name="username" value="<%=showusername%>">
<select name="newval">
<%if grade<10 then
for i=1 to showgrade-1%>
<option value="<%=i%>"><%=i%> 级</option>
<%next
else
for i=0 to showgrade-1%> 
<option value="<%=i%>"><%=i%> 级</option>
<%next
end if%> 
<option value="<%=showgrade%>" selected><%=showgrade%> 级</option>
</select>
</td>
</tr>
<tr> 
<td>原　　　因：</td>
<td>(&lt;=60字符)</td>
</tr>
<tr> 
<td align="center"> 
<select name="select" onChange="javascript:document.forms[0].why.value=this.value;document.forms[0].why.focus();">
<option value="" selected>自填</option>
<option value="版主选举时产生的新级别。">竞选</option>
<option value="利用级别权限进行捣乱!">捣乱</option>
</select>
</td>
<td> 
<input type="text" name="why" maxlength="60" size="40">
</td>
</tr>
<tr align="center"> 
<td colspan="2">
<input type="submit" value="提交">
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
