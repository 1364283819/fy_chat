<%@ LANGUAGE=VBScript%>
<%
username=session("fy_u_nickname")
if username="" then Response.Redirect "chaterr.aps?id=001"
%>
<html><head><meta http-equiv='content-type' content='text/html; charset=gb2312'><title>������</title>
<style type='text/css'>
.webstyle   {font-family: Webdings; font-size: 8pt}
body{font-size:9pt;}input{font-size:9pt;}a{font-size:9pt;color:FFFF00;text-decoration:none;}a:hover{color:FFFF00;text-decoration:underline;}</style>
<script>
var winbgcolor = parent.cbg();
var winbgimage = parent.cbi();
document.writeln("<body bgcolor=" + winbgcolor + " background=" + winbgimage + " bgproperties=fixed topmargin=3>");
</script>
</head>
<div align=left>
<form name=af method=POST action='' target='d' onsubmit='return(checksays());'>
    <p> 
      <input type=hidden name='sy' value=''>
      <input type=hidden name='oldsays' value>
      <input type=hidden name='oldact' value>
      <input type=hidden name='oldtowho' value>
      ��: 
      <select name='addwordcolor' onChange="bs2(document.af.addwordcolor.value)" style='font-size:12px'>
        <option style="background-color:008888;color:008888" value="008888" selected>Ĭ��</option>
        <option style="background-color:000000;color:000000" value="000000">��ɫ</option>
        <option style="background-color:0088FF;color:0088FF" value="0088FF">����</option>
        <option style="background-color:0000FF;color:0000FF" value="0000FF">����</option>
        <option style="background-color:000088;color:000088" value="000088">����</option>
        <option style="background-color:888800;color:888800" value="888800">����</option>
        <option style="background-color:008888;color:008888" value="008888">����</option>
        <option style="background-color:008800;color:008800" value="008800">���</option>
        <option style="background-color:8888FF;color:8888FF" value="8888FF">����</option>
        <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">��ɫ</option>
        <option style="background-color:8800FF;color:8800FF" value="8800FF">����</option>
        <option style="background-color:888888;color:888888" value="888888">��ɫ</option>
        <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">����</option>
        <option style="background-color:FF8800;color:FF8800" value="FF8800">���</option>
        <option style="background-color:CC3366;color:CC3366" value="CC3366">����</option>
        <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">�Ϻ�</option>
        <option style="background-color:3366CC;color:3366CC" value="3366CC">����</option>
      </select>
      <input type=text name='username' readonly  style="text-align:center;font-size:12px;color:008888" size=9 maxlength=10>
      ˵: 
      <input type=text name='sytemp' onpaste='parent.clsay();' style='font-size: 9pt;border-style: solid; border-width: 1' size=40 maxlength=150>
      <a href="#" onclick="gop()" onMouseOver="window.status='�ڱ����10�䷢������ǰ������';return true" onMouseOut="window.status='';return true" title="��һ��"><<</a> 
      <a href="#" onclick="gon()" onMouseOver="window.status='�ڱ����10�䷢������󷭶���';return true" onMouseOut="window.status='';return true" title="��һ��">>></a> 
      <input type=submit name='subsay'  value='����' >
      <input type=button value='���' onClick="window.open('act.asp','f3')" >
      <input type=button value='��ͼ' onClick="window.open('webdings.asp','f3')" >
      <br>
      ��: 
      <select name='sayscolor' onChange="bs(document.af.sayscolor.value)" style='font-size:12px'>
        <option style="background-color:660099;color:660099" value="660099" selected>Ĭ��</option>
        <option style="background-color:000000;color:000000" value="000000">��ɫ</option>
        <option style="background-color:0088FF;color:0088FF" value="0088FF">����</option>
        <option style="background-color:0000FF;color:0000FF" value="0000FF">����</option>
        <option style="background-color:000088;color:000088" value="000088">����</option>
        <option style="background-color:888800;color:888800" value="888800">����</option>
        <option style="background-color:008888;color:008888" value="008888">����</option>
        <option style="background-color:008800;color:008800" value="008800">���</option>
        <option style="background-color:8888FF;color:8888FF" value="8888FF">����</option>
        <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">��ɫ</option>
        <option style="background-color:8800FF;color:8800FF" value="8800FF">����</option>
        <option style="background-color:888888;color:888888" value="888888">��ɫ</option>
        <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">����</option>
        <option style="background-color:FF8800;color:FF8800" value="FF8800">���</option>
        <option style="background-color:CC3366;color:CC3366" value="CC3366">����</option>
        <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">�Ϻ�</option>
        <option style="background-color:3366CC;color:3366CC" value="3366CC">����</option>
      </select>
      <input type=text name='towho' value="���" readonly  style="text-align:center;font-size:12px;color:660099" size=9 maxlength=10 onClick=dj()>
      <input type=checkbox name='towhoway' value='1' accesskey='s' onclick="document.af.sytemp.focus();">
      <a href='#' onMouseOver="window.status='ѡ�б����˵�Ļ�ֻ����ͶԷ����ܿ�������ʹ����Ҳ����������';return true" onMouseOut="window.status='';return true" onClick="document.af.towhoway.checked=!(document.af.towhoway.checked);document.af.sytemp.focus();" title="���Ļ�������˵">˽��</a> 
      <font color="#FFFFFF">����</font>  
      <select name='addsign' onchange="rc(this.value);" style='font-size:12px'><option value="0" selected style=color:blue>----</option><option value="//��������ڳ��������˴��к���">�к�</option><option value="//������˵����������û�в�ɢ����ϯ��������һ���ˣ���ұ��ء���">�뿪</option><option value="//���°�ĭ������һ�����Ե��ڵء�">�ε�</option><option value="//����ĬĬ��������ɰ������ǣ��ɰ��������������ڰ��ߣ��������޲�����">Ĭ��</option><option value="//����ͷ�㽵�������������ϰ����й��ʣ���û���ϰ�ܣ��ǲ�֪�����ж�á���">��</option><option value="//������������Ŀ���飬ֻ���ô���Ļ����ҡ�">����</option><option value="//���ֶ���������Զɽ��ֻ��������Ӣ��������˭��">Ӣ��</option><option value="//����ͷ����ȻһЦ��¶������ǳǳ�����У����ߵ�������������">����</option><option value="//����ӯ����˵�����ã��ã��ã���">ͬ��</option><option value="//��������������������֪�õ�˭�Ҳ䷹ȥ��......��">�䷹</option><option value="//˵�������ԹԲ����ˣ����µ��ϰ����ˣ�û�������ˡ��ؼ�����">�ϰ�</option><option value="//�������ȹ��ϵ����ϣ���ͣ�ش�У�����㣡��㣡��ô������������">̫��</option><option value="//һƨ�����ڵ��Ϸ��������">����</option><option value="//ü����Ц���룺�˶�˵�����ۣ����ǰ����˼һ᲻�ᣬ������......">����</option><option value="//���Ŵ����˵��Ц��ת�����磬�����������Щʲô��">����</option><option value="//���ž����������ݵ�������Թ�԰���������##��������࣡��">����</option><option value="//һ������ã����֪����Χ������ʲô�¡�">��ã</option><option value="" style=color:blue>----</option><option value="//����%%��У�����ӭ����ӭ�����һ�ӭ����" style=color:red>��ӭ</option><option value="//�������%%���к���������һ����ŨCoffee��һ������Ĳ裬�Լ�ѡŶ��" style=color:red>����</option><option value="//��һ����֦ͱ��ͱ%%�ı��ӣ�������ѽ�������ѡ���" style=color:red>����</option><option value="//����%%�������Ǻÿɰ�Ӵ��" style=color:red>�ɰ�</option><option value="//����%%�����룺���ڵ�Ů������������" style=color:red>����</option><option value="//������ŵ��ﵽ%%�����ͳ�һ�Ѵ��ӣ��ٺ�......" style=color:red>͵͵</option><option value="//����%%�ݺݵ�һ����ͷ���£�΢Ц������%%������ҷ���ȥ�ɣ���" style=color:red>����</option><option value="//����������һ�������%%��Ϊһ�ѻҽ���" style=color:red>�ҽ�</option><option value="//���Ͱ͵ظ�%%��Ǹ����ʵ���ǶԲ�ס�����´���Ҳ�����ˡ���" style=color:red>��Ǹ</option><option value="//��%%�������⣬��æץ��绰��114��119��120��122��96315 ... ���룺������������ô������ѽ����" style=color:red>����</option><option value="//��%%��а���Ц�ţ��˳�ͬʱ�뵽ʲô����ͷ�ϡ�" style=color:red>����</option><option value="//��%%С���ֹ��ţ������ӱ���ʮ�겻��������������㡣��" style=color:red>����</option><option value="//��������%%һ�ۣ�����һ�����߸ߵİ�ͷ�����������������㡭��" style=color:red>����</option><option value="//����%%͵͵ֱ�֣������ֻ����룺��á�" style=color:red>���</option><option value="//�ճյ�����%%����Ӱ���������ˡ���" style=color:red>�ճ�</option><option value="//Ц�Ǻǵض�%%��ȭ��Ҿ�����������´��������׹��������������������ң���" style=color:red>����</option><option value="//������%%��ͷ������%%�ԣ�һ�����������������" style=color:red>����</option><option value="//�������������%%��ת������ﲻ֪���ֹ�Щʲô��" style=color:red>��ת</option><option value="//��%%ҡҡʳָ����С���ѣ�����������ร���" style=color:red>����</option></select>
      <font color="#FFFFFF"> ����</font> 
      <select name='addsays' onchange="document.af.sytemp.focus();" style='font-size:12px'>
        <option value="" selected>----</option>
        <option value="΢΢Ц">΢Ц</option>
        <option value="�����">����</option>
        <option value="������">����</option>
        <option value="ҡͷ���Ե����">����</option>
        <option value="������������Ц��">��Ц</option>
        <option value="���������">����</option>
        <option value="սս������">ս��</option>
        <option value="ë��ë�ŵ�">ë��</option>
        <option value="������">���</option>
        <option value="����˹���">����</option>
        <option value="ͬ���">ͬ��</option>
        <option value="�����ֻ���">�ֻ�</option>
        <option value="��Ҫ�޵�">���</option>
        <option value="����">��</option>
        <option value="ȭ����ߵ�">ȭ��</option>
        <option value="���������">����</option>
        <option value="�ź���">�ź�</option>
        <option value="�ɴ����۾����ܲ����">����</option>
        <option value="�Ҹ���">�Ҹ�</option>
        <option value="���䵹���">����</option>
        <option value="��ʹ��">��ʹ</option>
        <option value="������Ȼ��">����</option>
        <option value="�����">����</option>
        <option value="������">����</option>
        <option value="������">����</option>
        <option value="ɵ������">ɵ</option>
        <option value="�������">����</option>
        <option value="�����޴��">�޴�</option>
        <option value="���޹���">�޹�</option>
        <option value="�������">����</option>
        <option value="��ݺݵص�����">����</option>
        <option value="��Ҫ�µ�">����</option>
        <option value="�޾���ɵ�">�޲�</option>
        <option value="���������">����</option>
        <option value="���°�ĭ">��ĭ</option>
        <option value="����������">����</option>
        <option value="�޿��κε�">����</option>
        <option value="���������">����</option>
      </select>
      <font color="#FFFFFF">ͼƬ</font> 
      <select name='tu' onChange="rc(this.value);" style='font-size:12px'>
        <option value="" selected>----</option>
        <option value="[tu]1[/tu]">Ц��</option>
        <option value="[tu]2[/tu]">����</option>
        <option value="[tu]3[/tu]">����</option>
        <option value="[tu]4[/tu]">����</option>
        <option value="[tu]5[/tu]">��ͷ</option>
        <option value="[tu]6[/tu]">����</option>
        <option value="[tu]7[/tu]">����</option>
        <option value="[tu]8[/tu]">��Ů</option>
        <option value="[tu]9[/tu]">����</option>
        <option value="[tu]10[/tu]">ȭͷ</option>
        <option value="[tu]11[/tu]">ը��</option>
        <option value="[tu]12[/tu]">ҧ��</option>
        <option value="[tu]13[/tu]">С��</option>
        <option value="[tu]14[/tu]">õ��</option>
        <option value="[tu]15[/tu]">����</option>
        <option value="[tu]16[/tu]">�绰</option>
      </select>
