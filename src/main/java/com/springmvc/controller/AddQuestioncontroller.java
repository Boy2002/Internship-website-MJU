package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import ddf.ReadWriteExcel1;
import util.AddQuestionDB;
import util.CreateformDB;
import util.EditStudentProfileDB;
import util.EditTeacherProfileDB;
import util.EditmentorDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.LoginbyStudentDB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;

@Controller
public class AddQuestioncontroller {

	public AddQuestioncontroller() {
		// TODO Auto-generated constructor stub
	}
	

	@RequestMapping(value = "/addquestion" , method = RequestMethod.GET)
	public String loadAddStudentPage() throws Exception {	
	
		return "AddQuestionPage";
	}
	
	@RequestMapping(value = "/editquestion" , method = RequestMethod.GET)
	public String loadeditquestionPage(HttpServletRequest request, HttpSession session) {	
		String qid = request.getParameter("qid");
		System.out.println("qid="+qid);
		AddQuestionDB aqDB = new  AddQuestionDB();
		question qt = aqDB.getQuestionbyID(qid);
		session.setAttribute("qt", qt);
		
		return "EditQuestionPage";
	}
	
	@RequestMapping(value = "/listquestion" , method = RequestMethod.GET)
	public String loadlistquestionPage() throws Exception {	
		
		return "ListQuestions";
	}
	
	
	
