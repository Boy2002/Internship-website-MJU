package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.UploadVDODB;
@Controller
public class UploadVDOcontroller {

	public UploadVDOcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value = "/loadUploadVDOPage" , method = RequestMethod.POST)
	public String loadUploadVDOPage(HttpServletRequest  request ,HttpSession session) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		UploadVDODB UR = new UploadVDODB();
		
		List<Student> Lstd = UR.Liststudentidcom(student.getCompany_companyid(),student.getSemester(),student.getStartdate());
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("Lstd", Lstd);
		return "UpdoadVDOPage";
	}
	
	@RequestMapping(value = "/loadEditVDOPage" , method = RequestMethod.POST)
	public String loadEditVDOPage(HttpServletRequest  request ,HttpSession session) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		String VDOid = request.getParameter("VDOid");

		UploadVDODB UR = new UploadVDODB();
		List<Student> Lstd = UR.Liststudentidcom(student.getCompany_companyid(),student.getSemester(),student.getStartdate());
		int id = UR.getIDVOD(student.getIdstudent());
		VDO Fvdo = UR.getVOD(id);
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("Lstd", Lstd);
		session.setAttribute("VDOid", VDOid);
		session.setAttribute("Fvdo", Fvdo);
		return "EditVDOPage";
	}


//	@RequestMapping(value="/uploadVDO", method=RequestMethod.POST)
//	public String uploadVDO(HttpServletRequest  request, HttpSession session) {       
//
//	Student student = (Student)session.getAttribute("student");
//	String Reportid = (String)session.getAttribute("Reportid");
//	List<Student> Lstd = (List)session.getAttribute("Lstd"); 
//	UploadVDODB UR = new UploadVDODB();
//	List<teacher> Teacher = UR.ListTeacher();
//	 int Reportidint = Integer.parseInt(Reportid);
//	 int error = 0;
//	 
//	
//	/*if (ServletFileUpload.isMultipartContent(request)) {
//		try {
//			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//			
//			String URL = new String(data.get(0).get(),StandardCharsets.UTF_8);
//				
//			int getMaxVOD = UR.getMaxVOD();
//			
//			Date dd = new Date();
//			Calendar c1 = Calendar.getInstance();
//			c1.setTime(dd);
//			c1.add(Calendar.YEAR,543);
//			dd = c1.getTime();
//			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
//			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//			
//			int i = getMaxVOD+1;
//			
//			String s = "ไม่ผ่าน";
//					
//			VDO vdo = new VDO(i,URL,date1,s,student.getSemester(),student.getCompany_companyid());
//			error = UR.addvdo(vdo);	
//			
//			for(Student sd :Lstd) {
//			for(teacher TH : Teacher) {
//				if(TH.getStatus().equals("อยู่")){
//			evaluatevideo evvideo = new evaluatevideo(sd.getIdstudent(),i,-1,null,TH.getTeacherid());		
//			error = UR.addevaluatevideo(evvideo);	
//			}
//			}
//			}
//			
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//			
//			}
//	}*/
//	request.setAttribute("error", error);
//	return "notifysendingreportPage";
//	}
	
	@RequestMapping(value="/uploadVDO", method=RequestMethod.POST)
	public String uploadVDO(HttpServletRequest request, HttpSession session) {
	    Student student = (Student) session.getAttribute("student");
	    String Reportid = (String) session.getAttribute("Reportid");
	    List<Student> Lstd = (List<Student>) session.getAttribute("Lstd");
	    UploadVDODB UR = new UploadVDODB();
	    List<teacher> Teacher = UR.ListTeacher();
	    int Reportidint = Integer.parseInt(Reportid);
	    int error = 0;

	    try {
	        String URL = request.getParameter("URLvdo");

	        if (URL != null && !URL.isEmpty()) {
	            int getMaxVOD = UR.getMaxVOD();

	            Date dd = new Date();
	            Calendar c1 = Calendar.getInstance();
	            c1.setTime(dd);
	           // c1.add(Calendar.YEAR, 543);
	            dd = c1.getTime();
	            String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
	            String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);

	            int i = getMaxVOD + 1;

	            String s = "ไม่ผ่าน";

	            VDO vdo = new VDO(i, URL, date1, s, student.getSemester(), student.getCompany_companyid());
	            error = UR.addvdo(vdo);

	            for (Student sd : Lstd) {
	                for (teacher TH : Teacher) {
	                    if (TH.getStatus().equals("อยู่")) {
	                        evaluatevideo evvideo = new evaluatevideo(sd.getIdstudent(), i, -1, null, TH.getTeacherid());
	                        error = UR.addevaluatevideo(evvideo);
	                    }
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    request.setAttribute("error", error);
	    return "notifysendingreportPage";
	}

	
	
	
//	@RequestMapping(value="/EditVDO", method=RequestMethod.POST)
//	public String EditVDO(HttpServletRequest  request, HttpSession session) {       
//
//	Student student = (Student)session.getAttribute("student");
//	String Reportid = (String)session.getAttribute("Reportid");
//	List<Student> Lstd = (List)session.getAttribute("Lstd"); 
//	UploadVDODB UR = new UploadVDODB();
//	List<teacher> Teacher = UR.ListTeacher();
//	 int Reportidint = Integer.parseInt(Reportid);
//	 int error = 0;
//	
//	/*if (ServletFileUpload.isMultipartContent(request)) {
//		try {
//			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//			
//			String URL = new String(data.get(0).get(),StandardCharsets.UTF_8);
//				
//			int getMaxVOD = UR.getIDVOD(student.getIdstudent());
//			
//			Date dd = new Date();
//			Calendar c1 = Calendar.getInstance();
//			c1.setTime(dd);
//			c1.add(Calendar.YEAR,543);
//			dd = c1.getTime();
//			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
//			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//			String s = "ไม่ผ่าน" ;
//			
//			VDO vdo = new VDO(getMaxVOD,URL,date1, s ,student.getSemester(),student.getCompany_companyid());
//			error = UR.Editvdo(vdo);	
//	
//		}catch (Exception e) {
//			e.printStackTrace();
//			
//			}
//	}*/
//	request.setAttribute("error", error);
//	return "notifysendingreportPage";
//	}
	
	@RequestMapping(value="/EditVDO", method=RequestMethod.POST)
	public String EditVDO(HttpServletRequest  request, HttpSession session) {       

	Student student = (Student)session.getAttribute("student");
	String Reportid = (String)session.getAttribute("Reportid");
	List<Student> Lstd = (List)session.getAttribute("Lstd"); 
	UploadVDODB UR = new UploadVDODB();
	List<teacher> Teacher = UR.ListTeacher();
	 int Reportidint = Integer.parseInt(Reportid);
	 int error = 0;
	
	 String URL = request.getParameter("URLvdo");
	 
	if (URL!= null & !URL.isEmpty()) {
		try {
				
			int getMaxVOD = UR.getIDVOD(student.getIdstudent());
			
			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			//c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
			String s = "ไม่ผ่าน" ;
			
			VDO vdo = new VDO(getMaxVOD,URL,date1, s ,student.getSemester(),student.getCompany_companyid());
			error = UR.Editvdo(vdo);	
	
		}catch (Exception e) {
			e.printStackTrace();
			
			}
	}
	request.setAttribute("error", error);
	return "notifysendingreportPage";
	}
	
}
