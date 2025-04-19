package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import util.ConnectionDB;
import util.ListWeeklyReporDB;
import util.ViewReportDB;
import util.ViewVDODB;

@Controller
public class ViewReportcontroller {

	public ViewReportcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/loadViewReportPage" , method = RequestMethod.GET)
	public String loadViewReportPage(HttpServletRequest  request ,HttpSession session) {
		
		String STUid = request.getParameter("STUID");
		
		ListWeeklyReporDB LWR = new ListWeeklyReporDB();
		Student student = LWR.vSTU(STUid);
		
		ViewReportDB VRdb = new ViewReportDB();
		report report = VRdb.Viewreport(STUid);
		
		session.setAttribute("student1", student);
		session.setAttribute("report", report);
		
		return "ViewReportPage";
	}
	
}



