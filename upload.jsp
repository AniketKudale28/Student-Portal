<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["subid"];

	if(x.value== 0 )
	{
		alert("Please select subject name");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["doctype"];
	if(x.value=="" || x.value==null)
	{
		alert("Please select document type");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["doc"];
	if(x.value=="" || x.value==null)
	{
		alert("Please select path");
		x.focus();
		return false;
	}
}
</script>


<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<head>
<link rel="stylesheet" type='text/css' href='button.css'>
</head>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from subject");
%>
<body background='back.jpg'>
<form name='reg'  onsubmit='return validate()'method='post' action='upload1.jsp'>
<br><br><br><br>
<table style='border:2px solid;border-radius:8px;background-color:#EEEECC;box-shadow:8px 8px 8px #888888;width:38%;' align='center'>
<tr>
	<td colspan='2' style='font-weight: bold; font-size: 12pt;text-align:center'>Upload Details</span></td>
</tr>
<tr>
	<td>Subject Name:</td>
	<td>
	<select name='subid'>
	<option value='0'>Choose one</option>
	<%	
	while(rs.next()){
	%>
	<option value='<%=rs.getInt(1)%>'><%=rs.getString(2)%></option>
	<%}%>
	</select>
	</td>
</tr>
<tr>
	<td>Document Type:</td>	
	<td>
	<select name='doctype'>
	<option value="">Choose one</option>
	<option value='Presentation'>Presentation</option>
	<option value='Document'>Document</option>
	<option value='Video'>Video</option>
	</select>
	</td>
</tr>
<tr>
	<td>Path:</td>	
	<td><input type='file' name='doc'></td>
</tr>
<tr>
	<td><input type='submit' value='Upload' class='btn'></td>
	<td><input type='reset' value='Clear'class='btn'></td>
</tr>
</form>
</table>
<center><a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>
</body>
