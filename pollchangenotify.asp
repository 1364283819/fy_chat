<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=300"
Set fs=CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.OpenTextFile(server.mappath("pollnotify.dat"),1,False)
thisline=thisfile.Readline
thisfile.close
Set thisfile=nothing
Set fs=nothing%><html>
<head>
<title>ͶƱϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="FFFFFF" class=p150>
<div align="center"> 
<h1><font color="0099FF">��ͶƱϵͳ��</font></h1>
<font color="#FF0000">������վ�����桿</font></div>
<hr noshade size="1" color=009900>
<b>[վ������]</b><br>
����֧��HTML�﷨���س����С� 
<hr noshade size="1" color=009900>
<table border="1" align="center" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="4">
<form method="post" action="pollchangenotifyok.asp">
<tr> 
<td> 
<table border="0">
<tr>
<td>
<textarea name="notify" cols="72" rows="11"><%=thisline%></textarea>
</td>
</tr>
<tr align="center"> 
<td> 
<input type="submit" name="Submit" value="����">
<input type="reset" name="reset" value="��д">
<input type="button" value="����" onClick=javascript:history.go(-1) name="button">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="1" color=009900>
<div align="center" class="p9"><font color="#FF0000"><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></font></div>
</body>
</html>
