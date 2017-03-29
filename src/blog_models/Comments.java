/*********************************************************************************
*******************
* Project: COMP3095 Assignment2
* Assignment: ASSIGNMENT 2
* Author(s): Anthony Kwan, Bill Gray Quitalig, Kartihan Srisaravanapavan, Kushal Parmar
* Student Number: 100 969 393, 100 950 279, 100 946 216, 100 973 898
* Team Name: Team Confused
* Date: December 2, 2016
* Description: Comments Getters and Setters
***********************************************************************************
*****************/
package blog_models;

public class Comments {
	private String comment_author;
	private String post_id;
	private String comment;

	public String getComment_author() {
		return comment_author;
	}
	public void setComment_author(String comment_author) {
		this.comment_author = comment_author;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	
}
