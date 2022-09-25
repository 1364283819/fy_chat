<%@ LANGUAGE=VBScript%>
<%
op=Request.Form("op")
name=Request.Form("name")
Select Case op
Case "²éÕÒ"
 Response.Redirect "maninfosearch.asp?id="&server.URLEncode(name)
Case "Õ¨µ¯"
 Response.Redirect "manbomb.asp?id="&server.URLEncode(name)
Case "ÌßÈË"
 Response.Redirect "mankick.asp?id="&server.URLEncode(name)
Case else
 Response.Redirect "maninfosearch.asp?id="&server.URLEncode(name)
End Select%>