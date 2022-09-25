<%@ LANGUAGE=VBScript%>
<%
name=Trim(Request.Form("username"))
querytype=Trim(Request.Form("querytype"))
Response.Redirect "friendqueryview.asp?name=" & server.URLEncode(name) & "&querytype=" & querytype & "&page=1"%>