<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
On Error Resume Next
chatroomname=Application("fy_c_chatroomname")
username=Server.HTMLEncode(Trim(Request.Form("username")))
pwd=Server.HTMLEncode(Trim(Request.Form("pwd")))
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT password FROM reginfo WHERE kill='0' AND username='" & username & "'"
rs.open sql,conn,1,3
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Write "<script Language='Javascript'>"
 Response.Write "alert('该用户名不存在。');"
 Response.Write "history.go(-1);"
 Response.Write "</script>"
 Response.End
End if
oldpwd=rs("password")
if CStr(pwd)<>CStr(oldpwd) then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Write "<script Language='Javascript'>"
 Response.Write "alert('临时密码错误！');"
 Response.Write "history.go(-1);"
 Response.Write "</script>"
 Response.End
end if
rs("password")="8"
rs.Update
rs.close
conn.close
set rs=nothing
set conn=nothing
Response.Write "<script Language='Javascript'>"
Response.Write "alert('【新密码设置成功】\n\n新密码为“8”。\n\n请到聊天室登录窗口用“修改密码”功能，\n\n将密码“8”改为你自己的私人密码。');"
Response.Write "history.go(-1);"
Response.Write "</script>"
Response.End%>