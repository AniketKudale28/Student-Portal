<body  background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	Statement s=con.createStatement();

	
	ResultSet rs= s.executeQuery("select * from course");

%>
<br>
<table width='100%' align='center'>
<tr bgcolor='red'>
<th><u>Course ID</u></th>
<th><u>Name</u></th>
<th><u>Fees</u></th>
<th><u>Theory</u></th>
<th><u>Practical</u></th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><center><b><%=rs.getInt(1)%></b></center></td>
	<td><center><b><%=rs.getString(2)%></b></center></td>
	<td><center><b><%=rs.getFloat(3)%></b></center></td>
	<td><center><b><%=rs.getInt(4)%></b></center></td>
	<td><center><b><%=rs.getInt(5)%></b></center></td>
</tr>
<%	}	
%>
</table>
<br>
<center><a href='index.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
