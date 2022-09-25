<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
useronlinename=Application("fy_c_useronlinename")
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(useronlinename," "&nickname&" ")=0 then Response.Redirect "chaterr.asp?id=001"
towho=Trim(Request.Form("towho"))
if Instr(useronlinename," "&towho&" ")=0 then Response.Redirect "error.asp?id=400&name=" & server.URLEncode(towho)
intro=Trim(Request.Form("intro"))
if intro="" then Response.Redirect "error.asp?id=403"
intro=server.HTMLEncode(intro)
intro=Replace(intro,chr(13)&chr(10),"<br>")
if len(intro)>1024 then Response.Redirect "error.asp?id=401"
if Instr(intro,"<br><br><br>")<>0 then Response.Redirect "error.asp?id=402"
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
wbq=Application("fy_c_webicq")
wbqub=UBound(wbq)
if wbqub>0 then
 Dim wbqnew()
 j=1
 for i=1 to wbqub step 4
  if DateDiff("n",wbq(i),sj)<=10 then
   Redim Preserve wbqnew(j),wbqnew(j+1),wbqnew(j+2),wbqnew(j+3)
   wbqnew(j)=wbq(i)
   wbqnew(j+1)=wbq(i+1)
   wbqnew(j+2)=wbq(i+2)
   wbqnew(j+3)=wbq(i+3)
   j=j+4
  end if
 next
 if j>=4 then
  wbq=wbqnew
 else
  Dim wbqnull(0)
  wbq=wbqnull
 end if
 wbqub=UBound(wbq)
end if
Redim Preserve wbq(wbqub+1),wbq(wbqub+2),wbq(wbqub+3),wbq(wbqub+4)
wbq(wbqub+1)=sj
wbq(wbqub+2)=towho
wbq(wbqub+3)=nickname
wbq(wbqub+4)=intro
wbqub=wbqub+4
webicqname=""
for i=1 to wbqub step 4
 webicqname=webicqname & " " & wbq(i+1)
next
webicqname=webicqname&" "
Application.Lock
Application("fy_c_webicq")=wbq
Application("fy_c_webicqname")=webicqname
Application.UnLock
Response.Redirect "ok.asp?id=200&name=" & server.URLEncode(towho)%>