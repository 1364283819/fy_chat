<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=260"
Response.Write "<a href=actaddlogdel.asp>�����־</a>����<a href=javascript:history.go(0)>ˢ����־</a><p>ʱ�䡡������������ˡ��������������<p>"%>
