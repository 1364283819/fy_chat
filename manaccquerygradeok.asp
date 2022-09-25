<%@ LANGUAGE=VBScript%>
<%
grade=Trim(Request.Form("grade"))
Response.Redirect "manaccquerygradeview.asp?grade=" & server.URLEncode(grade) & "&page=1"%>