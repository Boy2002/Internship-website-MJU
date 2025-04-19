package bean;

import java.sql.Date;

import javax.persistence.*;


public class Mentor {
	
	private int mentorid;
	private String mentorprefix;
	private String mentorname;
	private String mentorlastname;
	private String mentornickname;
	private String mentorposition;
	private String metoremail;
	private String mentorline;
	private String mentorfacebook;
	private String phonenumber;
	private String mentorimg;
	private String password;//add
	private String keypass;
	

	public Mentor() {
		// TODO Auto-generated constructor stub
	}

	public Mentor(int mentorid, String mentorprefix, String mentorname, String mentorlastname, String mentornickname,
			String mentorposition, String metoremail, String mentorline, String mentorfacebook, String phonenumber,
			String mentorimg) {
		super();
		this.mentorid = mentorid;
		this.mentorprefix = mentorprefix;
		this.mentorname = mentorname;
		this.mentorlastname = mentorlastname;
		this.mentornickname = mentornickname;
		this.mentorposition = mentorposition;
		this.metoremail = metoremail;
		this.mentorline = mentorline;
		this.mentorfacebook = mentorfacebook;
		this.phonenumber = phonenumber;
		this.mentorimg = mentorimg;
	}
	
	
	
	

	public Mentor(int mentorid, String mentorprefix, String mentorname, String mentorlastname, String mentornickname,
			String mentorposition, String metoremail, String mentorline, String mentorfacebook, String phonenumber,
			String mentorimg, String password) {
		super();
		this.mentorid = mentorid;
		this.mentorprefix = mentorprefix;
		this.mentorname = mentorname;
		this.mentorlastname = mentorlastname;
		this.mentornickname = mentornickname;
		this.mentorposition = mentorposition;
		this.metoremail = metoremail;
		this.mentorline = mentorline;
		this.mentorfacebook = mentorfacebook;
		this.phonenumber = phonenumber;
		this.mentorimg = mentorimg;
		this.password = password;
		
	}


	public Mentor(int mentorid, String mentorprefix, String mentorname, String mentorlastname, String mentornickname,
			String mentorposition, String metoremail, String mentorline, String mentorfacebook, String phonenumber,
			String mentorimg, String password, String keypass) {
		super();
		this.mentorid = mentorid;
		this.mentorprefix = mentorprefix;
		this.mentorname = mentorname;
		this.mentorlastname = mentorlastname;
		this.mentornickname = mentornickname;
		this.mentorposition = mentorposition;
		this.metoremail = metoremail;
		this.mentorline = mentorline;
		this.mentorfacebook = mentorfacebook;
		this.phonenumber = phonenumber;
		this.mentorimg = mentorimg;
		this.password = password;
		this.keypass = keypass;
	}

	public String getKeypass() {
		return keypass;
	}

	public void setKeypass(String keypass) {
		this.keypass = keypass;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMentorid() {
		return mentorid;
	}

	public String getMentorprefix() {
		return mentorprefix;
	}

	public String getMentorname() {
		return mentorname;
	}

	public String getMentorlastname() {
		return mentorlastname;
	}

	public String getMentornickname() {
		return mentornickname;
	}

	public String getMentorposition() {
		return mentorposition;
	}

	public String getMetoremail() {
		return metoremail;
	}

	public String getMentorline() {
		return mentorline;
	}

	public String getMentorfacebook() {
		return mentorfacebook;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public String getMentorimg() {
		return mentorimg;
	}

	public void setMentorid(int mentorid) {
		this.mentorid = mentorid;
	}

	public void setMentorprefix(String mentorprefix) {
		this.mentorprefix = mentorprefix;
	}

	public void setMentorname(String mentorname) {
		this.mentorname = mentorname;
	}

	public void setMentorlastname(String mentorlastname) {
		this.mentorlastname = mentorlastname;
	}

	public void setMentornickname(String mentornickname) {
		this.mentornickname = mentornickname;
	}

	public void setMentorposition(String mentorposition) {
		this.mentorposition = mentorposition;
	}

	public void setMetoremail(String metoremail) {
		this.metoremail = metoremail;
	}

	public void setMentorline(String mentorline) {
		this.mentorline = mentorline;
	}

	public void setMentorfacebook(String mentorfacebook) {
		this.mentorfacebook = mentorfacebook;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public void setMentorimg(String mentorimg) {
		this.mentorimg = mentorimg;
	}

	
	
}
