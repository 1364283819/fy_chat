<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
id=Request.Form("id")
actname=Trim(Request.Form("actname"))
range=Trim(Request.Form("range"))
if range<>"1" and range<>"0" then range="0"
actnl=Trim(Request.Form("act"))
actnl=Replace(actnl,chr(13)&chr(10),"")
actnl=Replace(actnl,"<","&lt;")
actnl=Replace(actnl,">","&gt;")
actnl=Replace(actnl,"&","&amp;")
if range<>0 and range<>1 then range=""
if actname="" or actnl="" or range="" or len(actnl)<=2 then Response.Redirect "manerr.asp?id=102"
if left(actnl,2)<>"//" then Response.Redirect "manerr.asp?id=103"
if left(actnl,4)="//##" then Response.Redirect "manerr.asp?id=104"
if len(actnl)>100 or len(actname)>4 then Response.Redirect "manerr.asp?id=105"
if InStr(actnl,"%%")<>0 and range="0" then Response.Redirect "manerr.asp?id=106"
if InStr(actnl,"%%")=0 and range="1" then Response.Redirect "manerr.asp?id=107"
if InStr(actnl,"|")<>0 or InStr(actnl,"\")<>0 or InStr(actnl,chr(34))<>0 then Response.Redirect "manerr.asp?id=108"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT acttype,name,act FROM actlib WHERE id=" & id
rs.open sql,conn,1,3
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=261"
end if
rs("acttype")=range
rs("name")=actname
rs("act")=actnl
rs.Update
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
<b>［操作完成］</b><br>
　　ID 为 <font color="#FF0000"><%=id%></font> 的动作已经修改!<br><div align=center><a href="javascript:history.go(-2)">返回</a></div>
<div align=center></div>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
