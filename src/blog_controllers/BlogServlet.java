/*********************************************************************************
*******************
* Project: assignment1
* Assignment: ASSIGNMENT 1
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Handles Blog Data
***********************************************************************************
*****************/
package blog_controllers;

import blog_models.Blog;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class BlogServlet
 */
@WebServlet("/BlogServlet")
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
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
		
		  HttpSession session = request.getSession(true);
		  String title = request.getParameter("posttitle");
	      String content = request.getParameter("postcontent");
	      String author =  "" + session.getAttribute("savedWholeName");
	      int active = 1;
	      
	      if(title.isEmpty()||content.isEmpty()) 
	      {
	    		request.setAttribute("errorMessage1", "Please fill up all the fields");
	    		response.sendRedirect("Blog.jsp");
	      }
	      else 
	      {
	    	  response.sendRedirect("Welcome.jsp");
	    
	    	  Blog sets = new Blog ();
	    	  
	    	  sets.setPost_title(title);
	    	  sets.setPost_content(content);
	    	  sets.setPost_author(author);
	    	  sets.setActive(active);
	    	  
	    	  
	    		try {
	    			DbManager.Post(sets);
	    		} catch (ClassNotFoundException | SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	      }
	}

}
