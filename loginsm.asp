<%@ LANGUAGE=VBScript%>
<%
if Application("fy_c_chatroomname")="" then Response.Redirect "error.asp?id=000"
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
<form>
<tr> 
<td>
<table border=0 bgcolor=#0066FF cellspacing=0 cellpadding=2 width=497>
<tr> 
<td width=482><font color=FFFFFF face=Wingdings>1</font><font color=FFFFFF>��¼˵�� - <%=chatroomname&" "&ver%></font></td>
<td width=18> 
<table border=1 bordercolorlight=666666 bordercolordark=FFFFFF cellpadding=0 bgcolor=E0E0E0 cellspacing=0 width=18>
<tr> 
<td width=16><b><a href="<%=homepageurl%>" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�˳�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table width=497 height=330 border=1 cellspacing=0 bgcolor=FFFFFF>
<tr valign="top"> 
<td>
<table width="100%" border="0" cellpadding="3">
<tr> 
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=login.asp><font color=black>��¼����</font></a></td>
<td align="center" bgcolor="#000000" width="16%"><font color=white>��¼˵��</font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=logingb.asp><font color=black>�� �� ��</font></a></td>
                        <td width="16%" align="center" bgcolor="#cccccc"><a href="copyright.asp"><font color="#000000">��Ȩ����</font></a></td>
<td width="16%">&nbsp;</td>
<td width="20%">&nbsp;</td>
</tr>
</table>
<table width="100%" border="1" height="312" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="E0E0E0" cellpadding="5">
<tr valign="middle"> 
<td> 
<p>�����������Ķ���˵����</p>
<p align="center"> 
<textarea name=sm cols=65 rows=16 readonly style="background-color:FFCC99">
===============================================================
                     ע    ��    ��    ��
---------------------------------------------------------------
1.�������л����񹲺͹��йط��ɷ��棬�����������Ҽ����Բ��з���
  ��Υ���桢��㣵��µ����ۡ�
2.���������ˣ�����ЦҲ����̫���𣬸����ܽ����������������ǹ�
  ͬ����һ�����š���������ζ�����컷����
---------------------------------------------------------------
                     ʹ    ��    ˵    ��
---------------------------------------------------------------
�� ֻ��ʹ�� Internet Explorer 4.0 ���ϰ汾���ܻ�����Ч��
�� ǿ���Ƽ�ʹ�� Internet Explorer 5.0��

