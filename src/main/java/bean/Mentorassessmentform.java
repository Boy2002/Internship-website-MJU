package bean;

public class Mentorassessmentform {
	int mentorassessmentformid;
	String title;
	String description;
	String semester;
	String date;
	double totalscore;
	
	
	public Mentorassessmentform() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Mentorassessmentform(String title, String description, String semester, String date, double totalscore) {
		super();
		this.title = title;
		this.description = description;
		this.semester = semester;
		this.date = date;
		this.totalscore = totalscore;
	}
	
	

	public Mentorassessmentform(int mentorassessmentformid, String title, String description, String semester,
			String date, double totalscore) {
		super();
		this.mentorassessmentformid = mentorassessmentformid;
		this.title = title;
		this.description = description;
		this.semester = semester;
		this.date = date;
		this.totalscore = totalscore;
	}

	
	public int getMentorassessmentformid() {
		return mentorassessmentformid;
	}


	public void setMentorassessmentformid(int mentorassessmentformid) {
		this.mentorassessmentformid = mentorassessmentformid;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
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


	public double getTotalscore() {
		return totalscore;
	}


	public void setTotalscore(double totalscore) {
		this.totalscore = totalscore;
	}
	
	
	
}
