<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
dim URLStr
URLStr=Request.ServerVariables("SERVER_NAME")&Request.ServerVariables("URL")
URLStr=Replace (URLStr,"welcome.asp","")
Response.Cookies ("http")=URLStr
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
if Session("fy_u_nickname")="" then Response.Redirect "login.asp"
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
if Request.Cookies ("fy_u_visitor")<>"1" then 
 nc=int(Hour(time()))
 sql="SELECT value FROM counthour WHERE name='lc'"
 rs.open sql,conn,1,3
 lc=int(rs("value"))
 rs("value")=nc
 rs.Update
 rs.close
 if nc=lc then
  sql="SELECT value FROM counthour WHERE name='" & nc & "'"
  rs.open sql,conn,1,3
  rs("value")=rs("value")+1
  rs.Update
  rs.close
 end if
 if nc>lc then
  for i=lc+1 to nc
   sql="SELECT value FROM counthour WHERE name='" & i & "'"
   rs.open sql,conn,1,3
   if i=nc then
    rs("value")=1
   else
    rs("value")=0
   end if
   rs.Update
   rs.close
  next
 end if
 if nc<lc then
  for i=lc+1 to 23
   sql="SELECT value FROM counthour WHERE name='" & i & "'"
   rs.open sql,conn,1,3
   rs("value")=0
   rs.Update
   rs.close
  next
  for i=0 to nc
   sql="SELECT value FROM counthour WHERE name='" & i & "'"
   rs.open sql,conn,1,3
   if i=nc then
    rs("value")=1
   else
    rs("value")=0
   end if
   rs.Update
   rs.close
  next
 end if
 Response.Cookies ("fy_u_visitor")="1"
end if
visitor=Application("fy_c_visitor")
chatroomname=Application("fy_c_chatroomname")
user=Application("fy_c_user")
sn=Application("fy_c_sn")
winsn=Replace(sn,"-","")
copyright=Application("fy_c_copyright")
chatroombgimage=Application("fy_c_chatroombgimage")
homepageurl=Application("fy_c_homepageurl")
opendate=Application("fy_c_opendate")
chatroombgcolor=Application("fy_c_chatroombgcolor")
logo=Application("fy_c_logo")
ver=Application("fy_c_ver")
nickname=Session("fy_u_nickname")
if nickname<>"�����ҹ���Ա" then
 sql="SELECT leave FROM reginfo WHERE kill='0' and username='" & nickname & "'"
 rs.open sql,conn,1,1
 yj=rs("leave")
 rs.close
end if
sql="SELECT mm FROM gbook WHERE mm='0' or towho='" & nickname & "' or fromwho='" & nickname & "'"
rs.open sql,conn,1,1
totalcansee=rs.RecordCount
rs.close
sql="SELECT mm FROM gbook WHERE towho='" & nickname & "' or fromwho='" & nickname & "'"
rs.open sql,conn,1,1
totalaboutme=rs.RecordCount
rs.close
sql="SELECT mm FROM gbook WHERE mm='1' and (towho='" & nickname & "' or fromwho='" & nickname & "')"
rs.open sql,conn,1,1
totalmm=rs.RecordCount
rs.close
conn.close
set rs=nothing
set conn=nothing
useronlinename=Application("fy_c_useronlinename")
onliners=Application("fy_c_chatrs")
online=Split(Trim(useronlinename)," ",-1)
x=UBound(online)%><html>
<head>
<title><%=nickname&" �� "&chatroomname&" ��"%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<script language="javascript">
function openWin(){<%=winsn%>=window.open('hqtchat.asp','<%=winsn%>','Status=yes,scrollbars=yes,resizable=yes');<%=winsn%>.moveTo(0,0);<%=winsn%>.resizeTo(screen.availWidth,screen.availHeight);<%=winsn%>.outerWidth=screen.availWidth;<%=winsn%>.outerHeight=screen.availHeight;}
function rlg(){if(confirm("�����Ҫ���ص�¼ҳ�沢����������")){top.location.href="relogin.asp";return true;}}
</script>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%>>
<table width=100% border=0 height=100%>
<tr>
<td>
<table width=500 border=1 align=center cellspacing=0 bordercolorlight=000000 bordercolordark=FFFFFF bgcolor=E0E0E0>
<form name="wel">
<tr> 
<td>
<table border=0 bgcolor=#009900 cellspacing=0 cellpadding=2 width=497>
<tr> 
<td width=482><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>��ӭҳ�� - <%=chatroomname%></font></td>
<td width=18>
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="relogin.asp" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�˳�"><font color="000000">��</font></a></b></td>
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
<td align="center" bgcolor="#000000" width="16%"><font color=white>��ӭҳ��</font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcomemy.asp><font color=black>������Ϣ</font></a></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcomefq.asp><font color=black>���Ѳ�ѯ</font></a></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=welcomegb.asp><font color=black>�鿴����</font></a></td>
<td width="16%" bgcolor="#CCCCCC" align="center"><a href=welcomeph.asp><font color=black>��������</font></a></td>
<td width="20%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="312" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="5">
<tr valign="middle" align="center"> 
<td> 
<table border="0" cellpadding="5">
<tr>
<td>��ӭ������ <font color=red><%=chatroomname%></font> ��ף���ĵÿ��ģ�</td>
</tr>
</table>
<br>
                          <table border="0" cellpadding="6" width="377">
                            <tr> 
