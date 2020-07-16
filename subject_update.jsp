<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["sname"];

	if(x.value=="" || x.value==null)
	{
		alert("Subject name cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["marks"];
	if(x.value=="" || x.value==null)
	{
		alert("Enter subject marks");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["nol"];
	if(x.value=="" || x.value==null)
	{
		alert("Please enter Number of lectures");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["cid"];
	if(x.value=="" || x.value==null)
	{
		alert("Please enter course name");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["type"];
	if(x.value!="Theory" && x.value!="Practical")
	{
		alert("Please enter Subject type");
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

	int sid = Integer.parseInt(request.getParameter("sid"));
	
	PreparedStatement ps = con.prepareStatement("select * from subject where sub_id=?");
	ps.setInt(1,sid);

	ResultSet rs = ps.executeQuery();

	rs.next();
%>
<body background='back.jpg'>
<form name='reg' method='post' action='subject_update1.jsp' onsubmit='return validate()'>
<table align='center' width=400 style='border:1px solid black;background-color:#EEEECC;border-radius:8px;'>
<tr>
	<td align='center' colspan=2><b>Subject Details</b></td>
</tr>
<tr>
	<td><b>Subject Name:</b></td>
	<td><input type='text' name='sname' value='<%=rs.getString(2)%>'></td>
</tr>
<tr>
	<td><b>Marks:</b></td>
	<td><input type='text' name='marks' value='<%=rs.getInt(3)%>'></td>
</tr>
<tr>
	<td><b>No.of Lectures:</b></td>
	<td><input type='text' name='nol' value='<%=rs.getInt(4)%>'></td>
</tr>

<%
	Statement s1 = con.createStatement();
	ResultSet rs2 = s1.executeQuery("select * from course");
%>
<tr>
	<td><b>Course:</b></td>
	<td>
	<select name='cid'>
<%	
	while(rs2.next()){
%>
	<option value=<%=rs2.getInt(1)%> <%if(rs2.getInt(1)==rs.getInt(5)) out.print(" selected");%>><%=rs2.getString(2)%></option>
<%
	}
%>
	</select>
	</td>
</tr>
<tr>
	<td><b>Type</b></td>
	<td>
	<select name='type'>
	<option value='Theory' <% if(rs.getString(5).equals("Theory")) out.print(" selected");%>>Theory</option>
	<option value='Practical' <% if(rs.getString(5).equals("Practical")) out.print(" selected");%>>Practical</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type='submit' value='Update' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
<input type='hidden' name='sid' value='<%=sid%>'>
</form>
</body>
<center><a href='subject.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
