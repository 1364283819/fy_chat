<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
Response.Buffer =true
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
cx= trim(Request.Form("copyright"))
cx = Replace(cx, "&#169;", "&copy;")
if Application("fy_c_copyright")<>cx then
Response.Redirect "error.asp?id=990"
Response.End 
end if 
sername=Request.ServerVariables("SERVER_NAME")
if InStr(Request.ServerVariables("HTTP_USER_AGENT"),"MSIE")=0 then Response.Redirect "error.asp?id=010"
allhttp=LCase(Request.ServerVariables("ALL_HTTP"))
if Application("fy_c_disproxy")="1" and (Instr(allhttp,"proxy")<>0 or Instr(allhttp,"http_via")<>0 or Instr(allhttp,"http_pragma")<>0) then Response.Redirect "error.asp?id=011"
if Session("fy_u_nickname")<>"" then Response.Redirect "welcome.asp"
disloginname=Application("fy_c_disloginname")
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
userip=Request.ServerVariables("REMOTE_ADDR")
if Application("fy_c_closedoor")="1" then Response.Redirect "error.asp?id=100"
if int(Application("fy_c_chatrs"))>=int(Application("fy_c_maxpeople")) then Response.Redirect "error.asp?id=101"
nickname=Trim(Request.Form("nickname"))
if nickname=Application("fy_c_automanname") then Response.Redirect  "error.asp?id=420"
password=Trim(Request.Form("password"))
gender=Trim(Request.Form("gender"))
newpass=Trim(Request.Form("newpass"))
killpass=Trim(Request.Form("killpass"))
enter=Trim(Request.Form("enter"))
nickname=CStr(Replace(nickname,chr(13)&chr(10),""))
password=CStr(Replace(password,chr(13)&chr(10),""))
gender=CStr(Replace(gender,chr(13)&chr(10),""))
newpass=CStr(Replace(newpass,chr(13)&chr(10),""))
killpass=CStr(Replace(killpass,chr(13)&chr(10),""))
enter=CStr(Replace(enter,chr(13)&chr(10),""))
if nickname="" then Response.Redirect "error.asp?id=127"
if password="" then Response.Redirect "error.asp?id=128"
if LCase(nickname)=LCase(password) then Response.Redirect "error.asp?id=129"
if server.HTMLEncode(nickname)<>nickname or InStr(nickname,"【")<>0 or InStr(nickname,"】")<>0 or InStr(nickname," ")<>0 or InStr(nickname,"　")<>0 or InStr(nickname,"")<>0 then Response.Redirect "error.asp?id=120"
if server.URLEncode(password)<>password then Response.Redirect "error.asp?id=121"
if server.HTMLEncode(gender)<>gender or InStr(gender," ")<>0 then Response.Redirect "error.asp?id=122"
if server.URLEncode(newpass)<>newpass then Response.Redirect "error.asp?id=123"
if server.URLEncode(killpass)<>killpass then Response.Redirect "error.asp?id=124"
namelen=0
for i=1 to len(nickname)
 zh=mid(nickname,i,1)
 zhasc=asc(zh)
 if zhasc<0 then
  namelen=namelen+2
 else
  namelen=namelen+1
  if CStr(server.URLEncode(zh))<>CStr(zh) then Response.Redirect "error.asp?id=120"
 end if
next
if namelen>10 then Response.Redirect "error.asp?id=125"
namelen=0
for i=1 to len(gender)
 zh=mid(gender,i,1)
 zhasc=asc(zh)
 if zhasc<0 then
  namelen=namelen+2
 else
  namelen=namelen+1
  if CStr(server.URLEncode(zh))<>CStr(zh) then Response.Redirect "error.asp?id=122"
 end if
