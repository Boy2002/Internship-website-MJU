package bean;

import java.sql.Date;

import javax.persistence.*;


public class mentor_student {
	
	private int mentor_mentorid;
	private String student_studentid;
	

	public mentor_student() {
		// TODO Auto-generated constructor stub
	}


	

	public mentor_student(int mentor_mentorid, String student_studentid) {
		super();
		this.mentor_mentorid = mentor_mentorid;
		this.student_studentid = student_studentid;
	}




	public int getMentor_mentorid() {
		return mentor_mentorid;
	}


	public void setMentor_mentorid(int mentor_mentorid) {
		this.mentor_mentorid = mentor_mentorid;
	}


	public String getStudent_studentid() {
		return student_studentid;
	}


	public void setStudent_studentid(String student_studentid) {
		this.student_studentid = student_studentid;
	}


	


	
	
}
