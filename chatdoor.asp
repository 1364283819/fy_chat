<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
useronlinename=Application("fy_c_useronlinename")
online=Split(Trim(useronlinename)," ",-1)
x=UBound(online)
chatrs=Application("fy_c_chatrs")
sn=Application("fy_c_sn")
winsn=Replace(sn,"-","")
copyright=Application("fy_c_copyright")
bg=Request.QueryString("bg")
fc=Request.QueryString("fc")
'if bg="" then bg="FFEECC"
'if fc="" then fc="000000"
sername=Request.ServerVariables("SERVER_NAME")
serport=Request.ServerVariables("SERVER_PORT")
if serport<>"" and serport<>"80" then sername=sername&":"&serport
scrname=Request.ServerVariables("SCRIPT_NAME")
linkurl="http://"&sername&Left(scrname,(len(scrname)-12))&"check.asp"
chat="<table border='0' align='center' bgcolor='"&bg&"' cellspacing='2'><form method='post' action='"&linkurl&"' name='"&winsn&"' target=_blank>"
chat=chat&"<tr><td colspan='2'><div align='center'>"
chat=chat&"<font color='"&fc&"' style='font-size:12pt'></font>"
chat=chat&"</div></td></tr>"
chat=chat&"<tr><td colspan='2'><div align=center><select style='font-size:9pt;color:000000;border: 1 double' name='userlist'><option selected>共 "&chatrs&" 人在线</option>"
if chatrs>0 then
for i=0 to x
 chat=chat&"<option>"&online(i)&"</option>"
next
end if
chat=chat&"</select></div>"
chat=chat&"</td></tr><tr><td>"
chat=chat&"<font color='"&fc&"' style='font-size:9pt'>姓名:</font></td>"
chat=chat&"<td><input name='nickname' maxlength='10' tabindex='0' size='11' style='font-size:9pt;color:000000;border: 1 double'></td></tr><tr><td>"
chat=chat&"<font color='"&fc&"' style='font-size:9pt'>密码:</font></td>"
chat=chat&"<td><input type='password' name='password' maxlength='10' tabindex='0' size='11' style='font-size:9pt;color:000000;border: 1 double'></td></tr><tr><td>"
chat=chat&"<font color='"&fc&"' style='font-size:9pt'>称谓:</font></td>"
chat=chat&"<input type='hidden' name='copyright' readonly value='"&copyright&"'>"
chat=chat&"<td><select style='font-size:9pt;color:000000;border: 1 double' name=select onchange=javascript:document."&winsn&".gender.value=this.value;document."&winsn&".gender.focus(); tabindex=0><option value='' selected>自填</option><option value=Boy>ＧＧ</option><option value=Girl>ＭＭ</option></select><input style='font-size:9pt;color:000000;border: 1 double' type=text name=gender maxlength=4 size=3 tabindex=0></td></tr><tr><td colspan='2'><div align='center'><input type='submit' name='enter' value='进 入' tabindex='0' style='font-size:9pt;color:000000;border: 1 double'> <input type='reset' name='reset' value='重 写' style='font-size:9pt;color:000000;border: 1 double'></div></td></tr></form></table>"
Response.Write "document.write("&chr(34)&chat&chr(34)&");"
Response.end%>
