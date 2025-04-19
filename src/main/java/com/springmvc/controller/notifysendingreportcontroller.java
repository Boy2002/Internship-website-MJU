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
import util.notifysendingreportDB;
@Controller
public class notifysendingreportcontroller {

	public notifysendingreportcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadnotifyPage" , method = RequestMethod.GET)
	public String loadaddmentorPage(HttpSession session) {
		
		Student student = (Student)session.getAttribute("student");
		
		notifysendingreportDB HM = new notifysendingreportDB();
		List<reportname> Listreportname = HM.AllListreportname();
		
		session.setAttribute("Listreportname", Listreportname);
		
		return "notifysendingreportPage";
	}

}
