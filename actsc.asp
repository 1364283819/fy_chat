<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" then Response.Redirect "close.asp"
keyword=Trim(Request.Form("keyword"))
range=Trim(Request.Form("range"))
if keyword="" then Response.Redirect "act.asp"
if range<>"0" and range<>"1" and range<>"2" then range="0"
Response.Redirect "actview.asp?keyword="&server.URLEncode(keyword)&"&range="&range&"&page=1"%>