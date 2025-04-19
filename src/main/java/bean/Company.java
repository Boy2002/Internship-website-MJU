package bean;

import java.sql.Date;

import javax.persistence.*;


public class Company {
	
	private int companyid;
	private String companyname;
	private String companyaddress;
	private String coordinatorname;
	private String phonenumber;
	private String email;
	private String website;
	private String facebook;
	private double average;

	public Company() {
		// TODO Auto-generated constructor stub
	}

	public Company(int companyid, String companyname, String companyaddress, String coordinatorname, String phonenumber,
			String email, String website, String facebook ,double average) {
		super();
		this.companyid = companyid;
		this.companyname = companyname;
		this.companyaddress = companyaddress;
		this.coordinatorname = coordinatorname;
		this.phonenumber = phonenumber;
		this.email = email;
		this.website = website;
		this.facebook = facebook;
		this.average = average;
	}

	public int getCompanyid() {
		return companyid;
	}

	public String getCompanyname() {
		return companyname;
	}

	public String getCompanyaddress() {
		return companyaddress;
	}

	public String getCoordinatorname() {
		return coordinatorname;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public String getWebsite() {
		return website;
	}

	public String getFacebook() {
		return facebook;
	}
	
	public double getAverage() {
		return average;
	}

	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}

	public void setCoordinatorname(String coordinatorname) {
		this.coordinatorname = coordinatorname;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	
	public void setAverage(double average) {
		this.average = average;
	}


}