<input type="hidden" name="oldtitleline" value="0"'><input type="checkbox" name="titleline" value="1" accesskey='t' onClick="document.af.sytemp.focus();">
    <a href='#' onMouseOver="window.status='�������������������ҵ��û������С�';return true" onMouseOut="window.status='';return true" onclick="document.af.titleline.checked=!(document.af.titleline.checked);document.af.sytemp.focus();" title="�����������Ѳ���ʹ��">����</a>       
      <a onMouseOver="window.status='0Ϊ�����ˣ�1Ϊֻ��ʾ���Լ��ʹ��˵�Ļ���2Ϊֻ��ʾ���Լ�˵�Ļ���';return true" onMouseOut="window.status='';return true" title="ֻ��ʾ���Լ��йص����ݣ��ı����뷢�Բ�����Ч">����:</a> 
      <select name='sift' onChange="parent.setsift(this.value);document.af.sytemp.focus();" style='font-size:12px'>
        <option value="0" selected>0</option>
        <option value="1">1</option>
        <option value="2">2</option>
      </select>
      <font size="2" color="#FFFFFF"> 
      <input type=text name='clock' style="text-align:right;font-size:9pt;background-color:006600;color:FFFFFF;border: 1 double" value="" size=3 readonly>
      </font> 
    <div align="center">
