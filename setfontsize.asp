<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "chaterr.asp"
useronlinename=Application("fy_c_useronlinename")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(useronlinename," "&nickname&" ")=0 then Response.Redirect "chaterr.asp?id=001"
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<script Language="JavaScript">function chgfontsize(fontsize){parent.f0.document.body.style.fontSize=fontsize+"pt";parent.f1.document.body.style.fontSize=fontsize+"pt";}function chglineheight(lineheight){parent.f0.document.body.style.bgColor="ffffff";parent.f0.document.body.style.lineHeight=lineheight+"%";parent.f1.document.body.style.lineHeight=lineheight+"%";}function chgbgcolor(bgcolor){parent.f0.document.bgColor=bgcolor;parent.f1.document.bgColor=bgcolor;}</script>
<head>
<title>�����ֺż��о�</title>
<meta http-equiv='content-type' content='text/html; charset=gb2312'>
<link rel="stylesheet" href="READONLY/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<div align=center>
<table width="100%" border="0" height="100%">
<tr>
<td>
<table border="1" bgcolor="E0E0E0" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" cellpadding="4">
<form method="post" action="javascript:setfs()" name="">
<tr>
<td>
<div align=center>
<p><font color="#FF0000" style="font-size:12pt">�ֺż��о�</font></p>
                  <p>��ѡ��������Ҫ�������Сֵ���Ի������о�ֵ���������ұ���ɫ</p>
                  <p>�ֺź�<br>
                    <select name="ftsz" onchange="javascript:chgfontsize(this.value)">
                      <option value="9">9 ��</option>
                      <option value="9.5">9.5 ��</option>
                      <option value="10">10 ��</option>
                      <option value="10.5" selected>10.5 ��</option>
                      <option value="11">11 ��</option>
                      <option value="11.5">11.5 ��</option>
                      <option value="12">12 ��</option>
                      <option value="12.5">12.5 ��</option>
                      <option value="13">13 ��</option>
                      <option value="13.5">13.5 ��</option>
                      <option value="14">14 ��</option>
                      <option value="14.5">14.5 ��</option>
                      <option value="15">15 ��</option>
                      <option value="15.5">15.5 ��</option>
                      <option value="16">16 ��</option>
                    </select>
                  </p>
                  <p>�м��<br>
                    <select name="lheight" onchange="javascript:chglineheight(this.value)">
                      <option value="120">������%</option>
                      <option value="125" selected>������%</option>
                      <option value="130">������%</option>
                      <option value="135">������%</option>
                      <option value="140">������%</option>
                      <option value="145">������%</option>
                      <option value="150">������%</option>
                      <option value="155">������%</option>
                      <option value="160">������%</option>
                      <option value="165">������%</option>
                      <option value="170">������%</option>
                      <option value="175">������%</option>
                      <option value="180">������%</option>
                      <option value="185">������%</option>
                      <option value="190">������%</option>
                      <option value="195">������%</option>
                      <option value="200">������%</option>
                      <option value="205">������%</option>
                      <option value="210">������%</option>
                      <option value="215">������%</option>
                      <option value="220">������%</option>
                      <option value="225">������%</option>
                      <option value="230">������%</option>
                      <option value="235">������%</option>
                      <option value="240">������%</option>
                      <option value="245">������%</option>
                    </select>
                    <br>
                    <br>
                    ����ɫ<br>
                    <select name="bgcolor" onChange="javascript:chgbgcolor(this.value);">
                      <option value="#FFFFFF" style='background:#FFFFFF;color=#FFFFFF' selected> 
                      ����ɫ��</option>
                      <option value="#C8C8FF" style='background:#C8C8FF;color=#C8C8FF'> 
                      ����ɫ��</option>
                      <option value="#FFFFCC" style='background:#FFFFCC;color=#FFFFCC'> 
                      ����ɫ��</option>
                      <option value="#F4F4FF" style='background:#F4F4FF;color=#F4F4FF'> 
                      ����ɫ��</option>
                      <option value="#33FFFF" style='background:#33FFFF;color=#33FFFF'> 
                      ����ɫ��</option>
                      <option value="#FFF4F4" style='background:#FFF4F4;color=#FFF4F4'> 
                      ����ɫ��</option>
                      <option value="#F4FFF4" style='background:#F4FFF4;color=#F4FFF4'> 
                      ����ɫ��</option>
                      <option value="#F4F4FF" style='background:#F4F4FF;color=#F4F4FF'> 
                      ����ɫ��</option>
                      <option value="#EEEEEE" style='background:#EEEEEE;color=#EEEEEE'> 
                      ����ɫ��</option>
                    </select>
                  </p>
                  </div>
</td>
</tr>
</form>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>