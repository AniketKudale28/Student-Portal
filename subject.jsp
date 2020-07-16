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
	if(x.value== 0 )
	{
		alert("Please enter course name");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["type"];
	if(x.value== 0 )
	{
		alert("Please enter Subject type");
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

	String sname = request.getParameter("sname");
	String marks = request.getParameter("marks");
	String nol = request.getParameter("nol");
	String cid = request.getParameter("cid");
	String type = request.getParameter("type");
	String aid = session.getAttribute("aid").toString();

	if(sname!=null && marks!=null && nol!=null && cid!=null && type!=null){
		int m = Integer.parseInt(marks);
		int l = Integer.parseInt(nol);
		int id = Integer.parseInt(cid);

		PreparedStatement ps = con.prepareStatement(
		"insert into Subject(sub_name,marks,no_of_lects,cid,type,aid) values(?,?,?,?,?,?)");

		ps.setString(1,sname);
		ps.setFloat(2,m);
		ps.setInt(3,l);
		ps.setInt(4,id);
		ps.setString(5,type);
		ps.setString(6,aid);

		ps.executeUpdate();
	}
%>
<form name='reg' method='post' action='subject.jsp' onsubmit='return validate()'>
<table align='center' width=400 style='border:1px solid black;background-color:#EEEECC;border-radius:8px;'>
<tr>
	<td align='center' colspan=2><b>Subject Details</b></td>
</tr>
<tr>
	<td><b>Subject Name:</b></td>
	<td><input type='text' name='sname'></td>
</tr>
<tr>
	<td><b>Marks:</b></td>
	<td><input type='text' name='marks'></td>
</tr>
<tr>
	<td><b>No.of Lectures:</b></td>
	<td><input type='text' name='nol'></td>
</tr>
<tr>
	<td><b>Course:</b></td>
	<td>
	<select name='cid'>
	<option value='0'>Select One</option>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from Course");
	while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>
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
	<option value='0'>Select One</option>
	<option value='Theory'>Theory</option>
	<option value='Practical'>Practical</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type='submit' value='Add'class='btn'></td>
	<td><input type='reset' value='Clear'class='btn'></td>
</tr>
</table>
</form>
<%
	s = con.createStatement();
	rs = s.executeQuery("select sub_id,sub_name,marks,no_of_lects,cname,type,subject.aid from Subject,Course where Subject.cid = Course.cid");
%>
<br>
<table width='100%' align='center'>
<tr bgcolor='red'>
<th>Subject ID</th>
<th>Name</th>
<th>Marks</th>
<th>No.of Lectures</th>
<th>Course</th>
<th>Type</th>
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
	<td><%=rs.getInt(3)%></td>
	<td><%=rs.getInt(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td align='center'><a href="subject_remove.jsp?sid=<%=rs.getInt(1)%>"><img src='delete.png' width=70 height=30/></a></td>
	<td align='center'><a href="subject_update.jsp?sid=<%=rs.getInt(1)%>"><img src='update.png' width=70 height=30/></a></td>
</tr>
<%	}
%>
</table><br>

 
<td><center><a href='admin_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>





