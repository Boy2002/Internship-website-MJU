package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.crypto.SecretKey;

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

import org.mindrot.jbcrypt.BCrypt;

import bean.*;
import util.EditStudentProfileDB;
import util.EditmentorDB;
import util.ListmentorDB;
import util.LoginbyStudentDB;
import util.addmentorDB;
@Controller
public class Editmentorcontroller {

	public Editmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadEditmentorPage" , method = RequestMethod.GET)
	public String loadEditmentorPage(HttpServletRequest  request ,HttpSession session) {
		String mentorid = request.getParameter("idMentor");
		int mentoridint = Integer.parseInt(mentorid);
		EditmentorDB EDB = new EditmentorDB();
		Mentor mentor = EDB.SearchMentorid(mentoridint);
		mentor_student mentor_student = EDB.getmentor_studentByMentorid(mentoridint);
		
		session.setAttribute("Ementor", mentor);
		session.setAttribute("mentor_student", mentor_student);
		return "EditmentorPage";
	}
	
	@RequestMapping(value = "/loadEditmentorPageNew" , method = RequestMethod.GET)
	public String loadEditmentorPageNew(HttpServletRequest  request ,HttpSession session) {
		String mentorid = request.getParameter("idMentor");
		int mentoridint = Integer.parseInt(mentorid);
		EditmentorDB EDB = new EditmentorDB();
		Mentor mentor = EDB.SearchMentorid(mentoridint);
		
		session.setAttribute("Ementor", mentor);
		return "EditMentorPageNew";
	}
	
	@RequestMapping(value = "/loadViewmentorPage" , method = RequestMethod.GET)
	public String loadViewmentorPage(HttpServletRequest  request ,HttpSession session) {
		String mentorid = request.getParameter("idMentor");
		String STUid = request.getParameter("stu");
		int mentoridint = Integer.parseInt(mentorid);
		EditmentorDB EDB = new EditmentorDB();
		Mentor mentor = EDB.SearchMentorid(mentoridint);
		
		session.setAttribute("Ementor", mentor);
		session.setAttribute("STUid", STUid);
		return "ViewmentorPage";
	}

	
	
//	@RequestMapping(value="/Editmentor", method=RequestMethod.POST)
//	public String EditStudentProfile(HttpServletRequest  request, HttpSession session) {
//		int error = 0;
//		EditmentorDB md = new EditmentorDB();
//		int mentoridint = 0;
//		Mentor mentor = null;
//		
//		/*if (ServletFileUpload.isMultipartContent(request)) {
//			try {
//				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//				
//		String mentorimg = new File(data.get(0).getName()).getName();		
//		String testitem_ID = new String(data.get(1).get(),StandardCharsets.UTF_8);
//		String mentorprefix = new String(data.get(2).get(),StandardCharsets.UTF_8);
//		String mentorname = new String(data.get(3).get(),StandardCharsets.UTF_8);
//		String lastname = new String(data.get(4).get(),StandardCharsets.UTF_8);
//		String mentornickname = new String(data.get(5).get(),StandardCharsets.UTF_8);
//		String mentorposition = new String(data.get(6).get(),StandardCharsets.UTF_8);
//		String phonenumber = new String(data.get(7).get(),StandardCharsets.UTF_8);
//		String mentorline = new String(data.get(8).get(),StandardCharsets.UTF_8);
//		String metoremail = new String(data.get(9).get(),StandardCharsets.UTF_8);
//		String metorfacebook = new String(data.get(10).get(),StandardCharsets.UTF_8);
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
//	
//		mentoridint = Integer.parseInt(testitem_ID);
//		mentor = md.SearchMentorid(mentoridint);
//		
//		Student student = (Student)session.getAttribute("student");
//	
//		if(mentorimg != "") {
//		 mentor = new Mentor(mentoridint,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,testitem_ID+"_"+date1+"_Mentor.png");
//		 String path = request.getSession().getServletContext().getRealPath("/") + "//images//MT//";
//		 data.get(0).write(new File(path +File.separator +testitem_ID+"_"+date1+"_Mentor.png"));	
//		 
//		}else {
//		 mentor = new Mentor(mentoridint,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,mentor.getMentorimg());
//		}
//		
//		EditmentorDB sm = new EditmentorDB();
//		 error = sm.UPDATEMentor(mentor);		
//			
//		 
//			}catch (Exception e) {
//				e.printStackTrace();				
//				}	
//	}*/
//		if(error == 1) { 
//			Student student = (Student)session.getAttribute("student");
//			ListmentorDB   HM = new ListmentorDB();
//			List<Mentor> st = HM.AllListmentor(student.getIdstudent());
//			request.setAttribute("error", error);
//			session.setAttribute("listmentors", st);
//			return "ListmentorPage";
//		}else {
//			Mentor mentor1 = md.SearchMentorid(mentoridint);
//			request.setAttribute("error", error);
//			session.setAttribute("Ementor", mentor1);
//			return "EditmentorPage";
//		}
//		
//	}
	
