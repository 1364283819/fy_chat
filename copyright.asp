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
                        <td align="center" bgcolor="#cccccc" width="16%"><font color=white><a href="loginsm.asp"><font color="#000000">��¼˵��</font></a></font></td>
<td width="16%" align="center" bgcolor="#CCCCCC"><a href=logingb.asp><font color=black>�� �� ��</font></a></td>
                        <td width="16%" align="center" bgcolor="#000000"><font color="#FFFFFF">��Ȩ����</font></td>
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
                     ��    ��    ˵    ��
---------------------------------------------------------------
�� ֻ��ʹ�� Internet Explorer 4.0 ���ϰ汾���ܻ�����Ч��
�� ǿ���Ƽ�ʹ�� Internet Explorer 5.5��

���������ҽ���ɲ��ִ�����ú�����������3.0��,ԭʼ��ȨΪ�����
  �������ͬ,��������������Ҫ��ȡ���ͷ�����ȫ����д,����:����
  �����ҹ�www.21jm.net��
���������Ҳ���ȫ�����������·���II�ķ��Ի���,���з����ٶȿ�,ռ
  ��ϵͳ��Դ�͵��ص㡣
���������Ҳ�������ˢ�·���,һ����ԭʼ�Ŀ��ˢ�·�ʽ,һ����Java
  ˢ�·�ʽ��
��������������ͷ���ܡ�
����������ȫ���Ľ�����,����,����ˢ��,����ˢ��.�ڲ�Ӱ�찲ȫ����
  ��,�������Բ�����Cookie��ʵ��,ȥ���˴�����Session,����ˢ��ȫ
  �Զ�ʵ��,�������������µ���ʾ��ʽ,ҳ�澲ֹ,��ˢ�¸���!������
  Ҳһ��ʵ����ˢ�·�ʽ��ʾ
���Ľ���½���,��ֹ����̽���û����롣
���Ľ���̨����ʽ,ȥ�������ظ����ļ���
���Ľ����ݿ�ṹ��
�������ݵ㹦�ܡ�
��˫����/ͣ����ʽ��
�����öԻ����Ի���Ӱ��ʾ��ʽ��
����������ȫ�ǺͰ��ͬʱ�������ҵ�Bug��
===============================================================
����������:���
��2002��8��1��
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
