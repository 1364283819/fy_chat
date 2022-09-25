<%@ LANGUAGE=VBScript%>
<%
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
sj=n & "-" & y & "-" & r
chatbgcolor=Application("fy_c_chatbgcolor")
chatimage=Application("fy_c_chatimage")
if chatbgcolor="" then chatbgcolor="008888"
%>
<html>
<head>
<title>点歌系统</title>
<meta http-equiv='content-type' content='text/html; charset=gb2312'>
<script language="JavaScript">
var zj = "<%=Request.QueryString("zj")%>";
function gozj(){
 url="song.asp?zj=" + document.songlist.songzj.options[document.songlist.songzj.selectedIndex].value;
 this.location.href=url;
}
function wz(v){
 if(v == zj){
  document.write("<option value=\"" + v + "\" Selected>" + v + "</option>");
 }
 else{
  document.write("<option value=\"" + v + "\">" + v + "</option>");
 }
}
function check(){
 if(document.songlist.song.selectedIndex == -1 || document.songlist.song.value =='' ){
  alert("请选择所需曲目。");
  return false;
 }
}
function ws(v){
 var newv = escape(v);
 var fv = v.substring(0, v.length - 4);
 if(newv == v || v.indexOf("'") != -1){
  if(fv.length > 11){fv = fv.substring(0,11) + "…"}
  document.write("<option value=\"" + v + "\">" + fv + "</option>");
 }
 else{
  if(fv.length > 5){fv = fv.substring(0,5) + "…"}
  document.write("<option value=\"" + v + "\">" + fv + "</option>");
 }
}
function s(){
 if(document.songlist.song.selectedIndex == -1 || document.songlist.song.value ==''  ){
  alert("请选择所需曲目。");
  return false;
 }
 v = document.songlist.song.options[document.songlist.song.selectedIndex].value;
 v = v.substring(0, v.length - 4);
 while(v.indexOf("_") != -1){v = v.replace("_"," ")}
 alert("完整曲名:[ " + v + " ]");
}
function playsong(){
 if(document.songlist.song.selectedIndex == -1 || document.songlist.song.value =='' ){
  alert("请选择所需曲目。");
  return false;
 }
 zj = document.songlist.songzj.options[document.songlist.songzj.selectedIndex].value;
 sn = document.songlist.song.options[document.songlist.song.selectedIndex].value;
 if(document.songlist.loopok[1].checked){
  cs = "infinite";
  csn = "百听不厌";
 }
 else{
  cs = "1";
  csn = "只听一遍";
 }
 url = "mid/" + escape(zj) + "/" + escape(sn);
 parent.ps.document.open();
 parent.ps.document.writeln("<bgsound src=\"" + url + "\" loop=" + cs + ">");
 parent.ps.document.close();
}
function stopsong(){
 parent.ps.location.href = "about:blank";
}
</script>
<link rel="stylesheet" href="readonly/style.css">
</head>
<body oncontextmenu=self.event.returnValue=false bgcolor="<%=chatbgcolor%>" background="<%=chatimage%>" bgproperties="fixed">
<div align=center><font color="#FFFF00" style="font-size:12pt">点歌系统</font></div>
<hr size=1 color=FFFF00>
<table border="0" width="100%">
<form method="post" action="songsend.asp" name="songlist" onsubmit="return(check())">
<tr>
<td> 
<div>
<p><a href="javascript:history.go(0)" title="显示最新的曲目列表"><font color="#FFFFFF">刷新:<%=sj%></font></a></p>
<p><font color="#FFFF00">选择专辑：</font><br>
<select name="songzj" onchange="javascript:gozj()">
<%
Set fs=CreateObject("Scripting.FileSystemObject")
zjpath=Server.Mappath("mid")
zj=Replace(Request.QueryString("zj"),".","")
Set f=fs.GetFolder(zjpath)
Set fc=f.SubFolders
sss=0
For Each f1 in fc
fn=f1.name
if zj="" and sss=0 then zj=fn
sss=sss+1
Response.Write "<script>wz(" & chr(34) & fn & chr(34) & ");</script>" & chr(13) & chr(10)
next
%>
</select>
</p>
</div>
<p>
<font color="#FFFF00">选择曲目：</font><br>
<select name="song" size="6">
<option>------------</option>
<%
songpath=Server.Mappath("mid/"&zj)
Set f=fs.GetFolder(songpath)
Set fc=f.Files
For Each f1 in fc
fn=f1.name
Response.Write "<script>ws(" & chr(34) & fn & chr(34) & ");</script>" & chr(13) & chr(10)
next
Set f=nothing
Set fc=nothing
Set fs=nothing
%>
</select>
</p>
<p><font color="#FFFF00">播放方式：</font><br>
<input type="radio" name="loopok" value="1" checked>
只听一遍<br>
<input type="radio" name="loopok" value="infinite">
百听不厌</p>
<table border="0" cellpadding="4">
<tr> 
<td> 
<input type="button" name="play" value="播放" onclick="javascript:playsong()">
</td>
<td align="right"> 
<input type="button" name="st" value="停止" onclick="javascript:stopsong()">
</td>
</tr>
<tr> 
<td colspan="2"> 
<input type="button" value="完整的曲名" onClick="Javascript:s()" name="san">
</td>
</tr>
<tr> 
<td colspan="2"> 
<input type="submit" value="好歌赠好友" name="sen">
</td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</body>
</html>