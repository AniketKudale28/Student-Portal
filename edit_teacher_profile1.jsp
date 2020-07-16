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
	String edu = request.getParameter("education");

	PreparedStatement ps = con.prepareStatement("update teacher set loginid=?, passwd=?,name=?, address=?, gender=?, phone=?, email=?, qualification=? where loginid=?");

	ps.setString(1,unm);
	ps.setString(2,pass);
	ps.setString(3,name);
	ps.setString(4,add);
	ps.setString(5,gen);
	ps.setString(6,tel);
	ps.setString(7,email);
	ps.setString(8,edu);
	ps.setString(9,unm);

	ps.executeUpdate();

	response.sendRedirect("teacher_home.jsp");
%>

