<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/study","postgres","");

	int cid = Integer.parseInt(request.getParameter("cid"));
	String cname = request.getParameter("cname");
	float f = Float.parseFloat(request.getParameter("fees"));
	int t = Integer.parseInt(request.getParameter("not"));
	int p = Integer.parseInt(request.getParameter("nop"));
	String aid = session.getAttribute("aid").toString();

	PreparedStatement ps = con.prepareStatement(
		"update Course set cname=?,fees=?,no_of_theory=?,no_of_practicals=?,aid=? where cid=?");

	ps.setString(1,cname);
	ps.setFloat(2,f);
	ps.setInt(3,t);
	ps.setInt(4,p);
	ps.setString(5,aid);
	ps.setInt(6,cid);

	ps.executeUpdate();

	response.sendRedirect("course.jsp");
%>

