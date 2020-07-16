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
	int cid = Integer.parseInt(request.getParameter("class"));

	PreparedStatement ps = con.prepareStatement("update student set loginid=?, passwd=?, addr=?, gender=?, phone=?, email=?, dob=?, cid=?, stud_name=? where loginid=?");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	
	java.util.Date d = sdf.parse(dob);

	Date newDOB = new Date(d.getTime());

	ps.setString(1,unm);
	ps.setString(2,pass);
	ps.setString(3,add);
	ps.setString(4,gen);
	ps.setString(5,tel);
	ps.setString(6,email);
	ps.setDate(7,newDOB);
	ps.setInt(8,cid);
	ps.setString(9,name);
	ps.setString(10,unm);
	
	ps.executeUpdate();
	
	response.sendRedirect("student_home.jsp");	
%>
