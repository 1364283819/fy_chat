<%@ LANGUAGE=VBScript%>
<%
op=Request.Form("op")
name=Request.Form("name")
Select Case op
Case "����"
 Response.Redirect "maninfosearch.asp?id="&server.URLEncode(name)
Case "ը��"
 Response.Redirect "manbomb.asp?id="&server.URLEncode(name)
Case "����"
 Response.Redirect "mankick.asp?id="&server.URLEncode(name)
Case else
 Response.Redirect "maninfosearch.asp?id="&server.URLEncode(name)
End Select%>