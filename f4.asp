<%@ LANGUAGE=VBScript%>
<%
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>�˵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type='text/css'>
body{font-size:9pt;}
td{font-size:9pt;}
input{font-size:9pt;}
a{font-size:9pt; color:black;text-decoration:none;}
a:hover{color:red;text-decoration:none;}
</style>
<script Language="Javascript">
exit="exitchat.asp";
if(parent.document.URL.indexOf("file:")>=0||parent.f2.document.URL.indexOf("file:")>=0){parent.location.href='chaterr.asp?id=001';}function showname(){if(parent.m.location.href=="about:blank"){parent.m.location.href="f3.asp";}else{parent.m.location.reload();}}
function ex(){
if(confirm("�����Ҫ�˳������ң�")){parent.t.location.href='about:blank';setTimeout('top.location.href=exit',500);return true;
}}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<table width="100%" border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#CCCCCC" cellpadding="2">
<tr align="center"> 
<td><a href="savevalue.asp" onMouseOver="window.status='�������澭��ֵ������ʾ��ǰ״̬��';return true" onMouseOut="window.status='';return true" target="f3">���</a></td>
<td><a href="#" onMouseOver="window.status='����������������������';return true" onMouseOut="window.status='';return true" onclick="javascript:showname();">����</a></td>
<td><a href="mask.asp" onMouseOver="window.status='����ʾĳЩ���ѵķ��ԡ�';return true" onMouseOut="window.status='';return true" target="f3">����</a></td>
</tr>
<tr align="center"> 
<td><a href="#" onMouseOver="window.status='���÷������ܡ�';return true" onMouseOut="window.status='';return true" onclick="javascript:parent.tbclutch();">����</a></td>
<td><a href="song.asp" onMouseOver="window.status='�����Լ����������ѡ�';return true" onMouseOut="window.status='';return true" target="f3">���</a></td>
<td><a href="#" onMouseOver="window.status='���� Web ICQ ��Ϣ��';return true" onMouseOut="window.status='';return true" onclick="javascript:window.open('webicq.asp','hqtwebicq','width=380,height=320')">����</a></td>
</tr>
<tr align="center"> 
<td><a href="#" onclick="javascript:parent.qp()" onMouseOver="window.status='����Ի��������жԻ���';return true" onMouseOut="window.status='';return true">����</a></td>
<td><a href="manage.asp" onMouseOver="window.status='���������ҹ�������';return true" onMouseOut="window.status='';return true" target="_blank">����</td>
<td><a href="#" onMouseOver="window.status='�˳������ң����Զ����澭��ֵ��';return true" onMouseOut="window.status='';return true" onclick="javascript:ex()">�뿪</a></td>
</tr>
</table>
</body>
</html>
