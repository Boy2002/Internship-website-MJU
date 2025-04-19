package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;

//import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.AddQuestionDB;
import util.AssessmentDB;
import util.CreateformDB;
import util.EditStudentProfileDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ReviewCompanyDB;
import util.teacherManager;
@Controller
public class Assessmentcontroller {

	public Assessmentcontroller() {
		// TODO Auto-generated constructor stub
	}

	
	@RequestMapping(value = "/loadlistStuMentorPage" , method = RequestMethod.GET)
	public String loadlistStuMentorPage(HttpServletRequest  request ,HttpSession session) {
		
		int mid = Integer.parseInt(request.getParameter("mid"));
		System.out.println("loadlistStuMentorPage mid ="+mid);
		
		AssessmentDB aDB = new AssessmentDB();
		ListStudentDB ListStud = new ListStudentDB();
		List<String> semesterList =  ListStud.AllListsemester();
		
		List<Student> ListStu = aDB.ListStuMentor(mid,semesterList.get(0));

		session.setAttribute("ListStu", ListStu);
		
		session.setAttribute("getSemester", semesterList.get(0));
		
		return "ListStudentMentorPage";
	}
	
	@RequestMapping(value = "/loadcompanyStuTeacher" , method = RequestMethod.GET)
	public String loadcompanyStuTeacher(HttpSession session,HttpServletRequest request) {
		
		int tid =Integer.parseInt(request.getParameter("tid")); 
		
		AssessmentDB asDB = new AssessmentDB();
		ListStudentDB ListStu = new ListStudentDB();
	
		List<String> semesterList =  ListStu.AllListsemester();
		List<Company>company = asDB.searchCompanyStuTeacher(semesterList.get(0).trim(),tid);
		
		System.out.println("semesterList.get(0)"+semesterList.get(0)+"tid"+tid);
		// ###ระบบเดิมภาคเรียนมีช่องว่างต่อท้ายทำให้การคิวรี่หาไม่เจอ ระบบใหม่ตอนinsertข้อมูลไม่มีช่องว่างเหมือนระบบเดิม
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",semesterList.get(0));
		
		return "ListCompanyStuTeacherPage";
	}
	
	@RequestMapping(value = "/loadSearchlistStuMentorPage", method = RequestMethod.POST)
	public String loadSearchlistStuMentorPage(HttpServletRequest request, Model md, HttpSession session) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (UnsupportedEncodingException e1) {
	        e1.printStackTrace();
	    }

	    String NAME = request.getParameter("NAME");
	    String searchDate = request.getParameter("searchDate");
	    int Mertorid = Integer.parseInt(request.getParameter("mentorid"));

	    System.out.println("loadSearchlistStuMentorPage NAME: " + NAME + " searchDate: " + searchDate + " Mertorid: " + Mertorid);

	    AssessmentDB asDB = new AssessmentDB();
	    List<Student> ListStudent = asDB.getAllStudentsBySemester(searchDate, NAME, Mertorid); // Ensure correct parameter order

//	    if (ListStudent.isEmpty()) {
//	        System.out.println("0 ไม่มีข้อมูล");
//	    } else {
//	        System.out.println("1 มีข้อมูล");
//	    }

	    session.setAttribute("ListStu", ListStudent);
	    session.setAttribute("getSemester", searchDate);

