package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Assignsupervision {
	String companyid;
	String teacherid;
	String semester;
	String date;
	String time;
	String methods;
	String status;
	
	
	public Assignsupervision() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Assignsupervision(String companyid, String teacherid, String semester, String date, String time,
			String methods, String status) {
		super();
		this.companyid = companyid;
		this.teacherid = teacherid;
		this.semester = semester;
		this.date = date;
		this.time = time;
		this.methods = methods;
		this.status = status;
	}





	public String getMethods() {
		return methods;
	}

	public void setMethods(String methods) {
		this.methods = methods;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}
	
	
	
}
