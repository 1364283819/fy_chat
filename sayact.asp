<%@ LANGUAGE=VBScript%>
<%
username=Session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if username="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&username&" "))=0 then
Session("fy_u_inthechat")="0"
Response.Redirect "chaterr.asp?id=001"
Response.End 
end if
maxtimeout=int(Application("fy_c_maxtimeout"))
lasttime=Session("fy_u_lasttime")
towho=Trim(Request.Form("towho"))
addsays=Request.Form ("addsays")
saystr=Trim(Request.Form("sy"))
saystr=Replace(saystr,"//","")
saystr=Replace(saystr,"'","&#"&asc("'"))
saystr=Replace(saystr,"\","&#"&asc("\"))
saystr=Replace(saystr,"/","&#"&asc("/"))
saystr=Replace(saystr,",","&#"&asc(","))
saystr=Replace(saystr,"""","&#"&asc(""""))
saystr=Replace(saystr,"<","&#"&asc("<"))
saystr=Replace(saystr,">","&#"&asc(">"))
if saystr=""  then  
Response.Write "<script Language=Javascript>alert('“" & username & "”请输入发言和动作。');</script>"
Response.End 
end if
if towho="" then towho="大家"
if len(towho)>10 then towho=Left(towho,10)
if Not(towho="大家" or Instr(useronlinename," "&towho&" ")<>0) then
Response.Write "<script Language=Javascript>alert('“" & towho & "”不江湖或不在此地，不能对其发言。');parent.f2.document.af.towho.value='大家';parent.f2.document.af.towho.value='大家';parent.m.location.href='f3.asp';</script>"
Response.end
end if
if towho="" then towho="大家"
if len(towho)>10 then towho=Left(towho,10)
towhoway=Request.Form("towhoway")
if towhoway<>1 then towhoway=0
addwordcolor=Request.Form("addwordcolor")
sayscolor=Request.Form("sayscolor")
if addwordcolor="" then addwordcolor="008888"
if sayscolor="" then sayscolor="660099"
if InStr(saystr,"www")<>0 or InStr(saystr,"www.")<>0 or InStr(saystr,"http")<>0 or InStr(saystr,"http://")<>0 or InStr(saystr,".net")<>0 or InStr(saystr,".com")<>0 or InStr(saystr,".com.cn")<>0 or InStr(saystr,".net.cn")<>0 or InStr(saystr,"/xajh")<>0 or InStr(saystr,"/jh")<>0 then 
Response.Write "<script Language=Javascript>alert('“" & username & "”请不要在本江湖拉人！！。');parent.f2.document.af.towho.value='大家';parent.f2.document.af.towho.value='大家';parent.f3.location.reload();</script>"
Response.end
end if
if len(saystr)>150 then saystr=Left(saystr,150)
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
if DateDiff("s",Session("fy_u_lasttime"),sj2)<3 then
 Response.Write "<script language=JavaScript>{alert('有话慢慢说，别噎着哦！');}</script>"
 Response.End
end if
t="<font class=t>(" & sj & ")</font>"
if DateDiff("n",lasttime,sj2)>maxtimeout then
Response.Write "<script language=JavaScript>top.location.href='nosaytimeout.asp';</script>"
Response.End
end if
if InStr(saystr,"")<>0 or InStr(saystr,"&#63736")<>0 then Response.End
act=1
dowho=0
Session("fy_u_lasttime")=sj2
SayStr="parent.writesay('"&username&"','"&dowho&"','"&towho&"','"&SayStr&t&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');"
if Instr(saystr,"''")<>0 then 
Response.End 
end if
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
Response.Write "<script language=javascript>"&show(i+1)&"</script>"
next
end if
if newuserline>userline then Session("fy_u_line")=newuserline
Response.Write "<script language=javascript>var titlemsg='<font style=font-size:9pt>"&Application("hg_title")&"</font><br><font color=blue style=font-size:10.5pt>"&Application("fy_c_title") &"</font>';parent.t1.titlemsg.innerHTML=titlemsg;</script>"
Response.End
%>