	    return "ListStudentMentorPage";
	}

	@RequestMapping(value = "/searchCompanyStuTeacher" , method = RequestMethod.GET)
	public String SearchcompanyStuTeacher(HttpSession session,HttpServletRequest request) {
		
		String searchDate = request.getParameter("searchDate");
		int tid =Integer.parseInt(request.getParameter("tid")); 
		
		AssessmentDB asDB = new AssessmentDB();
				
		List<Company>company = asDB.searchCompanyStuTeacher(searchDate.trim(),tid);
		
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",searchDate);
		
		return "ListCompanyStuTeacherPage";
	}
	
	@RequestMapping(value = "/loadlistStuTeacherPage" , method = RequestMethod.GET)
	public String VisitedStudentPage(HttpServletRequest  request ,HttpSession session) {
		
		String Companyid = request.getParameter("getCompanyid");
		String getSemester = request.getParameter("getSemester");
		if(getSemester.equals("แสดงทั้งหมด")) {
			getSemester = "";
		}
		
		ListStudentDB ListStu = new ListStudentDB();
		List<Student> student = ListStu.AllListStu(Companyid,getSemester);
		
		session.setAttribute("student", student);
		session.setAttribute("Companyid", Companyid);
		
		session.setAttribute("getSemester", getSemester);
		
		return "VisitedStudentPage";
	}
	
	
	
	@RequestMapping(value = "/loadformmentorpage" , method = RequestMethod.GET)
	public String loadformmentorpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadformmentorpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(fid);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("mf", mf);
		session.setAttribute("stu", stu);
		
		return "AssessmentFormMentorPage";
	}
	
	@RequestMapping(value = "/loadformteacherpage" , method = RequestMethod.GET)
	public String loadformteacherpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadformteacherpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(fid);
		System.out.println("Teacherassessmentform tf="+tf);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("tf", tf);
		session.setAttribute("stu", stu);
		
		return "AssessmentFormTeacherPage";
	}
	
	@RequestMapping(value = "/loadEditformmentorpage" , method = RequestMethod.GET)
	public String loadEditformmentorpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadEditformmentorpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(fid);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("mf", mf);
		session.setAttribute("stu", stu);
		
		return "EditAssessmentFormMentorPage";
	}
	
	@RequestMapping(value = "/loadEditformteacherpage" , method = RequestMethod.GET)
	public String loadEditformteacherpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadEditformteacherpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(fid);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("tf", tf);
		session.setAttribute("stu", stu);
		
		return "EditAssessmentFormTeacherPage";
	}
	
	@RequestMapping(value = "/loadviewformmentorpage" , method = RequestMethod.GET)
	public String loadviewformmentorpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadviewformmentorpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(fid);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("mf", mf);
		session.setAttribute("stu", stu);
		
		return "ViewAssessmentFormMentorPage";
	}
	
	@RequestMapping(value = "/loadviewformteacherpage" , method = RequestMethod.GET)
	public String loadviewformteacherpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		String sid = request.getParameter("sid");
		System.out.println("loadEditformteacherpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(fid);
		EditStudentProfileDB espDB = new EditStudentProfileDB();
		Student stu = espDB.verifySTU(sid);
		
		session.setAttribute("tf", tf);
		session.setAttribute("stu", stu);
		
		return "ViewAssessmentFormTeacherPage";
	}
	
	@PostMapping("/AssessmentMentor")
	public String AssessmentMentor(HttpServletRequest request, HttpSession session) {
	    int error = -1;

	    try {
	        int mentorid = Integer.parseInt(request.getParameter("mentorid"));
	        String stuid = request.getParameter("stuid");
	        int mentorformid = Integer.parseInt(request.getParameter("mentorformid"));
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        String evalutiontime = request.getParameter("evalutiontime");
	        
	        System.out.println("evalutiontime ="+evalutiontime);
	        System.out.println("AssessmentMentor mentorid=" + mentorid + " stuid= " + stuid + " mentorformid= " + mentorformid + " rowCount= " + rowCount);
	        AssessmentDB amDB = new AssessmentDB();

	        for (int i = 1; i <= rowCount; i++) {
	            String questionAnswer = request.getParameter("questions[" + i + "].answer");
	            String questionIdStr = request.getParameter("questions[" + i + "].id");
	            Double questionScore = Double.parseDouble(request.getParameter("questions[" + i + "].score"));
	            if (questionIdStr == null) {
	                System.err.println("Question ID is null for row: " + i);
	                continue; // หรือจัดการข้อผิดพลาดตามต้องการ
	            }
	            int questionid = Integer.parseInt(questionIdStr); 
	            System.out.println("questionid= " + questionid + " questionAnswer= " + questionAnswer + " questionScore= "+questionScore);
	            
	          //แก้ไขได้1ครั้ง
	            int edited = 0;
	            
	            mentoranswer mt_ans = new mentoranswer(mentorformid, questionid, mentorid, stuid, questionAnswer,questionScore,edited,evalutiontime);
	            amDB.AssessmentMentorAnswer(mt_ans);
	        }

	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (error == 1) {
	    	request.setAttribute("error", error);
	        return "ListStudentMentorPage";
	    } else {
	    	request.setAttribute("error", error);
	        return "ListStudentMentorPage";
	    }
	}
	
	@PostMapping("/AssessmentTeacher")
	public String AssessmentTeacher(HttpServletRequest request, HttpSession session) {
	    int error = -1;

	    try {
	        int teacherid = Integer.parseInt(request.getParameter("teacherid"));
	        String stuid = request.getParameter("stuid");
	        int teacherformid = Integer.parseInt(request.getParameter("teacherformid"));
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        int teachertotalscore = Integer.parseInt(request.getParameter("teachertotalscore"));
	        String evalutiontime = request.getParameter("evalutiontime");
	        System.out.println("AssessmentTeacher teacherid=" + teacherid + " stuid= " + stuid + " teacherformid= " + teacherformid + " rowCount= " + rowCount);
	        AssessmentDB amDB = new AssessmentDB();

	        for (int i = 1; i <= rowCount; i++) {
	            String questionAnswer = request.getParameter("questions[" + i + "].answer");
	            String questionIdStr = request.getParameter("questions[" + i + "].id");
	            Double questionScore = Double.parseDouble(request.getParameter("questions[" + i + "].score"));
	            if (questionIdStr == null) {
	                System.err.println("Question ID is null for row: " + i);
	                continue; // หรือจัดการข้อผิดพลาดตามต้องการ
	            }
	            int questionid = Integer.parseInt(questionIdStr); // เปลี่ยนจาก request.getParameter เป็น request.getAttribute
	            System.out.println("questionid= " + questionid + " questionAnswer= " + questionAnswer);
	            
	            int edited = 0;
	            
	            teacheranswer t_ans = new teacheranswer(teacherformid, questionid, teacherid, stuid, questionAnswer,questionScore,edited,evalutiontime);
	            amDB.AssessmentTeacherAnswer(t_ans);
	        }

	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (error == 1) {
	    	request.setAttribute("error", error);
	        return "VisitedStudentPage";
	    } else {
	    	request.setAttribute("error", error);
	        return "VisitedStudentPage";
	    }
	}
	
	@PostMapping("/EditAssessmentMentor")
	public String EditAssessmentMentor(HttpServletRequest request, HttpSession session) {
	    int error = -1;

	    try {
	        int mentorid = Integer.parseInt(request.getParameter("mentorid"));
	        String stuid = request.getParameter("stuid");
	        int mentorformid = Integer.parseInt(request.getParameter("mentorformid"));
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        int mentortotalscore = Integer.parseInt(request.getParameter("mentortotalscore"));
	        String evalutiontime = request.getParameter("evalutiontime");
	        
	        System.out.println("EditAssessmentMentor mentorid=" + mentorid + " stuid= " + stuid + " mentorformid= " + mentorformid + " rowCount= " + rowCount + " mentortotalscore"+mentortotalscore+"evalutiontime "+evalutiontime );
	        AssessmentDB amDB = new AssessmentDB();

	        for (int i = 1; i <= rowCount; i++) {
	            String questionAnswer = request.getParameter("questions[" + i + "].answer");
	            String questionIdStr = request.getParameter("questions[" + i + "].id");
	            Double questionScore = Double.parseDouble(request.getParameter("questions[" + i + "].score"));
	            if (questionIdStr == null) {
	                System.err.println("Question ID is null for row: " + i);
	                continue; // หรือจัดการข้อผิดพลาดตามต้องการ
	            }
	            int questionid = Integer.parseInt(questionIdStr); // เปลี่ยนจาก request.getParameter เป็น request.getAttribute
	            System.out.println("questionid= " + questionid + " questionAnswer= " + questionAnswer + " questionScore= "+questionScore);
	            
	            //แก้ไขได้1ครั้ง
	            int edited = 1;

	            mentoranswer mt_ans = new mentoranswer(mentorformid, questionid, mentorid, stuid, questionAnswer,questionScore,edited,evalutiontime);
	            amDB.editMentorAnswer(mt_ans);
	        }

	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (error == 1) {
	    	request.setAttribute("error", error);
	        return "ListStudentMentorPage";
	    } else {
	    	request.setAttribute("error", error);
	        return "ListStudentMentorPage";
	    }
	}
	
	@PostMapping("/EditAssessmentTeacher")
	public String EditAssessmentTeacher(HttpServletRequest request, HttpSession session) {
	    int error = -1;

	    try {
	        int teacherid = Integer.parseInt(request.getParameter("teacherid"));
	        String stuid = request.getParameter("stuid");
	        int teacherformid = Integer.parseInt(request.getParameter("teacherformid"));
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        String evalutiontime = request.getParameter("evalutiontime");
	        int teachertotalscore = Integer.parseInt(request.getParameter("teachertotalscore"));
	        System.out.println("EditAssessmentTeacher teacherid=" + teacherid + " stuid= " + stuid + " mentorformid= " + teacherformid + " rowCount= " + rowCount + " teachertotalscore "+teachertotalscore);
	        AssessmentDB amDB = new AssessmentDB();

	        for (int i = 1; i <= rowCount; i++) {
	            String questionAnswer = request.getParameter("questions[" + i + "].answer");
	            String questionIdStr = request.getParameter("questions[" + i + "].id");
	            Double questionScore = Double.parseDouble(request.getParameter("questions[" + i + "].score"));
	            if (questionIdStr == null) {
	                System.err.println("Question ID is null for row: " + i);
	                continue; // หรือจัดการข้อผิดพลาดตามต้องการ
	            }
	            int questionid = Integer.parseInt(questionIdStr); // เปลี่ยนจาก request.getParameter เป็น request.getAttribute
	            System.out.println("questionid= " + questionid + " questionAnswer= " + questionAnswer);
	            
	          //แก้ไขได้1ครั้ง
	            int edited = 1;
	            
	            teacheranswer t_ans = new teacheranswer(teacherformid, questionid, teacherid, stuid, questionAnswer,questionScore,edited,evalutiontime);
	            amDB.editTeacherAnswer(t_ans);
	        }

	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (error == 1) {
	    	request.setAttribute("error", error);
	        return "VisitedStudentPage";
	    } else {
	    	request.setAttribute("error", error);
	        return "VisitedStudentPage";
	    }
	}


	


}
