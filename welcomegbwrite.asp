<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
towho=Trim(Request.QueryString("towho"))
title=Replace(Trim(Request.QueryString("title")),chr(34),"'")
if title<>"" then title="Re:"&title%><html>
<head>
<title>��д����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script language="JavaScript">
function check(){if(document.forms[0].title.value==""||document.forms[0].intro.value==""||document.forms[0].fromwho.value==""){alert("�뽫��ɫ��Ŀ��д������");return false;}document.forms[0].Submit.disabled=1;return true;}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="welcomegbwrok.asp" onsubmit='return(check());'>
<tr align="center">
<td> 
<table width="100%" border="0">
<tr> 
<td><a title="�������������д��˭�����ڴ˴���д�Է������ƣ�����<=20�ַ���(һ������ռ�����ַ��Ŀ��)">д����</a></td>
<td> 
<input type="text" name="towho" maxlength="20" value=<%=towho%>>
<input type="checkbox" name="mm" value="1"><a title="ѡ�д���������ֻ����ͶԷ����ܿ�����">���Ļ�</a></td>
</tr>
<tr> 
<td><a title="�����Ե�����˼�룬<=40�ַ���"><font color="#FF0000">���⣺</font></a></td>
<td> 
<input type="text" name="title" size="32" maxlength="40" value="<%=title%>">
</td>
</tr>
<tr>
<td><font color="#FF0000">���ݣ�</font><br><=1024</td>
<td>
<textarea name="intro" cols="40" rows="8"></textarea>
</td>
</tr>
</table>
������Ϣ
<table width="100%" border="0">
<tr> 
<td><a title="��д���������<=20�ַ���"><font color="#FF0000">������</font></a></td>
<td> 
<input type="text" name="fromwho" maxlength="20" value=<%=nickname%>>
<a title="Ϊ��ֹ����ð�����ԣ��������ǰһ����ʹ�õ��������Ѿ�ע���������������������룬�������ԡ�"><font color="#FF0000">���룺</font></a>
<input type="password" name="pass" size="10" maxlength="10">
</td>
</tr>
<tr> 
<td><a title="��Ȼ����д�����ڵ�ʡ���ˣ�<=20�ַ�">��ַ��</a></td>
<td> 
<input type="text" name="address" maxlength="20">
<input type="checkbox" name="hideip" value="1"><a title="ѡ�д�������IP������ʾ�����Բ��С�">�����ҵ�IP</a></td>
</tr>
<tr> 
<td><a title="��д��� E-mail ��ַ��<=50�ַ���">���䣺</a></td>
<td> 
<input type="text" name="email" maxlength="50">
</td>
</tr>
<tr> 
<td>��ҳ��</td>
<td><a title="�����Ҷ�����ƣ�<=24�ַ�">����</a><input type="text" name="homename" size="32" maxlength="24">
<br>
<a title="�����Ҷ�ĵ�ַ��<=50�ַ�">��ַ</a><input type="text" name="homeurl" value="http://" size="32" maxlength="50">
</td>
</tr>
<tr align="center"> 
<td colspan="2">
<input type="submit" name="Submit" value="�ύ����">
<input type="reset" value="��д">
<input type="button" value="����" onclick="javascript:history.go(-1)">
<input type="button" value="�鿴����" onclick="javascript:document.location.href='welcomegbview.asp?show=0&page=1'">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
<table width="300" border="0" align="center" cellpadding="6">
<tr>
<td>
<br>
<p><font color="#FF0000">˵����</font><br>
�����ϱ��к�ɫ����ĿΪ������Ŀ��������Ƶ�����������ͣ�������ɿ�����д˵����<br>
����1������ = 2���ַ���</p>
</td>
</tr>
</table>
</body>
</html>
