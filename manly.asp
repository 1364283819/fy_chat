<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<9 then Response.Redirect "manerr.asp?id=270"
page=Request.QueryString("page")
if page="" then page=1
if Not(IsNumeric(page)) then page=1
if page<1 then page=1
page=int(page)
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
if grade>9 then
 sql="SELECT * FROM gbook ORDER BY writetime DESC"
else
 sql="SELECT * FROM gbook WHERE mm='0' or towho='" & nickname & "' or fromwho='" & nickname & "' ORDER BY writetime DESC"
end if
rs.open sql,conn,1,1
rs.PageSize=10
totalrec=rs.RecordCount
if totalrec=0 then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=200"
end if
totalpage=rs.PageCount
if page>totalpage then page=totalpage
rs.AbsolutePage=page
rs.CacheSize=rs.PageSize
i=0
dim showid(),showwritetime(),showmm(),showtowho(),showfromwho(),showtitle(),showintro(),showhideip(),showip(),showaddress(),showemail(),showhomename(),showhomeurl()
do while (Not rs.Eof) and (i<rs.PageSize)
 i=i+1
 Redim Preserve showid(i),showwritetime(i),showmm(i),showtowho(i),showfromwho(i),showtitle(i),showintro(i),showhideip(i),showip(i),showaddress(i),showemail(i),showhomename(i),showhomeurl(i)
 showid(i)=rs("id")
 showwritetime(i)=rs("writetime")
 showmm(i)=rs("mm")
 showtowho(i)=rs("towho")
 showfromwho(i)=rs("fromwho")
 showtitle(i)=rs("title")
 showintro(i)=rs("intro")
 showhideip(i)=rs("hideip")
 showip(i)=rs("ip")
 showaddress(i)=rs("address")
 showemail(i)=rs("email")
 showhomename(i)=rs("homename")
 showhomeurl(i)=rs("homeurl")
 rs.MoveNext
Loop
rs.close
conn.close
set rs=nothing
set conn=nothing%><html>
<head>
<title>留言簿</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
a{color:blue;text-decoration:none}
a:hover{color:red;text-decoration:none}
a:active{text-decoration:none}
a:visited{text-decoration:none}
td{font-size:9pt}
body{font-size:9pt}
.l1{color:3366FF;line-height:170%}
</style>
<script Language=JavaScript>
function gop(){url="manly.asp?page="+document.forms[0].page.value;this.location.href=url;}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<a name="begin"></a><div align=center>
<table width="440" border="0" cellspacing="0">
<form method="post" action="javascript:gop()">
<tr> 
<td> 
<table border="0" width="100%" cellspacing="0">
<tr> 
<td>共 <font color=red><%=totalrec%></font> 条留言　每页 10 条　共 <font color=red><%=totalpage%></font> 页</td>
<td align="right"> 
<input type="text" name="page" size="2" maxlength="3" value="<%=page%>">
<input type="submit" name="Submit" value="Go">
</td>
<td align="right"> <%if page-1>0 then%><a href="manly.asp?page=<%=page-1%>">上一页</a><%else%><font color=666666>上一页</font><%end if%>　<%if page+1<=totalpage then%><a href="manly.asp?page=<%=page+1%>">下一页</a><%else%><font color=666666>下一页</font><%end if%>　<a href=javascript:history.go(0) title=刷新本页>第<%=page%>页</a></td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<hr noshade size="0" color=009900>
<%for i=1 to UBound(showid)%><br>
<table width=440 border=1 cellspacing=0 bordercolorlight=999999 bordercolordark=FFFFFF cellpadding=0>
<tr><td><table width=100% border=0 cellpadding=4>
<tr bgcolor=33CCFF>
<td width=10% align=center bgcolor=CCFFCC>写给:</td>
<td width=61% bgcolor="#CCFFCC">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td><%=showtowho(i)%><%if showmm(i)="1" then Response.Write "　<font color=red>[悄悄话]</font>"%></td>
<td align="right"><a href="manlydel.asp?id=<%=showid(i)%>">删除</a></td>
</tr>
</table>
</td>
<td align=right width=29% bgcolor=CCFFCC><%=showwritetime(i)%></td>
</tr></table>
<table width=100% border=0 bordercolorlight=999999 bordercolordark=FFFFFF bgcolor=F0F0F0><tr> 
<td width=10% align=center>主题:</td>
<td width=90%><b><%=showtitle(i)%></b></td>
</tr><tr>
<td width=10% align=center>内容:</td>
<td width=90%><font color=0066FF class=l1><%=showintro(i)%></font></td></tr>
<tr><td width=10% align=center>姓名:</td>
<td width=90%><table width=100% border=0 cellspacing=0 cellpadding=0>
<tr><td><font color=FF0000><%=showfromwho(i)%></font></td>
<td align=right><%if showemail(i)<>"" then%><a href=mailto:<%=showemail(i)%>>信箱</a><%else%><font color=666666>信箱</font><%end if%>　<%if showhomeurl(i)<>"" then%><a href="<%=showhomeurl(i)%>" target="_blank" title="<%=showhomename(i)%>">主页</a><%else%><font color=666666>主页</font><%end if%></td>
</tr></table>
</td></tr><tr>
<td width=10% align=center>来自:</td>
<td width=90%><font color=009966><%=showip(i)&"　"&showaddress(i)%></font></td>
</tr></table>
</td>
</tr>
</table><%next%>
<hr noshade size="0" color=009900>
<table width="440" border="0" cellpadding="5">
<tr>
<td>
<div align=center></div>
<p align=right><%if page-1>0 then%><a href="manly.asp?page=<%=page-1%>">上一页</a><%else%><font color=666666>上一页</font><%end if%>　<%if page+1<=totalpage then%><a href="manly.asp?page=<%=page+1%>">下一页</a><%else%><font color=666666>下一页</font><%end if%>　<a href="#begin">〖回到页首〗</a></p>
</td>
</tr>
</table>
</div>
</body>
</html>