<td>
                                <table border="1" cellspacing="0" bordercolorlight="#3399FF" bordercolordark="#FFFFFF" cellpadding="5" width="100%">
                                  <tr> 
<td> 
                                      <table width="100%" border="0">
                                        <tr> 
                                          <td>�� �� ����</td>
                                          <td>
                                            <%if yj=1 then Response.Write "<a title='���ñ���'><font color='blue' face='Wingdings' style='font-size:12pt;cursor:hand'>&lt;</font></a>"%>
                                            <font color=red><%=nickname%></font></td>
                                        </tr>
                                        <tr> 
                                          <td>�ơ���ν��</td>
                                          <td><font color=red><%=Session("fy_u_userinfo")(1)%></font></td>
                                        </tr>
                                        <tr> 
                                          <td>��ǰ����</td>
                                          <td><font color=red><%=Session("fy_u_userinfo")(0)%> 
                                            ��</font></td>
                                        </tr>
                                        <tr> 
                                          <td>���ô�����</td>
                                          <td><font color=red><%=Request.Cookies("fy_u_times")%> 
                                            ��</font></td>
                                        </tr>
                                        <tr> 
                                          <td>�ۻ����飺</td>
                                          <td><font color=red><%=Session("fy_u_value")%> 
                                            ��</font></td>
                                        </tr>
                                        <tr> 
                                          <td height="21">���»��֣�</td>
                                          <td height="21"><font color=red><%=Session("fy_u_mvalue")%> 
                                            ��</font></td>
                                        </tr>
                                        <tr> 
                                          <td>������ʾ��</td>
                                          <td><font color=red><%=totalmm%>/<%=totalaboutme%>/<%=totalcansee%></font></td>
                                        </tr>
                                        <tr>
                                          <td>�������ң�</td>
                                          <td><font color=red><%=session("fy_u_userinfo")(3)%></font></td>
                                        </tr>
                                      </table>
</td>
</tr>
</table>
</td>
                              <td align="center"> 
                                <table border="1" cellspacing="0" bordercolorlight="#3399FF" bordercolordark="#FFFFFF" cellpadding="7" width="100%" height="100%">
                                  <tr> 
                                    <td valign="middle" align="center"> 
                                      <table width="100%" border="0" align="center">
                                        <tr> 
                                          <td valign="middle" align="center"> 
                                            <p> 
                                              <select name="onlinelist" style="background-color:3399FF;color:FFFFFF">
                                                <option selected>�� <%=onliners%>/<%=Application("fy_c_active")%> 
                                                ������</option>
                                                <%if onliners>0 then
for i=0 to x%>
                                                <option><%=online(i)%></option>
                                                <%next
end if%>
                                              </select>
                                            </p>
                                            <p> 
                                              <input type="button" value="������" style="background-color:E0E0E0;color:000000;border: 1 double" onMouseOver="this.style.color='FF0000'" onMouseOut="this.style.color='000000'" onClick=javascript:top.location.href="hqtchat.asp" name="button">
                                              �� 
                                              <input type="button" value="�´���" name="beginchat" style="background-color:E0E0E0;color:000000;border: 1 double" onMouseOver="this.style.color='FF0000'" onMouseOut="this.style.color='000000'" onClick="javascript:openWin()">
                                            </p>
                                            <p> 
                                              <input type="button" name="relogin" value=" �� �� �� ¼ " onClick="javascript:rlg()" style="background-color:E0E0E0;color:0000FF;border: 1 double" onMouseOver="this.style.color='FF00FF'" onMouseOut="this.style.color='0000FF'">
                                            </p>
                                            <p> 
                                              <input type="button" name="visitor" value=" �� �� �� �� " onClick="javascript:window.open('counter.asp','counter','width=620,height=360')" style="background-color:E0E0E0;color:0000FF;border: 1 double" onMouseOver="this.style.color='FF00FF'" onMouseOut="this.style.color='0000FF'">
                                              <br>
                                            </p>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td valign="middle" align="center">&nbsp;</td>
                                        </tr>
                                      </table>
                                      
                                    </td>
                                  </tr>
                                </table>
                              </td>
</tr>
</table>
<br>
<table border="0" cellpadding="5">
<tr> 
<td>ע�⣺���� 3 �����ڽ��������ң�����ϵͳ����ʱ�Ͽ����������ӡ�</td>
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
                    <input type="text" name="user" readonly value="<%=user%>" size="25" style="background-color:E0E0E0">
</td>
<td>
                    <input type="text" name="sn" readonly value="SN:<%=sn%>" size="25" style="background-color:E0E0E0">
</td>
<td align="right">
                    <input type="text" name="copyright" readonly value="<%=copyright%>" size="25" style="background-color:E0E0E0">
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
</body>
</html>
