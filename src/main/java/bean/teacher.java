package bean;

import java.sql.Date;

import javax.persistence.*;


public class teacher {
	
	private int teacherid;
	private String teachername;
	private String teacherlastname;
	private String phonenumber;
	private String teacheremail;
	private String password;
	private String teachertype;
	private String teacherimg;
	private String status;

	public teacher() {
		// TODO Auto-generated constructor stub
	}

	public teacher(int teacherid, String teachername, String teacherlastname, String phonenumber, String teacheremail,
			String password, String teachertype, String teacherimg ,String status) {
		super();
		this.teacherid = teacherid;
		this.teachername = teachername;
		this.teacherlastname = teacherlastname;
		this.phonenumber = phonenumber;
		this.teacheremail = teacheremail;
		this.password = password;
		this.teachertype = teachertype;
		this.teacherimg = teacherimg;
		this.status = status;
	}
	
	

	public teacher(String teachername, String teacherlastname) {
		super();
		this.teachername = teachername;
		this.teacherlastname = teacherlastname;
	}

	

	public teacher(int teacherid, String teachername, String teacherlastname, String phonenumber, String teacheremail,
			String teacherimg) {
		super();
		this.teacherid = teacherid;
		this.teachername = teachername;
		this.teacherlastname = teacherlastname;
		this.phonenumber = phonenumber;
		this.teacheremail = teacheremail;
		this.teacherimg = teacherimg;
	}
	
	

	public teacher(int teacherid, String teachername, String teacherlastname, String phonenumber, String teacheremail,
			String password, String teacherimg) {
		super();
		this.teacherid = teacherid;
		this.teachername = teachername;
		this.teacherlastname = teacherlastname;
		this.phonenumber = phonenumber;
		this.teacheremail = teacheremail;
		this.password = password;
		this.teacherimg = teacherimg;
	}

	public int getTeacherid() {
		return teacherid;
	}

	public String getTeachername() {
		return teachername;
	}

	public String getTeacherlastname() {
		return teacherlastname;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public String getTeacheremail() {
		return teacheremail;
	}

	public String getPassword() {
		return password;
	}

	public String getTeachertype() {
		return teachertype;
	}

	public String getTeacherimg() {
		return teacherimg;
	}

	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public void setTeacherlastname(String teacherlastname) {
		this.teacherlastname = teacherlastname;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public void setTeacheremail(String teacheremail) {
		this.teacheremail = teacheremail;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTeachertype(String teachertype) {
		this.teachertype = teachertype;
	}

	public void setTeacherimg(String teacherimg) {
		this.teacherimg = teacherimg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



}
