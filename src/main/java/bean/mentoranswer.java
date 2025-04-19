package bean;

public class mentoranswer {
	
	private int mentorformid_ans; 
	private int questionid_ans; 
	private int mentorid_ans; 
	private String studentid_ans; 
	private String mentoranswertext;
	private double score;
	private int edited;
	private String evalutiontime;
	
	public mentoranswer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public mentoranswer(int mentorformid_ans, int questionid_ans, int mentorid_ans, String studentid_ans,
			String mentoranswertext) {
		super();
		this.mentorformid_ans = mentorformid_ans;
		this.questionid_ans = questionid_ans;
		this.mentorid_ans = mentorid_ans;
		this.studentid_ans = studentid_ans;
		this.mentoranswertext = mentoranswertext;
	}
	
	public mentoranswer(int mentorformid_ans, int questionid_ans, int mentorid_ans, String studentid_ans,
			String mentoranswertext, double score) {
		super();
		this.mentorformid_ans = mentorformid_ans;
		this.questionid_ans = questionid_ans;
		this.mentorid_ans = mentorid_ans;
		this.studentid_ans = studentid_ans;
		this.mentoranswertext = mentoranswertext;
		this.score = score;
	}
	
	
	public mentoranswer(int mentorformid_ans, int questionid_ans, int mentorid_ans, String studentid_ans,
			String mentoranswertext, double score, int edited) {
		super();
		this.mentorformid_ans = mentorformid_ans;
		this.questionid_ans = questionid_ans;
		this.mentorid_ans = mentorid_ans;
		this.studentid_ans = studentid_ans;
		this.mentoranswertext = mentoranswertext;
		this.score = score;
		this.edited = edited;
	}
	
	
	public mentoranswer(int mentorformid_ans, int questionid_ans, int mentorid_ans, String studentid_ans,
			String mentoranswertext, double score, int edited, String evalutiontime) {
		super();
		this.mentorformid_ans = mentorformid_ans;
		this.questionid_ans = questionid_ans;
		this.mentorid_ans = mentorid_ans;
		this.studentid_ans = studentid_ans;
		this.mentoranswertext = mentoranswertext;
		this.score = score;
		this.edited = edited;
		this.evalutiontime = evalutiontime;
	}	
	
	public String getEvalutiontime() {
		return evalutiontime;
	}

	public void setEvalutiontime(String evalutiontime) {
		this.evalutiontime = evalutiontime;
	}

	public mentoranswer(int mentorid_ans) {
		super();
		this.mentorid_ans = mentorid_ans;
	}

	public int getEdited() {
		return edited;
	}

	public void setEdited(int edited) {
		this.edited = edited;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getMentorformid_ans() {
		return mentorformid_ans;
	}

	public void setMentorformid_ans(int mentorformid_ans) {
		this.mentorformid_ans = mentorformid_ans;
	}

	public int getQuestionid_ans() {
		return questionid_ans;
	}

	public void setQuestionid_ans(int questionid_ans) {
		this.questionid_ans = questionid_ans;
	}

	public int getMentorid_ans() {
		return mentorid_ans;
	}

	public void setMentorid_ans(int mentorid_ans) {
		this.mentorid_ans = mentorid_ans;
	}

	public String getStudentid_ans() {
		return studentid_ans;
	}

	public void setStudentid_ans(String studentid_ans) {
		this.studentid_ans = studentid_ans;
	}

	public String getMentoranswertext() {
		return mentoranswertext;
	}

	public void setMentoranswertext(String mentoranswertext) {
		this.mentoranswertext = mentoranswertext;
	}
	
	
}
