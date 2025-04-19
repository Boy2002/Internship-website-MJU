package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.EditmentorDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.addmentorDB;
@Controller
public class addmentorcontroller {



	public addmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadaddmentorPage" , method = RequestMethod.GET)
	public String loadaddmentorPage(HttpSession session) {
		return "addmentorPage";
	}
	

//	@RequestMapping(value="/addmentor", method=RequestMethod.POST)
//	public String addmentor(HttpServletRequest  request, HttpSession session) {
//		int error = 0;
//		Mentor errorM = null ;		
//		
//		/*if (ServletFileUpload.isMultipartContent(request)) {
//			try {
//				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//				
//		String mentorimg = new File(data.get(0).getName()).getName();
//		String mentorprefix = new String(data.get(1).get(),StandardCharsets.UTF_8);
//		String mentorname = new String(data.get(2).get(),StandardCharsets.UTF_8);
//		String lastname = new String(data.get(3).get(),StandardCharsets.UTF_8);
//		String mentornickname = new String(data.get(4).get(),StandardCharsets.UTF_8);
//		String mentorposition = new String(data.get(5).get(),StandardCharsets.UTF_8);
//		String phonenumber = new String(data.get(6).get(),StandardCharsets.UTF_8);
//		String mentorline = new String(data.get(7).get(),StandardCharsets.UTF_8);
//		String metoremail = new String(data.get(8).get(),StandardCharsets.UTF_8);
//		String metorfacebook = new String(data.get(9).get(),StandardCharsets.UTF_8);
//	
//		
//		
//		
//		Date dd = new Date();
//		Calendar c1 = Calendar.getInstance();
//		c1.setTime(dd);
//		c1.add(Calendar.YEAR,543);
//		dd = c1.getTime();
//		String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//		
//	
//		addmentorDB sm = new addmentorDB();
//		EditmentorDB md = new EditmentorDB();
//		Student student = (Student)session.getAttribute("student");
//	
//	
//			int MaxMentor = sm.getMaxMentor();
//			int Mentorid = MaxMentor+1;
//			
//			
//			if(mentorimg != "") {
//			Mentor mentor = new Mentor(Mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,Mentorid+"_"+date1+"_Mentor.png");
//			
//			Mentor mentorT = sm.SearchMentorname(mentorname,lastname);
//			
//			if(mentorT != null) {
//				error = md.UPDATEMentorED(mentor,mentorT);	
//				error = sm.addmentor_student(student.getIdstudent(),mentorT.getMentorid());
//			}else {
//				 error = sm.addMentor(mentor);
//				 error = sm.addmentor_student(student.getIdstudent(),Mentorid);
//			}
//			
//			
//			 
//			}else {
//				Mentor mentor = new Mentor(Mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,"user.png");
//				Mentor mentorT = sm.SearchMentorname(mentorname,lastname);
//				
//				if(mentorT != null) {
//					 error = md.UPDATEMentorED(mentor,mentorT);	
//					 error = sm.addmentor_student(student.getIdstudent(),mentorT.getMentorid());
//				}else {
//					error = sm.addMentor(mentor);
//					 error = sm.addmentor_student(student.getIdstudent(),Mentorid);
//				}
//						 
//			}
//			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//MT//";
//			 if(mentorimg != "") {			 
//				 data.get(0).write(new File(path +File.separator +Mentorid+"_"+date1+"_Mentor.png"));	
//			 }
//			
//			}catch (Exception e) {
//				e.printStackTrace();				
//				}	
//	}*/
//		if(error == -1) { 
//			request.setAttribute("error", error);
//			return "addmentorPage"; 
//		}else {
//			Student student = (Student)session.getAttribute("student");
//			ListmentorDB   HM = new ListmentorDB();
//			List<Mentor> st = HM.AllListmentor(student.getIdstudent());
//			request.setAttribute("error", error);
//			session.setAttribute("listmentors", st);
//			return "ListmentorPage";
//		}
//	}
	
