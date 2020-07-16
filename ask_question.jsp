<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<script>
function validate()
{
	x = document.forms["ask"]["tloginid"];
	if(x.value == 0)
	{
		alert("Please select teacher");
		x.focus();
		return false;
	}
	x = document.forms["ask"]["sid"];
	if(x.value == 0)
	{
		alert("Please select subject");
		x.focus();
		return false;
	}
	x = document.forms["ask"]["question"];
	if(x.value == "" || x==null)
	{
		alert("Please enter your question");
		x.focus();
		return false;
	}

}
</script>
<%
	java.util.Date d = new java.util.Date();
	Date d1 = new Date(d.getTime());

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select loginid,name from teacher");
%>
<body background='back.jpg'>

<table align='center'>
<td><img src='question.gif' width='400' height='400'></td>
<td><img src='.gif' width='400' height='400'></td>

</table>

<form method='post' action='add_question.jsp' name='ask' onsubmit='return validate()'>
<table align='center' style='border:1px solid black;background-color:pink;'>
<tr>
	<td colspan=2 style='text-align:center;font-size:14pt;'>Post Question</td>
</tr>
<tr>
	<td>Post Date:</td>
	<td><input type='text' name='pdate' value='<%=d1%>' readonly></td>
</tr>
<tr>
	<td>Teacher:</td>
	<td>
	<select name='tloginid'>
	<option value='0'>Choose one</option>
<%
	while(rs.next()){
%>
	<option value='<%=rs.getString(1)%>'><%=rs.getString(2)%></option>
<%
	}
%>
	</select>
	</td>	
</tr>
<tr>
	<td>Subject:</td>
	<td>
	<select name='sid'>
	<option value='0'>Choose one</option>
<%
	PreparedStatement ps = con.prepareStatement("select sub_id,sub_name from subject where cid = (select cid from student where loginid=?)");
	String logid = session.getAttribute("stud_id").toString();
	ps.setString(1,logid);
	rs = ps.executeQuery();
	while(rs.next()){
%>
	<option value='<%=rs.getString(1)%>'><%=rs.getString(2)%></option>
<%
	}
%> 
	</select>
	</td>	
</tr>
<tr>
	<td>Question:</td>
	<td><textarea name='question' rows=5 cols=50></textarea></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Submit'></td>
	<td align='center'><input type='reset' value='Clear'></td>
</tr>
</table>
</form>
<center><a href='student_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
