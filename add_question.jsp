<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String slogid = session.getAttribute("stud_id").toString();
	String pdate = request.getParameter("pdate");
	String tlogid = request.getParameter("tloginid");
	int sid = Integer.parseInt(request.getParameter("sid"));
	String question = request.getParameter("question");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = sdf.parse(pdate);
	Date postDate = new Date(d.getTime());

	PreparedStatement ps = con.prepareStatement("insert into questions(sloginid,tloginid,sub_id,question,post_date) values(?,?,?,?,?)");

	ps.setString(1,slogid);
	ps.setString(2,tlogid);
	ps.setInt(3,sid);
	ps.setString(4,question);
	ps.setDate(5,postDate);

	ps.executeUpdate();
%>
<body background='back.jpg'>
<h3>Question uploaded successfully.<h3>
Click <a href='ask_question.jsp'>here</a> to add more questions.<br>
<a href='student_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>