	@PostMapping("/addQuestions")
	public String addQuestions(HttpServletRequest request, HttpSession session) {
	    List<question> questionList = new ArrayList<>();
	    int error = 0;
	    
	    try {
	    int rowCount =Integer.parseInt(request.getParameter("rowCount"));
	    System.out.println("rowCount= " + rowCount);
	    // Retrieve all submitted questions
	   for (int i = 1; i<=rowCount; i++) {
	    String questionTexts = request.getParameter("questions["+i+"].questionText");
	    String questionTypes = request.getParameter("questions["+i+"].questionType");
	    double scores = Double.parseDouble(request.getParameter("questions["+i+"].score"));
	    System.out.println(" questionTexts= "+questionTexts+" questionTypes= "+questionTypes+" scores= "+scores);
	    // Process each question
	    
	    if (questionTexts != null && questionTypes != null) {

	            question qt = new question("", questionTexts, questionTypes, scores);
	            AddQuestionDB aqDB = new AddQuestionDB();
	            int checkdoublequestion = aqDB.CheckDoubleQuestion(questionTexts);
	            if(checkdoublequestion == 0) {
	            error = aqDB.addQuestion(qt);
	            }else {error = -1;}

	    }
	    }
	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "ListQuestions";
	    } else {
	        request.setAttribute("error", error);
	        return "AddQuestionPage";
	    }
	}

	
	@RequestMapping(value="/EditQuestion", method=RequestMethod.POST)
	public String EditQuestion(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    try {
	        // ดึงค่าจาก request
	        String questionid = request.getParameter("questionid");
	        String questiontext = request.getParameter("questiontext");
	        String questiontype = request.getParameter("questiontype");
	        double score =Double.parseDouble(request.getParameter("score")) ;
	        System.out.println("questionid="+questionid+"questiontext"+questiontext+"questiontype"+questiontype+"score"+score);
	        
	        AddQuestionDB aqDb = new AddQuestionDB();
	        question qt = new question(questionid,questiontext,questiontype,score);
	        
	        // อัปเดตข้อมูลครูในฐานข้อมูล
	        error = aqDb.editQuestion(qt);

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "ListQuestions";
	    } else {
	        request.setAttribute("error", error);
	        return "EditQuestionPage";
	    }
	}
	
	
	@RequestMapping(value="/DeleteQuestion", method=RequestMethod.GET)
	public String DeleteQuestion(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    List<String> formNames = new ArrayList<>();
	    try {
	        // ดึงค่าจาก request
	        int questionid =Integer.parseInt(request.getParameter("qid"));
	        System.out.println("qid"+questionid);
	        AddQuestionDB aqDb = new AddQuestionDB();
	        CreateformDB cfDB = new CreateformDB();
	        // อัปเดตข้อมูลครูในฐานข้อมูล
	        List<formteacherdetail> ftd = aqDb.CheckQuestionInFormTeacher(questionid);
	        List<formmenterdetail> fmd = aqDb.CheckQuestionInFormMentor(questionid);
	        
	        List<Teacherassessmentform> Listft = cfDB.ListAllTeacherassessmentform();
	        List<Mentorassessmentform> Listfm = cfDB.ListAllMentorassessmentform();
	        
	        if (ftd.isEmpty()&&fmd.isEmpty()) {
	        	System.out.println("0 ไม่มีคำถามในฟอร์ม");
	        error = aqDb.DeleteQuestion(questionid);
	        }else {
	        	for(formteacherdetail ft :ftd) {
	        	for (Teacherassessmentform form : Listft) {

	                if (form.getTeacherassessmentformid()==ft.getTeacherformid_detail()) {
	                    formNames.add(form.getTeacherassessmentformid()+" "+form.getTitle()); 

	                }
	            }
	        	}
	        	for(formmenterdetail fm :fmd) {
	            for (Mentorassessmentform form : Listfm) {

	                if (form.getMentorassessmentformid()==fm.getMentorformid_detail()) {
	                    formNames.add(form.getMentorassessmentformid()+" "+form.getTitle());

	                }
	            }
	        	
	        }
	        	error = -1;
	        	System.out.println("1 มีคำถามในฟอร์ม");
	        	System.out.println("1 มีคำถามในฟอร์ม"+formNames);
	        	
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "ListQuestions";
	    } else {
	        request.setAttribute("error", error);
	        request.setAttribute("formNames", formNames);
	        return "ListQuestions";
	    }
	}

	
	@RequestMapping(value="/ListFormByQuestionId", method=RequestMethod.GET)
	public String ListFormByQuestionId(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    int questionid = 0;
	    List<String> formNames = new ArrayList<>();
	    try {
	        // ดึงค่าจาก request
	        questionid =Integer.parseInt(request.getParameter("qid"));
	        System.out.println("qid"+questionid);
	        AddQuestionDB aqDb = new AddQuestionDB();
	        CreateformDB cfDB = new CreateformDB();
	        // อัปเดตข้อมูลครูในฐานข้อมูล
	        List<formteacherdetail> ftd = aqDb.CheckQuestionInFormTeacher(questionid);
	        List<formmenterdetail> fmd = aqDb.CheckQuestionInFormMentor(questionid);
	        
	        List<Teacherassessmentform> Listft = cfDB.ListAllTeacherassessmentform();
	        List<Mentorassessmentform> Listfm = cfDB.ListAllMentorassessmentform();
	        
	       
	       
	        	for(formteacherdetail ft :ftd) {
	        	for (Teacherassessmentform form : Listft) {

	                if (form.getTeacherassessmentformid()==ft.getTeacherformid_detail()) {
	                    formNames.add(form.getTeacherassessmentformid()+" "+form.getTitle()); 

	                }
	            }
	        	}
	        	for(formmenterdetail fm :fmd) {
	            for (Mentorassessmentform form : Listfm) {

	                if (form.getMentorassessmentformid()==fm.getMentorformid_detail()) {
	                    formNames.add(form.getMentorassessmentformid()+" "+form.getTitle());

	                }
	            }
	        	
	        }

	        	
	        
	     System.out.println("formNames="+formNames);   	
	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    
	        request.setAttribute("error", error);
	        if(formNames.isEmpty()||formNames==null) {
	        	request.setAttribute("CheckQuestion", 2);
	        }else {
	        request.setAttribute("CheckQuestion", 1);}
	        request.setAttribute("questiontid", questionid);
	        request.setAttribute("formNames", formNames);
	        return "ListQuestions";
	    
	}
	
	
	
}


