<%
Response.Buffer =true
Response.Flush 
%>
<html>
<title></title>
<style type="text/css">
<!--
A {
	COLOR: #814e16; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: 9pt
}
BODY {
	SCROLLBAR-FACE-COLOR: #b38a49; FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-3DLIGHT-COLOR: #000000; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #fbf8f0; SCROLLBAR-DARKSHADOW-COLOR: #000000
}

-->
</style>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#fbf8f0">
<table border=1 cellspacing=0 cellpadding=2 align=center width="100%">
  <td align=center>SessionID号是：<%=Session.Sessionid%> Session变量（<%=Session.Contents.Count%>）个 
      Application（<%=application.Contents.Count%>）个
  </tr>
  </table>
<div align="center"><br>
  <font color="#FF3333">&lt;&gt; 所有Session 对像列表 &lt;&gt;</font><br>
  <br>
</div>
<table table border=1 cellspacing=0 cellpadding=3 width="100%">
  <tr align=center> 
    <td align="center" width="12">id</td>
    <td width="140"> Session对像名称</td>
    <td> 值</td>
  </tr>
<%
id=0
for each system in session.Contents
id=id+1
%>
  <tr valign="middle"> 
    <td width="12" align="center"><%=id%></td>
    <td width="140"><%=system%></td>
    <td> <%
if isarray(session(system)) then
Response.Write "<div align=center>---------------->>>>数 组<<<<------------------</div><br>"
For iLoop = LBound(Session(system)) to UBound(Session(system)) 
Response.Write server.HTMLEncode(system & "(" & iLoop & ") - " & Session(system)(iLoop))
%>
<BR>
<%
Next 
else
response.Write server.HTMLEncode(session(system))
end if
%> </td>
  </tr>
<%
next
%>
</table>
<div align="center"><br>
  <font color="#FF3333">&lt;&gt; 所有Application 对像列表 &lt;&gt; </font><br>
  <br>
</div>
<table border=1 cellspacing=0 cellpadding=3  width="100%">
  <tr align=center> 
    <td align="center" width="12">id</td>
    <td width="140">Application对像名称</td>
    <td> 值</td>
  </tr>
<%
id=0
dim system
for each system in Application.Contents
id=id+1
%>
  <tr valign="middle"> 
    <td align="center"><%=id%></td>
    <td><%=system%></td>
    <td> <%
if isarray(Application(system)) then
Response.Write "<div align=center>---------------->>>>数 组<<<<------------------</div><br>"
For iLoop = LBound(Application(system)) to UBound(Application(system)) 
Response.Write server.HTMLEncode(system & "(" & iLoop & ") - " & Application(system)(iLoop))
%> <br>
      <br>
      <%
Next 
else
response.Write server.HTMLEncode(Application(system))
end if
%> </td>
  </tr>
<%
next
Dim theInstalledObjects(17)
    theInstalledObjects(0) = "MSWC.AdRotator"
    theInstalledObjects(1) = "MSWC.BrowserType"
    theInstalledObjects(2) = "MSWC.NextLink"
    theInstalledObjects(3) = "MSWC.Tools"
    theInstalledObjects(4) = "MSWC.Status"
    theInstalledObjects(5) = "MSWC.Counters"
    theInstalledObjects(6) = "IISSample.ContentRotator"
    theInstalledObjects(7) = "IISSample.PageCounter"
    theInstalledObjects(8) = "MSWC.PermissionChecker"
    theInstalledObjects(9) = "Scripting.FileSystemObject"
    theInstalledObjects(10) = "adodb.connection"
    
    theInstalledObjects(11) = "SoftArtisans.FileUp"
    theInstalledObjects(12) = "SoftArtisans.FileManager"
    theInstalledObjects(13) = "JMail.SMTPMail"
    theInstalledObjects(14) = "CDONTS.NewMail"
    theInstalledObjects(15) = "Persits.MailSender"
    theInstalledObjects(16) = "LyfUpload.UploadFile"
    theInstalledObjects(17) = "Persits.Upload"

'检查组件是否被支持
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function

'检查组件版本
Function getver(Classstr)
On Error Resume Next
getver=""
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(Classstr)
If 0 = Err Then getver=xtestobj.version
Set xTestObj = Nothing
Err = 0
End Function
%>
</table>
	
