<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(useronlinename," "&nickname&" ")=0 then Response.Redirect "chaterr.asp?id=001"
maxtimeout=int(Application("fy_c_maxtimeout"))
lasttime=Session("fy_u_lasttime")
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
t=s & ":" & f & ":" & m
sj=n & "-" & y & "-" & r & " " & t
if DateDiff("n",lasttime,sj)>maxtimeout then
 Response.Write "<script>top.location.href='nosaytimeout.asp';</script>"
 Response.End
end if
Application.Lock
onlinelist=Application("fy_c_onlinelist")
for i=1 to UBound(onlinelist) step 6
 if CStr(onlinelist(i+1))=CStr(nickname) then
  addvalue=DateDiff("n",onlinelist(i+5),sj)
  presj=onlinelist(i+5)
  onlinelist(i+5)=sj
 end if
next
Application("fy_c_onlinelist")=onlinelist
Application.UnLock
if addvalue>0 then
 Session("fy_u_savetime")=sj
 ip=Request.ServerVariables("REMOTE_ADDR")
 Set conn=Server.CreateObject("ADODB.CONNECTION")
 Set rs=Server.CreateObject("ADODB.RecordSet")
 connstr=Application("hg_connstr")
 conn.open connstr
 sql="SELECT grade,value,mvalue,lasttime,lastip,money FROM reginfo WHERE kill='0' and username='" & nickname & "'"
 rs.open sql,conn,1,3
 if Not(rs.Eof and rs.Bof) then
  grade=rs("grade")
  rs("value")=rs("value")+addvalue
  rs("money")=rs("money")+addvalue
  if DateDiff("m",presj,sj)=0 then
   rs("mvalue")=rs("mvalue")+addvalue
  else
   rs("mvalue")=addvalue
  end if
  rs("lasttime")=sj
  rs("lastip")=ip
  value=int(rs("value"))
  money=rs("money")
  if value>=int(Application("fy_c_level1to2")) and grade<2 then grade=2
  if value>=int(Application("fy_c_level2to3")) and grade<3 then grade=3
  if value>=int(Application("fy_c_level3to4")) and grade<4 then grade=4
  if value>=int(Application("fy_c_level4to5")) and grade<5 then grade=5
  fy_u_userinfo=session("fy_u_userinfo")
  fy_u_userinfo(0)=grade
  fy_u_userinfo(3)=rs("money")
  session("fy_u_userinfo")=fy_u_userinfo
  Session("fy_u_value")=rs("value")
  Session("fy_u_mvalue")=rs("mvalue")
  rs.Update
 end if
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
end if
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<meta http-equiv='content-type' content='text/html; charset=gb2312'>
<title>保存经验值</title>
<style type='text/css'>
body {font-size:12pt;}
td {font-size:10.5pt;}
input{font-size:9pt}
select{font-size:9pt}
textarea{font-size:9pt}
.p9{font-size:9pt}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<table width=100% border=0 cellspacing=0 cellpadding=0 height="100%">
<tr>
<td> 
<table border="1" align="center" cellspacing="0" bgcolor="E0E0E0" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellpadding="6">
<tr>
<td>
<div align="center"></div>
<p align=center><font color="red">保存经验值</font></p>
<p align=center>增长：<font color="#FF0000"><%=addvalue%></font> 分</p>
<p align=center><a style=cursor:'hand' title=刷新 onclick=javascript:history.go(0)><font color="blue">当前状态</font></a></p>
<p>等　级：<font color="#FF0000"><%=Session("fy_u_userinfo")(0)%></font> 级<br>
月积分：<font color="#FF0000"><%=Session("fy_u_mvalue")%></font><br>
累积分：<font color="#FF0000"><%=Session("fy_u_value")%></font><br>
货　币：<font color="#FF0000"><%=Session("fy_u_userinfo")(3)%></font></p>
</td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>