<input type='checkbox' name='as' accesskey='a' checked onClick='parent.f1.scrollit();document.af.sytemp.focus();'>
<a href=# onClick='document.af.as.checked=!(document.af.as.checked);parent.f1.scrollit();document.af.sytemp.focus();' onMouseOver="window.status='�Զ����Ի������������Ϲ�����';return true" onMouseOut="window.status='';return true" title="������/��ֹ���Ի����Զ�����">����</a> 
<input type="checkbox" name="addvalues">
      <a href="#" title='�򿪴����ϵͳ��ʱ�Լ����ԣ��Լ���㣡������һ���ݣ�' onClick='document.af.addvalues.checked=!(document.af.addvalues.checked);document.af.sytemp.focus();'>�ݵ�</a> 
      <a href='setfontsize.asp' target=f3 onMouseOver="window.status='�ı�Ի�������İ�ֵ���оࡣ';return true" onMouseOut="window.status='';return true" title="�ı������С���о�"> 
      </a><b><a href='setfontsize.asp' target=f3 onMouseOver="window.status='�ı�Ի�������İ�ֵ���оࡣ';return true" onMouseOut="window.status='';return true" title="�ı������С���о�"> 
      </a></b> <font size="2" color="#FFFFFF"><a href='setfontsize.asp' target=f3 onMouseOver="window.status='�ı�Ի�������İ�ֵ���оࡣ';return true" onMouseOut="window.status='';return true" title="�ı������С���о�">����</a></font>
