
/*********************************************************************************
*******************
* Project: assignment1
* Assignment: ASSIGNMENT 1
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: October 27, 2016
* Description: Handles Login and Registration
***********************************************************************************
*****************/
package blog_controllers;

import blog_models.Users;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		 response.setContentType("text/html");
		
		 String hdnParam	=	request.getParameter("pagename");
	if(hdnParam.equals("register")){
	
	       
	  
	    boolean isValid = true;
		
	    RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
	    RequestDispatcher rd2 = request.getRequestDispatcher("registersuccess.jsp");
        
	    String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String confEmail = request.getParameter("confemail");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String telephone = request.getParameter("prim1") + request.getParameter("prim2")+ request.getParameter("prim3") ;
        String year = request.getParameter("year");
        String major = request.getParameter("major");
       
   
     
        if(firstName.isEmpty()||lastName.isEmpty()||email.isEmpty()||confEmail.isEmpty()||telephone.isEmpty()||year.isEmpty()||major.isEmpty())
		{
			request.setAttribute("errorMessage1", "Please fill up all the fields correctly");
			isValid = false;
			
		}
	  
       /* if(isAllLetter(firstName)== false)
        {      
			request.setAttribute("errorMessage2", "Invalid First Name");
			isValid = false;
        }
	  if(isAllLetter(lastName)== false)
        {      
			request.setAttribute("errorMessage3", "Invalid Last Name");
			isValid = false;
        }*/
       	if( (telephone.length() != 10) || (isAPhone(telephone)== false))
        {   
			request.setAttribute("errorMessage4", "Invalid Telephone Number");
			isValid = false;
        }
        if(isValidEmail(email)== false)
        {   
			request.setAttribute("errorMessage5", "Invalid Email Address");
			isValid = false;
        }
        if(email.equals(confEmail)== false)
        {   
			request.setAttribute("errorMessage6", "Email Address doesn't match");
			isValid = false;
        }
        if(isValid== false)
        {
        	 rd.forward(request, response);
        }
    	
        if(isValid==true)
		{
			rd2.forward(request, response);
		}
    	
        Users sets	=	new Users();
        
        sets.setFname(firstName);
		sets.setLname(lastName);
		sets.setEmail(email);
		sets.setTelephone(telephone);
		sets.setYear(year);
		sets.setMajor(major);
		sets.setUser(userName);
		sets.setPassword(password);
	
		try {
			DbManager.Insert(sets);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
 if(hdnParam.equals("login")){
	  PrintWriter out = response.getWriter();
			String UN	=	request.getParameter("username");
			String PW	=	request.getParameter("password");
			HttpSession session = request.getSession();
	
			if((UN.equals("admin")) && (PW.equals("admin"))){
				response.sendRedirect("Welcome.jsp");
			}else{
			
				Users set	=	new Users();
			
			set.setUser(UN);
			set.setPassword(PW);
			try {
				int checkUser	=	DbManager.checkUser(set);
				String name = DbManager.checkName(set);
				
				int uid = DbManager.checkID(set);
				session.setAttribute("savedUserID", uid);
				
				session.setAttribute("savedWholeName", name);
				System.out.println(checkUser);
					if(checkUser == 1){
			
						out.println("HELLO USER " + session.getAttribute("savedWholeName"));
						response.sendRedirect("Welcome.jsp");
					}else{
						response.sendRedirect("Login.jsp");
					}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("CANNOT DO LOGIN");
			}
		}
   }
 }
	
	public boolean isAllLetter(String word){
		String regex = "[a-zA-Z]";
		
		return word.matches(regex);
			
		}
	public boolean isAPhone(String word){
		String regex2 = "[0-9]+";
		
		return word.matches(regex2);
		
		}
	public boolean isValidEmail(String word){
		String regex3 = "^(.+)@(.+)$";
		
		return word.matches(regex3);
		
		}
	
	}


