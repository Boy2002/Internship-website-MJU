package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class Createformcontroller {

	public Createformcontroller() {
		// TODO Auto-generated constructor stub
	}
	

	@RequestMapping(value = "/createformmentor" , method = RequestMethod.GET)
	public String createformmentor() throws Exception {	
	
		return "CreateFormMentorPage";
	}
	
	@RequestMapping(value = "/createformteacher" , method = RequestMethod.GET)
	public String createformteacher() throws Exception {	
	
		return "CreateFormTeacherPage";
	}
	
	@RequestMapping(value = "/listform" , method = RequestMethod.GET)
	public String loadlistquestionPage() throws Exception {	
		
		return "ListForm";
	}
	
	@RequestMapping(value = "/copymentorformpage" , method = RequestMethod.GET)
	public String loadcopymentorformPage(HttpServletRequest request, HttpSession session) {	
		int mfid = Integer.parseInt(request.getParameter("mfid"));
		System.out.println("Copyform mfid="+mfid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(mfid);
		
		session.setAttribute("mf", mf);
		
		return "CopyMentorFormPage";
	}
	
	@RequestMapping(value = "/copyteacherformpage" , method = RequestMethod.GET)
	public String loadcopyteacherformPage(HttpServletRequest request, HttpSession session) {	
		int tfid = Integer.parseInt(request.getParameter("tfid"));
		System.out.println("Copyform tfid="+tfid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(tfid);
		
		session.setAttribute("tf", tf);
		
		return "CopyTeacherFormPage";
	}
	
	@RequestMapping(value = "/editmentorformpage" , method = RequestMethod.GET)
	public String loadeditmentorformPage(HttpServletRequest request, HttpSession session) {	
		int mfid = Integer.parseInt(request.getParameter("mfid"));
		System.out.println("Editmentorform mfid="+mfid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(mfid);
		
		session.setAttribute("mf", mf);
		
		return "EditMentorFormPage";
	}
	
	@RequestMapping(value = "/editteacherformpage" , method = RequestMethod.GET)
	public String loadeditteacherformPage(HttpServletRequest request, HttpSession session) {	
		int tfid = Integer.parseInt(request.getParameter("tfid"));
		System.out.println("Editteacherform tfid="+tfid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(tfid);
		
		session.setAttribute("tf", tf);
		
		return "EditTeacherFormPage";
	}
	
	@PostMapping("/CreateFormMentor")
	public String CreateFormMentor(HttpServletRequest request, HttpSession session) {
	    List<question> questionList = new ArrayList<>();
	    int error = -1; 
	    int DoubleQuestion = 0;
	    double scores = 0.0;
	    		
	    try {
	        String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        double totalscore = Double.parseDouble(request.getParameter("totalscorevalue"));
	        
	        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	        
	        String yearE = request.getParameter("yearE");
	        String inlineRadio1 = request.getParameter("inlineRadio1");
	        String semester = inlineRadio1 + "/" + yearE;
	        
	        //double totalscore = 0;
	        
	        System.out.println(date);
	        System.out.println(semester);
	        
	        Mentorassessmentform mf = new Mentorassessmentform(title, description, semester, date, totalscore);
	        CreateformDB cfDB = new CreateformDB();
	        
	        // ตรวจสอบว่ามีฟอร์มภาคเรียนนี้แล้วหรือไม่
	        List<Mentorassessmentform> listmentor = cfDB.getMentorFormBySemester(semester);
	        if (!listmentor.isEmpty()) {
	            // ถ้ามีฟอร์มในภาคเรียนนี้แล้ว ให้ส่งกลับหน้า CreateFormTeacherPage พร้อมแสดง error
	            request.setAttribute("error", -2);
	            return "CreateFormMentorPage";
	        }

	        // ถ้าไม่มีฟอร์มซ้ำ ให้ดำเนินการเพิ่มฟอร์มต่อไป
	        error = cfDB.addHeaderFormMentor(mf);

	        if (error != 1) {
	            throw new RuntimeException("Failed to add mentor assessment form header");
	        }
	        
	        /////------------- add questions -----------------/////
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        System.out.println("rowCount= " + rowCount);
	        
	        // Retrieve all submitted questions
	        for (int i = 1; i <= rowCount; i++) {
	            String questionTexts = request.getParameter("questions[" + i + "].questionText");
	            String questionTypes = request.getParameter("questions[" + i + "].questionType");
	            String scoreParam = request.getParameter("questions["+i+"].score");
	            
	            if (scoreParam != null && !scoreParam.trim().isEmpty()) {
	                scores = Double.parseDouble(scoreParam);
	            } else {            
	                scores = 0.0; 
	            }

	            
	            System.out.println(i+" questionTexts= " + questionTexts + " questionTypes= " + questionTypes + " scores= " + scores);
	            // Process each question
	            
	            question Checkqt = cfDB.getQuestionbyName(questionTexts);
	            
	            if (questionTexts != null && questionTypes != null) {
	            	
	                if (Checkqt == null) {
	                    question qt = new question("", questionTexts, questionTypes, scores);
	                    AddQuestionDB aqDB = new AddQuestionDB();
	                    error = aqDB.addQuestion(qt);
	                    if (error == 1) {
	                    	///เพิ่มคำถามใหม่
	                        int mentorformid_detail = cfDB.getMaxIdMentorForm();
	                        int questionid_detail = cfDB.getMaxIdQuestion();
	                        formmenterdetail fmd = new formmenterdetail(mentorformid_detail, questionid_detail,i);
	                        cfDB.addformmenterdetail(fmd);
	                    } else {
	                        throw new RuntimeException("Failed to add question");
	                    }
	                } else {
	                	///คำถามที่เลือกจากคลัง
	                	
	                    int mentorformid_detail = cfDB.getMaxIdMentorForm();
	                    int questionid_detail = Integer.parseInt(Checkqt.getQuestionid());
	                    formmenterdetail fmd = new formmenterdetail(mentorformid_detail, questionid_detail,i);
	                    DoubleQuestion = cfDB.addformmenterdetail(fmd);
	                	//DoubleQuestion = return 1 , -1
	                }
	            }
	        }
	        
	        // If everything is successful, set errorMentorForm to 1
	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	        // Log the error if needed
	        // errorMentorForm remains -1 in case of an error
	    }

	    // Redirect based on the result
	    if (error == 1) {
	        request.setAttribute("error", error);
	        request.setAttribute("DoubleQuestion", DoubleQuestion);
	        return "ListForm";
	    } else {
	        request.setAttribute("error", error);
	        return "CreateFormMentorPage";
	    }
	}

	@PostMapping("/CreateFormTeacher")
	public String CreateFormTeacher(HttpServletRequest request, HttpSession session) {
	    List<question> questionList = new ArrayList<>();
	    int error = -1; 
	    int DoubleQuestion = 0; 
	    double scores = 0.0;

	    try {
	        String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        double totalscore = Double.parseDouble(request.getParameter("totalscorevalue"));
	        
	        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	        
	        String yearE = request.getParameter("yearE");
	        String inlineRadio1 = request.getParameter("inlineRadio1");
	        String semester = inlineRadio1 + "/" + yearE;
	        
	        //double totalscore = 0;
	        
	        System.out.println(date);
	        System.out.println(semester);
	        
	        Teacherassessmentform tf = new Teacherassessmentform(title, description, semester, date, totalscore);
	        
	        CreateformDB cfDB = new CreateformDB();
	        // ตรวจสอบว่ามีฟอร์มภาคเรียนนี้แล้วหรือไม่
	        List<Teacherassessmentform> listteacher = cfDB.getTeacherFormBySemester(semester);
	        if (!listteacher.isEmpty()) {
	            // ถ้ามีฟอร์มในภาคเรียนนี้แล้ว ให้ส่งกลับหน้า CreateFormTeacherPage พร้อมแสดง error
	            request.setAttribute("error", -2);
	            return "CreateFormTeacherPage";
	        }

	        // ถ้าไม่มีฟอร์มซ้ำ ให้ดำเนินการเพิ่มฟอร์มต่อไป
	        error = cfDB.addHeaderFormTeacher(tf);

	        if (error != 1) {
	            throw new RuntimeException("Failed to add teacher assessment form header");
	        }
	        
	        /////------------- add questions -----------------/////
	        int rowCount = Integer.parseInt(request.getParameter("rowCount"));
	        System.out.println("rowCount= " + rowCount);
	        
	        // Retrieve all submitted questions
	        for (int i = 1; i <= rowCount; i++) {
	            String questionTexts = request.getParameter("questions[" + i + "].questionText");
	            String questionTypes = request.getParameter("questions[" + i + "].questionType");
	            String scoreParam = request.getParameter("questions["+i+"].score");
	            
	            if (scoreParam != null && !scoreParam.trim().isEmpty()) {
	                scores = Double.parseDouble(scoreParam);
	            } else {            
	                scores = 0.0; 
	            }	 
	            
	            System.out.println(" questionTexts= " + questionTexts + " questionTypes= " + questionTypes + " scores= " + scores);
	            // Process each question
	            
	            question Checkqt = cfDB.getQuestionbyName(questionTexts);
	            
	            if (questionTexts != null && questionTypes != null) {
	                if (Checkqt == null) {
	                    question qt = new question("", questionTexts, questionTypes, scores);
	                    AddQuestionDB aqDB = new AddQuestionDB();
	                    error = aqDB.addQuestion(qt);
	                    if (error == 1) {
	                        int teacherformid_detail = cfDB.getMaxIdTeacherForm();
	                        int questionid_detail = cfDB.getMaxIdQuestion();
	                        System.out.println("i = "+i);
	                        formteacherdetail ftd = new formteacherdetail(teacherformid_detail, questionid_detail,i);
	                        cfDB.addformteacherdetail(ftd);
	                    } else {
	                        throw new RuntimeException("Failed to add question");
	                    }
	                } else {
	                    int teacherformid_detail = cfDB.getMaxIdTeacherForm();
	                    int questionid_detail = Integer.parseInt(Checkqt.getQuestionid());
	                    System.out.println("i = "+i);
	                    formteacherdetail ftd = new formteacherdetail(teacherformid_detail, questionid_detail,i);
	                    DoubleQuestion = cfDB.addformteacherdetail(ftd);
	                }
	            }
	        }
	        
	        // If everything is successful, set errorMentorForm to 1
	        error = 1;

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the error if needed
	        // errorMentorForm remains -1 in case of an error
	    }

	    // Redirect based on the result
	    if (error == 1) {
	        request.setAttribute("error", error);
	        request.setAttribute("DoubleQuestion", DoubleQuestion);
	        return "ListForm";
	    } else {
	        request.setAttribute("error", error);
	        return "CreateFormTeacherPage";
	    }
	}

	@PostMapping("/EditFormMentor")
	public String EditFormMentor(HttpServletRequest request, HttpSession session) {
	    List<question> questionList = new ArrayList<>();
	    int error = -1;
	    double scores = 0.0;
	    
	    try {
	    int mfid =Integer.parseInt(request.getParameter("mfid"));
	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    double totalscore = Double.parseDouble(request.getParameter("totalscorevalue"));
	    
	    String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	    
	    String yearE = request.getParameter("yearE");
	    String inlineRadio1 = request.getParameter("inlineRadio1");
	    String semester = inlineRadio1+"/"+yearE;
	    
	    //double totalscore = 0;
	    
	    System.out.println("mfid ="+mfid+" title="+title+" description="+description+" totalscorevalue="+totalscore+" date="+date);
	  
	    
	    Mentorassessmentform mf = new Mentorassessmentform(title,description,semester,date,totalscore);
	    CreateformDB cfDB = new  CreateformDB();
	    int errorMentorForm = cfDB.editFormMentor(mf, mfid);
	   
	    
	    /////------------- add questions -----------------/////
	    int rowCount =Integer.parseInt(request.getParameter("rowCount"));
	    System.out.println("rowCount= " + rowCount);
	    // Retrieve all submitted questions
	    int errorDelQuestionMentorForm = cfDB.DeleteQuestionFormMentorForAddNew(mfid);
	   for (int i = 1; i<=rowCount; i++) {
	    String questionTexts = request.getParameter("questions["+i+"].questionText");
	    String questionTypes = request.getParameter("questions["+i+"].questionType");
	    String scoreParam = request.getParameter("questions["+i+"].score");
        
        if (scoreParam != null && !scoreParam.trim().isEmpty()) {
            scores = Double.parseDouble(scoreParam);
        } else {            
            scores = 0.0; 
        }	
	    
	    //System.out.println(" questionTexts= "+questionTexts+" questionTypes= "+questionTypes+" scores= "+scores);
	    // Process each question
	    
	    question Checkqt = cfDB.getQuestionbyName(questionTexts);
	    
	    if (questionTexts != null && questionTypes != null) {
	    	if(Checkqt == null) {
	            question qt = new question("", questionTexts, questionTypes, scores);
	            AddQuestionDB aqDB = new AddQuestionDB();
	            error = aqDB.addQuestion(qt);
	            if(error == 1) {
		        	 int questionid_detail = cfDB.getMaxIdQuestion();
		        	 formmenterdetail fmd = new formmenterdetail(mfid,questionid_detail,i);
		        	 System.out.println("mfid="+mfid+" questionid_detail="+questionid_detail);
		        	 cfDB.addformmenterdetail(fmd);
	        	 }
	         }else {
	        	 
	        	 int questionid_detail = Integer.parseInt(Checkqt.getQuestionid());
	        	 formmenterdetail fmd = new formmenterdetail(mfid,questionid_detail,i);
	        	 System.out.println("mfid="+mfid+" questionid_detail="+questionid_detail);
	        	 cfDB.addformmenterdetail(fmd);
	         }
	        
	    }
	    }
	   error = 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the error if needed
	        // errorMentorForm remains -1 in case of an error
	    }

	        
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "ListForm";
	    } else {
	        request.setAttribute("error", error);
	        return "EditMentorFormPage";
	    }
	}
	
	@PostMapping("/EditFormTeacher")
	public String EditFormTeacher(HttpServletRequest request, HttpSession session) {
	    List<question> questionList = new ArrayList<>();
	    int error = -1;
	    double scores = 0.0;
	    
	    try {
	    int tfid =Integer.parseInt(request.getParameter("tfid"));
	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    double totalscore = Double.parseDouble(request.getParameter("totalscorevalue"));
	    
	    String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	    
	    String yearE = request.getParameter("yearE");
	    String inlineRadio1 = request.getParameter("inlineRadio1");
	    String semester = inlineRadio1+"/"+yearE;
	    
	    //double totalscore = 0;
	    
	    System.out.println(date);
	    System.out.println(semester);
	    
	    Teacherassessmentform tf = new Teacherassessmentform(title,description,semester,date,totalscore);
	    CreateformDB cfDB = new  CreateformDB();
	    int errorTeacherForm = cfDB.editFormTeacher(tf, tfid);
	   
	    
	    /////------------- add questions -----------------/////
	    int rowCount =Integer.parseInt(request.getParameter("rowCount"));
	    System.out.println("rowCount= " + rowCount);
	    // Retrieve all submitted questions
	    int errorDelQuestionTeacherForm = cfDB.DeleteQuestionFormTeacherForAddNew(tfid);
	   for (int i = 1; i<=rowCount; i++) {
	    String questionTexts = request.getParameter("questions["+i+"].questionText");
	    String questionTypes = request.getParameter("questions["+i+"].questionType");
	    String scoreParam = request.getParameter("questions["+i+"].score");
        
        if (scoreParam != null && !scoreParam.trim().isEmpty()) {
            scores = Double.parseDouble(scoreParam);
        } else {            
            scores = 0.0; 
        }
	    
	    System.out.println(" questionTexts= "+questionTexts+" questionTypes= "+questionTypes+" scores= "+scores);
	    // Process each question
	    
	    question Checkqt = cfDB.getQuestionbyName(questionTexts);
	    
	    if (questionTexts != null && questionTypes != null) {
	    	if(Checkqt == null) {
	            question qt = new question("", questionTexts, questionTypes, scores);
	            AddQuestionDB aqDB = new AddQuestionDB();
	            error = aqDB.addQuestion(qt);
	            if(error == 1) {
		        	 int questionid_detail = cfDB.getMaxIdQuestion();
		        	 formteacherdetail ftd = new formteacherdetail(tfid,questionid_detail,i);
		        	 cfDB.addformteacherdetail(ftd);
	        	 }
	         }else {
	        	 
	        	 int questionid_detail = Integer.parseInt(Checkqt.getQuestionid());
	        	 formteacherdetail fmd = new formteacherdetail(tfid,questionid_detail,i);
	        	 cfDB.addformteacherdetail(fmd);
	         }
	        
	    }
	    }
	   error = 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the error if needed
	        // errorMentorForm remains -1 in case of an error
	    }

	        
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "ListForm";
	    } else {
	        request.setAttribute("error", error);
	        return "EditTeacherFormPage";
	    }
	}

	@RequestMapping(value = "/deleteformmentorCasCade" , method = RequestMethod.GET)
	public String loaddeletementorforteacher(HttpSession session , HttpServletRequest  request) {
		int error = 0;
		String formid = request.getParameter("mfid");
		System.out.println("formid = "+formid);
		CreateformDB   cfDB = new CreateformDB();
		///CASCADE!!!!!!
		error = cfDB.deleteFormMentorCASCADE(formid);
		if(error == 1 ) {error +=2;}
		System.out.println("deleteformmentor = "+formid+" "+error);

		
		request.setAttribute("error", error);
		return "ListForm";
	}
	
	@RequestMapping(value = "/deleteformteacherCasCade" , method = RequestMethod.GET)
	public String deleteformteacher(HttpSession session , HttpServletRequest  request) {
		int error = 0;
		String formid = request.getParameter("tfid");
		System.out.println("formid = "+formid);
		CreateformDB   cfDB = new CreateformDB();
		///CASCADE!!!!!!
		error = cfDB.deleteFormTeacherCASCADE(formid);
		if(error == 1 ) {error +=2;}
		System.out.println("deleteformteacher = "+formid+" "+error);

		
		request.setAttribute("error", error);
		return "ListForm";
	}
	
	@RequestMapping(value = "/viewformmentorpage" , method = RequestMethod.GET)
	public String viewformmentorpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		
		//System.out.println("viewformmentorpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Mentorassessmentform mf = cfDB.getMentorFormById(fid);
		
		session.setAttribute("mf", mf);
		
		
		return "ViewFormMentorPage";
	}
	
	@RequestMapping(value = "/viewformteacherpage" , method = RequestMethod.GET)
	public String viewformteacherpage(HttpServletRequest request, HttpSession session) {	
		int fid = Integer.parseInt(request.getParameter("fid"));
		
		//System.out.println("viewformmentorpage fid="+fid +"sid = "+ sid);
		CreateformDB cfDB = new  CreateformDB();
		Teacherassessmentform tf = cfDB.getTeacherFormById(fid);
		
		session.setAttribute("tf", tf);
		
		
		return "ViewFormTeacherPage";
	}
	

}


