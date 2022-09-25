<%@ LANGUAGE=VBScript%>
<%
username=session("fy_u_nickname")
if username="" then Response.Redirect "chaterr.aps?id=001"
%>
<html><head><meta http-equiv='content-type' content='text/html; charset=gb2312'><title>发言区</title>
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
      名: 
      <select name='addwordcolor' onChange="bs2(document.af.addwordcolor.value)" style='font-size:12px'>
        <option style="background-color:008888;color:008888" value="008888" selected>默认</option>
        <option style="background-color:000000;color:000000" value="000000">黑色</option>
        <option style="background-color:0088FF;color:0088FF" value="0088FF">海蓝</option>
        <option style="background-color:0000FF;color:0000FF" value="0000FF">亮蓝</option>
        <option style="background-color:000088;color:000088" value="000088">深蓝</option>
        <option style="background-color:888800;color:888800" value="888800">黄绿</option>
        <option style="background-color:008888;color:008888" value="008888">蓝绿</option>
        <option style="background-color:008800;color:008800" value="008800">橄榄</option>
        <option style="background-color:8888FF;color:8888FF" value="8888FF">淡紫</option>
        <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">紫色</option>
        <option style="background-color:8800FF;color:8800FF" value="8800FF">蓝紫</option>
        <option style="background-color:888888;color:888888" value="888888">灰色</option>
        <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">土黄</option>
        <option style="background-color:FF8800;color:FF8800" value="FF8800">金黄</option>
        <option style="background-color:CC3366;color:CC3366" value="CC3366">暗红</option>
        <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">紫红</option>
        <option style="background-color:3366CC;color:3366CC" value="3366CC">蓝黑</option>
      </select>
      <input type=text name='username' readonly  style="text-align:center;font-size:12px;color:008888" size=9 maxlength=10>
      说: 
      <input type=text name='sytemp' onpaste='parent.clsay();' style='font-size: 9pt;border-style: solid; border-width: 1' size=40 maxlength=150>
      <a href="#" onclick="gop()" onMouseOver="window.status='在保存的10句发言中向前翻动。';return true" onMouseOut="window.status='';return true" title="上一句"><<</a> 
      <a href="#" onclick="gon()" onMouseOver="window.status='在保存的10句发言中向后翻动。';return true" onMouseOut="window.status='';return true" title="下一句">>></a> 
      <input type=submit name='subsay'  value='发言' >
      <input type=button value='酷库' onClick="window.open('act.asp','f3')" >
      <input type=button value='贴图' onClick="window.open('webdings.asp','f3')" >
      <br>
      话: 
      <select name='sayscolor' onChange="bs(document.af.sayscolor.value)" style='font-size:12px'>
        <option style="background-color:660099;color:660099" value="660099" selected>默认</option>
        <option style="background-color:000000;color:000000" value="000000">黑色</option>
        <option style="background-color:0088FF;color:0088FF" value="0088FF">海蓝</option>
        <option style="background-color:0000FF;color:0000FF" value="0000FF">亮蓝</option>
        <option style="background-color:000088;color:000088" value="000088">深蓝</option>
        <option style="background-color:888800;color:888800" value="888800">黄绿</option>
        <option style="background-color:008888;color:008888" value="008888">蓝绿</option>
        <option style="background-color:008800;color:008800" value="008800">橄榄</option>
        <option style="background-color:8888FF;color:8888FF" value="8888FF">淡紫</option>
        <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">紫色</option>
        <option style="background-color:8800FF;color:8800FF" value="8800FF">蓝紫</option>
        <option style="background-color:888888;color:888888" value="888888">灰色</option>
        <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">土黄</option>
        <option style="background-color:FF8800;color:FF8800" value="FF8800">金黄</option>
        <option style="background-color:CC3366;color:CC3366" value="CC3366">暗红</option>
        <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">紫红</option>
        <option style="background-color:3366CC;color:3366CC" value="3366CC">蓝黑</option>
      </select>
      <input type=text name='towho' value="大家" readonly  style="text-align:center;font-size:12px;color:660099" size=9 maxlength=10 onClick=dj()>
      <input type=checkbox name='towhoway' value='1' accesskey='s' onclick="document.af.sytemp.focus();">
      <a href='#' onMouseOver="window.status='选中本项后，说的话只有你和对方才能看到（即使版主也看不到）。';return true" onMouseOut="window.status='';return true" onClick="document.af.towhoway.checked=!(document.af.towhoway.checked);document.af.sytemp.focus();" title="悄悄话儿悄悄说">私聊</a> 
      <font color="#FFFFFF">动作</font>  
      <select name='addsign' onchange="rc(this.value);" style='font-size:12px'><option value="0" selected style=color:blue>----</option><option value="//热情地向在场的所有人打招呼。">招呼</option><option value="//留恋地说道：“世上没有不散的宴席，我先走一步了，大家保重。”">离开</option><option value="//口吐白沫，咕咚一声，栽倒在地。">晕倒</option><option value="//心中默默念道：“由爱故生忧，由爱故生怖；若离于爱者，无忧亦无怖。”">默念</option><option value="//歪着头憧憬地向往：“如果上班又有工资，又没有老板管，那不知道该有多好。”">憧憬</option><option value="//俏脸生春，妙目含情，只看得大家心慌意乱。">含情</option><option value="//负手而立，凝望远山。只觉得天下英雄舍我其谁。">英雄</option><option value="//低下头，嫣然一笑，露出颊上浅浅的梨涡，害羞地脸红了起来！">害羞</option><option value="//热泪盈眶地说：“好，好，好！”">同意</option><option value="//自言自语道：“今儿个不知该到谁家蹭饭去了......”">蹭饭</option><option value="//说道：“乖乖不得了，在下的老板来了，没功夫聊了。回见！”">老板</option><option value="//急得象热锅上的蚂蚁，不停地大叫：“快点！快点！怎么比猪还慢？！”">太慢</option><option value="//一屁股坐在地上发起呆来。">发呆</option><option value="//眉开眼笑地想：人都说打是疼，骂是爱，人家会不会，这个这个......">臭美</option><option value="//看着大家有说有笑，转而向隅，竭力想回忆起些什么。">回想</option><option value="//看着镜中日益消瘦的脸庞自怨自艾，“唉，##，你好命苦！”">命苦</option><option value="//一脸的迷茫，不知道周围发生了什么事。">迷茫</option><option value="" style=color:blue>----</option><option value="//向着%%大叫：“欢迎，欢迎，热烈欢迎！”" style=color:red>欢迎</option><option value="//热情地向%%打招呼，并递上一杯香浓Coffee和一杯清香的茶，自己选哦。" style=color:red>饮料</option><option value="//用一根树枝捅了捅%%的鼻子：“醒醒呀，快醒醒。”" style=color:red>醒醒</option><option value="//觉得%%妹妹真是好可爱哟！" style=color:red>可爱</option><option value="//看着%%，心想：现在的女孩真厉害……" style=color:red>厉害</option><option value="//蹑手蹑脚地溜到%%背后，掏出一把大锤子，嘿嘿......" style=color:red>偷偷</option><option value="//对着%%狠狠的一锤当头敲下，微笑道：“%%，你给我发呆去吧！”" style=color:red>锤子</option><option value="//从天上召来一道闪电把%%化为一堆灰烬。" style=color:red>灰烬</option><option value="//结结巴巴地跟%%道歉：“实在是对不住，我下次再也不敢了。”" style=color:red>道歉</option><option value="//见%%不怀好意，连忙抓起电话：114，119，120，122，96315 ... 心想：“警察叔叔怎么还不来呀？”" style=color:red>求助</option><option value="//和%%正邪恶地笑着，八成同时想到什么坏事头上。" style=color:red>坏事</option><option value="//对%%小声嘀咕着：“君子报仇，十年不晚，五年后再来找你。”" style=color:red>报仇</option><option value="//看都不看%%一眼，哼了一声，高高的把头扬了起来……不理你……" style=color:red>不理</option><option value="//看着%%偷偷直乐，幸灾乐祸地想：活该。" style=color:red>活该</option><option value="//痴痴地望着%%的身影，不禁呆了……" style=color:red>痴痴</option><option value="//笑呵呵地对%%抱拳打揖：“久仰阁下大名，如雷灌耳，今日相见，三生有幸！”" style=color:red>久仰</option><option value="//拍了拍%%的头道：“%%乖，一会ㄦ给你买棒棒冰。”" style=color:red>听话</option><option value="//不怀好意地绕着%%打转，嘴巴里不知在嘀咕些什么。" style=color:red>打转</option><option value="//向%%摇摇食指，“小朋友，不可以这样喔！”" style=color:red>不许</option></select>
      <font color="#FFFFFF"> 表情</font> 
      <select name='addsays' onchange="document.af.sytemp.focus();" style='font-size:12px'>
        <option value="" selected>----</option>
        <option value="微微笑">微笑</option>
        <option value="温柔地">温柔</option>
        <option value="红着脸">脸红</option>
        <option value="摇头晃脑得意地">得意</option>
        <option value="哈！哈！哈！笑着">大笑</option>
        <option value="神秘兮兮地">神秘</option>
        <option value="战战兢兢地">战兢</option>
        <option value="毛手毛脚地">毛手</option>
        <option value="嘟着嘴地">嘟嘴</option>
        <option value="慢条斯理地">慢条</option>
        <option value="同情地">同情</option>
        <option value="幸灾乐祸地">乐祸</option>
        <option value="快要哭地">快哭</option>
        <option value="哭着">哭</option>
        <option value="拳打脚踢地">拳打</option>
        <option value="不怀好意地">坏意</option>
        <option value="遗憾地">遗憾</option>
        <option value="瞪大了眼睛，很诧异地">诧异</option>
        <option value="幸福地">幸福</option>
        <option value="翻箱倒柜地">翻箱</option>
        <option value="悲痛地">悲痛</option>
        <option value="正义凛然地">正义</option>
        <option value="严肃地">严肃</option>
        <option value="生气地">生气</option>
        <option value="大声地">大声</option>
        <option value="傻乎乎地">傻</option>
        <option value="很满足地">满足</option>
        <option value="手足无措地">无措</option>
        <option value="很无辜地">无辜</option>
        <option value="喃喃自语地">自语</option>
        <option value="恶狠狠地瞪着眼">瞪眼</option>
        <option value="快要吐地">想吐</option>
        <option value="无精打采地">无采</option>
        <option value="依依不舍地">不舍</option>
        <option value="口吐白沫">白沫</option>
        <option value="有气无力地">无力</option>
        <option value="无可奈何地">无奈</option>
        <option value="可怜兮兮地">可怜</option>
      </select>
      <font color="#FFFFFF">图片</font> 
      <select name='tu' onChange="rc(this.value);" style='font-size:12px'>
        <option value="" selected>----</option>
        <option value="[tu]1[/tu]">笑脸</option>
        <option value="[tu]2[/tu]">不满</option>
        <option value="[tu]3[/tu]">生气</option>
        <option value="[tu]4[/tu]">鬼脸</option>
        <option value="[tu]5[/tu]">舌头</option>
        <option value="[tu]6[/tu]">汽车</option>
        <option value="[tu]7[/tu]">骷髅</option>
        <option value="[tu]8[/tu]">美女</option>
        <option value="[tu]9[/tu]">蛋糕</option>
        <option value="[tu]10[/tu]">拳头</option>
        <option value="[tu]11[/tu]">炸弹</option>
        <option value="[tu]12[/tu]">咬牙</option>
        <option value="[tu]13[/tu]">小熊</option>
        <option value="[tu]14[/tu]">玫瑰</option>
        <option value="[tu]15[/tu]">握手</option>
        <option value="[tu]16[/tu]">电话</option>
      </select>
