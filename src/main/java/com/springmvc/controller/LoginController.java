package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import util.LoginbyStudentDB;
import util.ReviewCompanyDB;
import util.notifysendingreportDB;
@Controller
public class LoginController {

	public LoginController() {
		// TODO Auto-generated constructor stub
	}
	

@RequestMapping(value = "/loadlogin" , method = RequestMethod.GET)
public String loadLoginPage() {
	return "LoginbyStudentPage";
}
@RequestMapping(value = "/loadloginEducation" , method = RequestMethod.GET)
public String loadloginEducation() {
	return "LoginEducationPage";
}


@RequestMapping (value="/loadlogout",method=RequestMethod.GET)
public String loadlogout(HttpSession session) {
	session.setMaxInactiveInterval(1);
	session.removeAttribute("student");
	session.removeAttribute("teacher");
	session.removeAttribute("mentor");
	return "index";
}

@RequestMapping (value="/loadlogoutEducation",method=RequestMethod.GET)
public String loadlogoutEducation(HttpSession session) {
	session.setMaxInactiveInterval(1);
	session.removeAttribute("student");
	session.removeAttribute("teacher");
	session.removeAttribute("mentor");
	return "indexEducation";
}

////////new system///////////
@RequestMapping(value = "/loadhomeEducation" , method = RequestMethod.GET)
public String loadhomeEducation() {
	return "indexEducation";
}
///////////////
@RequestMapping(value = "/loadhome" , method = RequestMethod.GET)
public String loadhomePage() {
	return "index";
}
@RequestMapping(value = "/" , method = RequestMethod.GET)
public String homePage() {
	return "index";
}

@RequestMapping(value="/login", method=RequestMethod.POST)
public String doLogin(HttpServletRequest request ,Model md , HttpSession session) {
	
	
	notifysendingreportDB HM = new notifysendingreportDB();
	List<reportname> Listreportname = HM.AllListreportname();
	String Error = null;
	String ErrorRV = null;
	
	try {
		request.setCharacterEncoding("UTF-8");
		}catch(UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
	
	String uname = request.getParameter("uname");
	String pwd = request.getParameter("pwd");

	Student stu = new Student(uname,"","",pwd,"",null,null,"",0,0);

	LoginbyStudentDB sm = new LoginbyStudentDB();
	stu = sm.verifyLoginSTU(stu);
	
	if(stu != null) {
		request.setAttribute("error",1);
		
		for (reportname R : Listreportname) {
			
			Date dt = new Date(stu.getStartdate().getTime());
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, R.getDelivery());
			dt = c.getTime();
			

			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			
			if(dd.after(dt)){
				
				 report Lreport = null;
                 int reportnameid = 0;
                 try{
                    Lreport = HM.AllListmyreport(stu.getIdstudent() , R.getReportnameid()); 
                    reportnameid = Lreport.getReportName_reportnameid();
                    }catch(Exception e){
                    reportnameid = 0;
                    }
                 
                 
                 int reportid = 0;
                 try{
                	 
                	 reportid = HM.AllListreportid(stu.getIdstudent() , R.getReportnameid()-1);  
                	                                  	 
                     }catch(Exception e){
                     reportid = 0;
                     } 
                 
                 if(reportnameid == R.getReportnameid()){
                	 
                 }
                 
                 else if (reportid+1 == R.getReportnameid()){
                	 if(R.getReportnameid() == 18) {
                		 evaluatevideo ev1 = null;
                         String id = null;
                            try{
                                 ev1 = HM.AllListVDO(stu.getIdstudent()); 
                                 id = ev1.getStudent_studentid();
                               }catch(Exception e){
                                 reportnameid = 0;
                               }
                            if(id == null){
                            	Error = R.getReportname();
                             break;
                            }
                            
                	 }else {
                		 Error = R.getReportname();
                	 }         	
                 }
				
			}
			
			
		}
		
		
		Date dtRV = new Date(stu.getEnddate().getTime());
		Calendar c = Calendar.getInstance();
		c.setTime(dtRV);
		dtRV = c.getTime();
		String date = new SimpleDateFormat("dd/MM/yyyy").format(dtRV);
		
		Date ddRV = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(ddRV);
		c1.add(Calendar.YEAR,543);
		ddRV = c1.getTime();
		String date1 = new SimpleDateFormat("dd/MM/yyyy").format(ddRV);
		
		ReviewCompanyDB RVC = new ReviewCompanyDB();
		Review review = null;
		
		if(date.equals(date1) ||ddRV.after(dtRV)){
		try{
		review = RVC.Searchreviewid(stu.getIdstudent());
		}catch(Exception e) {
		review = null;
		}
		
		if(review == null){
			ErrorRV = "1";
		}
		}
		request.setAttribute("Error", Error);
		request.setAttribute("ErrorRV", ErrorRV);
		session.setAttribute("student", stu);
		return "index";
	}else {
		request.setAttribute("error",-1);
		return "LoginbyStudentPage";
	}
	
}


/*
 * @RequestMapping(value="/loginTC", method=RequestMethod.POST) public String
 * loginTC(HttpServletRequest request ,Model md , HttpSession session) {
 * 
 * try { request.setCharacterEncoding("UTF-8");
 * }catch(UnsupportedEncodingException e1) { e1.printStackTrace(); }
 * 
 * String uname = request.getParameter("unameE"); String pwd =
 * request.getParameter("pwdE");
 * 
 * teacher th = new teacher(0,"","","",uname,pwd,"","",""); teacher th1 =null;
 * 
 * LoginbyStudentDB sm = new LoginbyStudentDB(); th1 = sm.verifyLoginTC(th);
 * 
 * if(th1 != null) { request.setAttribute("error",1);
 * session.setAttribute("teacher",th1); return "index"; }else {
 * 
 * th1 = sm.verifyLoginNameTC(th); if(th1 != null) {
 * request.setAttribute("error",-1); }else { request.setAttribute("error",-2); }
 * //response.sendRedirect("login.jsp"); return "LoginbyStudentPage"; }
 * 
 * }
 */


