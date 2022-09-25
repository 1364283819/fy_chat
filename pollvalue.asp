<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
Set fs=CreateObject("Scripting.FileSystemObject")
pollfile=Server.Mappath("pollending.asp")
Set thisfile = fs.OpenTextFile(pollfile,1,False)
Dim poll()
count=0
do while not thisfile.AtEndOfStream
 thisline=thisfile.Readline
 Redim preserve poll(count)
 poll(count)=thisline
 count=count+1
loop
thisfile.close
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>更改投票最低经验值</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【更改投票最低经验值】</font></div>
<hr noshade size="1" color=009900>
<b>[功能说明]</b> <br>
　　只有经验值达到此值的用户才允许参与投票。 
<hr noshade size="1" color=009900>
<table border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="4" align="center" bgcolor="E0E0E0">
<tr>
<td>
<table border="0" cellpadding="4">
<form method="post" action="pollvalueok.asp">
<tr> 
<td>投票最低经验值：</td>
<td> 
<input type="text" name="downvalue" size="10" value="<%=poll(3)%>" maxlength="10">
</td>
</tr>
<tr> 
<td align="right">选择操作：</td>
<td align="center"> 
<input type="submit" name="Submit" value="更改">
<input type="button" value="放弃" onClick=javascript:history.go(-1) name="button">
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
