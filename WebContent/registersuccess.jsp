<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GBC BLOG SITE</title>
<style>
ul {
    list-style-type: none;
 
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

div.output{
	text-align: center;
 	margin: auto;
    width: 50%;
    border: 2px solid #80aaff;
    padding: 10px;
    background-color:#f2f2f2;
}
h1{
text-align: center;
 border: 2px solid #80aaff;
 margin: auto;
 width: 50%;
 padding: 10px;
 color: white;
 background-color: #4d4dff;
 text-shadow: 2px 2px #000000;
}
</style>

</head>
<body>
<%
String firstName = request.getParameter("firstname");
String lastName = request.getParameter("lastname");
%>
<h1>Congratulations, <%=firstName %> <%=lastName %>  !</h1>

<div class ="output"> <h3>Your registration is now complete.</h3></div>

<ul>
  <li><a class="active" href="Homepage.jsp">Home</a></li>
  <li><a href="Register.jsp">Register</a></li>
  <li><a href="Login.jsp">Log In</a></li>
</ul>
</body>
</html>