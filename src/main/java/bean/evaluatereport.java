package bean;

import java.sql.Date;

import javax.persistence.*;
import java.time.LocalDateTime;


public class evaluatereport {
	
	private int Report_reportid;
	private int Teacher_teacherid;
	private double score;
	private String evaluatedate;
	

	public evaluatereport() {
		// TODO Auto-generated constructor stub
	}


	public evaluatereport(int report_reportid, int teacher_teacherid, double score, String evaluatedate) {
		super();
		Report_reportid = report_reportid;
		Teacher_teacherid = teacher_teacherid;
		this.score = score;
		this.evaluatedate = evaluatedate;
	}


	public int getReport_reportid() {
		return Report_reportid;
	}


	public int getTeacher_teacherid() {
		return Teacher_teacherid;
	}


	public double getScore() {
		return score;
	}


	public String getEvaluatedate() {
		return evaluatedate;
	}


	public void setReport_reportid(int report_reportid) {
		Report_reportid = report_reportid;
	}


	public void setTeacher_teacherid(int teacher_teacherid) {
		Teacher_teacherid = teacher_teacherid;
	}


	public void setScore(double score) {
		this.score = score;
	}


	public void setEvaluatedate(String evaluatedate) {
		this.evaluatedate = evaluatedate;
	}

	
}
