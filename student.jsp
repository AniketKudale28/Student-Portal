<body  background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	Statement s=con.createStatement();

	
	ResultSet rs= s.executeQuery("select loginid,stud_name,addr,gender,phone,email,dob,cname,active from student,course where student.cid = course.cid");
%>
<br>
<table width='100%' align='center'>
<tr bgcolor='red'>
<th><u>User ID</u></th>
<th><u>Name</u></th>
<th><u>Address</u></th>
<th><u>Gender</u></th>
<th><u>Phone</u></th>
<th><u>Email</u></th>
<th><u>DOB</u></th>
<th><u>Course</u></th>
<th><u>Activate?</u></th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><center><b><%=rs.getString(1)%></b></center></td>
	<td><center><b><%=rs.getString(2)%></b></center></td>
	<td><center><b><%=rs.getString(3)%></b></center></td>
	<td><center><b><%=rs.getString(4)%></b></center></td>
	<td><center><b><%=rs.getString(5)%></b></center></td>
	<td><center><b><%=rs.getString(6)%></b></center></td>
	<td><center><b><%=rs.getString(7)%></b></center></td>
	<td><center><b><%=rs.getString(8)%></b></center></td>
	<td><center>
	<b>
	<a href='student_activate.jsp?sid=<%=rs.getString(1)%>&active=<%=rs.getInt(9)%>'>
	<%=rs.getInt(9)==0?"Activate":"Deactivate"%>
	</a>
	</b></center>
	</td>
</tr>
<%	}	
%>
</table>
<br>
<center><a href='admin_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
	





