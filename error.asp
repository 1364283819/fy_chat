<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
id=Trim(Request.QueryString("id"))
chatroombgimage=Application("fy_c_chatroombgimage")
chatroombgcolor=Application("fy_c_chatroombgcolor")
Select Case id
Case "000"
 nl="�Բ��𣬳�������Ŀ¼��������Ŀ¼���������д���Global.asa û�б�ִ�С���������Ҫ����Ŀ¼��֧�֣�"
Case "004"
 nl="�����Ѿ����ڣ�����������ϵ��"
Case "002"
nl="�Բ��𣬱�����������̨�����������У�������Ǳ�����ĺϷ��û��������������ߣ������ʿ��ϵ��<br>�������䣺<a href='mailto:hqtchat@126.com?subject=���֡���������̨�����������е���ʾ��'>hqtchat@126.com</a><br>����OICQ��95001"
Case "003"
 nl="���ݿ���δ�򿪣�������վ����������ѹ�����ݿ⣬���Ժ�������"
Case "010"
 nl="�Բ��𣬱�����ר����� Internet Explorer 4.0 ���ϰ汾���������������ʹ�� IE ����������ʡ�"
Case "011"
 nl="�Բ�������ͨ����������������ʱ�վ��"
Case "100"
 nl="��ӭ���Ĺ��٣�ֻ��վ���Ѿ��ر��������ҵĵ�¼���ܣ����ڲ��ܽ��е�¼�����Ժ�������"
Case "101"
 nl="��ӭ���Ĺ��٣�����������������վ���������ͬʱ��������Ϊ <font color=red>" & Application("fy_c_maxpeople") & "</font> �ˣ����Ժ�������"
Case "102"
 nl="վ����ֹ���û�����¼�����Ժ�������"
Case "110"
 nl="�����ڵ� IP��<font color=red>" & Request.ServerVariables("REMOTE_ADDR") & "</font> ������ " & Application("fy_c_iplocktime") & " ���ӣ����ܽ��������ҡ�<br>�������Զ�����ʱ�仹�У�<font color=red>" & ABS(int(Application("fy_c_iplocktime"))-int(Datediff("s",Request.QueryString("lockdate"),now())/60)) & "</font> ���ӡ�"
Case "111"
 nl="�����ڵ� IP��<font color=red>" & Request.ServerVariables("REMOTE_ADDR") & "</font> ��<font color=red>�����á�</font>���������ܽ��������ҡ�����վ����ϵ��"
Case "120"
 nl="�û������зǷ��ַ���ֻ��ʹ�����ġ�Ӣ����ĸ�����֣����ܴ��ո񣩡�"
Case "121"
 nl="���뺬�зǷ��ַ���ֻ��ʹ��Ӣ����ĸ�����֣����ܴ��ո񣩡�"
Case "122"
 nl="��ν���зǷ��ַ���ֻ��ʹ�����ġ�Ӣ����ĸ�����֣����ܴ��ո񣩡�"
Case "123"
 nl="�����뺬�зǷ��ַ���ֻ��ʹ��Ӣ����ĸ�����֣����ܴ��ո񣩡�"
Case "124"
 nl="ȷ�����뺬�зǷ��ַ���ֻ��ʹ��Ӣ����ĸ�����֣����ܴ��ո񣩡�"
Case "125"
 nl="�û����ĳ��ȳ��� 10 ���ַ���һ������ռ�����ַ�����"
Case "126"
 nl="��ν�ĳ��ȳ��� 4 ���ַ���һ������ռ�����ַ�����"
Case "127"
 nl="�û�������Ϊ�ա�"
Case "128"
 nl="���벻��Ϊ�ա�"
Case "129"
 nl="���벻�ܺ��û�����ͬ��"
Case "130"
 nl="�Բ��𣬸��û���Ϊϵͳ��������������ʹ��������ֵ�¼��"
Case "131"
 nl="�Բ��𣬸��û������в������ۣ�������ʹ��������ֵ�¼��"
Case "132"
 nl="�Բ��𣬳�ν���в������ۣ�������ʹ�������ν��¼��"
