<body  background='back.jpg'>
<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String sid = request.getParameter("sid");
	int active = Integer.parseInt(request.getParameter("active"));

	active = active==0?1:0;

	PreparedStatement ps = con.prepareStatement("update student set active=? where loginid=?");

	ps.setInt(1,active);
	ps.setString(2,sid);

	ps.executeUpdate();

	response.sendRedirect("student.jsp");
%>	
	


