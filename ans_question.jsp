<%@include file="header.jsp"%>
<%@page import="java.sql.*,java.text.*;"%>
<%
	String tlogid = session.getAttribute("teach_id").toString();
	String slogid = request.getParameter("slogid");
	String q = request.getParameter("q");
	String rdate = request.getParameter("rdate");
	String ans = request.getParameter("ans");
	
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	PreparedStatement ps = con.prepareStatement("update questions set answer=?,ans_date=? where tloginid=? and sloginid=? and question=?");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = sdf.parse(rdate);
	Date newRdate = new Date(d.getTime());

	ps.setString(1,ans);
	ps.setDate(2,newRdate);
	ps.setString(3,tlogid);
	ps.setString(4,slogid);
	ps.setString(5,q);

	ps.executeUpdate();

	response.sendRedirect("edit_questions.jsp");
%>

