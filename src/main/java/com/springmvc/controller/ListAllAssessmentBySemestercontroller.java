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
import util.ListStudentDB;
import util.addTeacherDB;
import util.teacherManager;
@Controller
public class ListAllAssessmentBySemestercontroller {

	public ListAllAssessmentBySemestercontroller() {
		// TODO Auto-generated constructor stub
	}
	


	@RequestMapping(value = "/ListAllAssessmentBySemesterPage" , method = RequestMethod.GET)
	public String ListAllAssessmentBySemesterPage(HttpServletRequest  request ,HttpSession session) {	
		
		ListStudentDB ListStu = new ListStudentDB();
		teacherManager ListTM = new teacherManager();
		
		List<String> semesterList =  ListStu.AllListsemester();
		List<Student> StuSemester = ListStu.AllListStuSemester(semesterList.get(0));
		List<teacher> teacherList =  ListTM.SearchteacherALL();
		
		
		session.setAttribute("StuSemester", StuSemester);
		session.setAttribute("teacherList", teacherList);
		session.setAttribute("getSemester", semesterList.get(0));
		
		return "ListAllAssessmentBySemesterPage";
	}
	
	@RequestMapping(value = "/SearchListAllAssessmentBySemesterPage" , method = RequestMethod.POST)
	public String SearchListAllAssessmentBySemesterPage(HttpServletRequest  request ,HttpSession session) {	
		
		ListStudentDB ListStu = new ListStudentDB();
		teacherManager ListTM = new teacherManager();
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String searchDate = request.getParameter("searchDate");
		
		List<Student> StuSemester = ListStu.AllListStuSemester(searchDate);
		List<teacher> teacherList =  ListTM.SearchteacherALL();
		
		session.setAttribute("StuSemester", StuSemester);
		session.setAttribute("teacherList", teacherList);
		session.setAttribute("getSemester", searchDate);
		
		
		return "ListAllAssessmentBySemesterPage";
	}
	
	
	@RequestMapping(value = "/AllAnswerTeacher" , method = RequestMethod.GET)
	public String AllAnswerTeacher(HttpServletRequest  request ,HttpSession session) {
		
		ListStudentDB ListStu = new ListStudentDB();
		addTeacherDB atDB = new addTeacherDB();
		List<Student> student = null;
		List<teacher> Listteacher = null;
		
		List<String> semesterList =  ListStu.AllListsemester();
		student = ListStu.AllListStuE(semesterList.get(0));
		Listteacher = atDB.AllListTeachers();
		
		session.setAttribute("student",student);
		session.setAttribute("Listteacher",Listteacher);
		session.setAttribute("getSemester", semesterList.get(0));
		
		return "AllAnswerTeacherPage";
	}
	
	@RequestMapping(value = "/SearhAllAnswerTeacher" , method = RequestMethod.POST)
	public String SearhAllAnswerTeacher(HttpServletRequest  request ,HttpSession session) {
		
		ListStudentDB ListStu = new ListStudentDB();
		addTeacherDB atDB = new addTeacherDB();
		List<Student> student = null;
		List<teacher> Listteacher = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String searchDate = request.getParameter("searchDate");
		
		student = ListStu.AllListStuE(searchDate);
		Listteacher = atDB.AllListTeachers();
		
		session.setAttribute("student",student);
		session.setAttribute("Listteacher",Listteacher);
		session.setAttribute("getSemester", searchDate);
		
		return "AllAnswerTeacherPage";
	}
	
	@RequestMapping(value = "/AllAnswerMentor" , method = RequestMethod.GET)
	public String AllAnswerMentor(HttpServletRequest  request ,HttpSession session) {
		
		ListStudentDB ListStu = new ListStudentDB();
		addTeacherDB atDB = new addTeacherDB();
		List<Student> student = null;
		List<String> semesterList =  ListStu.AllListsemester();
		student = ListStu.AllListStuE(semesterList.get(0));

		
		session.setAttribute("student",student);

		session.setAttribute("getSemester", semesterList.get(0));
		
		return "AllAnswerMentorPage";
	}
	
	@RequestMapping(value = "/SearhAllAnswerMentor" , method = RequestMethod.POST)
	public String SearhAllAnswerMentor(HttpServletRequest  request ,HttpSession session) {
		
		ListStudentDB ListStu = new ListStudentDB();
		addTeacherDB atDB = new addTeacherDB();
		List<Student> student = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String searchDate = request.getParameter("searchDate");
		student = ListStu.AllListStuE(searchDate);

		
		session.setAttribute("student",student);
		session.setAttribute("getSemester", searchDate);
		
		return "AllAnswerMentorPage";
	}
	

	
	
	
	

}
