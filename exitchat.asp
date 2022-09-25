<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" then Response.Redirect "close.asp"
Session("fy_u_inthechat")="0"
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
ip=Request.ServerVariables("REMOTE_ADDR")
Application.Lock
onlinelist=Application("fy_c_onlinelist")
dim newonlinelist()
useronlinename=""
onliners=0
js=1
ubl=UBound(onlinelist)
for i=1 to ubl step 6
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
saystr="<font color=black>【公告】</font><font color=F08000>" & Replace(Application("fy_c_userout"),"%%","<font color=black>" & nickname & "</font>") & "</font><font class=t>(" & t & ")</font>"
SayStr="parent.writesay('"&nickname&"','"&dowho&"','"&towho&"','"&saystr&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');parent.m.location.reload();"
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



End if
Application.UnLock
if savetime<>"" then
 Set conn=Server.CreateObject("ADODB.CONNECTION")
 Set rs=Server.CreateObject("ADODB.RecordSet")
 connstr=Application("hg_connstr")
 conn.open connstr
 sql="SELECT grade,value,mvalue,lasttime,lastip FROM reginfo WHERE kill='0' and username='" & nickname & "'"
 rs.open sql,conn,1,3
 addvalue=DateDiff("n",savetime,sj)
 if Not(rs.Eof and rs.Bof) then
  grade=rs("grade")
  rs("value")=rs("value")+addvalue
  if DateDiff("m",savetime,sj)=0 then
   rs("mvalue")=rs("mvalue")+addvalue
  else
   rs("mvalue")=addvalue
  end if
  rs("lasttime")=sj
  rs("lastip")=ip
  value=int(rs("value"))
  if value>=int(Application("fy_c_level1to2")) and grade<2 then grade=2
  if value>=int(Application("fy_c_level2to3")) and grade<3 then grade=3
  if value>=int(Application("fy_c_level3to4")) and grade<4 then grade=4
  if value>=int(Application("fy_c_level4to5")) and grade<5 then grade=5
  rs("grade")=grade
  fy_u_userinfo=session("fy_u_userinfo")
  fy_u_userinfo(0)=grade
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
Response.Redirect "close.asp"%>