<input type='checkbox' name='oicq' accesskey='o' onClick='parent.oicqcheck();document.af.sytemp.focus();'>
      <a href='webicqreadf3.asp' target=f3 onMouseOver="window.status='���������ڵ������´����޷��̳�ԭ���ڵ�����ʱ��';return true" onMouseOut="window.status='';return true" title="��ȡ�Լ���WebICQ��Ϣ">WebICQ</a><font size="2" color="#FFFFFF"> 
<noscript>
      <input type='checkbox' name='refresh' checked accesskey='m' onClick='parent.refresh();document.af.sytemp.focus();'>
<a href='#' onMouseOver="window.status='ѡ�б�������ĵ��Խ�����Java��������������ӣ������ٶȽ�����������';return true" onMouseOut="window.status='';return true" onClick="document.af.refresh.checked=!(document.af.refresh.checked);parent.refresh();document.af.sytemp.focus();" title="����Java������������������ӣ�">Java</a>
</noscript>
<input type='checkbox' name='fc' accesskey='j' onClick='javascript:parent.facesel();document.af.sytemp.focus();'>
      <a href="face.asp" target=f3 onMouseOver="window.status='��ʾͷ��';return true" onMouseOut="window.status='';return true" title="������/��ֹ��ͷ����">ͷ��</a> 
      </font> 
      <script language="JavaScript">
function startnosay(){var nosay=<%=Application("fy_c_maxtimeout")*60%>;document.af.clock.value=nosay;}
</script>
<script src="readonly/f2.htm"></script>
<script>parent.rn();</script>
<div id="dh" style="position:absolute; left:-80px; top:-80px; width:0px; height:0px; z-index:1">
<input type="button" value="<" name='gopp' onClick="Javascript:gop();" accesskey=",">
<input type="button" value=">" name='gonn' onClick="Javascript:gon();" accesskey=".">
</div>
</div>
</form>
</div>
</body></html>