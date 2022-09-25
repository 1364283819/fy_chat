<%
Response.Write "<script language=javascript>if(window==window.top){top.location.href='chaterr.asp';}</script>"
username=session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if username="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&username&" "))=0 then
Session("fy_u_inthechat")="0"
Response.Redirect "chaterr.asp?id=001"
end if
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
sj=s & ":" & f & ":" & m
sj2=n & "-" & y & "-" & r & " " & sj
if DateDiff("s",Session("fy_u_lasttime"),sj2)<30 then
Response.Write "<script language=JavaScript>{alert('有话慢慢说，别噎着哦！');}</script>"
Response.End
end if
Session("fy_u_lasttime")=sj2
t="<font class=t>(" & sj & ")</font>"
saystr="泡点人，人不在。请不要对我说话！"
dowho="对"
act=0
towhoway=0
towho="大家"
addwordcolor="006699"
sayscolor="006699"
SayStr="parent.writesay('"&username&"','"&dowho&"','"&towho&"','"&SayStr&t&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');"
Application.Lock
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Application("fy_c_line")=line+1
Dim newsd(50)
j=1
for i=3 to 50 step 2
newsd(j)=sd(i)
newsd(j+1)=sd(i+1)
j=j+2
next
newsd(49)=line+1
newsd(50)=SayStr
Application("fy_c_sd")=newsd
Application.UnLock
for i=3 to 50 step 2
newuserline=sd(i)
if sd(i)>userline   then
Redim Preserve show(j),show(j+1)
show(j)=sd(i)
show(j+1)=sd(i+1)
j=j+2
end if
next
sd=Application("fy_c_sd")
userline=int(Session("fy_u_line"))
newuserline=0
j=1
for i=1 to 50 step 2
newuserline=sd(i)
if sd(i)>userline  then
Redim Preserve show(j),show(j+1)
show(j)=sd(i)
show(j+1)=sd(i+1)
j=j+2
end if
next
if j>1 then
for i=1 to UBound(show) step 2
Response.Write show(i+1)
next
end if
if newuserline>userline then Session("fy_u_line")=newuserline
Response.Write "<script language=javascript>var titlemsg='<font style=font-size:9pt>"&Application("hg_title")&"</font><br><font color=blue style=font-size:10.5pt>"&Application("fy_c_title") &"</font>';parent.t1.titlemsg.innerHTML=titlemsg;</script>"
Response.End
%>