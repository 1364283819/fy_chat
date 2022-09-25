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
set thisfile=nothing
set fs=nothing
hxrs=int((count-6)/2)%><html>
<head>
<title>候选人管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script language="JavaScript">
function del(name){document.forms[1].delname.value=name;
document.forms[1].delname.focus();}
</script>
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">【投票系统】</font></h1>
<font color="#FF0000">【候选人管理】</font></div>
<hr noshade size="1" color=009900>
<b>[功能说明]</b> <br>
添加或删除候选人。（共有候选人：<font color=red><%=hxrs%></font> 位；已投票：<font color=red><%=poll(4)%></font> 
票）<a href="javascript:history.go(0)">【刷新】</a>　<a href="javascript:history.go(-1)">【返回】</a> 
<hr noshade size="1" color=009900>
<table border="1" align="center" cellpadding="4" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="#E0E0E0" width="80%">
<tr bgcolor="#0099FF" align="center"> 
<td><font color="#FFFFFF">序号</font></td>
<td><font color="#FFFFFF">候选人</font></td>
<td><font color="#FFFFFF">得票数</font></td>
<td><font color="#FFFFFF">得票率</font></td>
<td><font color="#FFFFFF">删除</font></td>
</tr>
<%for i=6 to count-1 step 2%>
<tr align="center"> 
<td><%=(i-4)/2%></td>
<td><%=poll(i)%></td>
<td><%=poll(i+1)%></td>
<td><%if poll(4)=0 then
Response.write "0%"
else
Response.write int(poll(i+1)*100/poll(4))&"%"
end if%></td>
<td><a href=javascript:del("<%=poll(i)%>")>删除</a></td>
</tr>
<%next%>
</table>
<hr noshade size="1" color=009900>
<form method="post" action="pollcandadd.asp">
<div align="center"> 添加候选人： 
<input type="text" name="addname" maxlength="10" size="10">
<input type="submit" name="add" value="添加">
<input type="reset" value="重写">
</div>
</form>
<form method="post" action="pollcanddel.asp">
<div align="center"> 删除候选人： 
<input type="text" name="delname" maxlength="10" size="10">
<input type="submit" name="del" value="删除">
<input type="reset" value="重写">
</div>
</form>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
