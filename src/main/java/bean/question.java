package bean;

public class question {
	String questionid;
	String questiontext;
	String questiontype;
	double score;
	
	
	public question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public question(String questionid, String questiontext, String questiontype, double score) {
		super();
		this.questionid = questionid;
		this.questiontext = questiontext;
		this.questiontype = questiontype;
		this.score = score;
	}
	public String getQuestionid() {
		return questionid;
	}
	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}
	public String getQuestiontext() {
		return questiontext;
	}
	public void setQuestiontext(String questiontext) {
		this.questiontext = questiontext;
	}
	public String getQuestiontype() {
		return questiontype;
	}
	public void setQuestiontype(String questiontype) {
		this.questiontype = questiontype;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}

	
	
}
