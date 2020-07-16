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


<body background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<head>
<link rel="stylesheet" type='text/css' href='button.css'>
</head>
<%
	Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/study","postgres","");

	String cname = request.getParameter("cname");
	String fees = request.getParameter("fees");
	String not = request.getParameter("not");
	String nop = request.getParameter("nop");
	String aid = session.getAttribute("aid").toString();

	if(cname!=null && fees!=null && not!=null && nop!=null){
		float f = Float.parseFloat(fees);
		int t = Integer.parseInt(not);
		int p = Integer.parseInt(nop);

		PreparedStatement ps = con.prepareStatement(
		"insert into Course(cname,fees,no_of_theory,no_of_practicals,aid) values(?,?,?,?,?)");

		ps.setString(1,cname);
		ps.setFloat(2,f);
		ps.setInt(3,t);
		ps.setInt(4,p);
		ps.setString(5,aid);

		ps.executeUpdate();
	}
%>
<form name='reg'method='post' action='course.jsp' onsubmit='return validate()'>
<table align='center' width=400 style='border:1px solid black;background-color:#EEEECC;border-radius:8px;'>
<tr>
	<td align='center' colspan=2><b>Course Details</b></td>
</tr>
<tr>
	<td><b>Course Name:</b></td>
	<td><input type='text' name='cname'></td>
</tr>
<tr>
	<td><b>Fees:</b></td>
	<td><input type='text' name='fees'></td>
</tr>
<tr>
	<td><b>No.of Theory:</b></td>
	<td><input type='text' name='not'></td>
</tr>
<tr>
	<td><b>No.of Practicals:</b></td>
	<td><input type='text' name='nop'></td>
</tr>
<tr>
	<td><input type='submit' value='Add'class='btn'></td>
	<td><input type='reset' value='Clear'class='btn'></td>
</tr>
</table>
</form>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from Course");
%>
<br>
<table width='100%' align='center'>
<tr bgcolor='red'>
<th>Course ID</th>
<th>Name</th>
<th>Fees</th>
<th>Theory</th>
<th>Practical</th>
<th>Admin</th>
<th>Remove?</th>
<th>Update?</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getFloat(3)%></td>
	<td><%=rs.getInt(4)%></td>
	<td><%=rs.getInt(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td align='center'><a href="course_remove.jsp?cid=<%=rs.getInt(1)%>"><img src='delete.png' width=70 height=30/></a></td>
	<td align='center'><a href="course_update.jsp?cid=<%=rs.getInt(1)%>"><img src='update.png' width=70 height=30/></a></td>
</tr>
<%	}
%>
</table><br>
<center><a href='admin_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>





