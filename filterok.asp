<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" then Response.Redirect "close.asp"
filname=Request.Form("filtername")
filname=" "&filname&","
clearall=Request.Form("clearall")
if clearall="ȡ��" then filname=" ,"
Session("fy_u_filname")=filname
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>���������</title>
<style type='text/css'>
body {font-size:12pt;}
td {font-size:10.5pt;line-height:120%}
input{font-size:9pt}
select{font-size:9pt}
textarea{font-size:9pt}
.p9{font-size:9pt}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<table width="100%" border="0" height="100%">
<tr>
<td>
<table width="100%" border="1" cellspacing="0" cellpadding="4" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
<form>
<tr align="center"> 
<td> 
<font color="red">���ν��</font><br>
<%if filname=" ," then%><p>�رմ˹���</p><%else%>
<font class="p9">�����û��ķ��Խ������Σ������ٳ����������Ļ�ϡ�</font>
<p><font color=blue><%=filname%></font></p><%end if%>
<input type="button" value="����" onclick="javascript:history.go(-1)">
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
</body>
</html>