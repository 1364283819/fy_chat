<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
towho=server.HTMLEncode(Replace(Trim(Request.Form("towho")),chr(13)&chr(10),""))
mm=Request.Form("mm")
if mm<>"1" then mm="0"
title=server.HTMLEncode(Replace(Trim(Request.Form("title")),chr(13)&chr(10),""))
if Instr(title,chr(34))<>0 or Instr(title,"'")<>0 then Response.Redirect "error.asp?id=266"
intro=Replace(server.HTMLEncode(Trim(Request.Form("intro"))),chr(13)&chr(10),"<br>")
if Instr(intro,"<br><br><br>")<>0 then Response.Redirect "error.asp?id=264"
fromwho=server.HTMLEncode(Replace(Trim(Request.Form("fromwho")),chr(13)&chr(10),""))
pass=CStr(Request.Form("pass"))
address=server.HTMLEncode(Replace(Trim(Request.Form("address")),chr(13)&chr(10),""))
hideip=Request.Form("hideip")
if hideip<>"1" then hideip="0"
email=server.HTMLEncode(Replace(Trim(Request.Form("email")),chr(13)&chr(10),""))
homename=server.HTMLEncode(Replace(Trim(Request.Form("homename")),chr(13)&chr(10),""))
homeurl=server.HTMLEncode(Replace(Trim(Request.Form("homeurl")),chr(13)&chr(10),""))
if LCase(homeurl)="http://" then homeurl=""
ip=Request.ServerVariables("REMOTE_ADDR")
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
if towho="" then towho="大家"
if towho="大家" then mm="0"
if title="" or intro="" or fromwho="" then Response.Redirect "error.asp?id=250"
Function cnlen(zhc)
namelen=0
for i=1 to len(zhc)
 zhasc=asc(mid(zhc,i,1))
 if zhasc<0 then
  namelen=namelen+2
 else
  namelen=namelen+1
 end if
 cnlen=namelen
next
End Function
if cnlen(towho)>20 then Response.Redirect "error.asp?id=254"
if cnlen(title)>40 then Response.Redirect "error.asp?id=255"
if len(intro)>1024 then Response.Redirect "error.asp?id=256"
if cnlen(fromwho)>20 then Response.Redirect "error.asp?id=257"
if cnlen(address)>20 then Response.Redirect "error.asp?id=258"
if cnlen(email)>50 then Response.Redirect "error.asp?id=259"
if cnlen(homename)>24 then Response.Redirect "error.asp?id=260"
if cnlen(homeurl)>50 then Response.Redirect "error.asp?id=261"
if email<>"" then
 if Not(IsMail(email)) then Response.Redirect "error.asp?id=262"
end if
Function IsMail(ema)
 namelen=0
 for i=1 to len(ema)
  zhasc=asc(mid(ema,i,1))
  if zhasc<0 then
   namelen=namelen+2
  else
   namelen=namelen+1
  end if
 next
 if namelen<>len(ema) or len(ema)<7 or Instr(ema,"@")=0 or Instr(ema,".")=0 or Instr(ema,"@")<>InstrRev(ema,"@") or InstrRev(ema,"@")>(len(ema)-5) or InstrRev(ema,".")>(len(ema)-2) then
  IsMail=false
 else
  IsMail=true
 end if
End Function
if homeurl<>"" then
 if Instr(homeurl,".")=0 or LCase(Left(homeurl,7))<>"http://" then Response.Redirect "error.asp?id=263"
end if
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
if mm="1" then
 sql="SELECT username FROM reginfo WHERE username='" & towho & "' and kill='0'"
 rs.open sql,conn,1,1
 if rs.Eof and rs.Bof then
  rs.close
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=251&name=" & server.URLEncode(towho)
 end if
 rs.close
end if
cz=0
sql="SELECT password FROM reginfo WHERE username='" & fromwho & "' and kill='0'"
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then
 cz=1
 password=rs("password")
end if
rs.close
if cz=1 then
 if pass="" then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=252&name=" & server.URLEncode(fromwho)
 end if
 temppass=StrReverse(pass)
 templen=len(pass)
 mmpassword=""
 for j=1 to templen
  mmpassword=mmpassword+chr(asc(mid(temppass,j,1))-templen+int(j*1.1))
 next
 if CStr(mmpassword)<>CStr(password) then
  conn.close
  set rs=nothing
  set conn=nothing
  Response.Redirect "error.asp?id=253&name=" & server.URLEncode(fromwho)
 end if
end if
sql="SELECT * FROM gbook WHERE towho='" & towho & "' and fromwho='" & fromwho & "' and title='" & title & "'"
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=265"
end if
rs.close
dlcz=0
sql="SELECT mm FROM gbook WHERE DateDiff('d',writetime,#" & sj & "#)>30"
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then dlcz=1
rs.close
if dlcz=1 then
 sql="DELETE FROM gbook WHERE DateDiff('d',writetime,#" & sj & "#)>30"
 conn.Execute(sql)
end if
sql="SELECT * FROM gbook"
rs.open sql,conn,1,3
rs.AddNew
rs("writetime")=sj
rs("mm")=mm
rs("towho")=towho
rs("fromwho")=fromwho
rs("title")=title
rs("intro")=intro
rs("hideip")=hideip
rs("ip")=ip
if address<>"" then rs("address")=address
if email<>"" then rs("email")=email
if homename<>"" then rs("homename")=homename
if homeurl<>"" then rs("homeurl")=homeurl
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing
Response.Redirect "welcomegbview.asp?show=0&page=1"%>