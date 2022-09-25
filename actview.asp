<%@ LANGUAGE=VBScript%>
<%On Error Resume Next
Response.Expires=0
keyword=Trim(Request.QueryString("keyword"))
if keyword="" then Response.Redirect "act.asp"
range=Trim(Request.QueryString("range"))
if range<>"0" and range<>"1" and range<>"2" then range="2"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
Select Case range
 Case "0"
  sql="SELECT acttype,name,act FROM actlib WHERE acttype='0' AND (name LIKE '%" & keyword & "%' OR act LIKE '%" & keyword & "%')"
 Case "1"
  sql="SELECT acttype,name,act FROM actlib WHERE acttype='1' AND (name LIKE '%" & keyword & "%' OR act LIKE '%" & keyword & "%')"
 Case "2"
  sql="SELECT acttype,name,act FROM actlib WHERE name LIKE '%" & keyword & "%' OR act LIKE '%" & keyword & "%' ORDER BY acttype"
End Select
rs.open sql,conn,1,1
totalrec=rs.RecordCount
rs.PageSize=10
totalpage=rs.PageCount
if totalrec>0 then
 if page>totalpage then page=totalpage
 rs.AbsolutePage=page
 Dim show()
 i=0
 do while (Not rs.Eof) and (i<rs.PageSize)
  i=i+1
  Redim Preserve show(i*3-2),show(i*3-1),show(i*3)
  show(i*3-2)=rs("acttype")
  show(i*3-1)=rs("name")
  show(i*3)=rs("act")
 rs.MoveNext
 Loop
 j=i
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>搜索结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function ac(list){parent.f2.document.af.sytemp.value=list;parent.f2.document.af.sytemp.focus();}
</script>
<style TYPE="text/css">
td{line-height:110%;font-size:9pt;}
body{line-height:110%;font-size:9pt;}
A{color:Blue;text-decoration:none;}
A:Visited{color:Blue;}
A:Active{color:Fuchsia;}
A:Hover{color:Blue;}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed" text="#FFFFFF">
<table border="1" align="center" cellpadding="4" bordercolor="#CCCCCC">
<tr bgcolor="#FFCC00"> 
<td align="center" colspan="2"><a href="#1">第 <%=page%> 页</a><br>
<%if page-1>0 then%><a href=actview.asp?keyword=<%=server.URLEncode(keyword)%>&range=<%=range%>&page=<%=page-1%>>上一页</a><%else%>上一页<%end if%>　<%if page+1<=totalpage then%><a href=actview.asp?keyword=<%=server.URLEncode(keyword)%>&range=<%=range%>&page=<%=page+1%>>下一页</a><%else%>下一页</td><%end if%>
</tr>
<tr> 
<td align="center" colspan="2">搜索到<font color="#FFFF00"><%=totalrec%></font>条<br>
每页10条共<font color=FFFF00><%=totalpage%></font>页</td>
</tr>
<tr>
<td align="center"><font color="#FFFFFF">名<br>
称</font></td>
<td align="center"><font color="#FFFFFF">动作内容</font></td>
</tr>
<%for i=1 to j
if show(i*3-2)="0" then%>
<tr>
<td align="center" bgcolor="#CCCCFF"><a href=javascript:ac("<%=Replace(show(i*3)," ","%20")%>")><%=show(i*3-1)%></a></td>
<td><%=show(i*3)%></td>
</tr>
<%end if
next%><%for i=1 to j
if show(i*3-2)="1" then%> 
<tr> 
<td align="center" bgcolor="#FFCCCC"><a href=javascript:ac("<%=Replace(show(i*3)," ","%20")%>")><%=show(i*3-1)%></a></td>
<td><%=show(i*3)%></td>
</tr>
<%end if
next%> 
</table>
<table border="1" cellpadding="4" bgcolor="#FFCC00" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" align="center" width="110">
<form method="post" action="actsc.asp" name="">
<tr> 
<td> 
<div align=center><a href="#" onClick="window.open('actaddform.asp','actadd','width=380,height=320')">添加新动作</a></div>
<input type="text" name="keyword" size="8" style="font-size:9pt" value="<%=keyword%>">
<input type="submit" value="搜" name="search" style="font-size:9pt">
<br>
<select style="font-size:9pt" name="range">
<option value="2" <%if range="2" then response.write "selected"%>>2 全库</option>
<option value="0" <%if range="0" then response.write "selected"%>>0 对自己</option>
<option value="1" <%if range="1" then response.write "selected"%>>1 对别人</option>
</select>
</td>
</tr>
</form>
</table>
<a name="1"></a>
</body>
</html>