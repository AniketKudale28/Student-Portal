
<%@include file="header.jsp"%>
<body background='back.jpg'>
<script type='text/javascript'>
var imgs = new Array();
imgs[0] = 'events/1.jpg';
imgs[1] = 'events/2.jpg';
imgs[2] = 'events/3.jpg';
imgs[3] = 'events/4.jpg';
imgs[4] = 'events/5.jpg';
imgs[5] = 'events/6.jpg';
imgs[6] = 'events/7.jpg';
imgs[7] = 'events/8.jpg';
imgs[8] = 'events/9.jpg';
imgs[9] = 'events/10.jpg';
imgs[10] = 'events/11.jpg';
imgs[11] = 'events/12.jpg';
imgs[12] = 'events/13.jpg';
var i=1;
function slide()
{
	document.getElementById('img1').src = imgs[i];
	i=(i+1)%8;
}

setInterval("slide()",2500);

</script>


<center>
<h2>!!!!!!!!!Its Enjoy Time.... Last year Back to School Day!!!!!!!!!</h2>
</center>



<table width='100%'>
<tr>
<td width='60%' align='center'>
<img src='events/1.jpg' width=600 height=500 id='img1'/>
</td>

</tr>
</table>

<center><a href='index.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>

