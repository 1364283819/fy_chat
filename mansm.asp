<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"%><html>
<head>
<title>����˵��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center"><h1><font color="0099FF">������˵����</font></h1>
<a href="javascript:history.go(0)">ˢ��</a> </div>
<hr noshade size="1" color=009900>
<b>�������Ϣ��</b>
<table border="0" align="center" cellpadding="5">
<tr> 
<td>�� �� ��:</td>
<td><font color=red><%=nickname%></font></td>
<td>IP��ַ:</td>
<td><font color=red><%=Request.ServerVariables("REMOTE_ADDR")%></font></td>
<td>�ȡ���:</td>
<td><font color=red><%=grade%> ��</font></td>
</tr>
<tr> 
<td>���ô���:</td>
<td><font color=red><%=Request.Cookies("fy_u_times")%> ��</font></td>
<td>�ۻ���:</td>
<td><font color=red><%=Session("fy_u_value")%> ��</font></td>
<td>�»���:</td>
<td><font color=red><%=Session("fy_u_mvalue")%> ��</font></td>
</tr>
</table>
<hr noshade size="1" color=009900>
<b>��ע�������</b> <br>
������ ��������� 30 ��û�����������ң���ע����û�������ɾ�����û�����ɾ�������ô��û���¼������Ϊ���û��Դ�������������ֵ����� 30 �����޷�����¼�ģ�������վ���������ñ�������û����������ñ������û�������¼���ڻ�ӭҳ����Կ����Լ����û���ǰ����һ����<a title='���ñ���'><font color='blue' face='Wingdings' style='font-size:12pt;cursor:"hand"'>&lt;</font></a>����������Щֻ�ù�һ�ε��û�����ֻ���� 7 �졣<br>
������ �������ҵİ���ָ 6 ������Ȩ�޵����ѡ�ϵͳ�Զ����ݾ���ֵ�����û��������������ֻ������ 5 ����6 ������Ȩ�ޱ�����վ���ֹ����䡣<br>
������ �������ҡ����񹫿�������Ϊ�˶԰�������ӵ�и߼�Ȩ�޵��û������мල����ֹ��������ְȨ���������Ѷ԰�������Ϊ���мල����١�һ����ʵ�����ǽ����������Щ�������н���ֱ�����á�ɾ�����ʺš�
<hr noshade size="1" color=009900>
<b>��Ȩ��˵����</b><br>
��1 ������ͨ���ѣ����ܸı������ҵı��⣬����ʹ����ͼ��<br>
��2 ��������ʹ�ñ��⼰��ͼ���ܡ�<br>
��3 �������������м����Դ��Ķ��������ɲ鿴���ѽ���ʱ�䡣<br>
��4 �������Կ������ѵ�1/2���ȵ�IP���������ж೤ʱ��δ����ľ���ֵ��<br>
��5 �������������Ѳ�ѯ�в�ѯ�κ����ѵĵȼ����ɿ�IP��ַ��ǰ���Ρ�<br>
��6 �����������ˣ����߳����û�����5�������޷�ʹ�á�<br>
��7 �������Ը������������������ 5 �����ɿ���������IP��<br>
��8 �������Ը�����Υ�͵����ѽ�������ͽ��� 1 �������ɷ��� IP��<br>
��9 �������Թ������Բ�����ը���� 
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