	@RequestMapping(value="/Editmentor", method=RequestMethod.POST)
	public String EditStudentProfile(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    EditmentorDB md = new EditmentorDB();
	    int mentoridint = 0;
	    Mentor mentor = null;

	    try {
	        // ดึงค่าจาก request
	        String mentorimg = "";
	        String testitem_ID = request.getParameter("mentorid");
	        String mentorprefix = request.getParameter("mentorprefix");
	        String mentorname = request.getParameter("mentorname");
	        String lastname = request.getParameter("lastname");
	        String mentornickname = request.getParameter("mentornickname");
	        String mentorposition = request.getParameter("mentorposition");
	        String phonenumber = request.getParameter("phonenumber");
	        String mentorline = request.getParameter("metorline");
	        String metoremail = request.getParameter("metoremail");
	        String metorfacebook = request.getParameter("metorfacebook");
	        

	        // เทสการรับค่า
	        System.out.println(testitem_ID);
	        System.out.println(mentorname);
	        
	        

	        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
	        Part filePart = request.getPart("mentorimg");
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
	            String newFilename = testitem_ID + "_" + date1 + "_Mentor.png";
	            
	            filePart.write(path + File.separator + newFilename);
	            mentorimg = newFilename;
	        }

	        mentoridint = Integer.parseInt(testitem_ID);
	        mentor = md.SearchMentorid(mentoridint);

	        if (!mentorimg.isEmpty()) {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentorimg);
	        } else {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentor.getMentorimg());
	        }

	        error = md.UPDATEMentornotpassword(mentor);

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == 1) {
	        Student student = (Student) session.getAttribute("student");
	        ListmentorDB HM = new ListmentorDB();
	        List<Mentor> st = HM.AllListmentor(student.getIdstudent());
	        request.setAttribute("error", error);
	        session.setAttribute("listmentors", st);
	        return "ListmentorPage";
	    } else {
	        Mentor mentor1 = md.SearchMentorid(mentoridint);
	        request.setAttribute("error", error);
	        session.setAttribute("Ementor", mentor1);
	        return "EditmentorPage";
	    }
	}
	
	@RequestMapping(value="/EditmentorforTeacher", method=RequestMethod.POST)
	public String EditmentorforTeacher(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    int errormen_stu = 0;
	    EditmentorDB md = new EditmentorDB();
	    int mentoridint = 0;
	    Mentor mentor = null;

	    try {
	        // ดึงค่าจาก request
	        String mentorimg = "";
	        String testitem_ID = request.getParameter("mentorid");
	        String mentorprefix = request.getParameter("mentorprefix");
	        String mentorname = request.getParameter("mentorname");
	        String lastname = request.getParameter("lastname");
	        String mentornickname = request.getParameter("mentornickname");
	        String mentorposition = request.getParameter("mentorposition");
	        String phonenumber = request.getParameter("phonenumber");
	        String mentorline = request.getParameter("metorline");
	        String metoremail = request.getParameter("metoremail");
	        String metorfacebook = request.getParameter("metorfacebook");
	        String password = request.getParameter("password");
	        String stuid = request.getParameter("stuid");	
	        // เทสการรับค่า
	        System.out.println(testitem_ID);
	        System.out.println(mentorname);
	        
	        //เข้ารหัสผ่าน2ทางแปลงไปกลับได้
	        // สร้างคีย์ AES (ควรจัดเก็บคีย์นี้อย่างปลอดภัย)
	        SecretKey secretKey = AESpassword.generateKey();
	        // แปลงคีย์เป็นsting
	        String encodedKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
	        // เข้ารหัสรหัสผ่านก่อนบันทึกลงฐานข้อมูล
	        String encryptedPassword = AESpassword.encrypt(password, secretKey);
	        //////////////////////
	        

	        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
	        Part filePart = request.getPart("mentorimg");
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
	            String newFilename = testitem_ID + "_" + date1 + "_Mentor.png";
	            
	            filePart.write(path + File.separator + newFilename);
	            mentorimg = newFilename;
	        }

	        addmentorDB sm = new addmentorDB();
	        mentoridint = Integer.parseInt(testitem_ID);
	        mentor = md.SearchMentorid(mentoridint);
	        Mentor mentorT = sm.SearchMentorname(mentorname, lastname);

	        if(password != "" && password != null && !password.isEmpty()) {
	        if (!mentorimg.isEmpty()) {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentorimg,encryptedPassword,encodedKey);
	        } else {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentor.getMentorimg(),encryptedPassword,encodedKey);
	        }
	        error = md.UPDATEMentor(mentor);
	        }else {
	        	if (!mentorimg.isEmpty()) {
		            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentorimg);
		        } else {
		            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentor.getMentorimg());
		        }
	        	error = md.UPDATEMentornotpassword(mentor);
	        }
	        
	        if (stuid != null && stuid != "" && !stuid.isEmpty()) {
	        	errormen_stu = sm.addmentor_student(stuid, mentorT.getMentorid());
	        }

	        

	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == 1) {
	        //Student student = (Student) session.getAttribute("student");
	       // ListmentorDB HM = new ListmentorDB();
	        //List<Mentor> st = HM.AllListmentor(student.getIdstudent());
	    	session.setAttribute("error", error);
	    	 request.setAttribute("errormen_stu", errormen_stu);
	        //session.setAttribute("listmentors", st);
	        return "redirect:/loadListmentorManage";
	    } else {
	        Mentor mentor1 = md.SearchMentorid(mentoridint);
	        session.setAttribute("error", error);
	        request.setAttribute("errormen_stu", errormen_stu);
	        session.setAttribute("Ementor", mentor1);
	        return "redirect:/loadListmentorManage";
	    }
	}
	
	@RequestMapping(value="/EditMentorNew", method=RequestMethod.POST)
	public String EditMentorProfile(HttpServletRequest request, HttpSession session) {
	    int error = 0;
	    EditmentorDB md = new EditmentorDB();
	    int mentoridint = 0;
	    Mentor mentor = null;

	    try {
	        // ดึงค่าจาก request
	        String mentorimg = "";
	        String testitem_ID = request.getParameter("mentorid");
	        String mentorprefix = request.getParameter("mentorprefix");
	        String mentorname = request.getParameter("mentorname");
	        String lastname = request.getParameter("lastname");
	        String mentornickname = request.getParameter("mentornickname");
	        String mentorposition = request.getParameter("mentorposition");
	        String phonenumber = request.getParameter("phonenumber");
	        String mentorline = request.getParameter("metorline");
	        String metoremail = request.getParameter("metoremail");
	        String metorfacebook = request.getParameter("metorfacebook");
	        String password = request.getParameter("password");	
	        
	        // เทสการรับค่า
	        System.out.println(testitem_ID);
	        System.out.println(mentorname);
	        
	        //////////////////////////////////////////
	        // เข้ารหัสรหัสผ่านก่อนบันทึกลงฐานข้อมูล เข้ารหัสผ่านทางเดียวไม่สามารถแปลงกับได้ ปลอดภัยสุดๆๆ แต่จะชนการทำงานอื่นๆ เช่นการส่งรหัสผ่านอีเมล์
	        //String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
	        
	        
	        //เข้ารหัสผ่าน2ทางแปลงไปกลับได้
	        // สร้างคีย์ AES (ควรจัดเก็บคีย์นี้อย่างปลอดภัย)
	        SecretKey secretKey = AESpassword.generateKey();
	        // แปลงคีย์เป็นsting
	        String encodedKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
	        // เข้ารหัสรหัสผ่านก่อนบันทึกลงฐานข้อมูล
	        String encryptedPassword = AESpassword.encrypt(password, secretKey);
	        //////////////////////
	        
	        
	        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
	        Part filePart = request.getPart("imageUpload");
	        if (filePart != null && filePart.getSize() > 0) {
	            mentorimg = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	            String path = request.getServletContext().getRealPath("/") + "//images//MT//";
	            
	            // เพิ่มเวลาปัจจุบันเพื่อสร้างชื่อไฟล์ที่ไม่ซ้ำกัน
	            Date dd = new Date();
	            Calendar c1 = Calendar.getInstance();
	            c1.setTime(dd);
	           // c1.add(Calendar.YEAR, 543);
	            dd = c1.getTime();
	            String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
	            String newFilename = testitem_ID + "_" + date1 + "_Mentor.png";
	            
	            filePart.write(path + File.separator + newFilename);
	            mentorimg = newFilename;
	        }

	        mentoridint = Integer.parseInt(testitem_ID);
	        mentor = md.SearchMentorid(mentoridint);
	        if(password != "" && password != null && !password.isEmpty()) {
	        if (!mentorimg.isEmpty()) {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentorimg,encryptedPassword,encodedKey);
	        } else {
	            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentor.getMentorimg(),encryptedPassword,encodedKey);
	        }
	        error = md.UPDATEMentor(mentor);
	        }else {
	        	if (!mentorimg.isEmpty()) {
		            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentorimg);
		        } else {
		            mentor = new Mentor(mentoridint, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, metorfacebook, phonenumber, mentor.getMentorimg());
		        }
	        	error = md.UPDATEMentornotpassword(mentor);
	        }
	        
	        System.out.println("EditMentorProfile error="+error);
	    } catch (Exception e) {
	        e.printStackTrace();
	        error = -1;
	    }

	    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
	    if (error == 1) {
	        request.setAttribute("error", error);
	        return "redirect:/loadEditmentorPageNew?idMentor="+mentoridint;
	    } else {
	        Mentor mentor1 = md.SearchMentorid(mentoridint);
	        request.setAttribute("error", error);
	        session.setAttribute("Ementor", mentor1);
	        return "EditMentorPageNew";
	    }
	}


}
