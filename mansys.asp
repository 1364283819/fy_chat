<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=230"%><html>
<head>
<title>ϵͳ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">��ϵͳ������</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">ˢ��</a></div>
<hr noshade size="1" color=009900>
<b>��ע�������</b><br>
�����������²���������Ӱ�쵽���������ҵ�����״̬�� 
<hr noshade size="1" color=009900>
<form name="form1" method="post" action="setsystemok.asp">
  <table border="1" align="center" cellpadding="8" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="F0F0F0">
    <tr align="center" bgcolor="#3399FF"> 
      <td><font color="#FFFFFF">�����Ŀ</font></td>
      <td><font color="#FFFFFF">ֵ</font></td>
    </tr>
    <tr> 
      <td align="right">���������ƣ�</td>
      <td> 
        <input type="text" name="s1" value="<%=Application("fy_c_chatroomname")%>" size="14" maxlength="14">
      </td>
    </tr>
    <tr> 
      <td align="right">���Ļ��������ƣ�</td>
      <td> 
        <input type="text" name="s2" value="<%=Application("fy_c_automanname")%>" size="10" maxlength="10">
        <a href="mansysautomansays.asp"> ���������˻��ԡ�</a></td>
    </tr>
    <tr> 
      <td align="right">�û�����ֹ�����ַ�����</td>
      <td> 
        <input type="text" name="s4" value="<%=Application("fy_c_disloginname")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">����������ʱ�Ĺ��棺</td>
      <td> 
        <input type="text" name="s5" value="<%=Application("fy_c_userinto")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">�˳�������ʱ�Ĺ��棺</td>
      <td> 
        <input type="text" name="s6" value="<%=Application("fy_c_userout")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">������(����)�˳��Ĺ��棺</td>
      <td> 
        <input type="text" name="s7" value="<%=Application("fy_c_userdown")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">������LOGOͼƬ��</td>
      <td><img src=<%=Application("fy_c_logo")%>><br>
        URL�� 
        <input type="text" name="s8" value="<%=Application("fy_c_logo")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">�����ҽ���ʱ�䣺</td>
      <td> 
        <input type="text" name="s9" value="<%=Application("fy_c_opendate")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">��Ŀǰϵͳ�ܷ�������</td>
      <td> 
        <input type="text" name="s10" value="<%=Application("fy_c_visitor")%>">
      </td>
    </tr>
    <tr> 
      <td align="right">����ͬʱ�����������</td>
      <td> 
        <input type="text" name="s11" value="<%=Application("fy_c_maxpeople")%>">
        ��</td>
    </tr>
    <tr> 
      <td align="right">�˳�ʱ���ص�URL��</td>
      <td> 
        <input type="text" name="s12" value="<%=Application("fy_c_homepageurl")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">��������(Ǳˮ)ʱ�䣺</td>
      <td> 
        <input type="text" name="s13" value="<%=Application("fy_c_maxtimeout")%>" size="10">
        ����</td>
    </tr>
    <tr> 
      <td align="right">���� IP ��ʱ�䳤�ȣ�</td>
      <td> 
        <input type="text" name="s14" value="<%=Application("fy_c_iplocktime")%>" size="10">
        ����</td>
    </tr>
    <tr> 
      <td align="right">�����ҹ��ţ�</td>
      <td> 
        <input type="text" name="s15" value="<%=Application("fy_c_closedoor")%>" size="10">
        ��<font color="#666666">(0Ϊ���ţ�1Ϊ����)</font></td>
    </tr>
    <tr> 
      <td align="right">��ֹͨ��������������ʣ�</td>
      <td> 
        <input type="text" name="s16" value="<%=Application("fy_c_disproxy")%>" size="10">
        <font color="#666666">(0Ϊ����1Ϊ��ֹ)</font></td>
    </tr>
    <tr> 
      <td align="right">��ֹ���û�����¼��</td>
      <td> 
        <input type="text" name="s17" value="<%=Application("fy_c_disnewuser")%>" size="10">
        ��<font color="#666666">(0Ϊ����1Ϊ��ֹ)</font></td>
    </tr>
    <tr> 
      <td align="right">�����ұ���ɫ��</td>
      <td>[<font color="<%=Application("fy_c_chatroombgcolor")%>">��</font>] 
        <input type="text" name="s19" value="<%=Application("fy_c_chatroombgcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">�����ұ���ͼƬ��</td>
      <td><img src=<%=Application("fy_c_chatroombgimage")%> width="204" height="90"><br>
        URL�� 
        <input type="text" name="s20" value="<%=Application("fy_c_chatroombgimage")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">���촰�ڱ���ɫ��</td>
      <td>[<font color="<%=Application("fy_c_chatbgcolor")%>">��</font>] 
        <input type="text" name="s21" value="<%=Application("fy_c_chatbgcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">���촰�ڱ���ͼƬ��</td>
      <td><img src=<%=Application("fy_c_chatimage")%> width="216" height="90"><br>
        URL�� 
        <input type="text" name="s22" value="<%=Application("fy_c_chatimage")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">�����ҶԻ�������ɫ��</td>
      <td>[<font color="<%=Application("fy_c_chatcolor")%>">��</font>] 
        <input type="text" name="s23" value="<%=Application("fy_c_chatcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">�����ұ���������ɫ��</td>
      <td>[<font color="<%=Application("fy_c_titlecolor")%>">��</font>] 
        <input type="text" name="s24" value="<%=Application("fy_c_titlecolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">1 ���� 2 �����辭��ֵ��</td>
      <td> 
        <input type="text" name="s25" value="<%=Application("fy_c_level1to2")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">2 ���� 3 �����辭��ֵ��</td>
      <td> 
        <input type="text" name="s26" value="<%=Application("fy_c_level2to3")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">3 ���� 4 �����辭��ֵ��</td>
      <td> 
        <input type="text" name="s27" value="<%=Application("fy_c_level3to4")%> " size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">4 ���� 5 �����辭��ֵ��</td>
      <td> 
        <input type="text" name="s28" value="<%=Application("fy_c_level4to5")%>" size="6">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="submit" name="Submit" value="�ύ">
        <input type="reset" name="Submit2" value="��ԭ">
      </td>
    </tr>
  </table>
</form>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "���кţ�<font color=blue>" & Application("fy_c_sn") & "</font>����Ȩ����<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
