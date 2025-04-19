package bean;

import java.sql.Date;

import javax.persistence.*;
import java.time.LocalDateTime;


public class report {
	
	private int reportid;
	private String filename;
	private String sentdate;
	private String status;
	private String Student_studentid;
	private int ReportName_reportnameid;

	public report() {
		// TODO Auto-generated constructor stub
	}

	public report(int reportid, String filename, String sentdate, String status, String student_studentid,
			int reportName_reportnameid) {
		super();
		this.reportid = reportid;
		this.filename = filename;
		this.sentdate = sentdate;
		this.status = status;
		Student_studentid = student_studentid;
		ReportName_reportnameid = reportName_reportnameid;
	}

	public int getReportid() {
		return reportid;
	}

	public String getFilename() {
		return filename;
	}

	public String getSentdate() {
		return sentdate;
	}

	public String getStatus() {
		return status;
	}

	public String getStudent_studentid() {
		return Student_studentid;
	}

	public int getReportName_reportnameid() {
		return ReportName_reportnameid;
	}

	public void setReportid(int reportid) {
		this.reportid = reportid;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setSentdate(String sentdate) {
		this.sentdate = sentdate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setStudent_studentid(String student_studentid) {
		Student_studentid = student_studentid;
	}

	public void setReportName_reportnameid(int reportName_reportnameid) {
		ReportName_reportnameid = reportName_reportnameid;
	}

	
	
}
