<%@ LANGUAGE=VBScript%>
<%
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
if Request.Cookies ("fy_u_counted")<>"1" then 
 Set conn=Server.CreateObject("ADODB.CONNECTION")
 Set rs=Server.CreateObject("ADODB.RecordSet")
 connstr=Application("hg_connstr")
 conn.open connstr
 sql="SELECT visitor FROM system "
 rs.open sql,conn,1,3
 rs("visitor")=rs("visitor")+1
 Application.Lock
  Application("fy_c_visitor")=rs("visitor")
 Application.UnLock
 rs.update
 rs.close
 conn.close
 Set rs=nothing
 Set conn=nothing
 Response.Cookies("fy_u_counted")="1"
end if
visitor=Application("fy_c_visitor")
chatroomname=Application("fy_c_chatroomname")
user=Application("fy_c_user")
sn=Application("fy_c_sn")
copyright=Application("fy_c_copyright")
chatroombgimage=Application("fy_c_chatroombgimage")
homepageurl=Application("fy_c_homepageurl")
opendate=Application("fy_c_opendate")
chatroombgcolor=Application("fy_c_chatroombgcolor")
logo=Application("fy_c_logo")
ver=Application("fy_c_ver")%><html>
<head>
<title><%=chatroomname&" "&ver%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<table width=100% border=0 height=100%>
<tr>
<td>
<table width=500 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<form method=post action=check.asp id=form1 name=form1>
<tr> 
<td>
<table border=0 bgcolor=#0066FF cellspacing=0 cellpadding=2 width=497>
<tr> 
<td width=482><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>��¼���� - <%=chatroomname&" "&ver%></font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="<%=homepageurl%>" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�˳�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table width=497 height=330 border=1 cellspacing=0 bgcolor="FFFFFF">
<tr valign="top"> 
<td>
<table width="100%" border="0" cellpadding="3">
<tr> 
<td align="center" bgcolor="#000000" width="16%"><font color=white>��¼����</font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=loginsm.asp><font color=black>��¼˵��</font></a></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=logingb.asp><font color=black>�� �� ��</font></a></td>
                        <td width="16%" align="center" bgcolor="#cccccc"><a href="copyright.asp"><font color="#000000">��Ȩ����</font></a></td>
<td width="16%">&nbsp;</td>
<td width="20%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="312" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="5">
<tr valign="middle"> 
<td> 
<table width="100%" border="0">
<tr> 
<td align="center"> 
<p><img src="<%=logo%>"></p>
<p><font color="#FF0000">���Ч��</font></p>
<p> IE4.0����<br>
800 * 600<br>
С �� ��<br>
16bit��ɫ</p>
<p>���ܹر������<br>
�� Cookie ����</p>
<p><font color="#0000FF">�״ε�¼<br>
�Զ�ע��<br>
��������</font></p>
</td>
<td align="center"> 
<table border="0" align="center" cellpadding="5">
<tr align="center"> 
<td><font color=red><%=opendate%></font> ��� <font color="#FF0000"><%=visitor%></font> 
λ�ÿ�<br>
����ʱ�䣺<font color="#009900"><%n=Year(date())
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
Response.Write n & "��" & y & "��" & r & "��" & " " & weekdayname(weekday(date())) & " " & s & ":" & f & ":" & m%></font></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="3">
<tr align="center" bgcolor="#009900"> 
<td colspan="3"><font color="#FFFFFF">��¼����ν��ѡ��</font></td>
</tr>
<tr> 
<td>�� �� ��:</td>
<td> 
<input type="text" name="nickname" maxlength="10" size="12" tabindex="1" style="background-color:EEEEEE">
</td>
<td> 
<input type="submit" name="enter" value="�� ��" tabindex="6">
</td>
</tr>
<tr> 
<td>�ܡ�����:</td>
<td> 
<input type="password" name="password" maxlength="10" size="12" tabindex="2" style="background-color:EEEEEE">
</td>
<td> 
<input type="reset" value="�� д" name="reset" tabindex="6">
</td>
</tr>
<tr> 
<td>�ơ���ν:</td>
<td>
<select name="select" onchange="javascript:document.forms[0].gender.value=this.value;document.forms[0].gender.focus();" tabindex="3" style="background-color:EEEEEE">
<option value="" selected>����</option>
<option value="Boy">�ǣ�</option>
<option value="Girl">�ͣ�</option>
</select><input type="text" name="gender" maxlength="4" size="4" tabindex="4" style="background-color:EEEEEE">
</td>
<td>(��ѡ)</td>
</tr>
</table>
<br>
<table border="0" cellpadding="3" cellspacing="0">
<tr align="center" bgcolor="#FF9900">
<td colspan="3"><font color="#FFFFFF">�� �� �� ��</font></td>
</tr>
<tr>
<td>�� �� ��:</td>
<td>
<input type="password" name="newpass" maxlength="10" size="12" tabindex="7" style="background-color:EEEEEE">
</td>
<td>
<input type="submit" name="enter" value="�� ��" tabindex="8">
</td>
</tr>
</table>
<br>
<table border="0" cellpadding="3" cellspacing="0">
<tr align="center" bgcolor="#9999FF">
<td colspan="3"><font color="#FFFFFF">ɾ �� �� ��</font></td>
</tr>
<tr>
<td>ȷ������:</td>
<td>
<input type="password" name="killpass" maxlength="10" size="12" tabindex="9" style="background-color:EEEEEE">
</td>
<td>
<input type="submit" name="enter" value="�� ɱ" tabindex="10">
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width=100% border=0 cellspacing=0>
<tr>
<td>
                    <input type="text" name="user" readonly value="<%=user%>" size="25" style="text-align:center;background-color:E0E0E0" >
</td>
<td>
                    <input type="text" name="sn" readonly value="SN:<%=sn%>" size="25" style="text-align:center;background-color:E0E0E0" >
</td>
<td align="right">
                    <input type="text" name="copyright" readonly value="<%=copyright%>" size="25" style="text-align:center;background-color:E0E0E0" >
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
<script Language="JavaScript">
document.forms[0].nickname.focus();
</script>
</body>
</html>
