<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
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
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align=center><h1><font color="0099FF">��ͶƱϵͳ��</font></h1>
<a href="javascript:history.go(0)">ˢ��</a></div>
<hr noshade size="1" color=009900>
<b>[վ������]</b> 
<hr noshade size="1" color=009900>
<table width="100%" border="0" align="center">
<tr>
<td class=p150> <%=thisline%></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<blockquote> 
�� <a href="pollview.asp">ͶƱ / �鿴ͶƱ���</a><br>
<%if grade>9 then%> �� <a href="polluser.asp">������ͶƱ��</a><br>
�� <a href="pollchangenotify.asp">����վ������</a><br>
�� <a href="polltime.asp">����ͶƱ��ֹʱ��</a><br>
�� <a href="pollvalue.asp">�����û�ͶƱ��;���ֵ</a><br>
�� <a href="pollcand.asp">��ѡ�˹���</a><br>
�� <a href="manupdowngrade.asp">ԭ�а����������</a><br>
�� <a href="pollclear.asp">������к�ѡ�˵ĵ�Ʊ��������ͶƱ</a><br>
�� <a href="pollreset.asp">��λͶƱϵͳ���������</a>
<%end if%></blockquote>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