	@RequestMapping(value="/addmentor", method=RequestMethod.POST)
	public String addmentor(HttpServletRequest request, HttpSession session) {
	    int error = 0;

	    try {
	        String mentorimg = "";
	        String mentorprefix = request.getParameter("mentorprefix");
	        String mentorname = request.getParameter("mentorname");
	        String lastname = request.getParameter("lastname");
	        String mentornickname = request.getParameter("mentornickname");
	        String mentorposition = request.getParameter("mentorposition");
	        String phonenumber = request.getParameter("phonenumber");
	        String metorline = request.getParameter("metorline");
	        String metoremail = request.getParameter("metoremail");
	        String metorfacebook = request.getParameter("metorfacebook");

	        System.out.println(mentorprefix); // เทสการรับค่า
	        System.out.println(mentorname); // เทสการรับค่า
	        
	        addmentorDB sm = new addmentorDB();
	        EditmentorDB md = new EditmentorDB();
	        Student student = (Student) session.getAttribute("student");
	        int MaxMentor = sm.getMaxMentor();
	        int Mentorid = MaxMentor + 1;
	        
	        
	        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
	        Part filePart = request.getPart("imageUpload");
	        if (filePart != null && filePart.getSize() > 0) {
	            mentorimg = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	            String path = request.getServletContext().getRealPath("/") + "//images//MT//";
	            
	            // เพิ่มเวลาปัจจุบันเพื่อสร้างชื่อไฟล์ที่ไม่ซ้ำกัน
	            Date dd = new Date();
	            Calendar c1 = Calendar.getInstance();
	            c1.setTime(dd);
	            //c1.add(Calendar.YEAR, 543);
	            dd = c1.getTime();
	            String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
	            String newFilename = Mentorid + "_" + date1 + "_Mentor.png";
	            
	            filePart.write(path + File.separator + newFilename);
	            mentorimg = newFilename;
	        }

	        // เพิ่มข้อมูลลงฐานข้อมูล
	        

	        String profileImage = (mentorimg != "") ? mentorimg : "user.png";

	        Mentor mentor = new Mentor(Mentorid, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, metorline, metorfacebook, phonenumber, profileImage,"mentorIT");
	        Mentor mentorT = sm.SearchMentorname(mentorname, lastname);

	        if (mentorT != null) {
	            error = md.UPDATEMentorED(mentor, mentorT);
	            error = sm.addmentor_student(student.getIdstudent(), mentorT.getMentorid());
	        } else {
	            error = sm.addMentor(mentor);
	            error = sm.addmentor_student(student.getIdstudent(), Mentorid);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == -1) {
	        request.setAttribute("error", error);
	        return "addmentorPage";
	    } else {
	        Student student = (Student) session.getAttribute("student");
	        ListmentorDB HM = new ListmentorDB();
	        List<Mentor> st = HM.AllListmentor(student.getIdstudent());
	        request.setAttribute("error", error);
	        session.setAttribute("listmentors", st);
	        return "ListmentorPage";
	    }
	}
	
	@RequestMapping(value="/addmentorforTeacher", method=RequestMethod.POST)
	public String addmentorforTeacher(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    int errormen_stu = 0;

	    try {
	        String mentorimg = "";
	        String mentorprefix = request.getParameter("mentorprefix");
	        String mentorname = request.getParameter("mentorname");
	        String lastname = request.getParameter("lastname");
	        String mentornickname = request.getParameter("mentornickname");
	        String mentorposition = request.getParameter("mentorposition");
	        String phonenumber = request.getParameter("phonenumber");
	        String metorline = request.getParameter("metorline");
	        String metoremail = request.getParameter("metoremail");
	        String metorfacebook = request.getParameter("metorfacebook");
	        String stuid = request.getParameter("stuid");

	        System.out.println(mentorprefix); // เทสการรับค่า
	        System.out.println(mentorname); // เทสการรับค่า
	        
	        addmentorDB sm = new addmentorDB();
	        EditmentorDB md = new EditmentorDB();
	        //Student student = (Student) session.getAttribute("student");
	        int MaxMentor = sm.getMaxMentor();
	        int Mentorid = MaxMentor + 1;
	        
	        
	        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
	        Part filePart = request.getPart("imageUpload");
	        if (filePart != null && filePart.getSize() > 0) {
	            mentorimg = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	            String path = request.getServletContext().getRealPath("/") + "//images//MT//";
	            
	            // เพิ่มเวลาปัจจุบันเพื่อสร้างชื่อไฟล์ที่ไม่ซ้ำกัน
	            Date dd = new Date();
	            Calendar c1 = Calendar.getInstance();
	            c1.setTime(dd);
	            //c1.add(Calendar.YEAR, 543);
	            dd = c1.getTime();
	            String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
	            String newFilename = Mentorid + "_" + date1 + "_Mentor.png";
	            
	            filePart.write(path + File.separator + newFilename);
	            mentorimg = newFilename;
	        }

	        // เพิ่มข้อมูลลงฐานข้อมูล
	        

	        String profileImage = (mentorimg != "") ? mentorimg : "user.png";

	        Mentor mentor = new Mentor(Mentorid, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, metorline, metorfacebook, phonenumber, profileImage,"mentorIT");
	        Mentor mentorT = sm.SearchMentorname(mentorname, lastname);

	        if (mentorT != null) {
	            error = md.UPDATEMentorED(mentor, mentorT);
	            errormen_stu = sm.addmentor_student(stuid, mentorT.getMentorid());
	        } else {
	            error = sm.addMentor(mentor);
	            errormen_stu = sm.addmentor_student(stuid, Mentorid);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }
	    	
	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == -1) {
	        request.setAttribute("error", error);
	        return "addmentorPage";
	    } else {
	       // Student student = (Student) session.getAttribute("student");
	       // ListmentorDB HM = new ListmentorDB();
	        //List<Mentor> st = HM.AllListmentor(student.getIdstudent());
	        request.setAttribute("error", error);
	        request.setAttribute("errormen_stu", errormen_stu);
	        
	       // session.setAttribute("listmentors", st);
	        return "ListmentorManagePage";
	    }
	}

	}
	
