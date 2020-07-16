<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con=	DriverManager.getConnection("jdbc:postgresql://localhost:5432/study","postgres","");
	String tid=request.getParameter("tid");	
		
	PreparedStatement ps =con.prepareStatement("delete from teacher where loginid=?");
	ps.setString(1,tid);
	ps.executeUpdate();
	response.sendRedirect("delete_faculty.jsp");
		
%>
