<%@ LANGUAGE=VBScript%>
<%Server.ScriptTimeout=1000
Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
inthechat=Session("fy_u_inthechat")
value=Int(Session("fy_u_value"))
if nickname="" then Response.Redirect "manerr.asp?id=100"
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
Set fs=CreateObject("Scripting.FileSystemObject")
pollfile=Server.Mappath("pollending.asp")
Set thisfile = fs.OpenTextFile(pollfile,1,False)
Dim poll()
count=0
do while not thisfile.AtEndOfStream
 thisline=thisfile.Readline
 Redim preserve poll(count)
 poll(count)=thisline
 count=count+1
loop
thisfile.close
set thisfile=nothing
set fs=nothing
hxrs=int((count-6)/2)
Dim show()
js=1
for i=6 to count-1 step 2
 Redim Preserve show(js),show(js+1),show(js+2)
 show(js)=poll(i)
 show(js+1)=poll(i+1)
 show(js+2)=1
 js=js+3
next
zzz=0
for i=1 to js-3 step 3
 if int(show(i+1))>int(zzz) then zzz=show(i+1)
 for j=1 to js-3 step 3
  if int(show(i+1))<int(show(j+1)) then show(i+2)=show(i+2)+1
 next
next%><html>
<head>
<title>ͶƱϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="FFFFFF" class=p150>
<h1 align="center"><font color="0099FF">��ͶƱ�����</font></h1>
<div align="center">�����ǣ�<%=sj%> </div>
<hr noshade size="1" color=009900>
<b>[����˵��]</b>��ͶƱʱ�䣺<font color=red><%=poll(1)%></font> �� <font color=red><%=poll(2)%></font> 
<hr noshade size="1" color=009900>
<div align="center">Ŀǰ���к�ѡ�ˣ�<font color=red><%=hxrs%></font> λ����ͶƱ��<font color=red><%=poll(4)%></font> Ʊ��<a href="javascript:history.go(0)">��ˢ�¡�</a><a href="javascript:history.go(-1)">�����ء�</a></div>
<form method="post" action="pollviewpoll.asp">
<table border="1" align="center" cellpadding="4" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="#E0E0E0" width="90%">
<tr bgcolor="#0099FF"> 
<td align="center"><font color="#FFFFFF">���</font></td>
<td align="center"><font color="#FFFFFF">ͶƱ</font></td>
<td><font color="#FFFFFF">��ѡ��</font></td>
<td align="center"><font color="#FFFFFF">�� Ʊ ��</font></td>
<td align="center"><font color="#FFFFFF">��Ʊ��</font></td>
<td align="center"><font color="#FFFFFF">����</font></td>
<%if grade>9 then%><td align="center"><font color="#FFFFFF">����</font></td><%end if%>
</tr>
<%for i=1 to js-3 step 3%> 
<tr> 
<td align="center"><%=(i+2)/3%></td>
<td align="center"> 
<input type="radio" name="poll" value="<%=show(i)%>">
</td>
<td><%=show(i)%></td>
<td nowrap><%if poll(4)>0 and show(i+1)>0 then%><img src="readonly/poll.gif" width="<%=int(show(i+1)*200/zzz)%>" height="18"><%end if%>&nbsp;<%=show(i+1)%></td>
<td align="right"><%if poll(4)=0 then
Response.Write "0%"
else
Response.Write formatnumber(show(i+1)*100/poll(4),2)&"%"
end if%></td>
<td align="center"><%=show(i+2)%></td>
<%if grade>9 then%><td align="center"><a href="pollgrade.asp?id=<%=server.URLEncode(show(i))%>" target="_blank">��</a></td><%end if%>
</tr>
<%next%> 
<tr> 
<td align="center" colspan="7"> <%yxtp=1
if CDate(poll(1))>CDate(sj) then
 yxtp=0
 Response.Write "ͶƱ���δ��ʼ������ͶƱ"
end if
if CDate(poll(2))<CDate(sj) then
 yxtp=0
 Response.Write "ͶƱ��Ѿ�����������ͶƱ"
end if
if value<int(poll(3)) and yxtp=1 then
 yxtp=0
 Response.Write "���ľ���ֵû�дﵽ" & poll(3) & "�֣�����ͶƱ"
end if
if Instr(LCase(poll(5))," "&LCase(nickname)&" ")<>0 and yxtp=1 then
 yxtp=0
 Response.Write "���Ѿ�Ͷ��Ʊ�ˣ������ظ�ͶƱ"
end if
if yxtp=1 then
 Response.Write "<input type='submit' name='Submit' value='Ͷ����ʥһƱ'>"
end if%></td>
</tr>
</table>
</form>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
