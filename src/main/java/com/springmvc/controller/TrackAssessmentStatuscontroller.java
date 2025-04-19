package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import util.ConnectionDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ReviewCompanyDB;
import util.teacherManager;
@Controller
public class TrackAssessmentStatuscontroller {

	public TrackAssessmentStatuscontroller() {
		// TODO Auto-generated constructor stub
	}

	
//	@RequestMapping(value = "/loadlistStuPage" , method = RequestMethod.GET)
//	public String loadlistStuPage(HttpServletRequest  request ,HttpSession session) {
//		
//		String Companyid = request.getParameter("getCompanyid");
//		String getSemester = request.getParameter("getSemester");
//		if(getSemester.equals("แสดงทั้งหมด")) {
//			getSemester = "";
//		}
//		
//		ListStudentDB ListStu = new ListStudentDB();
//		List<Student> student = ListStu.AllListStu(Companyid,getSemester);
//		
//		session.setAttribute("student", student);
//		session.setAttribute("Companyid", Companyid);
//		
//		session.setAttribute("getSemester", getSemester);
//		
//		return "ListStudentPage";
//	}
	
//	@RequestMapping(value = "/loadlistStuNOscorePage" , method = RequestMethod.GET)
//	public String loadlistStuNOscorePage(HttpServletRequest  request ,HttpSession session) {
//		
//		String Companyid = request.getParameter("getCompanyid");
//		String getSemester = request.getParameter("getSemester");
//		if(getSemester.equals("แสดงทั้งหมด")) {
//			getSemester = "";
//		}
//		
//		ListStudentDB ListStu = new ListStudentDB();
//		List<Student> student = ListStu.AllListStuscore(Companyid,getSemester);
//		
//		session.setAttribute("student", student);
//		session.setAttribute("Companyid", Companyid);
//		
//		session.setAttribute("getSemester", getSemester);
//		
//		return "ListStudentPage";
//	}
//	
	
	
	@RequestMapping(value = "/loadTrackAssessment" , method = RequestMethod.GET)
	public String loadTrackAssessment(HttpServletRequest  request ,HttpSession session) {
		
		ListStudentDB ListStu = new ListStudentDB();
		List<Student> student = null;
		
		List<String> semesterList =  ListStu.AllListsemester();
		student = ListStu.AllListStuE(semesterList.get(0));
		
		session.setAttribute("student",student);
		session.setAttribute("getSemester", semesterList.get(0));
		
		return "ListTrackAssessmentStatusPage";
	}
	
	@RequestMapping(value = "/loadnameTrack" , method=RequestMethod.POST)
	public String loadnameSUTPageE(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String NAME = request.getParameter("NAME");
		String searchDate = request.getParameter("searchDate");
		
		
	
		ListStudentDB ListStu = new ListStudentDB();
		List<Student> student = null;
		
			student = ListStu.AllListStuidE(searchDate,NAME);

		session.setAttribute("student",student);
		session.setAttribute("getSemester",searchDate);
		
		return "ListTrackAssessmentStatusPage";
	}
	
	
	
	
//	@RequestMapping(value = "/loadnameSUTPageE" , method=RequestMethod.POST)
//	public String loadnameSUTPageE(HttpServletRequest request ,Model md , HttpSession session) {
//		
//		try {
//			request.setCharacterEncoding("UTF-8");
//			}catch(UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//			}
//		
//		String NAME = request.getParameter("NAME");
//		String searchDate = request.getParameter("searchDate");
//		
//		
//	
//		ListStudentDB ListStu = new ListStudentDB();
//		List<Student> student = null;
//		
//			student = ListStu.AllListStuidE(searchDate,NAME);
//
//		session.setAttribute("student",student);
//		session.setAttribute("getSemester",searchDate);
//		
//		return "ListStudentE";
//	}
//	
//	
//	@RequestMapping(value = "/ExportStudentPage" , method = RequestMethod.GET)
//	public String ViewExportSummaryReport(HttpServletRequest  request ,HttpSession session) {	
//		
//		return "ExportStudent";
//	}
//	
//	
//	
//	
//	
//	@RequestMapping(value = "/loadADDscorePage" , method=RequestMethod.POST)
//	public String loadADDscorePage(HttpServletRequest request ,Model md , HttpSession session) {
//		try {
//			request.setCharacterEncoding("UTF-8");
//			}catch(UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//			}
//		
//		String[] questionIdList = request.getParameterValues("question_id");
//		String[] questionVDOList = request.getParameterValues("questionVDO_id");
//		
//		List<Student> student = (List)session.getAttribute("student");
//		teacher Teacher = (teacher)session.getAttribute("teacher");
//		
//		ListStudentDB ListStu = new ListStudentDB();
//		 
//		int reportid = 0;		
//		int i = 0;
//		int error = 0;
//		
//		for (Student S : student) {	
//			
//			Date dd = new Date();
//			Calendar c1 = Calendar.getInstance();
//			c1.setTime(dd);
//			c1.add(Calendar.YEAR,543);
//			dd = c1.getTime();
//			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
//			
//			try {
//			reportid = ListStu.Searchreportid(S.getIdstudent());
//			error = ListStu.UPDATEscoreStudent(Teacher.getTeacherid(),reportid,questionIdList[i],date1);
//			error = ListStu.UPDATEscoreevaluatevideo(Teacher.getTeacherid(),S.getIdstudent(),questionVDOList[i],date1);
//			
//			error = ListStu.UPDATEreportstatus(reportid);
//			
//			int vdoid = ListStu.Sidvdo(S.getIdstudent());
//			
//			}catch(Exception e) {				
//			}
//			i++;
//			
//		}
//		request.setAttribute("error",error);
//		return "ListStudentPage";
//	}
//	
//	
//	@RequestMapping(value = "/loadnameSUTPageD" , method=RequestMethod.GET)
//	public String loadnameSUTPageD(HttpServletRequest request ,Model md , HttpSession session) {
//		
//		ReviewCompanyDB RVC = new ReviewCompanyDB();
//		ListStudentDB STU = new ListStudentDB();
//		String getSemester = (String)session.getAttribute("getSemester");
//		int error1 = 0;
//		try {
//			request.setCharacterEncoding("UTF-8");
//			}catch(UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//			}
//		
//		String STUid = request.getParameter("studentid");
//		Student STUALL = STU.SStuid(STUid);
//		
//		List<report> RP = STU.AllListreportname(STUid);
//			 
//		 
//		if(RP.size() == 0 ) {
//		boolean error = STU.isDeleteStudent1(STUid);
//		
//		 double AVG = RVC.getscoreAVG(STUALL.getCompany_companyid());
//		 Double avg= ( Math.floor(AVG * 100) / 100 );
//		  error1 = RVC.UPDATEAVG(avg,STUALL.getCompany_companyid());
//		}
//		
//		for(report R : RP) {
//		boolean error = STU.isDeleteStudent(STUid,R.getReportid());
//		
//		 double AVG = RVC.getscoreAVG(STUALL.getCompany_companyid());
//		 Double avg= ( Math.floor(AVG * 100) / 100 );
//		  error1 = RVC.UPDATEAVG(avg,STUALL.getCompany_companyid());
//		}
//		
//		List<Student> student = null;
//		student = STU.AllListStuE(getSemester);
//		
//		request.setAttribute("error",error1);
//		session.setAttribute("student",student);
//		session.setAttribute("getSemester",getSemester);
//		
//		return "ListStudentE";
//	}
	


}
