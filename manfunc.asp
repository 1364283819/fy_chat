<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
if Session("fy_u_nickname")="" then
 Response.Write "<" & "Script Language=Javascript>top.location.href='login.asp';</" & "Script>"
end if
grade=Session("fy_u_userinfo")(0)
%><html>
<head>
<title>�߼����ܲ˵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
.p12{font-size:12pt;line-height:150%}
.p9{font-size:9pt;line-height:150%}
td{font-size:12pt;line-height:160%}
A:Hover{color:#FFFFFF;text-decoration:none;background-color:#0000FF}
A:Active{color:#FFFFFF;text-decoration:none;background-color:#FF0000}
a:visited{text-decoration:none}
a:link{text-decoration:none}
</style>
<base target="main">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="008888" class=p12 text="#FFFFFF" vlink="#FFFFFF" link="#FFFFFF">
<table width="100%" border="0" height="100%">
<tr valign="middle"> 
<td> 
<p align="center"><b><font color="FFFF00">�߼�������</font></b></p>
      <p align="center"><a href="mansm.asp">[����˵��]</a><br>
        <a href="manlog.asp?page=1">[���񹫿�]</a><br>
        <a href="poll.asp">[ͶƱϵͳ]</a><br>
        <a href="maninfo.asp?page=1">[������Ϣ]</a> 
        <%if grade>6 then%>
        <br>
        <a href="mangrade.asp">[�������]</a><br>
        <a href="manlock.asp">[�ɣй���]</a><br>
        <a href="manly.asp?page=1">[���Թ���]</a> 
        <%end if
if grade>9 then%>
        <br>
        <a href="manacc.asp">[�ʺŹ���]</a><br>
        <a href="manip.asp">[���÷���]</a><br>
        <a href="mangg.asp">[վ������]</a><br>
        <a href="manact.asp?page=1">[��������]</a><br>
        <a href="mandb.asp">[����ѹ��]</a><br>
        <a href="mansys.asp">[ϵͳ����]</a><br>
        <a href="relogin.asp" target="_top">[�뿪����]</a><br>
        <%end if%>
</td>
</tr>
</table>
</body>
</html>
