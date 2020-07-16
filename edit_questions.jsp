<body background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
	String loginid = session.getAttribute("teach_id").toString();

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	PreparedStatement ps = con.prepareStatement("select student.loginid,student.stud_name,sub_name,question,answer,post_date,ans_date from student,questions,subject where subject.sub_id=questions.sub_id and student.loginid = questions.sloginid and tloginid=?");
	ps.setString(1,loginid);
	ResultSet rs = ps.executeQuery();

	ps.setString(1,loginid);

	rs = ps.executeQuery();
%>
<table border=1 align='center'>
<tr>
	<th>Student ID</th>
	<th>Student Name</th>
	<th>Subject Name</th>
	<th>Question</th>
	<th>Answer</th>	
	<th>Post Date</th>
	<th>Answer Date</th>
	<th>Reply</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
<%
		for(int i=1;i<=7;i++){
%>
		<td><% if(rs.getString(i)==null) out.print("-"); else out.print(rs.getString(i));%></td>
<%
		}
%>
		<td><a href='reply.jsp?slogid=<%=rs.getString(1)%>&q=<%=rs.getString(4)%>'>Reply</a></td>
</tr>
<%
	}
%>
</table>
</body>
<center><a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
