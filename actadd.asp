<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<3 then Response.Redirect "manerr.asp?id=101"
actname=Trim(Request.Form("actname"))
actname=Replace(actname,chr(13)&chr(10),"")
range=Trim(Request.Form("range"))
if range<>"1" and range<>"0" then range="0"
actnl=Trim(Request.Form("act"))
actnl=Replace(actnl,chr(13)&chr(10),"")
actnl=Replace(actnl,"<","&lt;")
actnl=Replace(actnl,">","&gt;")
actnl=Replace(actnl,"&","&amp;")
if range<>0 and range<>1 then range=""
if actname="" or actnl="" or range="" or len(actnl)<=2 then Response.Redirect "manerr.asp?id=102"
if left(actnl,2)<>"//" then Response.Redirect "manerr.asp?id=103"
if left(actnl,4)="//##" then Response.Redirect "manerr.asp?id=104"
if len(actnl)>100 or len(actname)>4 then Response.Redirect "manerr.asp?id=105"
if InStr(actnl,"%%")<>0 and range="0" then Response.Redirect "manerr.asp?id=106"
if InStr(actnl,"%%")=0 and range="1" then Response.Redirect "manerr.asp?id=107"
if InStr(actnl,"|")<>0 or InStr(actnl,"\")<>0 or InStr(actnl,chr(34))<>0 then Response.Redirect "manerr.asp?id=108"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT acttype FROM actlib WHERE act LIKE '%" & actnl & "%'"
rs.open sql,conn,1,1
if Not(rs.Eof and rs.Bof) then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Redirect "manerr.asp?id=109"
end if
rs.close
set rs=nothing
Function SqlStr(data)
 SqlStr="'" & Replace(data,"'","''") & "'"
End Function
sql="INSERT INTO actlib (acttype,name,act) VALUES ("
sql=sql & SqlStr(range) & ","
sql=sql & SqlStr(actname) & ","
sql=sql & SqlStr(actnl) & ")"
conn.Execute(sql)
conn.close
set conn=nothing
Set fs=CreateObject("Scripting.FileSystemObject")
Application.Lock
logfile=Server.Mappath("actaddlog.asp")
set thisfile=fs.OpenTextFile(logfile,8)
thisfile.writeline now & "¡¡" & nickname & "¡¡" & actname & "¡¡" & actnl & "<p>"
thisfile.close
Application.UnLock
set fs=nothing
Response.Redirect "ok.asp?id=210"%>
