<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String unm = request.getParameter("unm");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String gen = request.getParameter("gender");
	String add = request.getParameter("addr");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String dob = request.getParameter("dob");
	String edu = request.getParameter("Education");

	PreparedStatement ps = con.prepareStatement("insert into Teacher(uname, passwd,teach_name, addr, gender, phone, email, dob, education) values(?,?,?,?,?,?,?,?,?)");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	
	java.util.Date d = sdf.parse(dob);

	Date newDOB = new Date(d.getTime());

	ps.setString(1,unm);
	ps.setString(2,pass);
	ps.setString(3,name);
	ps.setString(4,add);
	ps.setString(5,gen);
	ps.setString(6,tel);
	ps.setString(7,email);
	ps.setDate(8,newDOB);
	ps.setString(9,edu);
	ps.executeUpdate();
%>
<h1>Registration Successful !!!!!!</h1>
Wait for Approval.
<center><a href='index.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
