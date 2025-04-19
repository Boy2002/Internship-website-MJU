package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.AssisgnTeacherDB;
import util.ListStudentDB;
import util.teacherManager;
@Controller
public class ExportTableAssignController {

	public ExportTableAssignController() {
		// TODO Auto-generated constructor stub
	}
	

//	@RequestMapping(value = "/ViewSummaryReportPage" , method = RequestMethod.GET)
//	public String ViewSummaryReportPage(HttpServletRequest  request ,HttpSession session) {	
//		
//		ListStudentDB ListStu = new ListStudentDB();
//		teacherManager ListTM = new teacherManager();
//		
//		List<String> semesterList =  ListStu.AllListsemester();
//		List<Student> StuSemester = ListStu.AllListStuSemester(semesterList.get(0));
//		List<teacher> teacherList =  ListTM.SearchteacherALL();
//		
//		
//		session.setAttribute("StuSemester", StuSemester);
//		session.setAttribute("teacherList", teacherList);
//		session.setAttribute("getSemester", semesterList.get(0));
//		
//		return "ViewSummaryReport";
//	}
//	
//	@RequestMapping(value = "/ViewSummaryReportPageS" , method = RequestMethod.POST)
//	public String ViewSummaryReportPageS(HttpServletRequest  request ,HttpSession session) {	
//		
//		ListStudentDB ListStu = new ListStudentDB();
//		teacherManager ListTM = new teacherManager();
//		try {
//			request.setCharacterEncoding("UTF-8");
//			}catch(UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//			}
//		
//		String searchDate = request.getParameter("searchDate");
//		
//		List<Student> StuSemester = ListStu.AllListStuSemester(searchDate);
//		List<teacher> teacherList =  ListTM.SearchteacherALL();
//		
//		session.setAttribute("StuSemester", StuSemester);
//		session.setAttribute("teacherList", teacherList);
//		session.setAttribute("getSemester", searchDate);
//		
//		
//		return "ViewSummaryReport";
//	}
	
	@RequestMapping(value = "/ExportTableAssign" , method = RequestMethod.GET)
	public String ViewExportSummaryReport(HttpServletRequest  request ,HttpSession session) {	
		
		String Semester = request.getParameter("Semester");
		 AssisgnTeacherDB ListAsBysemester = new AssisgnTeacherDB();
		 List<Assignsupervision> ListAs = ListAsBysemester.SearchAssignSemester(Semester);

		session.setAttribute("ListAs", ListAs);
		session.setAttribute("Semester", Semester);
		
		return "ExportTableAssignPage";
	}
	
	

}
