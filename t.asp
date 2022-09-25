<%
nickname=session("fy_u_nickname")
useronlinename=Application("fy_c_useronlinename")
if nickname="" or Session("fy_u_inthechat")<>"1" or Instr(LCase(useronlinename),LCase(" "&nickname&" "))=0 then
 Session("fy_u_inthechat")="0"
 Response.Redirect "chaterr.asp?id=001"
end if
Response.Write "<script language=javascript>if(window==window.top){top.location.href='exitchat.asp';}</script>"
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
webicqname=Application("fy_c_webicqname")
if newuserline>userline then Session("fy_u_line")=newuserline
if Instr(webicqname," "&nickname&" ")>0 then
 Response.Write "<script>parent.webicq();</script>"
end if
Response.Write "<script Language=JavaScript>var titlemsg='<font style=font-size:9pt>"&Application("hg_title")&"</font><br><font color=blue style=font-size:10.5pt>"&Application("fy_c_title") &"</font>';parent.t1.titlemsg.innerHTML=titlemsg;setTimeout('this.location.reload();',3000);</script>"
Response.End 
%>