<%@ LANGUAGE=VBScript%>
<%
Response.Expires=0
On Error Resume Next
chatroomname=Application("fy_c_chatroomname")
username=Server.HTMLEncode(Trim(Request.Form("username")))
Set conn=Server.CreateObject("ADODB.CONNECTION")
Set rs=Server.CreateObject("ADODB.RecordSet")
connstr=Application("hg_connstr")
conn.open connstr
sql="SELECT password,email FROM reginfo WHERE kill='0' AND username='" & username & "'"
rs.open sql,conn,1,1
if rs.Eof and rs.Bof then
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
 Response.Write "<script Language='Javascript'>"
 Response.Write "alert('���û��������ڡ�');"
 Response.Write "history.go(-1);"
 Response.Write "</script>"
 Response.End
End if
pwd=rs("password")
email=rs("email")
rs.close
conn.close
set rs=nothing
set conn=nothing
if email="" then
 Response.Write "<script Language='Javascript'>"
 Response.Write "alert('���û���δ��д���䡣');"
 Response.Write "history.go(-1);"
 Response.Write "</script>"
 Response.End
End if
if Not(IsMail(email)) then
 Response.Write "<script Language='Javascript'>"
 Response.Write "alert('���û����������ַ����');"
 Response.Write "history.go(-1);"
 Response.Write "</script>"
 Response.End
end if
Function IsMail(ema)
 namelen=0
 for i=1 to len(ema)
  zhasc=asc(mid(ema,i,1))
  if zhasc<0 then
   namelen=namelen+2
  else
   namelen=namelen+1
  end if
 next
 if namelen<>len(ema) or len(ema)<7 or Instr(ema,"@")=0 or Instr(ema,".")=0 or Instr(ema,"@")<>InstrRev(ema,"@") or InstrRev(ema,"@")>(len(ema)-5) or InstrRev(ema,".")>(len(ema)-2) then
  IsMail=false
 else
  IsMail=true
 end if
End Function
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
sj=n & "-" & y & "-" & r & " " & s & ":" & f & ":" & m
ip=Request.ServerVariables("REMOTE_ADDR")
frommail=email
tomail=email
mailsubject="����" & chatroomname & "����ʱ����"
mailbody="������ϵͳ�Զ����ɣ�����ظ���" & chr(13) & chr(10) & chr(13) & chr(10)
mailbody=mailbody & "���ע���ǳ��ǣ���" & username & "��" & chr(13) & chr(10) & chr(13) & chr(10)
mailbody=mailbody & "�����ʱ�����ǣ���" & pwd & "��" & chr(13) & chr(10) & chr(13) & chr(10)
mailbody=mailbody & "���ô����뵽 [ " & chatroomname & " ] ֮���һ����롱�ĵڶ������ĵ�¼���롣" & chr(13) & chr(10) & chr(13) & chr(10)
mailbody=mailbody & chr(13) & chr(10) & chr(13) & chr(10) & "-------------------------------" & chr(13) & chr(10) & "ȡ����ʱ�䣺" & sj & chr(13) & chr(10) & "ȡ������IP��" & ip & chr(13) & chr(10) & chr(13) & chr(10) & "___________________________________________________________________" & chr(13) & chr(10) & "(c) 1999-2001 ���㹤����"
dim objCDOMail
Set objCDOMail=Server.CreateObject("CDONTS.NewMail")
objCDOMail.From=frommail
objCDOMail.To=tomail
objCDOMail.Subject=mailsubject
objCDOMail.Body=mailbody
objCDOMail.Send
Set objCDOMail=Nothing
tomail=Replace(tomail,"\","\\")
tomail=Replace(tomail,"/","\/")
tomail=Replace(tomail,chr(34),"\"&chr(34))
tomail=Replace(tomail,"'","\'")
Response.Write "<script Language='Javascript'>"
Response.Write "alert('�Ѿ�����ʱ���뷢�͵���[" & tomail & "]');"
Response.Write "history.go(-1);"
Response.Write "</script>"%>