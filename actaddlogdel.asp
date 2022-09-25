<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
Set fs=CreateObject("Scripting.FileSystemObject")
logfile=Server.Mappath("actaddlog.asp")
Set thisfile=fs.CreateTextFile(logfile)
thisfile.WriteLine "<" & "%nickname=Session(" & chr(34) & "fy_u_nickname" & chr(34) & ")"
thisfile.WriteLine "grade=Int(Session(" & chr(34) & "fy_u_grade" & chr(34) & "))"
thisfile.WriteLine "if nickname=" & chr(34) & chr(34) & " then Response.Redirect " & chr(34) & "manerr.asp?id=100" & chr(34)
thisfile.WriteLine "if grade<>10 then Response.Redirect " & chr(34) & "manerr.asp?id=260" & chr(34)
thisfile.WriteLine "Response.Write " & chr(34) & "<a href=actaddlogdel.asp>清空日志</a>　　<a href=javascript:history.go(0)>刷新日志</a><p>时间　　　　　添加人　　　　添加内容<p>" & chr(34) & "%" & ">"
thisfile.close
set thisfile=nothing
set fs=nothing
Response.Redirect "actaddlog.asp"%>