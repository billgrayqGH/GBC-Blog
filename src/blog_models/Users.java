/*********************************************************************************
*******************
* Project: COMP3095 Assignment2
* Assignment: ASSIGNMENT 2
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Users Getters and Setters
***********************************************************************************
*****************/
package blog_models;

public class Users {
	// Variables
		private String fname;
		private String  lname;
		private String  email;
		private String user;
		private String password;
		private String telephone;
		private String year;
		private String major;
		
		// returns variables
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getLname() {
			return lname;
		}
		public void setLname(String lname) {
			this.lname = lname;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getTelephone() {
			return telephone;
		}
		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}
		public String getYear() {
			return year;
		}
		public void setYear(String year) {
			this.year = year;
		}
		public String getMajor() {
			return major;
		}
		public void setMajor(String major) {
			this.major = major;
		}
}
