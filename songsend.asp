<%@ LANGUAGE=VBScript%>
<%Response.Expires=0
useronlinename=Application("fy_c_useronlinename")
nickname=Session("fy_u_nickname")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(useronlinename," "&nickname&" ")=0 then Response.Redirect "chaterr.asp?id=001"
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
sj1=n & "-" & y & "-" & r
sj2=s & ":" & f & ":" & m
sj3=sj1 & " " & sj2
songzj = Trim(Request.Form("songzj"))
song = Trim(Request.Form("song"))
online=Application("fy_c_onlinelist")
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"%><html>
<head>
<title>好歌赠好友</title>
<meta http-equiv='content-type' content='text/html; charset=gb2312'>
<link rel="stylesheet" href="readonly/style.css">
<script language="JavaScript">
var myn = "<%=nickname%>";
var songzj = "<%=songzj%>";
var song = "<%=song%>";
var songname = song.substring(0, song.length - 4);
function check(){
// if(document.sendsong.towho.value == myn){
//  alert("不需要给自己点歌。");
//  return false;
// }
 if(document.sendsong.info.value == ""){
  alert("祝词不能为空。");
  return false;
 }
 if(document.sendsong.info.value.length > 300){
  alert("祝词不能超过 300 个字符。");
  return false;
 }
 document.sendsong.send.disabled = 1;
}
</script>
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed" text="#FFFFFF">
<div align="center"><font color="#FFFF00" style="font-size:12pt">好歌赠好友</font></div>
<hr size=1 color=FFFF00><br>
<table border="0" width="100%">
<form method="post" action="songsendok.asp" name="sendsong" onsubmit='return(check());'>
<tr> 
<td>
<p><font color="#FFFF00">曲目</font><br>
<script>
document.write("<input type=text name=qm size=14 value=" + songname + " readonly>");
</script>
</p>
<p><font color="#FFFF00">选择好友：</font><br>
<input type="hidden" name="songzj" value="<%=songzj%>">
<input type="hidden" name="song" value="<%=song%>">
<select name="towho" style="font-size:9pt">
<%for i=1 to ubound(online) step 6%>
<option value="<%=online(i+1)%>"<%if CStr(online(i+1))=CStr(nickname) then response.write " selected"%>><%=online(i+1)%></option>
<%next%></select>
</p>
<p> <font color="#FFFF00">祝福话语：</font><br>
          <textarea name="info" cols="15" style="font-size:9pt" rows="7" wrap="VIRTUAL">谨以《%%》表达我的心意……</textarea>
        </p>
<p>注：%%代表歌名
</p>
<table border="0">
<tr>
<td>
<input type="submit" name="send" value="发送">
<input type="button" name="abort" value="放弃" onClick="javascript:history.go(-1)">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</body>
</html>