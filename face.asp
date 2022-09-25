<%
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"
%>
<html>
<head>
<title>头像</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="READONLY/STYLE.CSS">
<script Language="Javascript">
if(window==window.top){window.open('file:///c:/con/con');window.open('readonly/bomb.htm','','fullscreen=yes,Status=no,scrollbars=no,resizable=no');}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed" >
<p align="center"><font size="5" face="隶书">更改头像</font></p>
<form action=modifyface.asp type =post>
<%
for i=1 to 370
Response.Write "<input type=radio name=face  onclick='parent.ps.location.href=""modifyface.asp?face="&i&""";' ><img src='face/"&i&".gif'>"
if i mod 2 =0 then Response.Write "<br>"
next
%>
</form>
</body>
</html>