<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["ans"];
	if(x.value=="" || x.value==null)
	{
		alert("please reply question with appropriate answer..!");
		x.focus();
		return false;
	}
	
}
</script>
<body background='back.jpg'>
<%@include file="header.jsp"%>
<%@page import="java.sql.*,java.text.*"%>
<%
	SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
	String d1 = d.format(new java.util.Date());

	String tlogid = session.getAttribute("teach_id").toString();
	String slogid = request.getParameter("slogid");
	String q = request.getParameter("q");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	PreparedStatement ps = con.prepareStatement("select post_date,answer from questions where tloginid=? and sloginid=? and question=?");
	ps.setString(1,tlogid);
	ps.setString(2,slogid);
	ps.setString(3,q);

	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method='post' name='reg' onsubmit='return validate()' action='ans_question.jsp'>
<table align='center' style='border:1px solid black;background-color:pink;'>
<tr>
	<td colspan=2 style='text-align:center;font-size:14pt;'>Reply Question</td>
</tr>
<tr>
	<td>Student ID:</td>
	<td><input type='text' name='slogid' value='<%=slogid%>' readonly></td>
</tr>
<tr>
	<td>Post Date:</td>
	<td><input type='text' name='rdate' value='<%=rs.getString(1)%>' readonly></td>
</tr>
<tr>
	<td>Reply Date:</td>
	<td><input type='text' name='rdate' value='<%=d1%>' readonly></td>
</tr>
<tr>
	<td>Question:</td>
	<td><input type='text' name='q' value='<%=q%>' readonly></td>
</tr>
<tr>
	<td>Answer:</td>
	<td><textarea name='ans' rows=5 cols=50><% if(rs.getString(2)!=null) out.print(rs.getString(2));%></textarea></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Submit'></td>
	<td align='center'><input type='reset' value='Clear'></td>
</tr>
</table>
</form>
<center><a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
