package bean;

import java.sql.Date;

import javax.persistence.*;


public class Review {
	

	private int reviewid;
	private String reviewpicture;
	private String reviewdetails;
	private String reviewdate;
	private double reviewrating;
	private String status;
	private String Student_studentid;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewid, String reviewpicture, String reviewdetails, String reviewdate, double reviewrating,
			String status, String student_studentid) {
		super();
		this.reviewid = reviewid;
		this.reviewpicture = reviewpicture;
		this.reviewdetails = reviewdetails;
		this.reviewdate = reviewdate;
		this.reviewrating = reviewrating;
		this.status = status;
		Student_studentid = student_studentid;
	}

	public int getReviewid() {
		return reviewid;
	}

	public String getReviewpicture() {
		return reviewpicture;
	}

	public String getReviewdetails() {
		return reviewdetails;
	}

	public String getReviewdate() {
		return reviewdate;
	}

	public double getReviewrating() {
		return reviewrating;
	}

	public String getStatus() {
		return status;
	}

	public String getStudent_studentid() {
		return Student_studentid;
	}

	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}

	public void setReviewpicture(String reviewpicture) {
		this.reviewpicture = reviewpicture;
	}

	public void setReviewdetails(String reviewdetails) {
		this.reviewdetails = reviewdetails;
	}

	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}

	public void setReviewrating(double reviewrating) {
		this.reviewrating = reviewrating;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setStudent_studentid(String student_studentid) {
		Student_studentid = student_studentid;
	}
	
	

}
