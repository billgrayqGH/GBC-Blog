/*********************************************************************************
*******************
* Project: assignment1
* Assignment: ASSIGNMENT 1
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Handles Database Connection
***********************************************************************************
*****************/
package blog_controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import blog_controllers.ConnectionManager;

public class ConnectionManager {
	
	private static ConnectionManager instance = null;
	
	private final String USERNAME = 	"root";// Username of connection
	private final String PASSWORD = 	"admin";// Password of connection
	private final String DATABASE = 	"comp3095";// Database name
	//private final String CONN_STRING = "jdbc:mysql://localhost/database";
	
	private Connection conn = null;
	
	private ConnectionManager(){
	}
	
	public static ConnectionManager getInstance(){
		if(instance == null){
			instance = new ConnectionManager();
			System.out.println("Connection Doesn't Exist");
		}
		return instance;
	}
	private boolean openConnection(){
		try {
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DATABASE+"?"
		              + "user="+USERNAME+"&password="+PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Connection Doesn't Exist...");
			e.printStackTrace();
		}
		return true;
	}
	public Connection getConnection(){
			if(conn == null){
				if(openConnection()){
						System.out.println("Connection Opened");
						return conn;
				}else{
					System.out.println("Connection Not Opened");
					return null;
				}
			}
			return conn;
	}
	public void close(){
		System.out.println("Closing Connection");
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn = null;
	}
}
