<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["pass"];
	if(x.value=="" || x.value==null)
	{
		alert("Password cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["name"];
	if(x.value=="" || x.value==null)
	{
		alert("Name cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["addr"];
	if(x.value=="" || x.value==null)
	{
		alert("Address cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["gender"];
	if(x.value!="Male" && x.value!="Female")
	{
		alert("Gender cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["tel"];
	if(x.value=="" || x.value==null)
	{
		alert("Contact number cannot be blank");
		x.focus();
		return false;
	}
	x = document.forms["reg"]["email"];
	if(x.value=="" || x.value==null)
	{
		alert("Email ID cannot be blank");
		x.focus();
		return false;
	}

    	var atpos = x.value.indexOf("@");
    	var dotpos = x.value.lastIndexOf(".");
    	if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.value.length) {
        	alert("Not a valid e-mail address");
		x.focus();        
		return false;
    	}

	
	x = document.forms["reg"]["education"];
	if(x.value=="" || x.value==null)
	{
		alert("select education!!!!");
		x.focus();
		return false;
	}
}
</script>


<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<head>
<link rel="stylesheet" type='text/css' href='button.css'>
</head>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/study","postgres","");

	String loginid= session.getAttribute("teach_id").toString();

	PreparedStatement ps= con.prepareStatement("select * from teacher where loginid=?");

	ps.setString(1,loginid);

	ResultSet rs= ps.executeQuery();
	
	rs.next();
%>
<body background='back.jpg'>
<form name='reg' method ='post' action="edit_teacher_profile1.jsp" onsubmit='return validate()'>
<table align="center" width=650 style='border:1px solid red;background-color:EEEECC;border-radius:8px;box-shadow:8px 8px 8px #888888;'>
<tr>
	<td colspan=2 align='center' style='font-size:18px;'>
	<b>Edit Teacher Details</b>
	</td>
</tr>
<tr>
	<td><b>Username *: </b></td>
	<td><input type="text" name="unm" value='<%=rs.getString(1)%>' readOnly></td></tr>
</tr>
<tr>
	<td><b>Password *: </b></td>
	<td><input type="password" name="pass" value='<%=rs.getString(2)%>'></td>
</tr>
<tr>
	<td><b>Name*: </b></td>
	<td><input type="text" name="name" value='<%=rs.getString(3)%>'></td>
</tr>
<tr>
	<td><b>Address *:<b></td>
	<td>
	<textarea name="addr" rows=5 cols=50><%=rs.getString(4)%></textarea>
	</td>
</tr>
<tr>
	<td><b>Gender *: </b></td>
	<td>
	<select name="gender">
	<option>Select Gender</option>
	<option value="Male" <% if(rs.getString(5).equals("Male")) out.print(" selected");%>>Male</option>
	<option value="Female" <% if(rs.getString(5).equals("Female")) out.print(" selected");%>>Female</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Phone.*:</b></td>
	<td><input type="text" name="tel" value='<%=rs.getString(6)%>'></td>
</tr>
<tr>
	<td><b>Email *: </b></td>
	<td><input type="text" name="email" value='<%=rs.getString(7)%>'></td>
</tr>
<tr>
	<td><b>Education *: </b></td>
	<td>
	<select name="education">
	<option value="">Select One</option>
	<option value="Ph.D" <% if(rs.getString(8).equals("Ph.D")) out.print(" selected");%>>Ph.D</option>
	<option value="MCS" <% if(rs.getString(8).equals("MCS")) out.print(" selected");%>>MCS</option>
	<option value="MCA" <% if(rs.getString(8).equals("MCA")) out.print(" selected");%>>MCA</option>
	<option value="MBA" <% if(rs.getString(8).equals("MBA")) out.print(" selected");%>>MBA</option>
	<option value="ME" <% if(rs.getString(8).equals("ME")) out.print(" selected");%>>ME</option>
	<option value="BE" <% if(rs.getString(8).equals("BE")) out.print(" selected");%>>BE</option>
	<option value="M.Tech" <% if(rs.getString(8).equals("M.Tech")) out.print(" selected");%>>M.Tech</option>
	<option value="B.Tech" <% if(rs.getString(8).equals("B.Teach")) out.print(" selected");%>>B.Tech</option>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Update' class='btn'></td>
	<td align='center'><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
<b>
<p><center><font color="red">Note: Please make sure your details are correct before submitting form and that all fields marked with * are compulsory!.</font></center></p>
</b>
<center><a href='teacher_home.jsp'><img src='home.gif' width=90 height=90/></a></center>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
