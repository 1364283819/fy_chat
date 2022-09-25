<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Request.QueryString("kickusername")
if nickname="" then Response.Redirect "error.asp"
Application.Lock
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
else
 Application.UnLock
 Response.Redirect "error.asp"
end if
Application.UnLock
Response.write "É¾³ıÍê³É£º" & nickname & " £¡"
Response.end%>