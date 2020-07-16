<body background='back.jpg'>
<%@include file="header.jsp"%>
<style>
#menu {
    width: 100%;
    height: 35px;
    font-size: 16px;
    font-family: Tahoma, Geneva, sans-serif;
    font-weight: bold;
    text-align: center;
    text-shadow: 3px 2px 3px #333333;
    background-color: #8AD9FF;
    border-radius: 8px;
}

#menu a {
    text-decoration: none;
    color: black;
    padding: 8px 8px 8px 8px;
    font-size: 16px;
    font-family: Tahoma, Geneva, sans-serif;
    font-weight: bold;
    text-shadow: 3px 2px 3px white;
}

#menu a:hover {
    color: #F90;
    background-color: #FFF;
}
</style>
<div id="menu">
<table width='100%'>
<tr>
	<td align='center'><b>Welcome</b> <%=session.getAttribute("teach_id")%></td>
	<td align='center'><a href='view_teacher_profile.jsp'>View Profile</a></td>
	<td align='center'><a href='edit_teacher_profile.jsp'>Edit Profile</a></td>
	<td align='center'><a href='upload.jsp'>Upload</a></td>
	<td align='center'><a href='view_documents.jsp'>View Documents</a></td>
	<td align='center'><a href='edit_questions.jsp'>Reply Questions</a></td>
	<td align='center'><a href='logout.jsp'>Logout</a></td>
</tr>
</table>
</div>
<br>
<table width='100%'>
<tr>
	<td align='center'>
	<img src='teacher.jpg' width=300 height=300/>
	</td>
</tr>
</table>
<br>
<br>
<div style='border:1px solid white;position:absolute;bottom:0;left:10px;right:10px;color:black;'>
<p align='center'>&copy; Copyright Reserved 2015-16&nbsp;&nbsp;<a href="http://www.study-center.com" style='font-size:19px;text-decoration:none;color:red;font-weight:bold;text-shadow:2px 2px 2px black;'>STUDY CENTER</a></p>
</div>

</body>
