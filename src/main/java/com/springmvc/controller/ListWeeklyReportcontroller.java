package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
import util.notifysendingreportDB;
@Controller
public class ListWeeklyReportcontroller {

	public ListWeeklyReportcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadListWeeklyReportPage" , method = RequestMethod.GET)
	public String loadListWeeklyReportPage(HttpServletRequest  request ,HttpSession session) {
			
	   String STUid = request.getParameter("STUID");
	   String getSemester = request.getParameter("getSemester");
	   
		notifysendingreportDB HM = new notifysendingreportDB();
		List<reportname> Listreportname = HM.AllListreportname();
		
		ListWeeklyReporDB LWR = new ListWeeklyReporDB();
		Student student = LWR.vSTU(STUid);
		
		session.setAttribute("Listreportname", Listreportname);
		session.setAttribute("student1", student);
		session.setAttribute("getSemester", getSemester);
		
		return "ListWeeklyReportPage";
	}

}