next
if namelen>4 then Response.Redirect "error.asp?id=126"
if InStr(LCase(nickname),LCase(disloginname))<>0 or nickname="大家" or LCase(nickname)="automan" or nickname="聊天室管理员" or (Instr(nickname,"稻")<>0 or Instr(nickname,"?")<>0) and Instr(nickname,"香")<>0 and nickname<>"稻香居士" then Response.Redirect "error.asp?id=130"
if InStr(LCase(nickname),"fuck")<>0 or InStr(LCase(nickname),"sex")<>0 or InStr(nickname,"奸")<>0 or InStr(nickname,"淫")<>0 or InStr(nickname,"娼")<>0 or InStr(nickname,"嫖")<>0 or InStr(nickname,"性")<>0 and InStr(nickname,"交")<>0 or InStr(nickname,"妓")<>0 or InStr(nickname,"色")<>0 and InStr(nickname,"黄")<>0 or InStr(nickname,"色")<>0 and InStr(nickname,"情")<>0 or InStr(nickname,"日")<>0 and InStr(nickname,"妈")<>0 or InStr(nickname,"日")<>0 and InStr(nickname,"妹")<>0 or InStr(nickname,"日")<>0 and InStr(nickname,"姐")<>0 or InStr(nickname,"日")<>0 and InStr(nickname,"娘")<>0 or InStr(nickname,"日")<>0 and InStr(nickname,"奶")<>0 or InStr(nickname,"乳")<>0 or InStr(nickname,"阴")<>0 or InStr(nickname,"操")<>0 then Response.Redirect "error.asp?id=131"
if InStr(LCase(gender),"fuck")<>0 or InStr(LCase(gender),"sex")<>0 or InStr(gender,"奸")<>0 or InStr(gender,"淫")<>0 or InStr(gender,"娼")<>0 or InStr(gender,"嫖")<>0 or InStr(gender,"性")<>0 and InStr(gender,"交")<>0 or InStr(gender,"妓")<>0 or InStr(gender,"色")<>0 and InStr(gender,"黄")<>0 or InStr(gender,"色")<>0 and InStr(gender,"情")<>0 or InStr(gender,"日")<>0 and InStr(gender,"妈")<>0 or InStr(gender,"日")<>0 and InStr(gender,"妹")<>0 or InStr(gender,"日")<>0 and InStr(gender,"姐")<>0 or InStr(gender,"日")<>0 and InStr(gender,"娘")<>0 or InStr(gender,"日")<>0 and InStr(gender,"奶")<>0 or InStr(gender,"乳")<>0 or InStr(gender,"阴")<>0 or InStr(gender,"操")<>0 then Response.Redirect "error.asp?id=132"
dieip=Application("fy_c_dieip")
ipk=split(userip,".",-1)
if Instr(dieip,"*.*.*.*")<>0 or Instr(dieip,ipk(0)&".*.*.*")<>0 or Instr(dieip,ipk(0)&"."&ipk(1)&".*.*")<>0 or Instr(dieip,ipk(0)&"."&ipk(1)&"."&ipk(2)&".*")<>0 or Instr(dieip,userip)<>0 then Response.Redirect "error.asp?id=111"
iplocktime=int(Application("fy_c_iplocktime"))
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
conn.open Application("hg_connstr")
dcz=0
sql="SELECT ip FROM iplocktemp WHERE DateDiff('n',lockdate,#" & sj & "#)>=" & iplocktime
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then dcz=1
rs.close
if dcz=1 then
 sql="DELETE FROM iplocktemp WHERE DateDiff('n',lockdate,#" & sj & "#)>=" & iplocktime
 conn.Execute(sql)
end if
sql="SELECT ip,lockdate FROM iplocktemp WHERE ip='" & userip & "'"
rs.open sql,conn,1,1
if NOT(rs.Eof and rs.Bof) then
 lockdate=rs("lockdate")
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=110&lockdate=" & server.URLEncode(lockdate)
end if
rs.close
if NOT(enter="进 入" or enter="修 改" or enter="自 杀") then enter="进 入"
ydl=1
if Instr(LCase(Application("fy_c_useronlinename"))," "&LCase(nickname)&" ")=0 then ydl=0
if ydl=1 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=140"
end if
yzc=0
sql="SELECT username,password,grade,lastkick FROM reginfo WHERE username='" & nickname & "' and kill='0'"
rs.open sql,conn,1,1
if NOT(rs.Eof or rs.Bof) then
 if server.URLEncode (rs("username"))<>server.URLEncode (nickname) then
 rs.Close
 set rs=nothing
 conn.Close
 set conn=nothing
 Response.Redirect "error.asp?id=422"
 end if 
 yzc=1
 regpass=rs("password")
 reggrade=rs("grade")
 reglastkick=rs("lastkick")
