<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="java.sql.*" import="java.sql.ResultSet"%>
<% 	Class.forName("com.mysql.jdbc.Driver"); %>
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
<style>
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
body {font-family: "Open Sans"}
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


<ul class="w3-navbar w3-black w3-hide-small">
<% String user = "" + session.getAttribute("savedWholeName");
%>
 <li><a href="Welcome.jsp"><i class="fa fa-home">WELCOME <%=user %></i> </a></li>
 <li><a href="Blog.jsp"><i class="fa fa-address-card">&nbsp POST A BLOG</i></a></li>
 <li class="w3-right"><a href="Login.jsp"><i class="fa fa-coffee">
 <%
session.invalidate();
%>
</i>&nbsp LOGOUT</a></li>

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
    <div class="w3-col l8 s12">
           <%    Connection connection3 = DriverManager.getConnection(
            		"jdbc:mysql://localhost/comp3095", "root", "admin"); 
                 PreparedStatement statement3 = connection3.prepareStatement("select post_title,author,date_added,post,post_id from posts order by post_id desc");

                ResultSet resultset3 = statement3.executeQuery() ; %> 
    
      <!-- Blog entry -->
       <% while(resultset3.next()){ %>
      <div class="w3-container w3-white w3-margin w3-padding-large">
        <div class="w3-center">
          <h3><b>  <%= resultset3.getString(1) %></b></h3>
          <h5>BY: <%= resultset3.getString(2) %>, <span class="w3-opacity"><%= resultset3.getString(3) %></span></h5>
        </div>
        <div class="w3-justify">
          <p><%= resultset3.getString(4) %> </p>
     
          <p class="w3-left"><button class="w3-btn w3-white w3-border"><b><i class="fa fa-thumbs-up"></i> Like</b></button></p>
          <p class="w3-right"><button class="w3-btn" onclick="myFunction('demo1')" id="myBtn"><b> Comments  </b> <span class="w3-tag w3-white"></span></button></p>
          <p class="w3-clear"></p>
            <hr>
            
         <% String pID = resultset3.getString(5); 
                    PreparedStatement statement4 = connection3.prepareStatement("select author, date_added,comment from comments where post_id like ?");
                	statement4.setString(1, " "+ pID);
                    ResultSet resultset4 = statement4.executeQuery();%> 
                    <% while(resultset4.next()){ %>
             
                <h4><%= resultset4.getString(1) %> <span class="w3-opacity w3-medium"><%= resultset4.getString(2) %></span></h4>
                <p><%= resultset4.getString(3) %></p>
                 <% } %>   
                 <hr>
        </div>
      </div>
            <form action ="CommentServlet" method="post">
            <input type="hidden" name="author" value="<%=user %>"/>
             <input type="hidden" name="postID" value=" <%= resultset3.getString(5)%>"/>
          	  <textarea class="textarea" rows="10" cols="50" name="comment" placeholder="Write a Comment" required></textarea>
               <br>
               <br>
                 <%String errorMessage1=(String)request.getAttribute("errorMessage1");  
	   				if(errorMessage1!=null)
	   				out.println("<font color=red size=4px>"+errorMessage1+"</font>");
	    		  %>   
				  <div class="w3-center">
				   <input type="submit" class="button" value="Comment">
				  </div>
				  <br>
			      <br>
			      <br>
			      <br>
              </form>
       <hr>
       
        <% } %>
          </div>
       
     </div>
    
   
    

  

<!-- END w3-content -->
</div>


<!-- Footer -->
<footer class="w3-container w3-indigo w3-padding-32 w3-padding-xlarge">
  <a href="#" class="w3-btn w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>

</footer>

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
