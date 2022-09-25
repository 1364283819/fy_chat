<%@ LANGUAGE=VBScript%>
<%
username=Session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if username="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&username&" "))=0 then
Session("fy_u_inthechat")="0"
Response.Redirect "chaterr.asp?id=001"
end if

maxtimeout=int(Application("fy_c_maxtimeout"))
lasttime=Session("fy_u_lasttime")
towho=Trim(Request.Form("towho"))
if towho="" then towho="大家"
if len(towho)>10 then towho=Left(towho,10)
if Not(towho="大家" or Instr(useronlinename," "&towho&" ")<>0) then
Response.Write "<script Language=Javascript>alert('“" & towho & "”己不在聊天室，不能对其发言。');parent.f2.document.af.towho.value='大家';parent.f2.document.af.towho.value='大家';parent.m.location.reload();</script>"
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
addsays=Request.Form("addsays")
saystr=Trim(Request.Form("sy"))
saystr=Replace(saystr,"'","&#"&asc("'"))
saystr=Replace(saystr,"\","&#"&asc("\"))
saystr=Replace(saystr,",","&#"&asc(","))
saystr=Replace(saystr,"""","&#"&asc(""""))
saystr=Replace(saystr,"<","&#"&asc("<"))
saystr=Replace(saystr,">","&#"&asc(">"))
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
if towhoway=1 and (towho="大家" or towho=username) then
 Response.Write "<script language=JavaScript>{alert('不能对大家或自己私聊哟！');}</script>"
 Response.End
end if
t="<font class=t>(" & sj & ")</font>"
if DateDiff("n",lasttime,sj2)>maxtimeout then
Response.Write "<script language=JavaScript>top.location.href='nosaytimeout.asp';</script>"
Response.End
end if
if InStr(saystr,"")<>0 or InStr(saystr,"")<>0 or InStr(saystr,"█") or InStr(saystr,"&#63736")<>0 then Response.End
saystr=Replace(saystr,"&amp;","&")
titleline=Request.Form("titleline")
if titleline=1 then
if Session("fy_u_userinfo")(0)>2 then 
Application.Lock 
Application("fy_c_title")=Left(saystr,32) & "<font color=FF00FF style=font-size:9pt>（" & username & "，" & sj & "）</font>"
Application.UnLock 
Response.Write "<script language=javascript>var titlemsg='<font style=font-size:9pt>"&Application("hg_title")&"</font><br><font color=blue style=font-size:10.5pt>"&Application("fy_c_title") &"</font>';parent.t1.titlemsg.innerHTML=titlemsg;</script>"
Response.End 
else
Response.Write "<script language=javascript>alert('发标题需要2级或2级以上!')</script>"
end if
end if
if Instr(saystr,"[tu]")<>0 then
dim reg
set reg=new regexp
reg.IgnoreCase=true
reg.Global=true
reg.Pattern="(\[tu\])([1234567890])(\[\/tu\])"
saystr=reg.Replace(saystr,"<img src=logo/$2.gif>")
reg.Pattern="(\[tu\]1)([1234567890])(\[\/tu\])"
saystr=reg.Replace(saystr,"<img src=logo/1$2.gif>")
set reg=nothing
end if
if grade>1 and (Instr(saystr,"[SY]")<>0 or Instr(saystr,"[WI]")<>0 or Instr(saystr,"[WE]")<>0 or Instr(saystr,"[IMG]")<>0) then
 if Instr(saystr,"[SY]")<>0 then
  yxtt=1
  bzz=1
  bzy=1
  lastbzz=0
  saystrlen=len(saystr)
  Do While Instr(bzz,saystr,"[SY]")>lastbzz
   bzz=Instr(bzz,saystr,"[SY]")
   bzy=Instr(bzy,saystr,"[/SY]")
   tpname=mid(saystr,bzz+4,Abs(bzy-bzz-4))
   if len(tpname)>1 and Left(tpname,1)<>"&" and Right(tpname,1)<>";" or len(tpname)>8 or Instr(tpname," ")<>0 then
    yxtt=0
    Exit Do
   end if
   lastbzz=bzz
   bzz=bzz+4
   bzy=bzy+5
  Loop
  if yxtt=1 then
   saystr=Replace(saystr,"[/SY][SY]","")
   gsz=0
   Do While Instr(saystr,"[SY]")<>0
    saystr=Replace(saystr,"[SY]","<font face=Symbol class=p>",1,1)
    gsz=gsz+1
   Loop
   gsy=0
   Do While Instr(saystr,"[/SY]")<>0
    saystr=Replace(saystr,"[/SY]","</font>",1,1)
    gsy=gsy+1
   Loop
   for i=1 to gsz-gsy
    saystr=saystr&"</font>"
   next
  end if
 end if
 if Instr(saystr,"[WI]")<>0 then
  yxtt=1
  bzz=1
  bzy=1
  lastbzz=0
  Do While Instr(bzz,saystr,"[WI]")>lastbzz
   bzz=Instr(bzz,saystr,"[WI]")
   bzy=Instr(bzy,saystr,"[/WI]")
   tpname=mid(saystr,bzz+4,Abs(bzy-bzz-4))
   if len(tpname)>1 and Left(tpname,1)<>"&" and Right(tpname,1)<>";" or len(tpname)>8 or Instr(tpname," ")<>0 then
    yxtt=0
    Exit Do
   end if
   lastbzz=bzz
   bzz=bzz+4
   bzy=bzy+5
  Loop
  if yxtt=1 then
   saystr=Replace(saystr,"[/WI][WI]","")
   gsz=0
   Do While Instr(saystr,"[WI]")<>0
    saystr=Replace(saystr,"[WI]","<font face=Wingdings class=p>",1,1)
    gsz=gsz+1
   Loop
   gsy=0
   Do While Instr(saystr,"[/WI]")<>0
    saystr=Replace(saystr,"[/WI]","</font>",1,1)
    gsy=gsy+1
   Loop
   for i=1 to gsz-gsy
    saystr=saystr&"</font>"
   next
  end if
 end if
 if Instr(saystr,"[WE]")<>0 then
  yxtt=1
  bzz=1
  bzy=1
  lastbzz=0
  Do While Instr(bzz,saystr,"[WE]")>lastbzz
   bzz=Instr(bzz,saystr,"[WE]")
   bzy=Instr(bzy,saystr,"[/WE]")
   tpname=mid(saystr,bzz+4,Abs(bzy-bzz-4))
   if len(tpname)>1 and Left(tpname,1)<>"&" and Right(tpname,1)<>";" or len(tpname)>8 or Instr(tpname," ")<>0 then
    yxtt=0
    Exit Do
   end if
   lastbzz=bzz
   bzz=bzz+4
   bzy=bzy+5
  Loop
  if yxtt=1 then
   saystr=Replace(saystr,"[/WE][WE]","")
   gsz=0
   Do While Instr(saystr,"[WE]")<>0
    saystr=Replace(saystr,"[WE]","<font face=Webdings class=p>",1,1)
    gsz=gsz+1
   Loop
   gsy=0
   Do While Instr(saystr,"[/WE]")<>0
    saystr=Replace(saystr,"[/WE]","</font>",1,1)
    gsy=gsy+1
   Loop
   for i=1 to gsz-gsy
    saystr=saystr&"</font>"
   next
  end if
 end if
 if Instr(saystr,"[IMG]")<>0 then
  yxtt=1
  bzz=1
  bzy=1
  lastbzz=0
  Do While Instr(bzz,saystr,"[IMG]")>lastbzz
   bzz=Instr(bzz,saystr,"[IMG]")
   bzy=Instr(bzy,saystr,"[/IMG]")
   tpname=mid(saystr,bzz+5,bzy-bzz-5)
   if Instr(tpname,"..")<>0 or Instr(tpname,"/")<>0 or Instr(tpname,"\")<>0 or Instr(tpname," ")<>0 or Replace(tpname,".","")<>Server.URLEncode(Replace(tpname,".","")) then
    yxtt=0
    Exit Do
   end if
   lastbzz=bzz
   bzz=bzz+5
   bzy=bzy+6
  Loop
  if yxtt=1 then
   gsz=0
   Do While Instr(saystr,"[IMG]")<>0
    saystr=Replace(saystr,"[IMG]","<img src=pic/",1,1)
    gsz=gsz+1
   Loop
   gsy=0
   Do While Instr(saystr,"[/IMG]")<>0
    saystr=Replace(saystr,"[/IMG]",">",1,1)
    gsy=gsy+1
   Loop
   if gsz>gsy then saystr=saystr&">"
  end if
 end if
end if
saystr=Replace(saystr,"/","\/")
dowho=addsays&"对"
act=0
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
