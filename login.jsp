<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String uid = request.getParameter("uid");
 	String pass = request.getParameter("pass");
	String type = request.getParameter("type");

	if(type.equals("Admin")){	
		PreparedStatement ps = con.prepareStatement("select * from Admin where uid=? and pass=?");
		ps.setString(1,uid);
		ps.setString(2,pass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			session.setAttribute("aid",uid);
			response.sendRedirect("admin_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");
		}
	}
	
	if(type.equals("Student")){	
		PreparedStatement ps = con.prepareStatement("select * from student where loginid=? and passwd=? and active=1");
		ps.setString(1,uid);
		ps.setString(2,pass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next())
		{	
			session.setAttribute("stud_id",uid);
			response.sendRedirect("student_home.jsp");
		}
		else 
		{
			response.sendRedirect("err.jsp");
		}
	}
	if(type.equals("Teacher")){	
		PreparedStatement ps = con.prepareStatement("select * from teacher where loginid=? and passwd=? and active=1");
		ps.setString(1,uid);
		ps.setString(2,pass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next())
		{
			session.setAttribute("teach_id",uid);
			response.sendRedirect("teacher_home.jsp");
		}
		else
		{
			response.sendRedirect("err.jsp");
		}
	}
%>
	
