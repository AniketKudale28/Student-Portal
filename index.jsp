<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["uid"];

	if(x.value=="" || x.value==null)
	{
		alert("Login id cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["pass"];
	if(x.value=="" || x.value==null)
	{
		alert("Password cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["type"];
	if(x.value!="Admin" && x.value!="Teacher" && x.value!="Student" || x.value==null)
	{
		alert("Please select type..!");
		x.focus();
		return false;
	}
	
}
</script>
<style>
a{
	text-decoration:none;
	font-size:18px;
	font-weight:bold;
}
a:link,a:visited,a:hover,a:active{
	color:blue;
}
a:hover{
	color:white;
	background:blue;
}
</style>
<head>
<link rel="stylesheet" type='text/css' href='button.css'>
</head>
<body background='back.jpg'>
<script type='text/javascript'>
var imgs = new Array();
imgs[0] = 'images1.jpg';
imgs[1] = 'images2.jpg';
imgs[2] = 'images3.jpg';
imgs[3] = 'images4.jpg';
imgs[4] = 'images5.jpg';
imgs[5] = 'images6.jpg';
imgs[6] = 'images7.jpg';
imgs[7] = 'images8.jpg';
var i=1;
function slide()
{
	document.getElementById('img1').src = imgs[i];
	i=(i+1)%8;
}

setInterval("slide()",2500);

</script>

<%@include file="header.jsp"%>
<br>
<table width='100%' align='center' style='background-color:#EAEAEA;'>
<tr>
	<td align='center'><a href='view_courses.jsp'>View Courses</a></td>
	<td align='center'><a href='student_reg.jsp'>Student Sign Up</a></td>
	<td align='center'><a href='teacher_reg.jsp'>Teacher Sign Up</a></td>
	<td align='center'><a href='gallery.jsp'>Gallery</a></td>
	<td align='center'><a href='about_us.jsp'>About Us</a></td>
	<td align='center'><a href='contact_us.jsp'>Contact Us</a></td>
</tr>
</table><br>
<table width='100%'>
<tr>
<td width='60%' align='center'>
<img src='images1.jpg' width=500 height=400 id='img1'/>
</td>
<td align='center' width='20%'>
	<b>Notice</b>
</td>
<td align='center' width='20%'>
<form name='reg' method='post' action='login.jsp' onsubmit='return validate()'>
<table width='350' style='background-color:#FFA500;box-shadow: 10px 10px 5px grey;border-radius:8px;'>
<tr>
	<td colspan=2 align='center'><b>Login Information</b></td>
</tr>
<tr>
	<td><b>User ID:</b></td><td><input type='text' name='uid'></td>
</tr>
<tr>
	<td><b>Password:</b></td><td><input type='password' name='pass'></td>
</tr>
<tr>
	<td><b>User Type:</b></td>
	<td>
	<select name='type'>
	<option>Select One</option>
	<option value='Admin'>Admin</option>
	<option value='Teacher'>Teacher</option>
	<option value='Student'>Student</option>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='OK' class='btn'></td>
	<td align='center'><input type='reset' value='Clear' class='btn'></td>
</tr>
<tr>
	<td align='center' colspan=2><a href='forget_pass.jsp'>Forgot Password?</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<br><br><br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>
</body>
