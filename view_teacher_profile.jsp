<body background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
       Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");
	
	String loginid= session.getAttribute("teach_id").toString();

	PreparedStatement ps= con.prepareStatement("select * from teacher where loginid=?");

	ps.setString(1,loginid);

	ResultSet rs= ps.executeQuery();
	
	rs.next();
%>
<body background='back.jpg'>
<table align="center" width=650 style='border:1px solid red;background-color:EEEECC;border-radius:8px;box-shadow:8px 8px 8px #888888;'>
<tr>
	<td colspan=2 align='center' style='font-size:18px;'>
	<b>Teacher Details</b>
	</td>
</tr>
<tr>
	<td><b>Username *: </b></td>
	<td><%=rs.getString(1)%></td></tr>
</tr>
<tr>
	<td><b>Password *: </b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Name*: </b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Address *:<b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Gender *: </b></td>
	<td><%=rs.getString(5)%>
	</td>
</tr>
<tr>
	<td><b>Phone.*:</b></td>
	<td><%=rs.getString(6)%></td>
</tr>
<tr>
	<td><b>Email *: </b></td>
	<td><%=rs.getString(7)%></td>
</tr>
<tr>
	<td><b>Education *: </b></td>
	<td><%=rs.getString(8)%></td>
</tr>
</table>
</form>
<b>
<p><center><font color="red">Note: Please make sure your details are correct before submitting form and that all fields marked with * are compulsory!.</font></center></p>
</b>
<center><a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>
</body>



