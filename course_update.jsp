<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["cname"];

	if(x.value=="" || x.value==null)
	{
		alert("Course name cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["fees"];
	if(x.value=="" || x.value==null)
	{
		alert("Please enter fees");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["not"];
	if(x.value=="" || x.value==null)
	{
		alert("Please enter Number of theory");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["nop"];
	if(x.value=="" || x.value==null)
	{
		alert("Please enter Number of practicle");
		x.focus();
		return false;
	}
	}
</script>

<%@page import="java.sql.*"%>
<head>
<link rel="stylesheet" type='text/css' href='button.css'>
</head>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	int cid = Integer.parseInt(request.getParameter("cid"));
	
	PreparedStatement ps = con.prepareStatement("select * from Course where cid=?");
	ps.setInt(1,cid);

	ResultSet rs = ps.executeQuery();

	rs.next();
%>
<body background='back.jpg'>
<form name='reg' method='post' action='course_update1.jsp' onsubmit='return validate()'>
<table align='center' width=400 style='border:1px solid black;background-color:#EEEECC;border-radius:8px;'>
<tr>
	<td align='center' colspan=2><b>Course Details</b></td>
</tr>
<tr>
	<td><b>Course ID:</b></td>
	<td><input type='text' name='cid' value='<%=rs.getInt(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Course Name:</b></td>
	<td><input type='text' name='cname' value='<%=rs.getString(2)%>'></td>
</tr>
<tr>
	<td><b>Fees:</b></td>
	<td><input type='text' name='fees' value='<%=rs.getFloat(3)%>'></td>
</tr>
<tr>
	<td><b>No.of Theory:</b></td>
	<td><input type='text' name='not' value='<%=rs.getInt(4)%>'></td>
</tr>
<tr>
	<td><b>No.of Practicals:</b></td>
	<td><input type='text' name='nop' value='<%=rs.getInt(5)%>'></td>
</tr>
<tr>
	<td><b>Admin ID:</b></td>
	<td><input type='text' name='aid' value='<%=rs.getString(6)%>' readOnly></td>
</tr>
<tr>
	<td><input type='submit' value='Update'class='btn'></td>
	<td><input type='reset' value='Clear'class='btn'></td>
</tr>
</table>
</form>
<center><a href='admin_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>

