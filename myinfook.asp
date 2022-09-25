<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
address=Trim(Request.Form("address"))
email=Trim(Request.Form("email"))
homepage=Trim(Request.Form("homepage"))
intro=Trim(Request.Form("intro"))
address=Replace(address,chr(13)&chr(10),"")
email=Replace(email,chr(13)&chr(10),"")
homepage=Replace(homepage,chr(13)&chr(10),"")
if LCase(homepage)="http://" then homepage=""
intro=Replace(intro,chr(13)&chr(10),"<br>")
if server.HTMLEncode(address)<>address or Instr(address,chr(34))<>0 then Response.Redirect "error.asp?id=220"
if server.HTMLEncode(email)<>email or Instr(email,chr(34))<>0 then Response.Redirect "error.asp?id=221"
if server.HTMLEncode(homepage)<>homepage or Instr(homepage,chr(34))<>0 then Response.Redirect "error.asp?id=222"
intro=Server.HTMLEncode(intro)
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
if cnlen(address)>30 then Response.Redirect "error.asp?id=223"
if cnlen(email)>50 then Response.Redirect "error.asp?id=224"
if cnlen(homepage)>50 then Response.Redirect "error.asp?id=225"
if cnlen(intro)>200 then Response.Redirect "error.asp?id=226"
if email<>"" then
 if Not(IsMail(email)) then Response.Redirect "error.asp?id=227"
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
if homepage<>"" then
 if LCase(Left(homepage,7))<>"http://" or Instr(homepage,".")=0 then Response.Redirect "error.asp?id=228"
end if
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT address,email,homepage,intro FROM reginfo WHERE username='" & nickname & "' and kill='0'"
rs.open sql,conn,1,3
if rs.Eof and rs.Bof then
 rs.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "error.asp?id=229"
end if
rs("address")=address
rs("email")=email
rs("homepage")=homepage
rs("intro")=intro
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing
Response.Redirect "ok.asp?id=110"%>