<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
grade=Int(Session("fy_u_userinfo")(0))
if nickname="" then Response.Redirect "manerr.asp?id=100"
if grade<>10 then Response.Redirect "manerr.asp?id=230"%><html>
<head>
<title>系统参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
</head>
<body bgcolor="#FFFFFF" class=p150>
<div align="center">
<h1><font color="0099FF">【系统参数】</font></h1>
</div>
<div align="center"><a href="javascript:history.go(0)">刷新</a></div>
<hr noshade size="1" color=009900>
<b>［注意事项］</b><br>
　　更改以下参数，将会影响到整个聊天室的运行状态。 
<hr noshade size="1" color=009900>
<form name="form1" method="post" action="setsystemok.asp">
  <table border="1" align="center" cellpadding="8" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" bgcolor="F0F0F0">
    <tr align="center" bgcolor="#3399FF"> 
      <td><font color="#FFFFFF">项　　　目</font></td>
      <td><font color="#FFFFFF">值</font></td>
    </tr>
    <tr> 
      <td align="right">聊天室名称：</td>
      <td> 
        <input type="text" name="s1" value="<%=Application("fy_c_chatroomname")%>" size="14" maxlength="14">
      </td>
    </tr>
    <tr> 
      <td align="right">陪聊机器人名称：</td>
      <td> 
        <input type="text" name="s2" value="<%=Application("fy_c_automanname")%>" size="10" maxlength="10">
        <a href="mansysautomansays.asp"> 〖给机器人换脑〗</a></td>
    </tr>
    <tr> 
      <td align="right">用户名禁止包含字符串：</td>
      <td> 
        <input type="text" name="s4" value="<%=Application("fy_c_disloginname")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">进入聊天室时的公告：</td>
      <td> 
        <input type="text" name="s5" value="<%=Application("fy_c_userinto")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">退出聊天室时的公告：</td>
      <td> 
        <input type="text" name="s6" value="<%=Application("fy_c_userout")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">非正常(断线)退出的公告：</td>
      <td> 
        <input type="text" name="s7" value="<%=Application("fy_c_userdown")%>" size="50">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天室LOGO图片：</td>
      <td><img src=<%=Application("fy_c_logo")%>><br>
        URL： 
        <input type="text" name="s8" value="<%=Application("fy_c_logo")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天室建立时间：</td>
      <td> 
        <input type="text" name="s9" value="<%=Application("fy_c_opendate")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">到目前系统总访问量：</td>
      <td> 
        <input type="text" name="s10" value="<%=Application("fy_c_visitor")%>">
      </td>
    </tr>
    <tr> 
      <td align="right">允许同时聊天的人数：</td>
      <td> 
        <input type="text" name="s11" value="<%=Application("fy_c_maxpeople")%>">
        人</td>
    </tr>
    <tr> 
      <td align="right">退出时返回到URL：</td>
      <td> 
        <input type="text" name="s12" value="<%=Application("fy_c_homepageurl")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">允许不发言(潜水)时间：</td>
      <td> 
        <input type="text" name="s13" value="<%=Application("fy_c_maxtimeout")%>" size="10">
        分钟</td>
    </tr>
    <tr> 
      <td align="right">封锁 IP 的时间长度：</td>
      <td> 
        <input type="text" name="s14" value="<%=Application("fy_c_iplocktime")%>" size="10">
        分钟</td>
    </tr>
    <tr> 
      <td align="right">聊天室关门：</td>
      <td> 
        <input type="text" name="s15" value="<%=Application("fy_c_closedoor")%>" size="10">
        　<font color="#666666">(0为开门，1为关门)</font></td>
    </tr>
    <tr> 
      <td align="right">禁止通过代理服务器访问：</td>
      <td> 
        <input type="text" name="s16" value="<%=Application("fy_c_disproxy")%>" size="10">
        <font color="#666666">(0为允许，1为禁止)</font></td>
    </tr>
    <tr> 
      <td align="right">禁止新用户名登录：</td>
      <td> 
        <input type="text" name="s17" value="<%=Application("fy_c_disnewuser")%>" size="10">
        　<font color="#666666">(0为允许，1为禁止)</font></td>
    </tr>
    <tr> 
      <td align="right">聊天室背景色：</td>
      <td>[<font color="<%=Application("fy_c_chatroombgcolor")%>">■</font>] 
        <input type="text" name="s19" value="<%=Application("fy_c_chatroombgcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天室背景图片：</td>
      <td><img src=<%=Application("fy_c_chatroombgimage")%> width="204" height="90"><br>
        URL： 
        <input type="text" name="s20" value="<%=Application("fy_c_chatroombgimage")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天窗口背景色：</td>
      <td>[<font color="<%=Application("fy_c_chatbgcolor")%>">■</font>] 
        <input type="text" name="s21" value="<%=Application("fy_c_chatbgcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天窗口背景图片：</td>
      <td><img src=<%=Application("fy_c_chatimage")%> width="216" height="90"><br>
        URL： 
        <input type="text" name="s22" value="<%=Application("fy_c_chatimage")%>" size="30">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天室对话区背景色：</td>
      <td>[<font color="<%=Application("fy_c_chatcolor")%>">■</font>] 
        <input type="text" name="s23" value="<%=Application("fy_c_chatcolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">聊天室标题区背景色：</td>
      <td>[<font color="<%=Application("fy_c_titlecolor")%>">■</font>] 
        <input type="text" name="s24" value="<%=Application("fy_c_titlecolor")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">1 级升 2 级所需经验值：</td>
      <td> 
        <input type="text" name="s25" value="<%=Application("fy_c_level1to2")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">2 级升 3 级所需经验值：</td>
      <td> 
        <input type="text" name="s26" value="<%=Application("fy_c_level2to3")%>" size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">3 级升 4 级所需经验值：</td>
      <td> 
        <input type="text" name="s27" value="<%=Application("fy_c_level3to4")%> " size="6">
      </td>
    </tr>
    <tr> 
      <td align="right">4 级升 5 级所需经验值：</td>
      <td> 
        <input type="text" name="s28" value="<%=Application("fy_c_level4to5")%>" size="6">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="还原">
      </td>
    </tr>
  </table>
</form>
<hr noshade size="1" color=009900>
<div align=center class=cp><%Response.Write "序列号：<font color=blue>" & Application("fy_c_sn") & "</font>，授权给：<font color=blue>" & Application("fy_c_user") & "</font><br><font color=999999>" & Application("fy_c_copyright") & "</font>"%></div>
</body>
</html>
