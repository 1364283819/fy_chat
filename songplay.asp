<%@ LANGUAGE=VBScript%>
<%nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" then Response.Redirect "chaterr.asp?id=001"
songzj=Request.Form("songzj")
song=Request.Form("song")
loopok=Request.Form("loopok")
linkurl="mid/" & songzj & "/" & song
Response.write "<html><head></head><body oncontextmenu=self.event.returnValue=false>"
if Request.Form("play")="²¥·Å" then
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
Session("fy_u_lasttime")=sj
Response.Write "<bgsound src=" & chr(34) & linkurl & chr(34) & " loop=" & chr(34) & loopok & chr(34) & "><script Language=JavaScript>parent.f2.startnosay();</script>"
end if
Response.Write "</body></html>"%>