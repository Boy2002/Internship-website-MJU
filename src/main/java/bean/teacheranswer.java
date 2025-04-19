package bean;

public class teacheranswer {
	private int teacherformid_answer;
	private int questionid_answer; 
	private int teacherid_answer;
	private String studentid_answer;
	private String teacheranswertext;
	private Double score;
	private int  edited;
	private String  evalutiontime;
	
	
	
	public teacheranswer() {
		super();
		// TODO Auto-generated constructor stub
	}



	public teacheranswer(int teacherformid_answer, int questionid_answer, int teacherid_answer, String studentid_answer,
			String teacheranswertext) {
		super();
		this.teacherformid_answer = teacherformid_answer;
		this.questionid_answer = questionid_answer;
		this.teacherid_answer = teacherid_answer;
		this.studentid_answer = studentid_answer;
		this.teacheranswertext = teacheranswertext;
	}


	public teacheranswer(int teacherformid_answer, int questionid_answer, int teacherid_answer, String studentid_answer,
			String teacheranswertext, Double score) {
		super();
		this.teacherformid_answer = teacherformid_answer;
		this.questionid_answer = questionid_answer;
		this.teacherid_answer = teacherid_answer;
		this.studentid_answer = studentid_answer;
		this.teacheranswertext = teacheranswertext;
		this.score = score;
	}
	
	public teacheranswer(int teacherformid_answer, int questionid_answer, int teacherid_answer, String studentid_answer,
			String teacheranswertext, Double score, int edited) {
		super();
		this.teacherformid_answer = teacherformid_answer;
		this.questionid_answer = questionid_answer;
		this.teacherid_answer = teacherid_answer;
		this.studentid_answer = studentid_answer;
		this.teacheranswertext = teacheranswertext;
		this.score = score;
		this.edited = edited;
	}

	

	public teacheranswer(int teacherformid_answer, int questionid_answer, int teacherid_answer, String studentid_answer,
			String teacheranswertext, Double score, int edited, String evalutiontime) {
		super();
		this.teacherformid_answer = teacherformid_answer;
		this.questionid_answer = questionid_answer;
		this.teacherid_answer = teacherid_answer;
		this.studentid_answer = studentid_answer;
		this.teacheranswertext = teacheranswertext;
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



	public int getEdited() {
		return edited;
	}



	public void setEdited(int edited) {
		this.edited = edited;
	}



	public Double getScore() {
		return score;
	}



	public void setScore(Double score) {
		this.score = score;
	}



	public int getTeacherformid_answer() {
		return teacherformid_answer;
	}



	public void setTeacherformid_answer(int teacherformid_answer) {
		this.teacherformid_answer = teacherformid_answer;
	}



	public int getQuestionid_answer() {
		return questionid_answer;
	}



	public void setQuestionid_answer(int questionid_answer) {
		this.questionid_answer = questionid_answer;
	}



	public int getTeacherid_answer() {
		return teacherid_answer;
	}



	public void setTeacherid_answer(int teacherid_answer) {
		this.teacherid_answer = teacherid_answer;
	}



	public String getStudentid_answer() {
		return studentid_answer;
	}



	public void setStudentid_answer(String studentid_answer) {
		this.studentid_answer = studentid_answer;
	}



	public String getTeacheranswertext() {
		return teacheranswertext;
	}



	public void setTeacheranswertext(String teacheranswertext) {
		this.teacheranswertext = teacheranswertext;
	}
	
	

	
	
	
}
