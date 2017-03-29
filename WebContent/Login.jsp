<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GBC BLOG SITE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<style>
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
body {font-family: "Open Sans"}
.testbox {
  margin: 10px auto;
  width: 500px; 
  height: 270px; 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #ebebeb; 
  -webkit-box-shadow: 1px 2px 5px}
  form{
 	text-align: center;
 	margin: auto;
  }
.button {
    background-color: green;
    border: none;
    color: white;
    padding: 8px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
</head>
<body class="w3-blue">

<!-- Navigation bar with social media icons -->
<ul class="w3-navbar w3-black w3-hide-small">
 <li><a href="Homepage.jsp"><i class="fa fa-home">&nbsp HOME</i></a></li>
 <li><a href="#"><i class="fa fa-coffee">&nbsp LOGIN</i></a></li>
 <li><a href="Register.jsp"><i class="fa fa-address-card">&nbsp REGISTER</i></a></li>
</ul>
  
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">

  <!-- Header -->
  <header class="w3-container w3-center w3-padding-48 w3-indigo">
    <h1 class="w3-xxxlarge"><b>GBC STUDENTS BLOG SITE</b></h1>
  </header>



  <!-- Grid -->
  <div class="w3-row w3-padding w3-border">

    <!-- Blog entries -->
    <div class="w3-col l8 s12 w3-blue">
 
<div class="testbox">
     <div class="w3-container w3-indigo w3-margin w3-padding-large">
        <div class="w3-center">
          <h3>LOGIN</h3>
        </div>

  <form action = "RegisterServlet" method="post">
	 <input type="hidden" name="pagename" value="login"/>
      <hr>
   
  <label id="icon"  ><i class="icon-user">  <b>USERNAME: </b></i></label>
  <input type="text" name="username" placeholder="Username" required/>
  <br>
  <br>
  <label id="icon"  ><i class="icon-shield">  <b>PASSWORD: </b></i></label>
  <input type="password" name="password"  placeholder="Password" required/>
  <br>
  <br>
  <br>
  <div class="w3-center">
  <a href="Register.jsp">Register</a>-or-<input type="submit" class="button" value="Login">
  </div>
  </form>
</div>
      </div>
<!-- END w3-content -->
</div>



<script>
// Toggle between hiding and showing blog replies/comments
document.getElementById("myBtn").click();
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

</body>
</html>
