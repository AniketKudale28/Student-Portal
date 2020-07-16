<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con=	DriverManager.getConnection("jdbc:postgresql://localhost:5432/study","postgres","");
	String sid=request.getParameter("sid");	
		
	PreparedStatement ps =con.prepareStatement("delete from student where loginid=?");
	ps.setString(1,sid);
	ps.executeUpdate();
	response.sendRedirect("delete_student.jsp");
		
%>
