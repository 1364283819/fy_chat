<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
Response.Buffer =true
Response.Flush 
%>
<link rel="stylesheet" href="readonly/style.css">
<body bgcolor="#fbf8f0">
<%
Const Jet_Conn_Partial = "Provider=Microsoft.Jet.OLEDB.4.0;Data source="
Dim strDatabase, strFolder, strFileName
connstr=Application("hg_connstr")
tempvar=split(connstr,"Data Source=")
temp=  tempvar(1)
temp1=split(temp,"\")
strDatabase=temp1(UBound(temp1))
strFolder=Replace(temp,strDatabase,"")
Private Sub dbCompact()
Dim SourceConn
Dim DestConn
Dim oJetEngine
SourceConn = Jet_Conn_Partial & strFolder & strDatabase
DestConn = Jet_Conn_Partial & strFolder & date() &"ѹ������"& strDatabase
mymdb=strFolder & strDatabase
tomdb=strFolder & date() &"ѹ������"& strDatabase
%>

<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0">
<tr align="center"> 
<td>
<%
If DbExists(DestConn ) Then 
%>
�Բ������ݿ�:<font color=red><%=tomdb%></font>�Ѿ�����,ʹ��Ftpɾ�����ԣ�
<%
Response.End
end if
Set oJetEngine = Server.CreateObject("JRO.JetEngine")
With oJetEngine
	.CompactDatabase SourceConn, DestConn
End With
%> ���ݿ�:<font color=blue><%= mymdb %></font>ѹ�����!<br>
      ѹ���ļ��ļ���<font color=blue><%=tomdb%></font><br>
      ���½ftp��ɾ��ԭʼ���ݿ⣺<font color=blue><%=mymdb%></font><br>
      �ٽ�ѹ�����ݿ⣺<font color=blue><%=tomdb%></font><br>
      �����ɣ�<font color=blue><%=mymdb%></font>ʹ�ã���
<%
End Sub


Public function DbExists(byVal dbPath) 
'�������ݿ��ļ��Ƿ���� 
On Error resume Next 
Dim c 
Set c = Server.CreateObject("ADODB.Connection") 
c.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath 
If Err.number<>0 Then 
Err.Clear 
DbExists = false 
else 
DbExists = True 
End If 
set c = nothing 
End function 
Select Case Request.form("cmd")
	Case "ѹ��"
		call dbCompact 
End Select
%> </td>
  </tr>
</table>
<p align="center">&lt;&gt; �û�����ѹ�����޸�ϵͳ &lt;&gt;</p>
<form method="POST" action="">
<p align="center">
<input type="submit" value="ѹ��" name="cmd">
</p>
</form>

<p align="center">��ѡ����ѹ�������ݿ⣬��ѹ����ʼ���У�<br>
  ѹ���ɹ����뽫ԭ���ݿ������Ȼ��ѹ��������ݿ�ĳ�ԭ���ݿ⣡ <b><br>
  </b></p>
