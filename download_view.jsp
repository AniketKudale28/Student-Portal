<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	Statement s = con.createStatement();

	ResultSet rs = s.executeQuery("select name,sub_name,doc_type,upload_date,doc_path from teacher,subject,documents where teacher.loginid = documents.loginid and subject.sub_id = documents.sub_id");
%>
<body background='back.jpg'>
<table border=1 align='center'>
<tr>
	<th>Teacher Name</th>
	<th>Subject Name</th>
	<th>Document Type</th>
	<th>Upload Date</th>
	<th>File Name</th>	
	<th>Download</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
<%
		for(int i=1;i<=5;i++){
%>
		<td><%=rs.getString(i)%></td>
<%
		}
%>
		<td><a href='<%=rs.getString(5)%>'><img src='download.gif' width='170' height='100'></a></td>
</tr>
<%
	}
%>
</table>
<center><a href='student_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
