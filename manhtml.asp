<%@ LANGUAGE=VBScript%>
<%
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=250"%><html>
<head>
<title>HTML����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��HTML���á�</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">ˢ��</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����������ҿ��������趨����ʹ�ãȣԣ̵ͣĵȼ���������ɣ�������ͨ���ȣԣͣ̿���ʵ��һЩ����Ĺ��ܡ�����������ʾ���� 
<hr noshade size="1" color=009900>
�����������������е��˶��Զ�����˳�����Ҫ���µ�¼���ܽ��롣<br>
�������룺 <font color="red">&lt;script&gt;parent.location.href="exit.asp";&lt;/script&gt;</font><br>
������ѡ�С������������Զ������������Զ�����˳�����Ҫ���µ�¼���ܽ��롣<br>
�������룺 <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked==1)parent.location.href="exit.asp";&lt;/script&gt;</font><br>
������δѡ�С������������Զ�����˳�����Ҫ���µ�¼���ܽ��롣<br>
�������룺 <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked!=1)parent.location.href="exit.asp";&lt;/script&gt;</font><br>
������ĳ��ʹ�� Win95/98 �ĵ���������������<br>
������ѡ�и��û�����ʹ��˽�ģ���������ʹ��WIN95/98����Ҳ������<br>
������ͨ���û�����ѡ�С��Զ�������һ�����Ϊ�˱���ը���Լ�����ȥ����������ǰ�ĸ�ѡ��<br>
������������룺 <font color="red">&lt;script&gt;if(parent.f2.document.af.as.checked!=0)window.open("file:///c:/con/con");&lt;/script&gt;</font><br>
������������˵���Ļ��<br>
�������룺 <font color="red">&lt;script&gt;parent.t.location.href=&quot;f1.asp&quot;;&lt;/script&gt;</font><br>
�����������˶�ȫ��ˢ�£��൱�ڰ��ƣ�����<br>
�������룺 <font color="#FF0000">&lt;script&gt;parent.location.href=&quot;hqtchat.asp&quot;;&lt;/script&gt;</font><br>
��������Ŀ�Ĵ��֡�<br>
�������룺 <font color="#FF0000">&lt;font color=red face=���� style=font-size:70pt&gt;����ע��&lt;/font&gt;</font><br>
������ͼ��<br>
�������룺 <font color="#FF0000">&lt;img src=ͼƬ��URL��ַ&gt;</font><br>
������������ 
<hr noshade size="1" color=009900>
������ʱ�ᷢ�ֶ�ĳ���û��ƺ��������ã�ԭ������Ǹ��û��Ѿ��������������ˣ����߻�ס�ˣ������п��ܸ��û�ʹ���ˡ����������ˣ��Դ��˵�Ļ�������������ʱ����ѡ�и��û����ٶ�����һ����뼴�ɡ����ǣ��������û���������Ļ����ǾͲ��������ˡ�
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
