<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
nickname=Session("fy_u_nickname")
if nickname="" then Response.Redirect "error.asp?id=210"
towho=Trim(Request.QueryString("towho"))
title=Replace(Trim(Request.QueryString("title")),chr(34),"'")
if title<>"" then title="Re:"&title%><html>
<head>
<title>书写留言</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="readonly/style.css">
<script language="JavaScript">
function check(){if(document.forms[0].title.value==""||document.forms[0].intro.value==""||document.forms[0].fromwho.value==""){alert("请将红色项目填写完整！");return false;}document.forms[0].Submit.disabled=1;return true;}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="#FFFFFF">
<table border="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" bgcolor="#CCCCFF" cellpadding="8">
<form method="post" action="welcomegbwrok.asp" onsubmit='return(check());'>
<tr align="center">
<td> 
<table width="100%" border="0">
<tr> 
<td><a title="你想把这条留言写给谁，就在此处填写对方的名称，必须<=20字符。(一个汉字占两个字符的宽度)">写给：</a></td>
<td> 
<input type="text" name="towho" maxlength="20" value=<%=towho%>>
<input type="checkbox" name="mm" value="1"><a title="选中此项，则此留言只有你和对方才能看到。">悄悄话</a></td>
</tr>
<tr> 
<td><a title="本留言的中心思想，<=40字符。"><font color="#FF0000">主题：</font></a></td>
<td> 
<input type="text" name="title" size="32" maxlength="40" value="<%=title%>">
</td>
</tr>
<tr>
<td><font color="#FF0000">内容：</font><br><=1024</td>
<td>
<textarea name="intro" cols="40" rows="8"></textarea>
</td>
</tr>
</table>
个人信息
<table width="100%" border="0">
<tr> 
<td><a title="填写你的姓名，<=20字符。"><font color="#FF0000">姓名：</font></a></td>
<td> 
<input type="text" name="fromwho" maxlength="20" value=<%=nickname%>>
<a title="为防止有人冒名留言，如果你在前一项中使用的姓名是已经注册的姓名，则必须输入密码，才能留言。"><font color="#FF0000">密码：</font></a>
<input type="password" name="pass" size="10" maxlength="10">
</td>
</tr>
<tr> 
<td><a title="当然是填写你所在的省市了，<=20字符">地址：</a></td>
<td> 
<input type="text" name="address" maxlength="20">
<input type="checkbox" name="hideip" value="1"><a title="选中此项，则你的IP不会显示在留言簿中。">隐藏我的IP</a></td>
</tr>
<tr> 
<td><a title="填写你的 E-mail 地址，<=50字符。">信箱：</a></td>
<td> 
<input type="text" name="email" maxlength="50">
</td>
</tr>
<tr> 
<td>主页：</td>
<td><a title="你的竹叶的名称，<=24字符">名称</a><input type="text" name="homename" size="32" maxlength="24">
<br>
<a title="你的竹叶的地址，<=50字符">地址</a><input type="text" name="homeurl" value="http://" size="32" maxlength="50">
</td>
</tr>
<tr align="center"> 
<td colspan="2">
<input type="submit" name="Submit" value="提交留言">
<input type="reset" value="重写">
<input type="button" value="放弃" onclick="javascript:history.go(-1)">
<input type="button" value="查看留言" onclick="javascript:document.location.href='welcomegbview.asp?show=0&page=1'">
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
<p><font color="#FF0000">说明：</font><br>
　　上表中红色的项目为必填项目，将鼠标移到文字上稍做停留，即可看到填写说明。<br>
　　1个汉字 = 2个字符。</p>
</td>
</tr>
</table>
</body>
</html>