end if
rs.close
if yzc=1 and CStr(password)<>CStr(regpass) then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=141"
end if
if reggrade="0" then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=142"
end if
if Not(IsNull(reglastkick)) then
if DateDiff("s",CDate(reglastkick),sj)<=300 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=143&lastkick=" & server.URLEncode(reglastkick)
end if
end if
if Application("fy_c_disnewuser")="1" and yzc=0 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=102"
end if
Select Case enter
Case "进 入"
if yzc=1 then
 sql="SELECT grade,times,value,mvalue,lasttime,lastip,face,money FROM reginfo WHERE username='" & nickname & "' and kill='0'"
 rs.open sql,conn,1,3
 grade=int(rs("grade"))
 value=int(rs("value"))
 prevtime=CDate(rs("lasttime"))
 if value>=int(Application("fy_c_level1to2")) and grade<2 then grade=2
 if value>=int(Application("fy_c_level2to3")) and grade<3 then grade=3
 if value>=int(Application("fy_c_level3to4")) and grade<4 then grade=4
 if value>=int(Application("fy_c_level4to5")) and grade<5 then grade=5
 if DateDiff("m",prevtime,sj)<>0 then rs("mvalue")=0
 rs("grade")=grade
 rs("times")=rs("times")+1
 rs("lasttime")=sj
 rs("lastip")=userip
 rs.update
 str1=int(rs("grade"))
 str2=gender
 str3=rs("face")
 str4=rs("money")
 call Dim_userinfo(str1,str2,str3,str4)
 Session("fy_u_nickname")=nickname
 Session("fy_u_value")=int(value)
 Session("fy_u_mvalue")=rs("mvalue")
 Response.Cookies("fy_u_times")=rs("times")
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "welcome.asp"
 Response.End
else
if Request.Cookies("fy_u_newreg")="true" then
conn.Close
set conn=nothing
Response.Redirect "error.asp?id=423"
end if
 conn.Execute ("insert into reginfo ([kill],[leave],[username],[password],[grade],[times],[regtime],[regip],[lasttime],[lastip]) values ('0','0','"&nickname&"','"&password&"',1,1,'"&sj&"','"&userip&"','"&sj&"','"&userip&"')")
 conn.close
 set rs=nothing
 set conn=nothing
 Session("fy_u_nickname")=nickname
 str1=1
 str2=gender
 str3=313
 str4=0
 call Dim_userinfo(str1,str2,str3,str4)
 Session("fy_u_value")=0
 Session("fy_u_mvalue")=0
 Response.Cookies("fy_u_times")=1
 Response.Cookies("fy_u_newreg")="true"
 Response.Redirect "welcome.asp"
 Response.End
end if
Case "修 改"
if yzc=0 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=150"
else
 if newpass="" then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=151"
 end if
 if newpass=password then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=152"
 end if
 if LCase(newpass)=LCase(nickname) then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=153"
 end if
 sql="SELECT password,mvalue,lasttime,lastip FROM reginfo WHERE username='" & nickname & "' and kill='0'"
 rs.open sql,conn,1,3
 rs("password")=newpass
 prevtime=CDate(rs("lasttime"))
 if DateDiff("m",prevtime,sj)<>0 then rs("mvalue")=0
 rs("lasttime")=sj
 rs("lastip")=userip
 rs.update
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "ok.asp?id=100&new="&newpass
end if
Case "自 杀"
if yzc=0 then
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=160"
else
 if killpass="" then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=161"
 end if
 if killpass<>regpass then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=162"
 end if
 sql="SELECT leave,kill,mvalue,lasttime,lastip FROM reginfo WHERE username='" & nickname & "' and kill='0'"
 rs.open sql,conn,1,3
 leave=rs("leave")
 if leave="1" then
  rs.close
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=163"
 end if
 prevtime=CDate(rs("lasttime"))
 if DateDiff("m",prevtime,sj)<>0 then rs("mvalue")=0
 rs("kill")="1"
 rs("lasttime")=sj
 rs("lastip")=userip
 rs.update
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "ok.asp?id=101&name="&server.URLEncode(nickname)
end if
End Select

sub  Dim_userinfo(str1,str2,str3,str4)
 Dim fy_u_userinfo(3)
 fy_u_userinfo(0)=str1
 fy_u_userinfo(1)=str2
 fy_u_userinfo(2)=str3
 fy_u_userinfo(3)=str4
 Session("fy_u_userinfo")=fy_u_userinfo
 erase fy_u_userinfo
end sub
%>