Case "140"
 nl="�Բ��𣬸��û�������ʹ���У��������������Ҫ�Ĳ�����<br>������������״�ʹ�ø��û�����¼��������Ǹ��û����Ѿ�����������ע�ˣ���ֻ�ܻ����������ֵ�¼��<br>�����������ǰ����ʹ�ù����û�����¼�ɹ���������������û����������˵��á�<br>������һ�ֿ����ǣ���û�������˳������ң��磺���ߡ���ʱ��������Ͽ����ӵȣ��������û����������������У��������ر�����������������´򿪣���������Ӻ�������¼�����ʵ�ڲ��У��뵽���Բ����������ԣ������Ϊ�������"
Case "141"
 nl="�Բ����������ע�⣺�������ִ�Сд�����������������Ҫ�Ĳ�����<br>������������״�ʹ�ø��û�����¼��������Ǹ��û����Ѿ�����������ע�ˣ���ֻ�ܻ����������ֵ�¼��<br>�����������ǰ����ʹ�ù����û�����¼�ɹ���������������û����������˵��ã����ҵ����߸��������롣���������������뵽���Բ����������ԣ������Ϊ�������"
Case "142"
 nl="�Բ��𣬸��û��������ã��뵽���Բ����������ԣ������Ϊ�������"
Case "143"
 nl="�Բ��𣬸��û������߳������ң�5 �����ڲ���ʹ�ø��û�����¼������ <font color=red>" & ABS(300-Datediff("s",Request.QueryString("lastkick"),now())) & "</font> �롣"
Case "150"
 nl="�Բ��𣬸��û�����δ��ע�ᣬ��Ȼ�����޸������ˡ�"
Case "151"
 nl="�Բ�����û��ָ���������롱����ô�޸������أ�"
Case "152"
 nl="�������롱���������ȫ��ͬ���ò������޸���������"
Case "153"
 nl="�������롱�������û�����ͬ��"
Case "160"
 nl="�Բ��𣬸��û�����δ��ע�ᣬ��Ȼ���ܡ���ɱ���ˡ�"
Case "161"
 nl="��ȷ�����롱Ϊ�գ�����ִ����ɱ������"
Case "162"
 nl="��ȷ�����롱�롰���롱��һ�£�����ִ����ɱ������"
Case "163"
 nl="���û��������ñ���������ִ����ɱ������"
Case "001"
 nl="�ó���ִ���˷Ƿ�������������ֹͣʹ�ã�����������𲻿�Ԥ��ĺ���������������ߣ������ʿȡ����ϵ��<br>�������䣺<a href='mailto:hqtchat@126.com?subject=�����ҳ���ִ���˷Ƿ�����'>hqtchat@126.com</a><br>����OICQ��95001"
Case "200"
 nl="û�д���ɹ���ʾ���������ݣ����ܲ鿴��"
Case "201"
 nl="û�д���ɹ���ʾ�����ݣ����ܲ鿴��"
Case "210"
 nl="����δ��¼�����Ѿ���ʱ�Ͽ������ӣ������µ�¼��"
Case "220"
 nl="�����Ժη������зǷ��ַ���Ҳ����ʹ��HTML�﷨��"
Case "221"
 nl="��E-Mail����ַ���зǷ��ַ���Ҳ����ʹ��HTML�﷨��"
Case "222"
 nl="����ҳ��ַ�����зǷ��ַ���Ҳ����ʹ��HTML�﷨��"
Case "223"
 nl="�����Ժη������ȳ���30�ַ���1������ռ2�ַ���"
Case "224"
 nl="��E-mail�����ȳ���50�ַ���"
Case "225"
 nl="����ҳ��ַ�����ȳ���50�ַ� ��"
Case "226"
 nl="�����˼�顱���ȳ���200�ַ� ��"
Case "227"
 nl="��E-mail����ַ��ʽ����"
Case "228"
 nl="����ҳ��ַ����ʽ���� ��"
Case "229"
 nl="�û��������ڣ������޸ĸ�����Ϣ��"
Case "230"
 nl="������Ҫ��ѯ���û�����"
Case "231"
 nl="�û�����<font color=red>" & Request.QueryString("name") & "</font> �����ڡ�"
