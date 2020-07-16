<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	int cid = Integer.parseInt(request.getParameter("cid"));
	
	PreparedStatement ps = con.prepareStatement("delete from student where cid=?");
	ps.setInt(1,cid);
	ps.executeUpdate();


	ps = con.prepareStatement("delete from documents where sub_id in(select sub_id from subject where cid=?)");
	ps.setInt(1,cid);
	ps.executeUpdate();


	ps = con.prepareStatement("delete from subject where cid=?");
	ps.setInt(1,cid);
	ps.executeUpdate();

	ps = con.prepareStatement("delete from Course where cid=?");
	ps.setInt(1,cid);

	ps.executeUpdate();

	response.sendRedirect("course.jsp");
%>
