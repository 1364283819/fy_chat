<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=310"
dieip=Trim(Request.Form("dieip"))
if Instr(dieip," ")<>0 then Response.Redirect "manerr.asp?id=311"
if Instr(dieip,chr(13)&chr(10))<>0 then Response.Redirect "manerr.asp?id=311"
if Instr(dieip,";;")<>0 then Response.Redirect "manerr.asp?id=311"
if left(dieip,1)=";" then dieip=Right(dieip,len(dieip)-1)
if Right(dieip,1)=";" then dieip=left(dieip,len(dieip)-1)
dieip=";" & dieip & ";"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT dieip FROM iplockdie"
rs.open sql,conn,1,3
rs("dieip")=dieip
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing
Application.Lock
 Application("fy_c_dieip")=dieip
Application.UnLock%><html>
<head>
<title>永久封锁</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【永久封锁】</font></h1>
</div>
<div align="center"></div>
<hr noshade size="1" color=009900>
<b>［操作完成］</b><br>
<hr noshade size="1" color=009900>
<table border="1" cellspacing="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="4">
<tr>
<td><font color="#FF9933">下列ＩＰ（段）被永久封锁：</font><br>
<br><%=dieip%><br><br><div align=center><a href="javascript:history.go(-1)">返回</a></div></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
