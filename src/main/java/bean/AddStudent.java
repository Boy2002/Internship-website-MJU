package bean;

import java.sql.Date;

import javax.persistence.*;


public class AddStudent {
	
	private String idstudent;
	private String studentname;
	private String studentlastname;
	private String password;
	private String workposition;
	private Date startdate;
	private Date enddate;
	private String Teacher_teachername;
	private String Teacher_teacherlastname;
	private String Company_companyname;
	
	public AddStudent() {
		// TODO Auto-generated constructor stub
	}

	public AddStudent(String idstudent, String studentname, String studentlastname, String password,
			String workposition, Date startdate, Date enddate, String teacher_teachername,
			String teacher_teacherlastname, String company_companyname) {
		super();
		this.idstudent = idstudent;
		this.studentname = studentname;
		this.studentlastname = studentlastname;
		this.password = password;
		this.workposition = workposition;
		this.startdate = startdate;
		this.enddate = enddate;
		Teacher_teachername = teacher_teachername;
		Teacher_teacherlastname = teacher_teacherlastname;
		Company_companyname = company_companyname;
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

	public String getTeacher_teachername() {
		return Teacher_teachername;
	}

	public String getTeacher_teacherlastname() {
		return Teacher_teacherlastname;
	}

	public String getCompany_companyname() {
		return Company_companyname;
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

	public void setTeacher_teachername(String teacher_teachername) {
		Teacher_teachername = teacher_teachername;
	}

	public void setTeacher_teacherlastname(String teacher_teacherlastname) {
		Teacher_teacherlastname = teacher_teacherlastname;
	}

	public void setCompany_companyname(String company_companyname) {
		Company_companyname = company_companyname;
	}

	
}
