package bean;

public class formmenterdetail {

	int mentorformid_detail;
	int questionid_detail;
	int question_no;
	
	
	public formmenterdetail() {
		super();
		// TODO Auto-generated constructor stub
	}


	public formmenterdetail(int mentorformid_detail, int questionid_detail) {
		super();
		this.mentorformid_detail = mentorformid_detail;
		this.questionid_detail = questionid_detail;
	}
	

	public formmenterdetail(int mentorformid_detail, int questionid_detail, int question_no) {
		super();
		this.mentorformid_detail = mentorformid_detail;
		this.questionid_detail = questionid_detail;
		this.question_no = question_no;
	}


	public int getMentorformid_detail() {
		return mentorformid_detail;
	}


	public void setMentorformid_detail(int mentorformid_detail) {
		this.mentorformid_detail = mentorformid_detail;
	}


	public int getQuestionid_detail() {
		return questionid_detail;
	}


	public void setQuestionid_detail(int questionid_detail) {
		this.questionid_detail = questionid_detail;
	}


	public int getQuestion_no() {
		return question_no;
	}


	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	
	
	
}
