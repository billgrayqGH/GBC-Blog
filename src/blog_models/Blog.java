/*********************************************************************************
*******************
* Project: COMP3095 Assignment2
* Assignment: ASSIGNMENT 2
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Blog Post Getters and Setters
***********************************************************************************
*****************/
package blog_models;

public class Blog {

	private String post_title;
	private String post_content;
	private String post_author;
	private int active;
	
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_author() {
		return post_author;
	}
	public void setPost_author(String post_author) {
		this.post_author = post_author;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
	
	
}
