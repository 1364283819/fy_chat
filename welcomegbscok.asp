<%@ LANGUAGE=VBScript%>
<%
keyword=Trim(Request.Form("keyword"))
if keyword="" then Response.Redirect "error.asp?id=240"
fw=Request.Form("fw")
if fw="" then fw=0
if fw<0 then fw=0
if fw>6 then fw=6
Response.Redirect "welcomegbscview.asp?keyword=" & server.URLEncode(keyword) & "&fw=" & fw & "&page=1"%>