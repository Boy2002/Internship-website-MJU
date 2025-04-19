package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.ListStudentDB;
import util.ListmentorDB;
@Controller
public class Listmentorcontroller {

	public Listmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value = "/loadListmentor" , method = RequestMethod.GET)
	public String loadLoginPage(HttpSession session , HttpServletRequest  request) {
		
		Student student = (Student)session.getAttribute("student");
		ListmentorDB   HM = new ListmentorDB();
		List<Mentor> st = HM.AllListmentor(student.getIdstudent());
		session.setAttribute("listmentors", st);
		return "ListmentorPage";
	}
	
	@RequestMapping(value = "/loadListmentorManage" , method = RequestMethod.GET)
	public String loadListmentorManage(HttpSession session , HttpServletRequest  request) {
		
		ListmentorDB   HM = new ListmentorDB();
		ListStudentDB ListStu = new ListStudentDB();
		
		List<String> semesterList =  ListStu.AllListsemester();
		List<Mentor> st = HM.AllListmentorManage(semesterList.get(0));
		
		session.setAttribute("listmentors", st);
		session.setAttribute("getSemester", semesterList.get(0));
		return "ListmentorManagePage";
	}
	
	@RequestMapping(value = "/loadListmentorNostudentManage" , method = RequestMethod.GET)
	public String loadListmentorNostudentManage(HttpSession session , HttpServletRequest  request) {
		
		ListmentorDB   HM = new ListmentorDB();	
		List<Mentor> st = HM.AllListmentorNOstudentManage();
		
		session.setAttribute("listmentors", st);
		return "ListmentorNOstudentManagePage";
	}
	
	@RequestMapping(value = "/loadSearchListmentorManage" , method = RequestMethod.POST)
	public String loadSearchListmentorManage(HttpSession session , HttpServletRequest  request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String NAME = request.getParameter("NAME");
		String searchDate = request.getParameter("searchDate");
		
		ListmentorDB   HM = new ListmentorDB();
		
		List<Mentor> st = HM.SearchAllListmentorManage(searchDate,NAME);
		
		session.setAttribute("listmentors", st);
		session.setAttribute("getSemester",searchDate);
		return "ListmentorManagePage";
	}

	@RequestMapping(value = "/loaddeletmentor" , method = RequestMethod.GET)
	public String loaddeletmentor(HttpSession session , HttpServletRequest  request) {
		int error = 0;
		String mentorid = request.getParameter("idMentor");
		System.out.println("idMentor = "+mentorid);
		ListmentorDB   HM = new ListmentorDB();
		Student student = (Student)session.getAttribute("student");
		 error = HM.deletmentor(mentorid,student.getIdstudent());
		List<Mentor> st = HM.AllListmentor(student.getIdstudent());
		
		request.setAttribute("error", error);
		return "ListmentorPage";
	}
	
	@RequestMapping(value = "/loaddeletementorforteacher" , method = RequestMethod.GET)
	public String loaddeletementorforteacher(HttpSession session , HttpServletRequest  request) {
		int error = 0;
		String mentorid = request.getParameter("idMentor");
		System.out.println("idMentor = "+mentorid);
		ListmentorDB   HM = new ListmentorDB();
		///CASCADE!!!!!!
		error = HM.deleteMentorForTeacherCASCADE(mentorid);
		System.out.println("loaddeletementorforteacher = "+mentorid+" "+error);

		
		request.setAttribute("error", error);
		return "redirect:/loadListmentorManage";
	}
	
	@RequestMapping(value = "/loaddeletmentorforTeacher" , method = RequestMethod.GET)
	public String loaddeletmentorforMentor(HttpSession session , HttpServletRequest  request) {
		int error = 0;
		String mentorid = request.getParameter("idMentor");
		System.out.println("idMentor = "+mentorid);
		ListmentorDB   HM = new ListmentorDB();
		List<mentor_student> lmentor_student = HM.Listmentor_studentByid(Integer.parseInt(mentorid));
		List<String> listmen_stu = new ArrayList<>();
		if(!lmentor_student.isEmpty()&&lmentor_student != null) {
			for(mentor_student ms :lmentor_student) {
				listmen_stu.add(ms.getStudent_studentid());
			}
			error = -1;
		}else {
			HM.deletementornothavestu(mentorid);
			error = 1;}
		
		
		session.setAttribute("listmen_stu", listmen_stu);
		session.setAttribute("mentoridforDeleteCASCADE", mentorid);
		session.setAttribute("error", error);
		return "redirect:/loadListmentorManage";
	}
	


}
