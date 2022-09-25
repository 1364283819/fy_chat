<%
sername=Request.ServerVariables("SERVER_NAME")
Session("fy_u_nickname")="聊天室管理员"
 Dim fy_u_userinfo(2)
 fy_u_userinfo(0)=10
 fy_u_userinfo(1)=1
 fy_u_userinfo(2)=1
 Session("fy_u_userinfo")=fy_u_userinfo
 erase fy_u_userinfo
Response.Cookies ("fy_u_times")=1
Session("fy_u_value")=0
Session("fy_u_mvalue")=0
Response.Redirect "manage.asp"
%>