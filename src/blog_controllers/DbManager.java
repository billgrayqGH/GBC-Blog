/*********************************************************************************
*******************
* Project: COMP3095 Assignment2
* Assignment: ASSIGNMENT 2
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Handles DB TRANSACIONS
***********************************************************************************
*****************/
package blog_controllers;

import blog_models.Users;
import blog_models.Blog;
import blog_models.Comments;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class DbManager {
	
	 
	// Insert Blog Post data on the database
	public static void Post(Blog set) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
		String sql	=	"INSERT INTO POSTS (post_title, post, author,active) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//insert values into database by the user
		pstmt.setString(1, set.getPost_title());
		pstmt.setString(2, set.getPost_content());
		pstmt.setString(3, set.getPost_author());
		pstmt.setInt(4, set.getActive());
		pstmt.executeUpdate();
		conn.close();		
	}
	
	// Insert Comment data on the database
		public static void Comment(Comments set) throws ClassNotFoundException, SQLException{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
			String sql	=	"INSERT INTO COMMENTS (author, post_id,comment) VALUES(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//insert values into database by the user
			pstmt.setString(1, set.getComment_author());
			pstmt.setString(2, set.getPost_id());
			pstmt.setString(3, set.getComment());
			pstmt.executeUpdate();
			conn.close();		
		}
	
	// Insert User data on the database
	public static void Insert(Users set) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
		String sql	=	"INSERT INTO USERS (firstname,lastname,email,phone,year,major,username,password) VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//insert values into database by the user
		pstmt.setString(1, set.getFname());
		pstmt.setString(2, set.getLname());
		pstmt.setString(3, set.getEmail());
		pstmt.setString(4, set.getTelephone());
		pstmt.setString(5, set.getYear());
		pstmt.setString(6, set.getMajor());
		pstmt.setString(7, set.getUser());
		pstmt.setString(8, set.getPassword());
		pstmt.executeUpdate();
		conn.close();		
	}
	
	// Checks if user's username and password is on the database
	public static int checkUser(Users get) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
		String sql	=	"SELECT COUNT(*) FROM USERS WHERE username=? AND password=?";
		PreparedStatement pstmt	=conn.prepareStatement(sql);
		pstmt.setString(1, get.getUser());
		pstmt.setString(2, get.getPassword());
		ResultSet rs	=	pstmt.executeQuery();
		
		int count = 0;
		while(rs.next()){
			count	=	rs.getInt(1);
		}
		conn.close();
		return count;
		
	}
	// Checks the name of the user  on the database
		public static String checkName(Users get) throws ClassNotFoundException, SQLException{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
			String sql	=	"SELECT firstname,lastname FROM USERS WHERE username=? AND password=?";
			PreparedStatement pstmt	=conn.prepareStatement(sql);
			pstmt.setString(1, get.getUser());
			pstmt.setString(2, get.getPassword());
			ResultSet rs	=	pstmt.executeQuery();
			
			String name = "";
			while(rs.next()){
			 name	=	rs.getString(1)+ " " + rs.getString(2);
			}
			conn.close();
			return name;
			
		}
		// Checks if user's username and password is on the database
				public static int checkID(Users get) throws ClassNotFoundException, SQLException{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/comp3095", "root", "admin");
					String sql	=	"SELECT user_id FROM USERS WHERE username=? AND password=?";
					PreparedStatement pstmt	=conn.prepareStatement(sql);
					pstmt.setString(1, get.getUser());
					pstmt.setString(2, get.getPassword());
					ResultSet rs	=	pstmt.executeQuery();
					
					int uid = 0;
					while(rs.next()){
						uid	=	rs.getInt(1);
					}
					conn.close();
					return uid;
					
				}

}