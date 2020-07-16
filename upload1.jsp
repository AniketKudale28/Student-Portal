<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String loginid = session.getAttribute("teach_id").toString();
	int sid = Integer.parseInt(request.getParameter("subid"));
	String doc_type = request.getParameter("doctype");
	String doc_path = request.getParameter("doc");

	java.util.Date d = new java.util.Date();
	Date upDate = new Date(d.getTime());	

	PreparedStatement ps = con.prepareStatement("insert into documents values(?,?,?,?,?)");

	ps.setString(1,loginid);
	ps.setInt(2,sid);
	ps.setString(3,doc_type);
	ps.setDate(4,upDate);
	ps.setString(5,doc_path);

	ps.executeUpdate();
%>
<body background='back.jgp'>
<h4>Document uploaded successfully.</h4>
<a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
