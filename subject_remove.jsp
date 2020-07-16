<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	int sid = Integer.parseInt(request.getParameter("sid"));


	PreparedStatement ps = con.prepareStatement("delete from questions where sub_id=?");
	ps.setInt(1,sid);
	ps.executeUpdate(); 
	ps = con.prepareStatement("delete from documents where sub_id =?");
	ps.setInt(1,sid);
	ps.executeUpdate();
	
	 ps = con.prepareStatement("delete from subject where sub_id=?");
	ps.setInt(1,sid);

	ps.executeUpdate();

	response.sendRedirect("subject.jsp");
%>


