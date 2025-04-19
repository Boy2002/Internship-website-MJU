package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import util.AssisgnTeacherDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.UploadReportDB;
import util.UploadVDODB;
import util.ViewReportDB;
import util.ViewVDODB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;
@MultipartConfig
@Controller
public class TableAssignController {

	public TableAssignController() {
		// TODO Auto-generated constructor stub
	}
	
///////new system///2567
	@RequestMapping(value = "/loadtableassignPage" , method = RequestMethod.GET)
	public String loadlistcomassignPag(HttpSession session) {
		
		
		ListCompanyDB ListCom = new ListCompanyDB();
		ListStudentDB ListStu = new ListStudentDB();
		AssisgnTeacherDB AsDB = new AssisgnTeacherDB();
				
		List<String> semesterList =  ListStu.AllListsemester();
		List<Company>company = ListCom.SearchcompanyALL(semesterList.get(0));
		List<Assignsupervision> ListAs = AsDB.SearchAssignALL(); 
		
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",semesterList.get(0));
		session.setAttribute("ListAs",ListAs);
		
		return "TableAssign";
	}
	
	@RequestMapping(value = "/loadSearchAssignPage", method=RequestMethod.POST)
	public String loadnamecomassignPage(HttpServletRequest request, Model md, HttpSession session) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (UnsupportedEncodingException e1) {
	        e1.printStackTrace();
	    }

	    String semester = request.getParameter("searchDate");//.trim();
	    //System.out.println("Controller: semester = '" + semester + "'");
	    AssisgnTeacherDB ListAsBysemester = new AssisgnTeacherDB();
	    List<Assignsupervision> ListAs = ListAsBysemester.SearchAssignSemester(semester);

	    session.setAttribute("ListAs", ListAs);
	    session.setAttribute("semester", semester);

	    return "TableAssign";
	}
	
	
	
	@RequestMapping(value = "/loadAssignTeacherPage" , method = RequestMethod.GET)
	public String loadAssignSupervisionPage(HttpServletRequest  request ,HttpSession session) {
		
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
		
		return "AssignTeacherPage";
	}
	
	@RequestMapping(value = "/loadEditAssignTeacherPage" , method = RequestMethod.GET)
	public String EditloadAssignSupervisionPage(HttpServletRequest  request ,HttpSession session) {
		
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
		
		return "EditAssignTeacherPage";
	}
	
	
	
	
	////////end system 2567 /////


}
