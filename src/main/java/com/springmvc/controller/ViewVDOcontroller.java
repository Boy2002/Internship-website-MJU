package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.ListWeeklyReporDB;
import util.ViewVDODB;

@Controller
public class ViewVDOcontroller {

	public ViewVDOcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/loadViewVDOPage" , method = RequestMethod.GET)
	public String loadLoginPage(HttpServletRequest  request ,HttpSession session) {
		
		String STUid = request.getParameter("STUID");
		
		ListWeeklyReporDB LWR = new ListWeeklyReporDB();
		Student student = LWR.vSTU(STUid);
		
		ViewVDODB Vvdo = new ViewVDODB();
		VDO vdo = Vvdo.Viewvideo(STUid);
		
		
		session.setAttribute("student1", student);
		session.setAttribute("vdo", vdo);
		
		return "ViewVDOPage";
	}
	
	@RequestMapping(value = "/loadViewVDOALLPage" , method = RequestMethod.GET)
	public String loadViewVDOALLPage(HttpServletRequest  request ,HttpSession session) {
		 ViewVDODB vdo = new ViewVDODB(); 
		 List<VDO> Listvdo = vdo.AllListStuvdoDESC1(); 
		 String semester = "1";
				 
		 session.setAttribute("Listvdo", Listvdo);
		 session.setAttribute("semester", semester);
		return "ListVDOPage";
	}
	
	@RequestMapping(value = "/loadViewVDOALLsemesterPage" , method = RequestMethod.POST)
	public String loadViewVDOALLsemesterPage(HttpServletRequest  request ,HttpSession session) {
		ViewVDODB vdo = new ViewVDODB(); 
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		List<VDO> Listvdo =null;
		String searchDate = request.getParameter("searchDate");
		if(searchDate.equals("1")) {
			Listvdo  = vdo.AllListStuvdoDESC1(); 
		}else {
			Listvdo = vdo.AllListStuvdoDESC2(searchDate);
		}
			 
		 session.setAttribute("Listvdo", Listvdo);
		 session.setAttribute("semester", searchDate);
		return "ListVDOPage";
	}
	

	
}