Case "240"
 nl="�ؼ���Ϊ�գ�����������"
Case "250"
 nl="���С���ɫ������Ŀ��Ϊ������Ŀ������д������"
Case "251"
 nl="�û�����<font color=red>" & Request.QueryString("name") & "</font> �����ڣ�����ʹ�á����Ļ�����ʽ��"
Case "252"
 nl="����Ϊ�գ�����ʹ���û�����<font color=red>" & Request.QueryString("name") & "</font> �������ԡ�"
Case "253"
 nl="������󣬲���ʹ���û�����<font color=red>" & Request.QueryString("name") & "</font> �������ԡ�"
Case "254"
 nl="��д�����ĳ��ȳ���20���ַ���1������=2���ַ�����"
Case "255"
 nl="�����⡱�ĳ��ȳ���40���ַ���1������=2���ַ�����"
Case "256"
 nl="�����ݡ��ĳ��ȳ���1024���֡�"
Case "257"
 nl="���������ĳ��ȳ���20���ַ���1������=2���ַ�����"
Case "258"
 nl="����ַ���ĳ��ȳ���20���ַ���1������=2���ַ�����"
Case "259"
 nl="�����䡱�ĳ��ȳ���50���ַ���1������=2���ַ�����"
Case "260"
 nl="����ҳ���ơ��ĳ��ȳ���24���ַ���1������=2���ַ�����"
Case "261"
 nl="����ҳ��ַ���ĳ��ȳ���50���ַ���"
Case "262"
 nl="�����䡱�ĸ�ʽ����"
Case "263"
 nl="����ҳ��ַ���ĸ�ʽ����"
Case "264"
 nl="���ԡ����ݡ��в��ܳ��������Ŀհ��С�"
Case "265"
 nl="�����ظ�ճ����ͬ�����ԡ�"
Case "266"
 nl="�����⡱���ܰ�����ǵġ�" & chr(34) & "����'�����š�"
Case "300"
 nl="���û����Ѿ����������У������ظ����롣"
Case "301"
 nl="�����ԡ������ҹ���Ա�������ƽ����������У����ػص�¼ҳ�滻����¼��"
Case "400"
 nl="����<font color=red>" & Request.QueryString("name") & "</font> �����������У����ܷ�����Ϣ��"
Case "401"
 nl="��Ϣ�ĳ��ȱ���С�� 1024 ���ַ���"
Case "402"
 nl="��Ϣ�в��ܳ��������Ŀհ��С�"
Case "403"
 nl="��Ϣ����Ϊ�ա�"
Case "410"
 nl="����<font color=red>" & Request.QueryString("name") & "</font> �����������У�����Ϊ���衣"
Case "420"
 nl="�Բ�����Ҫע������ֺͻ�����ͬ����"
Case "421"
 nl="�Բ�����Ҫע������ֺͻ�����ͬ����"
Case "422"
 nl="�Բ����û������ִ�Сд��ȫ�ǰ�ǡ�"
Case "423"
nl="�Բ��𣺲�������ͬһʱ����ע���û����������ע���µ��û���,��ر����������ע��!"
Case else
 nl="���󣺰�Ȩ��Ϣ��������ջ�����������"
End Select
nl="<p>����" & nl & "</p>"%><html>
<head>
<title>������ʾ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor=<%=chatroombgcolor%> background=<%=chatroombgimage%> leftmargin="0" topmargin="0">
<table width="100%" border="0" height="100%">
<tr align="center"> 
<td>
<form method="post" action="">
<table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" bgcolor="E0E0E0">
<tr>
<td>
<table border="0" bgcolor="#FF0099" cellspacing="0" cellpadding="2" width="350">
<tr>
<td width="342"><font color="FFFFFF">�������ʾ</font></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="javascript:history.go(-1)" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�ر�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
<td width="59" align="center" valign="top"><font face="Wingdings" color="#FF0000" style="font-size:32pt">L</font></td>
<td width="269">
<%=nl%>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<input type="button" name="ok" value="��ȷ ����" onclick=javascript:history.go(-1)>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<script Language="JavaScript">
document.forms[0].ok.focus();
</script>
</body>
</html>
