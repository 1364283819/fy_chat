<%@ LANGUAGE=VBScript%>
<%option explicit
Response.CacheControl = "Private"
Response.Expires = 0
dim URLStr
URLStr=Request.ServerVariables("SERVER_NAME")&Request.ServerVariables("URL")
URLStr=Replace (URLStr,"java.asp","")
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language=JavaScript src="http://<%=URLStr%>_ScriptLibrary/rs.htm"></script>
<script language=JavaScript>
serverURL='http://<%=URLStr%>_ScriptLibrary';
RSEnableRemoteScripting( serverURL );
PageUrl='http://<%=URLStr%>chat_rs.asp';
refresh_time = 2 ;
refresh_interval = refresh_time;RSErrorCount = 0;GetInfoAsArraySign = false;
function TreatRSErr(){refresh_interval = 0;}
function GetInfoFromServer( ret ){AllMsg = ret.return_value;
if( ret.status == 0 )
{
RSErrorCount = 0;
if(AllMsg[0]==1)
{
parent.f0.document.write("<\script language=javascript>"+AllMsg[1]+"</\script>");
parent.t1.titlemsg.innerHTML=AllMsg[2];
}

}
else
TreatRSErr();
GetInfoAsArraySign = false;
}
function RefreshOnline()
{if( refresh_interval ){
RSExecute( PageUrl, "GetInfoAsArray",GetInfoFromServer );
GetInfoAsArraySign = true;
window.setTimeout("RefreshOnline();", refresh_interval * 1000 );}}
function et(){}
function OnLoad()
{
RefreshOnline();}
</script>
</head>
<body onload="OnLoad();parent.write();">
</body>
</html>