<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%
	Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/study","postgres","");

	String sname = request.getParameter("sname");
	int mark = Integer.parseInt(request.getParameter("marks"));
	int nol = Integer.parseInt(request.getParameter("nol"));
	int cid = Integer.parseInt(request.getParameter("cid"));
	String type = request.getParameter("type");
	int sid = Integer.parseInt(request.getParameter("sid"));
	

	PreparedStatement ps = con.prepareStatement("update subject set sub_name=?,marks=?,no_of_lects=?,type=?,cid=? where sub_id=?");

	ps.setString(1,sname);
	ps.setInt(2,mark);
	ps.setInt(3,nol);
	ps.setString(4,type);
	ps.setInt(5,cid);	
	ps.setInt(6,sid);

	ps.executeUpdate();

	response.sendRedirect("subject.jsp");
%>