<input type="hidden" name="oldtitleline" value="0"'><input type="checkbox" name="titleline" value="1" accesskey='t' onClick="document.af.sytemp.focus();">
    <a href='#' onMouseOver="window.status='将发言内容置于聊天室的用户标题行。';return true" onMouseOut="window.status='';return true" onclick="document.af.titleline.checked=!(document.af.titleline.checked);document.af.sytemp.focus();" title="二级以上聊友才能使用">标题</a>       
      <a onMouseOver="window.status='0为不过滤，1为只显示对自己和大家说的话，2为只显示对自己说的话。';return true" onMouseOut="window.status='';return true" title="只显示与自己有关的内容，改变后必须发言才能生效">过滤:</a> 
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
<a href=# onClick='document.af.as.checked=!(document.af.as.checked);parent.f1.scrollit();document.af.sytemp.focus();' onMouseOver="window.status='自动将对话区的内容向上滚动。';return true" onMouseOut="window.status='';return true" title="“激活/禁止”对话区自动滚屏">滚屏</a> 
<input type="checkbox" name="addvalues">
      <a href="#" title='打开此项后，系统定时自己发言，自己存点！不在线一样泡！' onClick='document.af.addvalues.checked=!(document.af.addvalues.checked);document.af.sytemp.focus();'>泡点</a> 
      <a href='setfontsize.asp' target=f3 onMouseOver="window.status='改变对话区字体的磅值及行距。';return true" onMouseOut="window.status='';return true" title="改变字体大小及行距"> 
      </a><b><a href='setfontsize.asp' target=f3 onMouseOver="window.status='改变对话区字体的磅值及行距。';return true" onMouseOut="window.status='';return true" title="改变字体大小及行距"> 
      </a></b> <font size="2" color="#FFFFFF"><a href='setfontsize.asp' target=f3 onMouseOver="window.status='改变对话区字体的磅值及行距。';return true" onMouseOut="window.status='';return true" title="改变字体大小及行距">字体</a></font>
<input type='checkbox' name='oicq' accesskey='o' onClick='parent.oicqcheck();document.af.sytemp.focus();'>
      <a href='webicqreadf3.asp' target=f3 onMouseOver="window.status='本功能用于弹出的新窗口无法继承原窗口的属性时。';return true" onMouseOut="window.status='';return true" title="读取自己的WebICQ信息">WebICQ</a><font size="2" color="#FFFFFF"> 
<noscript>
      <input type='checkbox' name='refresh' checked accesskey='m' onClick='parent.refresh();document.af.sytemp.focus();'>
<a href='#' onMouseOver="window.status='选中本项后，您的电脑将启用Java与服务器建立连接！滚屏速度将极大提升！';return true" onMouseOut="window.status='';return true" onClick="document.af.refresh.checked=!(document.af.refresh.checked);parent.refresh();document.af.sytemp.focus();" title="采用Java与服务器建立高速连接！">Java</a>
</noscript>
<input type='checkbox' name='fc' accesskey='j' onClick='javascript:parent.facesel();document.af.sytemp.focus();'>
      <a href="face.asp" target=f3 onMouseOver="window.status='显示头像。';return true" onMouseOut="window.status='';return true" title="“激活/禁止”头像功能">头像</a> 
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