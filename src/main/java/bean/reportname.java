package bean;

import java.sql.Date;

import javax.persistence.*;


public class reportname {
	
	private int reportnameid;
	private String reportname;
	private int delivery;
	

	public reportname() {
		// TODO Auto-generated constructor stub
	}


	public reportname(int reportnameid, String reportname, int delivery) {
		super();
		this.reportnameid = reportnameid;
		this.reportname = reportname;
		this.delivery = delivery;
	}


	public int getReportnameid() {
		return reportnameid;
	}


	public String getReportname() {
		return reportname;
	}


	public int getDelivery() {
		return delivery;
	}


	public void setReportnameid(int reportnameid) {
		this.reportnameid = reportnameid;
	}


	public void setReportname(String reportname) {
		this.reportname = reportname;
	}


	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

}
