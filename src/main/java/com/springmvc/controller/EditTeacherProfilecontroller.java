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
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.EditTeacherProfileDB;
import util.LoginbyStudentDB;
import util.teacherManager;
@Controller
public class EditTeacherProfilecontroller {

	public EditTeacherProfilecontroller() {
		// TODO Auto-generated constructor stub
	}
	



@RequestMapping(value = "/loadEditTeacherProfile" , method = RequestMethod.GET)
public String loadEditStudentProfilePage() {
	
	return "EditTeacherProfile";
}

@RequestMapping(value = "/loadViewTeacherProfile" , method = RequestMethod.GET)
public String loadViewTeacherProfile() {
	
	return "ViewTeacherProfile";
}

//@RequestMapping(value="/EditTeacher", method=RequestMethod.POST)
//public String EditStudentProfile(HttpServletRequest  request, HttpSession session) {
//	int error = 0;
//	EditTeacherProfileDB md = new EditTeacherProfileDB();
//	teacherManager TM = new teacherManager();
//	int Teacheridint = 0;
//	teacher Teacher = null;
//	teacher TeacherE = null;
//	
//	/*if (ServletFileUpload.isMultipartContent(request)) {
//		try {
//			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//			
//	String Teacherimg = new File(data.get(0).getName()).getName();	
//	String teacherid = new String(data.get(1).get(),StandardCharsets.UTF_8);
//	String teachername = new String(data.get(2).get(),StandardCharsets.UTF_8);
//	String teacherlastname = new String(data.get(3).get(),StandardCharsets.UTF_8);
//	String phonenumber = new String(data.get(4).get(),StandardCharsets.UTF_8);
//	String teacheremail = new String(data.get(5).get(),StandardCharsets.UTF_8);
//	String password = new String(data.get(6).get(),StandardCharsets.UTF_8);
//	
//
//	Teacheridint = Integer.parseInt(teacherid);
//	TeacherE = TM.Searchteacherid(Teacheridint);
//	
//	Date dd = new Date();
//	Calendar c1 = Calendar.getInstance();
//	c1.setTime(dd);
//	c1.add(Calendar.YEAR,543);
//	dd = c1.getTime();
//	String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//	
//	if(Teacherimg != "") {
//	Teacher = new teacher(Teacheridint,teachername,teacherlastname,phonenumber,teacheremail,password,"",Teacheridint+"_"+date1+"_Teacher.png","");
//	 String path = request.getSession().getServletContext().getRealPath("/") + "//images//TC//";
//	 data.get(0).write(new File(path +File.separator +Teacheridint+"_"+date1+"_Teacher.png"));	
//	 
//	}else {
//		Teacher = new teacher(Teacheridint,teachername,teacherlastname,phonenumber,teacheremail,password,"",TeacherE.getTeacherimg(),"");
//	}
//	
//	 error = md.UPDATESTeacher(Teacher);		
//		
//	 
//		}catch (Exception e) {
//			e.printStackTrace();				
//			}	
//}*/
//	
//		LoginbyStudentDB LS = new LoginbyStudentDB();
//		Teacher = LS.verifyLoginTC(Teacher);
//		session.setAttribute("teacher", Teacher);
//		request.setAttribute("error", error);
//		return "EditTeacherProfile";
//	
//}

@RequestMapping(value="/EditTeacher", method=RequestMethod.POST)
public String EditTeacherProfile(HttpServletRequest request, HttpSession session) {
    int error = 0;
    EditTeacherProfileDB md = new EditTeacherProfileDB();
    teacherManager TM = new teacherManager();
    int Teacheridint = 0;
    teacher Teacher = null;
    teacher TeacherE = null;

    try {
        // ดึงค่าจาก request
        String teacherid = request.getParameter("teacherid");
        String teachername = request.getParameter("teachername");
        String teacherlastname = request.getParameter("teacherlastname");
        String phonenumber = request.getParameter("phonenumber");
        String teacheremail = request.getParameter("teacheremail");
        String password = request.getParameter("password");
        
        // ตรวจสอบค่า teacherid ไม่เป็น null หรือว่าง
        if (teacherid == null || teacherid.isEmpty()) {
            throw new NumberFormatException("teacherid is null or empty");
        }

        // แปลงค่า teacherid เป็น int
        Teacheridint = Integer.parseInt(teacherid);
        TeacherE = TM.Searchteacherid(Teacheridint);

        // ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
        Part filePart = request.getPart("imageUpload");
        String teacherimg = "";
        if (filePart != null && filePart.getSize() > 0) {
            teacherimg = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String path = request.getServletContext().getRealPath("/") + "//images//TC//";

            // เพิ่มเวลาปัจจุบันเพื่อสร้างชื่อไฟล์ที่ไม่ซ้ำกัน
            Date dd = new Date();
            Calendar c1 = Calendar.getInstance();
            c1.setTime(dd);
           // c1.add(Calendar.YEAR, 543);
            dd = c1.getTime();
            String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
            String newFilename = Teacheridint + "_" + date1 + "_Teacher.png";

            filePart.write(path + File.separator + newFilename);
            teacherimg = newFilename;
        }

        // กำหนดค่าให้กับ Teacher object
        
 
        if(password != "" && password != null && !password.isEmpty()) {
        	 String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        	 if (!teacherimg.isEmpty()) {
                 Teacher = new teacher(Teacheridint, teachername, teacherlastname, phonenumber, teacheremail, hashedPassword,  teacherimg);
             } else {
                 Teacher = new teacher(Teacheridint, teachername, teacherlastname, phonenumber, teacheremail, hashedPassword,  TeacherE.getTeacherimg());
             }
        	 error = md.UPDATESTeacher(Teacher);
	        }else {
	        	 if (!teacherimg.isEmpty()) {
	                 Teacher = new teacher(Teacheridint, teachername, teacherlastname, phonenumber, teacheremail, teacherimg);
	             } else {
	                 Teacher = new teacher(Teacheridint, teachername, teacherlastname, phonenumber, teacheremail, TeacherE.getTeacherimg());
	             }
	        	 error = md.UPDATESTeachernotPassword(Teacher);
	        }
        
        // อัปเดตข้อมูลครูในฐานข้อมูล
       

    } catch (Exception e) {
        e.printStackTrace();
        error = -1;
    }

    // ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
    if (error == 1) {
        LoginbyStudentDB LS = new LoginbyStudentDB();
		
		 Teacher = LS.verifyLoginTCByEmail(Teacher); session.setAttribute("teacher",Teacher);
		
        request.setAttribute("error", error);
        return "ViewTeacherProfile";
    } else {
        request.setAttribute("error", error);
        return "EditTeacherProfile";
    }
}




}
