if(window==window.top)
{top.location.href="jhchat.asp";}var max=9;var whamsg=new Array(max+1);var base=0;var p=0;var j;for(j=0;j<=max+1;j++){whamsg[j]='';}function addOne(what){if (base<max+1){whamsg[base]=what;base++;}else{for (i=0;i<max;i++)whamsg[i]=whamsg[i+1];whamsg[i]=what;}p=base;}function gop(){if(p>0)p--;document.af.sytemp.value=whamsg[p];document.af.sytemp.focus();}function gon(){if(p<base)p++;document.af.sytemp.value=whamsg[p];document.af.sytemp.focus();}
function bs(){document.af.towho.style.color=document.af.sayscolor.value;
document.af.sytemp.style.color=document.af.sayscolor.value;
document.af.sytemp.focus();}
function bs2(){document.af.username.style.color=document.af.addwordcolor.value;
document.af.sytemp.focus();}
function dj(){document.af.towho.value="´ó¼Ò";document.af.towho.value;document.af.sytemp.focus();}function rc(list){if(list!="0"){document.af.sytemp.value=list;document.af.sytemp.focus();}}function runnosay(){document.af.clock.value=document.af.clock.value-1;if(document.af.clock.value==300){window.open('comeon.asp','','Status=no,scrollbars=no,resizable=no,width=210,height=130');}
if(document.af.clock.value==0)
{top.location.href='nosaytimeout.asp';}
if(document.af.clock.value<0){startnosay();changecolor();parent.rn();}setTimeout('runnosay()',1000);}
function changecolor()
{
var sayscolor=Math.round(Math.random()*(document.af.sayscolor.length-1))
var addwordcolor=Math.round(Math.random()*(document.af.addwordcolor.length-1))
document.af.sayscolor.value=document.af.sayscolor.options[sayscolor].value;
document.af.addwordcolor.value=document.af.addwordcolor.options[addwordcolor].value;
bs(document.af.sayscolor.value);
bs2(document.af.addwordcolor.value);
}
startnosay();
runnosay();
changecolor();