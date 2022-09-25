<%
SayStr="parent.writesay('"&username&"','"&dowho&"','"&towho&"','"&SayStr&t&"','"&addwordcolor&"','"&sayscolor&"','"&act&"','"&towhoway&"');"
if Instr(saystr,"''")<>0 then 
Response.End 
end if
Application.Lock
sd=Application("fy_c_sd")
line=int(Application("fy_c_line"))
Application("fy_c_line")=line+1
Dim newsd(50)
j=1
for i=3 to 50 step 2
newsd(j)=sd(i)
newsd(j+1)=sd(i+1)
j=j+2
next
newsd(49)=line+1
newsd(50)=SayStr
Application("fy_c_sd")=newsd
Application.UnLock
sd=Application("fy_c_sd")
userline=int(Session("fy_u_line"))
newuserline=0
j=1
for i=1 to 50 step 2
newuserline=sd(i)
if sd(i)>userline  then
Redim Preserve show(j),show(j+1)
show(j)=sd(i)
show(j+1)=sd(i+1)
j=j+2
end if
next
if j>1 then
for i=1 to UBound(show) step 2
Response.Write "<script language=javascript>"&show(i+1)&"</script>"
next
end if
if newuserline>userline then Session("fy_u_line")=newuserline
Response.Write "<script language=javascript>var titlemsg='<font style=font-size:9pt>"&Application("hg_title")&"</font><br><font color=blue style=font-size:10.5pt>"&Application("fy_c_title") &"</font>';parent.t1.titlemsg.innerHTML=titlemsg;</script>"
Response.End
%>