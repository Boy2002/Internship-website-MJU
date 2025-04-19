package bean;

import java.sql.Date;

import javax.persistence.*;
import java.time.LocalDateTime;


public class evaluatevideo {
	
	private String Student_studentid;
	private int Video_videoid;
	private double score;
	private String evaluatedate;
	private int Teacher_teacherid;

	public evaluatevideo() {
		// TODO Auto-generated constructor stub
	}

	public evaluatevideo(String student_studentid, int video_videoid, double score, String evaluatedate,
			int teacher_teacherid) {
		super();
		Student_studentid = student_studentid;
		Video_videoid = video_videoid;
		this.score = score;
		this.evaluatedate = evaluatedate;
		Teacher_teacherid = teacher_teacherid;
	}

	public String getStudent_studentid() {
		return Student_studentid;
	}

	public int getVideo_videoid() {
		return Video_videoid;
	}

	public double getScore() {
		return score;
	}

	public String getEvaluatedate() {
		return evaluatedate;
	}

	public int getTeacher_teacherid() {
		return Teacher_teacherid;
	}

	public void setStudent_studentid(String student_studentid) {
		Student_studentid = student_studentid;
	}

	public void setVideo_videoid(int video_videoid) {
		Video_videoid = video_videoid;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public void setEvaluatedate(String evaluatedate) {
		this.evaluatedate = evaluatedate;
	}

	public void setTeacher_teacherid(int teacher_teacherid) {
		Teacher_teacherid = teacher_teacherid;
	}
	
}
