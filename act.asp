<%@ LANGUAGE=VBScript%>
<%
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>动作库</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style TYPE="text/css">
body {font-size:12pt;}
td {font-size:10.5pt;line-height:130%}
input{font-size:9pt}
select{font-size:9pt}
textarea{font-size:9pt}
.p9{font-size:9pt}
A {text-decoration:none;}
A:Visited {color:FFFFFF;}
A:Active {color:000000;}
A:Hover {color:000000;}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<table width="100%" border="0" height="100%">
<tr>
<td>
<table border="1" cellpadding="4" bgcolor="#FFCC00" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" width="110" align="center">
<form method="post" action="actsc.asp" name="">
<tr> 
<td> 
<div align=center><a href="#" onClick="window.open('actaddform.asp','actadd','width=380,height=320')"><font color=blue>添加新动作</font></a></div>
<input type="text" name="keyword" size="8">
<input type="submit" value="搜" name="search">
<br>
<select name="range">
<option value="2">2 全库</option>
<option value="0">0 对自己</option>
<option value="1" selected>1 对别人</option>
</select>
<div align=center>## 代表 自己<br>
%% 代表 对方</div>
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
<Script Language=Javascript>parent.m.location.href='about:blank';</Script>
</body>
</html>