���������Ҳ���Ҫר�Ž���ע�ᣬֻ��Ҫ���롰�û������������롱��
�����Խ��룬��ʱϵͳ���Զ����ע����̣��������������롣���
���������룬���վ�����Ի����ţ���վ��Ϊ�����������루ע�⣺վ
����Ҳ���ܿ����û������룩��
���û����ֻ��10���ַ���ÿ������ռ�����ַ�����ֻ��ʹ�����ġ�
��Ӣ����ĸ�����֡���ν�ֻ��4���ַ���Ҳ���Բ���������
��Ϊ10λ��ֻ����Ӣ����ĸ�����֡���������Щ�����ܴ��пո�
�����������У������Ҫ�뿪�����ʹ�á��뿪�����ܣ����������ǲ�
��֪�����Ѿ��뿪�ˡ������ֱ�ӹر������Ҵ��ڣ������Ӻ�ϵͳ��
����ʾ�����顯��һ����XXX���ص�ˤ����ȥ��������ʾ���Ѿ����߻�
����ʱ�Ͽ������ˡ�
��������������е��ߣ����²�����������¼ʱ��ʾ�����û�������ʹ
���á��У�������ر����������������Ӻ��ٵ�¼��
���������������Ǳˮ�������ԣ�ʱ�䳬��<%=Application("fy_c_maxtimeout")%>���ӣ�ϵͳ���Զ�ɾ����
���û�������ʾ��XXX����Ǳˮʱ����������ҳ��뺣�ס���
������㳬��30��û����������û�������ϵͳ�Զ�ɾ����ɾ����ԭ
�������û������е�Ȩ�޶�����ʧ�����ø��û�������ʱ��ϵͳ����Ϊ
�����û���������ֵ0�֡��ȼ�1����������Щֻʹ�� 1 �ε��û�����
��ֻΪ�䱣�� 7 ���ʱ�䡣
����������ʹ�þ���ֵ�ȼ��ƣ��ս��������Ѿ���ֵΪ0�֣��ȼ�Ϊһ
������һ�����Ѳ��ܸı������ҵı��⡣����ľ���ֵ�ﵽ<%=Application("fy_c_level1to2")%>��ʱϵͳ
�����Զ�������Ϊ�������ﵽ<%=Application("fy_c_level2to3")%>��ʱ�����������ﵽ<%=Application("fy_c_level3to4")%>��ʱ��Ϊ��
�������ﵽ<%=Application("fy_c_level4to5")%>��ʱ�����弶���������û�ֻ��㡰��㡱���¼���
��������Ч���������µ�¼����������Υ�������ҹ�����û���������
������ֱ��ɾ�������ѵ��û���������û���������Ȩ��ȫ����ȡ����
���û������߳������Һ󣬸��û����� 5 �����ڲ���ʹ�á�
���û�����������ÿͣ�� 1 ���ӣ�����ֵ������ 1 �֡�������ʱ��
������㡱���ܽ�����ֵ��������������߻�Ǳˮ��ʱ�������������
�������ľ���ֵ������롣
�������������üල���ƣ������а�������ӵ�и߼�Ȩ�޵����ѣ��Ĳ�
�������������������ˡ������������Ȳ������ᱻϵͳ�Զ���¼������
���κ��û������Բ鿴��Щ��¼������㷢��ĳЩ�����в���ƽ������
�������Ϊ�����վ�����Ի����ţ�վ��������Щ�������ʺŽ��н���
������á���Щ��¼ֻ���� 7 �졣
���������ҵ����Բ�֧�֡����Ļ������ܣ�����֧��������֤��������
����ʹ���Ѿ��ڱ�������ע����û�����������ʱ����������ע��ʱ��
��������ܽ��У��������Է�ֹ����ð�����ԡ���ʹ�á����Ļ�������
��ʱ�������Ծ�ֻ����ͶԷ����ܿ�����Ҫ���������Ļ��������ȵ�¼
�����������Һ󣬷��ɿ�����
�����������Һ���ῴ������������������ʾ��7/29/253�����ʾ��
���������ܿ�����������253��������29���Ǻ����йصģ���д�Ļ��
������д����ģ�����������7���ǡ����Ļ�����
�����Բ�ֻ�������30����������ݡ�
��������������Ѹ�����˽��Լ��������ڵ�¼��ġ�������Ϣ������
�����Լ��ĵ�ַ���������䡢��ҳ��ַ�����˼�飬�����ҵ���ϵ��
��ͬʱ�㻹�����ڡ����Ѳ�ѯ���в��ҶԷ��ĸ�����Ϣ��
������û�����������δ����ľ���ֵ���� 60 �֣���ϵͳ���Զ����
�����û�����Ϊ���û��������Ѿ����߶������ֱ������������С�����
����������Ҫ�����á���㡱����һ���Լ��ľ���ֵ��
����������Web ICQ�����ڸ����ߵ����ѷ��Ͷ���Ϣ��Ҳ���������ж�
���Է��Ƿ����������С���ֻ��Ҫʹ�á����С����ܣ����Է���һ��
����Ϣ��Ȼ�����Ϣ�б�������������������Ϣ��û�б�ȡ�ߣ���
����û�У���˵�����û��Ѿ������������У����������ǹ����������С�
����û�б���ȡ����Ϣ��ֻ���� 10 ���ӡ�
===============================================================
��<%=chatroomname%>
��<%=opendate%>
��END
</textarea>
</p>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width=100% border=0 cellspacing=0>
<tr>
<td>
<input type="text" name="user" readonly value="<%=user%>" size="35" style="background-color:E0E0E0">
</td>
<td>
<input type="text" name="sn" readonly value="SN:<%=sn%>" size="19" style="background-color:E0E0E0">
</td>
<td align="right">
<input type="text" name="copyright" readonly value="<%=copyright%>" size="22" style="background-color:E0E0E0">
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
