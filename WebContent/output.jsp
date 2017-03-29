<%@ page import="java.sql.*" %>

<% 	Class.forName("com.mysql.jdbc.Driver"); %>

<HTML>
    <HEAD>
        <TITLE>Selecting Publishers From a Database</TITLE>
    </HEAD>

    <BODY>
        <H1>USERS LOL</H1>

        <% 
            Connection connection = DriverManager.getConnection(
            		"jdbc:mysql://localhost/comp3095", "root", "admin");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from users") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH> First Name</TH>
                <TH> Last Name</TH>
                <TH> Email</TH>
                <TH> Phone</TH>
                <TH> Year</TH>
                <TH> Major</TH>
                <TH> Username</TH>
                <TH> Password</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
                <TD> <%= resultset.getString(7) %></TD>
                <TD> <%= resultset.getString(8) %></TD>
                <TD> <%= resultset.getString(9) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
        
        <H1>POSTS LOL</H1>

        <% 
            Connection connection2 = DriverManager.getConnection(
            		"jdbc:mysql://localhost/comp3095", "root", "admin");

            Statement statement2 = connection.createStatement() ;
            ResultSet resultset2 = statement.executeQuery("select * from posts order by post_id desc") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH> Post Title</TH>
                <TH> Post Content</TH>
                <TH> Author</TH>
                <TH> Active</TH>
                <TH> Date Added</TH>
            </TR>
            <% while(resultset2.next()){ %>
            <TR>
                <TD> <%= resultset2.getString(1) %></td>
                <TD> <%= resultset2.getString(2) %></TD>
                <TD> <%= resultset2.getString(3) %></TD>
                <TD> <%= resultset2.getString(4) %></TD>
                <TD> <%= resultset2.getString(5) %></TD>
                <TD> <%= resultset2.getString(6) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
        
        <H1>COMMENTS LOL</H1>


        <TABLE BORDER="1">
          
            
              <TR>
           
            <%    Connection connection3 = DriverManager.getConnection(
            		"jdbc:mysql://localhost/comp3095", "root", "admin"); 
                 PreparedStatement statement3 = connection3.prepareStatement("select post_title,author,date_added,post,post_id from posts order by post_id desc");

                ResultSet resultset3 = statement3.executeQuery() ; %> 
                
                <% while(resultset3.next()){ %>
                 <TR>
                   <TD>
                   <h1> <%= resultset3.getString(1) %>
                   <br> <%= resultset3.getString(2) %>
                   <br> <%= resultset3.getString(3) %>
                   <br> <%= resultset3.getString(4) %>
                   </h1>
                   </TD>
                  
                  <% String pID = resultset3.getString(5); 
                    PreparedStatement statement4 = connection3.prepareStatement("select author, date_added,comment from comments where post_id like ?");
                	statement4.setString(1, " "+ pID);
                    ResultSet resultset4 = statement4.executeQuery();%> 
                    <% while(resultset4.next()){ %>
                    <TR>
                    <TD><%= resultset4.getString(1) %>
                    <br><%= resultset4.getString(2) %>
                    <br><%= resultset4.getString(3) %>
                    </TD>
                   
                    </TR> 
                     <% } %>
                </TR>
            
           
             <% } %>
           </TR>
        </TABLE>
    </BODY>
</HTML>