    @RequestMapping(value = "/loginTC", method = RequestMethod.POST)
    public String loginTC(HttpServletRequest request, Model md, HttpSession session) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }

        String uname = request.getParameter("unameE");
        String pwd = request.getParameter("pwdE");

        teacher th = new teacher(0, "", "", "", uname, pwd, "", "", "");
        LoginbyStudentDB sm = new LoginbyStudentDB();
        teacher th1 = sm.verifyLoginNameTC(th);
        
        if (th1 != null) {
            String storedPassword = th1.getPassword(); // ดึงรหัสผ่านที่เก็บในฐานข้อมูล

            // ตรวจสอบถ้ารหัสผ่านในฐานข้อมูลมีความยาว 60 ตัวอักษร ให้ใช้ bcrypt
            boolean isPasswordValid;
            if (storedPassword.length() == 60 && storedPassword.startsWith("$2a$")) {
            	System.out.println("sssssssss");
                // ตรวจสอบรหัสผ่านด้วย bcrypt
                isPasswordValid = BCrypt.checkpw(pwd, storedPassword);
            } else {
                // ตรวจสอบรหัสผ่านด้วยวิธีเดิม (เปรียบเทียบโดยตรงหรือวิธีแฮชที่ใช้ก่อนหน้า)
                isPasswordValid = storedPassword.equals(pwd); // หรือใช้วิธีแฮชอื่นถ้าเก็บแฮชแบบอื่นไว้
                System.out.println("lllllllll");
            }

            if (isPasswordValid) {
                request.setAttribute("error", 1);
                session.setAttribute("teacher", th1);
                return "index";
            } else {
                request.setAttribute("error", -1);
            }
        } else {
            th1 = sm.verifyLoginNameTC(th);
            if (th1 != null) {
                request.setAttribute("error", -1);
            } else {
                request.setAttribute("error", -2);
            }
            return "LoginbyStudentPage";
        }
        return "LoginbyStudentPage";
    }

/*
 * @RequestMapping(value="/loginMentor", method=RequestMethod.POST) public
 * String loginMentor(HttpServletRequest request ,Model md , HttpSession
 * session) {
 * 
 * try { request.setCharacterEncoding("UTF-8");
 * }catch(UnsupportedEncodingException e1) { e1.printStackTrace(); }
 * 
 * String uname = request.getParameter("unameE"); String pwd =
 * request.getParameter("pwdE");
 * 
 * Mentor mt = new Mentor (0,"","","","","",uname,"","", "", "", pwd); Mentor
 * mt1 = null;
 * 
 * LoginbyStudentDB sm = new LoginbyStudentDB(); mt1 = sm.verifyLoginMentor(mt);
 * 
 * if(mt1 != null) { request.setAttribute("error",1);
 * session.setAttribute("mentor",mt1); return "index"; }else {
 * 
 * mt1 = sm.verifyLoginNameMT(mt); if(mt1 != null) {
 * request.setAttribute("error",-1); }else { request.setAttribute("error",-2); }
 * //response.sendRedirect("login.jsp"); return "LoginbyStudentPage"; }
 * 
 * 
 * }
 */


@RequestMapping(value="/loginMentor", method=RequestMethod.POST)
public String loginMentor(HttpServletRequest request ,Model md , HttpSession session) throws Exception {
    try {
        request.setCharacterEncoding("UTF-8");
    } catch (UnsupportedEncodingException e1) {
        e1.printStackTrace();
    }
    
    String uname = request.getParameter("unameE");
    String pwd = request.getParameter("pwdE");

    Mentor mt = new Mentor(0, "", "", "", "", "", uname, "", "", "", "", pwd);
    Mentor mt1 = null;

    LoginbyStudentDB sm = new LoginbyStudentDB();
    
    // ค้นหารหัสผ่านที่เข้ารหัสในฐานข้อมูล
    String encryptedPassword = sm.getEncryptedPasswordByUsername(uname); 
    String encodedKey = sm.getEncryptedKeyByUsername(uname); 
    
    // หากมีรหัสผ่านที่เข้ารหัส ให้ทำการถอดรหัส
    if (encryptedPassword != null && encodedKey != null && !encodedKey.isEmpty()) {
    	
        byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
        SecretKey secretKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
        
        // ถอดรหัสรหัสผ่าน
        String decryptedPassword = AESpassword.decrypt(encryptedPassword, secretKey);
        //System.out.println("-----decryptedPassword-------\n"+decryptedPassword+"\n----------pwd----------\n"+pwd);
        // เปรียบเทียบรหัสผ่าน
        if (decryptedPassword.equals(pwd)) {
        	mt = new Mentor(0, "", "", "", "", "", uname, "", "", "", "", encryptedPassword);
            mt1 = sm.verifyLoginMentor(mt);
            
        }
    } else {
        // หากไม่มีการเข้ารหัส ใช้รหัสผ่านที่ไม่ได้เข้ารหัสในการล็อกอิน
        mt1 = sm.verifyLoginMentor(mt);
    }

    // ตรวจสอบผลการล็อกอิน
    if (mt1 != null) {
        request.setAttribute("error", 1);
        session.setAttribute("mentor", mt1);
        return "index";
    } else {
        mt1 = sm.verifyLoginNameMT(mt);
        if (mt1 != null) {
            request.setAttribute("error", -1);
        } else {
            request.setAttribute("error", -2);
        }
        return "LoginbyStudentPage";
    }
}





}
