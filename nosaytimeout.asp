<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
if Session("fy_u_inthechat")="1" then
 Application.Lock
 Session("fy_u_inthechat")="0"
 s=Hour(time())
 f=Minute(time())
 m=Second(time())
 if len(s)=1 then s="0" & s
 if len(f)=1 then f="0" & f
 if len(m)=1 then m="0" & m
 t=s & ":" & f & ":" & m
 nickname=Session("fy_u_nickname")
 onlinelist=Application("fy_c_onlinelist")
 dim newonlinelist()
 useronlinename=""
 onliners=0
 js=1
 for i=1 to UBound(onlinelist) step 6
  if CStr(onlinelist(i+1))<>CStr(nickname) then
   onliners=onliners+1
   useronlinename=useronlinename & " " & onlinelist(i+1)
   Redim Preserve newonlinelist(js),newonlinelist(js+1),newonlinelist(js+2),newonlinelist(js+3),newonlinelist(js+4),newonlinelist(js+5)
   newonlinelist(js)=onlinelist(i)
   newonlinelist(js+1)=onlinelist(i+1)
   newonlinelist(js+2)=onlinelist(i+2)
   newonlinelist(js+3)=onlinelist(i+3)
   newonlinelist(js+4)=onlinelist(i+4)
   newonlinelist(js+5)=onlinelist(i+5)
   js=js+6
  else
   savetime=onlinelist(i+5)
  end if
 next
 useronlinename=useronlinename&" "
 if savetime<>"" then
  if onliners=0 then
   dim listnull(0)
   Application("fy_c_onlinelist")=listnull
  else
   Application("fy_c_onlinelist")=newonlinelist
  end if
  Application("fy_c_useronlinename")=useronlinename
  Application("fy_c_chatrs")=onliners
  sd=Application("fy_c_sd")
  line=int(Application("fy_c_line"))
  Application("fy_c_line")=line+1
dowho=0
act=4
towhoway=0
towho="大家"
addwordcolor="006699"
sayscolor="006699"
saystr="<font color=black>【默哀】" & nickname &"</font><font color=F08000>由于潜水超过" & Application("fy_c_maxtimeout") & "分钟，不幸沉入海底……</font><font class=t>(" & t & ")</font>"
SayStr="parent.writesay('"&nickname&"','"&dowho&"','"&towho&"','"&saystr&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');"
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Session("fy_u_line")=line
Application("fy_c_line")=line+1
Dim newsd(50)
j=1
for i=3 to 50 step 2
 newsd(j)=sd(i)
 newsd(j+1)=sd(i+1)
 j=j+2
next
newsd(49)=line+1
newsd(50)=saystr
Application("fy_c_sd")=newsd
 end if
 Application.UnLock
end if
Response.Redirect "chaterr.asp?id=002"%>