<div align="center"><font color="#FF3333"><br>
  &lt;&gt; 服 务 器 信 息 &lt;&gt;</font><br>
  <br>
</div>
<table border=1 width=100% cellspacing=0 cellpadding=2>
  <tr height=18> 
    <td align=left>&nbsp;服务器名</td><td>&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器IP</td><td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器端口</td><td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器时间</td><td>&nbsp;<%=now%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;IIS版本</td><td>&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;脚本超时时间</td><td>&nbsp;<%=Server.ScriptTimeout%> 秒</td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;本文件路径</td><td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器CPU数量</td><td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器解译引擎</td><td>&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
	  </tr>
	  
  <tr height=18> 
    <td align=left>&nbsp;服务器操作系统</td><td>&nbsp;<%=Request.ServerVariables("OS")%></td>
	  </tr>
	</table>

<br>
组件支持情况 <%
Dim strClass
    strClass = Trim(Request.Form("classname"))
    If "" <> strClass then
    Response.Write "<br>您指定的组件的检查结果："
      If Not IsObjInstalled(strClass) then 
        Response.Write "<br><font color=red>很遗憾，该服务器不支持" & strclass & "组件！</font>"
      Else
        Response.Write "<br><font color=green>恭喜！该服务器支持" & strclass & "组件。该组件版本是：" & getver(strclass) & "</font>"
      End If
      Response.Write "<br>"
    end if
    %> <br>
■ IIS自带的ASP组件 
<table border=1 width=100% cellspacing=0 cellpadding=2>
  <tr height=18  align=center> 
    <td width=350>组 件 名 称</td>
    <td width=100>支持及版本</td>
  </tr>
  <%
    dim i
    For i=0 to 10
      Response.Write "<TR  align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
	  select case i
		case 9
		Response.Write "(FSO 文本文件读写)"
		case 10
		Response.Write "(ACCESS 数据库)"
	  end select
	  Response.Write "</font></td>"
      If Not IsObjInstalled(theInstalledObjects(i)) Then 
        Response.Write "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
      Else
        Response.Write "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(i)) & "</td>"
      End If
      Response.Write "</TR>" & vbCrLf
    Next
    %> 
</table>
<br>
■ 常见的其他组件 
<table border=1 width=100% cellspacing=0 cellpadding=2>
  <tr height=18  align=center> 
    <td width=350>组 件 名 称</td>
    <td width=100>支持及版本</td>
  </tr>
  <%

    For i=11 to UBound(theInstalledObjects)
      Response.Write "<TR align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
	  select case i
		case 11
		Response.Write "(SA-FileUp 文件上传)"
		case 12
		Response.Write "(SA-FM 文件管理)"
		case 13
		Response.Write "(JMail 邮件发送)"
		case 14
		Response.Write "(CDONTS 邮件发送 SMTP Service)"
		case 15
		Response.Write "(ASPEmail 邮件发送)"
		case 16
		Response.Write "(LyfUpload 文件上传)"
		case 17
		Response.Write "(ASPUpload 文件上传)"
		
	  end select
	  Response.Write "</font></td>"
      If Not IsObjInstalled(theInstalledObjects(i)) Then 
        Response.Write "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
      Else
        Response.Write "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(i)) & "</td>"
      End If
'      if i = 13 and IsObjInstalled(theInstalledObjects(13)) then
'		dim jmail
'		Set JMail = Server.CreateObject("JMail.smtpmail")
'        Response.Write "</tr><tr bgcolor=#EEFEE0 ><td colspan=3><font color=#888888>　　w3 JMail 是 Dimac 公司（www.dimac.net）推出的ASP发信组件，可以在ASP、VC、VB、Delphi等开发工具中调用。和其他发信组件相比，它具有支持HTML、多收件人、抄送、暗送等特点，4.0以上版本还支持SMTP发信认证、群发、POP3收信等。<br>　　目前安装的JMail组件版本是：</font>" & jmail.Version & "</td>"
'      end if

      Response.Write "</TR>" & vbCrLf
    Next
    %> 
</table>
<p align="center">Copyright <a href="http://www.21jm.net" target="_blank">风云江湖</a><br>
  2001-2002 </p>
</body></html>
