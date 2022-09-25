<%
face=Request.QueryString ("face")
if face<1 and face >370 then 
Response.Write "<script language=JavaScript>{alert('对不起，程序拒绝您的操作！！！');}</script>"
Response.End
End If
if face="" then Response.Redirect "close.asp"
nickname=session("fy_u_nickname")
if nickname="" then Response.Redirect "close.asp"
Set conn=Server.CreateObject("ADODB.CONNECTION")
conn.open Application("hg_connstr")
conn.Execute ("update reginfo set face='"&face&"' where username='"&nickname&"'")
conn.Close
set conn=nothing
Application.Lock
onlinelist=Application("fy_c_onlinelist")
ubl=UBound(onlinelist)
for i=1 to ubl step 6
if onlinelist(i+1)=nickname then onlinelist(i)=face
next
Application("fy_c_onlinelist")=onlinelist
Application.UnLock 
Response.Write "<script language=JavaScript>parent.ps.location.href='about:blank';parent.m.location.href='f3.asp'</script>"
%>