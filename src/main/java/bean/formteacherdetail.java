package bean;

public class formteacherdetail {

	int teacherformid_detail;
	int questionid_detail;
	int question_no;
	
	
	public formteacherdetail() {
		super();
		// TODO Auto-generated constructor stub
	}


	public formteacherdetail(int teacherformid_detail, int questionid_detail) {
		super();
		this.teacherformid_detail = teacherformid_detail;
		this.questionid_detail = questionid_detail;
	}
	
	public formteacherdetail(int teacherformid_detail, int questionid_detail, int question_no) {
		super();
		this.teacherformid_detail = teacherformid_detail;
		this.questionid_detail = questionid_detail;
		this.question_no = question_no;
	}


	public int getTeacherformid_detail() {
		return teacherformid_detail;
	}


	public void setTeacherformid_detail(int teacherformid_detail) {
		this.teacherformid_detail = teacherformid_detail;
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
