package bean;

import java.sql.Date;


import javax.persistence.*;


public class Student {
	
	private String idstudent;
	private String studentname;
	private String studentlastname;
	private String password;
	private String workposition;
	private Date startdate;
	private Date enddate;
	private String semester;
	private int Teacher_teacherid;
	private int Company_companyid;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(String idstudent, String studentname, String studentlastname, String password, String workposition,
			Date startdate, Date enddate, String semester,int teacher_teacherid, int company_companyid) {
		super();
		this.idstudent = idstudent;
		this.studentname = studentname;
		this.studentlastname = studentlastname;
		this.password = password;
		this.workposition = workposition;
		this.startdate = startdate;
		this.enddate = enddate;
		this.semester = semester;
		Teacher_teacherid = teacher_teacherid;
		Company_companyid = company_companyid;
	}

	public String getIdstudent() {
		return idstudent;
	}

	public String getStudentname() {
		return studentname;
	}

	public String getStudentlastname() {
		return studentlastname;
	}

	public String getPassword() {
		return password;
	}

	public String getWorkposition() {
		return workposition;
	}

	public Date getStartdate() {
		return startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public String getSemester() {
		return semester;
	}


	public int getTeacher_teacherid() {
		return Teacher_teacherid;
	}

	public int getCompany_companyid() {
		return Company_companyid;
	}

	public void setIdstudent(String idstudent) {
		this.idstudent = idstudent;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public void setStudentlastname(String studentlastname) {
		this.studentlastname = studentlastname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setWorkposition(String workposition) {
		this.workposition = workposition;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public void setTeacher_teacherid(int teacher_teacherid) {
		Teacher_teacherid = teacher_teacherid;
	}

	public void setCompany_companyid(int company_companyid) {
		Company_companyid = company_companyid;
	}

	


}
