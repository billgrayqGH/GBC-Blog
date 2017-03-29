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
  height: 620px; 
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
 <li><a href="Homepage.jsp"><i class="fa fa-home"></i>&nbsp HOME</a></li>
 <li><a href="Login.jsp"><i class="fa fa-coffee"></i>&nbsp LOGIN</a></li>
 <li><a href="#"><i class="fa fa-address-card"></i>&nbsp REGISTER</a></li>
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
          <h3>REGISTER</h3>
        </div>


<form action = "RegisterServlet" method="post">
<input type="hidden" name="pagename" value="register"/>
      <hr>
  <label id="icon"  ><i class="fa fa-user-circle">  <b>FIRSTNAME: </b></i></label>
  <input type="text" name="firstname" placeholder="Firstname" required/>
  <br>
  <%String errorMessage2=(String)request.getAttribute("errorMessage2");  
   				if(errorMessage2!=null)
   				out.println("<font color=red size=4px>"+errorMessage2+"</font>");
    		  %> 
  <br>
  <label id="icon"  ><i class="fa fa-user-circle">  <b>LASTNAME: </b></i></label>
  <input type="text" name="lastname" placeholder="Lastname" required/>
  <br>
  <%String errorMessage3=(String)request.getAttribute("errorMessage3");  
   				if(errorMessage3!=null)
   				out.println("<font color=red size=4px>"+errorMessage3+"</font>");
    		  %> 
  <br>
  <label id="icon"  ><i class="fa fa-envelope-open">  <b>EMAIL: </b></i></label>
  <input type="text" name="email" placeholder="Email" required/>
  <br>
  <%String errorMessage5=(String)request.getAttribute("errorMessage5");  
   				if(errorMessage5!=null)
   				out.println("<font color=red size=4px>"+errorMessage5+"</font>");
    		  %> 
  <br>
  <label id="icon"  ><i class="fa fa-envelope-open">  <b>CONFIRM EMAIL: </b></i></label>
  <input type="text" name="confemail" placeholder="Confirm email" required/>
  <br>
  <%String errorMessage6=(String)request.getAttribute("errorMessage6");  
   				if(errorMessage6!=null)
   				out.println("<font color=red size=4px>"+errorMessage6+"</font>");
    		  %> 
  <br>
  <label id="icon"  ><i class="icon-user">  <b>USERNAME: </b></i></label>
  <input type="text" name="username" placeholder="Username" required/>
  <br>
  <br>
  <label id="icon"  ><i class="icon-shield">  <b>PASSWORD: </b></i></label>
  <input type="password" name="password"  placeholder="Password" required/>
  <br>
  <br>
  <label id="icon"  ><i class="fa fa-mobile-phone">  <b>PHONE NUMBER: </b></i></label>
   (<input name="prim1" type="text" id="prim1" size="3" >)
	<input name="prim2" type="text" id="prim2" size="3" >
	<input name="prim3" type="text" id="prim3" size="4" >
  <br>
  <%String errorMessage4=(String)request.getAttribute("errorMessage4");  
   				if(errorMessage4!=null)
   				out.println("<font color=red size=4px>"+errorMessage4+"</font>");
    		  %> 
  <br>
  <label id="icon"  ><i class="fa fa-mortar-board">  <b>YEAR: </b></i></label>	
  <select name="year" id="year">
		<option selected disabled>Select One...</option>
			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
 </select>
 <br>
 <br>
  <label id="icon"  ><i class="fa fa-object-group">  <b>MAJOR: </b></i></label>
  <select name="major" id="major">
			<option selected disabled>Select One...</option>
  			<option value="Accounting">Accounting</option>
  			<option value="Art">Art</option>
  			<option value="Business">Business</option>
  			<option value="Computer Science">Computer Science</option>
  		    <option value="Engineering">Engineering</option>
  		    <option value="Fashion">Fashion</option>
  			<option value="Health Care">Health Care</option>
  			
  	
  		
		</select>
     
  <br>
  <br>
    <%String errorMessage1=(String)request.getAttribute("errorMessage1");  
   				if(errorMessage1!=null)
   				out.println("<font color=red size=4px>"+errorMessage1+"</font>");
    		  %> 
  <br>
  <div class="w3-center">
  <a href="Login.jsp">Login</a>-or-<input type="submit" class="button" value="Register">
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
