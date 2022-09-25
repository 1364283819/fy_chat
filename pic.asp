<%@ LANGUAGE=VBScript%>
<%
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"
Set fs=CreateObject("Scripting.FileSystemObject")
picpath=server.Mappath("pic")
Set f=fs.GetFolder(picpath)
Set fc=f.Files
dim show()
Redim Preserve show(0)
i=1
For Each f1 in fc
 Redim Preserve show(i)
 show(i)=f1.name
 i=i+1
next
Set fc=nothing
Set f=nothing
Set fs=nothing%><html><head><title>图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">function s(list){parent.f2.document.af.sytemp.value=parent.f2.document.af.sytemp.value+"[IMG]"+list+"[/IMG]";parent.f2.document.af.sytemp.focus();}</script>
<style TYPE="text/css">
td{line-height:110%;font-size:20pt;}
.p9{line-height:150%;font-size:9pt;}
A{color:FFFFFF;text-decoration:none;}
A:Visited{color:FFFFFF;}
A:Active{color:FFFF00;}
A:Hover{color:Black;}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed" text="#FFFFFF">
<a name="1"></a> 
<table border="1" align="center" cellpadding="3" bordercolor="#CCCCCC" width="110">
<tr><td align="center" colspan="2" class="p9"><a href="webdings.asp">[1]</a>
<a href="wingdings.asp">[2]</a>
<a href="symbol.asp">[3]</a>
<font color=#FFFF00>[4]</font></td>
</tr><tr><td><div align=center class=p9><a href=javascript:history.go(0)>刷新</a></div></td></tr>
</table><%for i=1 to UBound(show)%>
<a href=javascript:s("<%=show(i)%>")><img border=0 src="pic/<%=show(i)%>"></a> 
<%next%><table border="1" align="center" cellpadding="3" bordercolor="#CCCCCC" width="110"><tr><td><div align=center class=p9><a href=#1>返回页首</a></div></td></tr></table>
</body></html>