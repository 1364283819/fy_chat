<%RSDispatch%>
<!--#INCLUDE file="_ScriptLibrary/RS.ASP"-->
<SCRIPT RUNAT=SERVER Language=JScript>
function Description()
{
this.GetInfoAsArray = DoGetData;
}
public_description = new Description();
function DoGetData()
{
AllMsg=new Array()
if (Session("fy_u_line")==Application("fy_c_line"))
{
AllMsg[0] = 0;
return AllMsg;
}
else
{
var Str="";
var sd = new VBArray(Application("fy_c_sd"));
var sd = sd.toArray();
var uLine=Session("fy_u_line");
for(var i=1;i<50;i+=2){
if(sd[i]>uLine){
Str=Str+sd[i+1];
}
}
var song=Application("fy_c_webicqname");
var online=Application("fy_c_useronlinename");
var username=Session("fy_u_nickname");
//var str2=online.indexOf(' '+username+' ');
//var str3=song.indexOf(' '+username+' ');
if (online.indexOf(' '+username+' ')==-1){Str="parent.top.location.href='chaterr.asp?id=001';";}
if (song.indexOf(' '+username+' ')==0){Str=Str+"parent.webicq();"}
AllMsg[0]=1;
AllMsg[1]=Str;
AllMsg[2]= '<font style=font-size:9pt>'+ Application("hg_title")+'</font><br><font color=blue style=font-size:10.5pt>'+Application("fy_c_title")+'</font>';
}
Session("fy_u_line")=Application("fy_c_line");
return AllMsg;
}
</SCRIPT>