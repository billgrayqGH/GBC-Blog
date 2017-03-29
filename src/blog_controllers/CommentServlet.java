/*********************************************************************************
*******************
* Project: assignment1
* Assignment: ASSIGNMENT 1
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Handles Comment Data
***********************************************************************************
*****************/
package blog_controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_models.Comments;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		  String id = "" + request.getParameter("postID");
	      String author = request.getParameter("author");
		  String comment = request.getParameter("comment");
	   
	     
	      
	      if(comment.isEmpty()||author.isEmpty()) 
	      {
	    		request.setAttribute("errorMessage1", "Please create a comment");
	    		response.sendRedirect("Welcome.jsp");
	      }
	      else 
	      {
	    	  response.sendRedirect("Welcome.jsp");
	    
	    	  Comments sets = new Comments ();
	    	  
	    	
	    	sets.setComment_author(author);
	    	sets.setPost_id(id);
	    	sets.setComment(comment);
	    	  
	    		try {
	    			DbManager.Comment(sets);
	    		} catch (ClassNotFoundException | SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	      }
	}

}
