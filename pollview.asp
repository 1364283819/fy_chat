<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
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
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
Set fs=CreateObject("Scripting.FileSystemObject")
pollfile=Server.Mappath("pollending.asp")
Set thisfile = fs.OpenTextFile(pollfile,1,False)
Dim poll()
count=0
do while not thisfile.AtEndOfStream
 thisline=thisfile.Readline
 Redim preserve poll(count)
 poll(count)=thisline
 count=count+1
loop
thisfile.close
set thisfile=nothing
set fs=nothing
hxrs=int((count-6)/2)
Dim show()
js=1
for i=6 to count-1 step 2
 Redim Preserve show(js),show(js+1),show(js+2)
 show(js)=poll(i)
 show(js+1)=poll(i+1)
 show(js+2)=1
 js=js+3
next
zzz=0
for i=1 to js-3 step 3
 if int(show(i+1))>int(zzz) then zzz=show(i+1)
 for j=1 to js-3 step 3
  if int(show(i+1))<int(show(j+1)) then show(i+2)=show(i+2)+1
 next
next%><html>
<head>
<title>投票系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="FFFFFF" class=p150>
<h1 align="center"><font color="0099FF">【投票结果】</font></h1>
<div align="center">现在是：<%=sj%> </div>
<hr noshade size="1" color=009900>
<b>[功能说明]</b>　投票时间：<font color=red><%=poll(1)%></font> 至 <font color=red><%=poll(2)%></font> 
<hr noshade size="1" color=009900>
<div align="center">目前共有候选人：<font color=red><%=hxrs%></font> 位；已投票：<font color=red><%=poll(4)%></font> 票。<a href="javascript:history.go(0)">【刷新】</a><a href="javascript:history.go(-1)">【返回】</a></div>
<form method="post" action="pollviewpoll.asp">
<table border="1" align="center" cellpadding="4" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="#E0E0E0" width="90%">
<tr bgcolor="#0099FF"> 
<td align="center"><font color="#FFFFFF">序号</font></td>
<td align="center"><font color="#FFFFFF">投票</font></td>
<td><font color="#FFFFFF">候选人</font></td>
<td align="center"><font color="#FFFFFF">得 票 数</font></td>
<td align="center"><font color="#FFFFFF">得票率</font></td>
<td align="center"><font color="#FFFFFF">名次</font></td>
<%if grade>9 then%><td align="center"><font color="#FFFFFF">调级</font></td><%end if%>
</tr>
<%for i=1 to js-3 step 3%> 
<tr> 
<td align="center"><%=(i+2)/3%></td>
<td align="center"> 
<input type="radio" name="poll" value="<%=show(i)%>">
</td>
<td><%=show(i)%></td>
<td nowrap><%if poll(4)>0 and show(i+1)>0 then%><img src="readonly/poll.gif" width="<%=int(show(i+1)*200/zzz)%>" height="18"><%end if%>&nbsp;<%=show(i+1)%></td>
<td align="right"><%if poll(4)=0 then
Response.Write "0%"
else
Response.Write formatnumber(show(i+1)*100/poll(4),2)&"%"
end if%></td>
<td align="center"><%=show(i+2)%></td>
<%if grade>9 then%><td align="center"><a href="pollgrade.asp?id=<%=server.URLEncode(show(i))%>" target="_blank">Ｇ</a></td><%end if%>
</tr>
<%next%> 
<tr> 
<td align="center" colspan="7"> <%yxtp=1
if CDate(poll(1))>CDate(sj) then
 yxtp=0
 Response.Write "投票活动尚未开始，不能投票"
end if
if CDate(poll(2))<CDate(sj) then
 yxtp=0
 Response.Write "投票活动已经结束，不能投票"
end if
if value<int(poll(3)) and yxtp=1 then
 yxtp=0
 Response.Write "您的经验值没有达到" & poll(3) & "分，不能投票"
end if
if Instr(LCase(poll(5))," "&LCase(nickname)&" ")<>0 and yxtp=1 then
 yxtp=0
 Response.Write "您已经投过票了，不能重复投票"
end if
if yxtp=1 then
 Response.Write "<input type='submit' name='Submit' value='投出神圣一票'>"
end if%></td>
</tr>
</table>
</form>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
