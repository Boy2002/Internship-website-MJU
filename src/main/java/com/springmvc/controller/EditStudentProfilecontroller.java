package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

import util.EditStudentProfileDB;
import util.ListCompanyDB;
import util.LoginbyStudentDB;
@Controller
public class EditStudentProfilecontroller {

	public EditStudentProfilecontroller() {
		// TODO Auto-generated constructor stub
	}
	



@RequestMapping(value = "/loadEditStudentProfile" , method = RequestMethod.GET)
public String loadEditStudentProfilePage() {
	
	return "EditStudentProfile";
}

@RequestMapping(value = "/loadViewStudentProfile" , method = RequestMethod.GET)
public String loadViewStudentProfile() {
	
	return "ViewStudentProfile";
}

@RequestMapping(value="/EditStudentProfile", method=RequestMethod.POST)
public String EditStudentProfile(HttpServletRequest request ,Model md , HttpSession session) {
	
	int error = 0;
	try {
		request.setCharacterEncoding("UTF-8");
		}catch(UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
	
	String studentid = request.getParameter("studentid");
	String studentname = request.getParameter("studentname");
	String studentlastname = request.getParameter("studentlastname");
	String workposition = request.getParameter("workposition");
	String password = request.getParameter("password");
	String Company = request.getParameter("Company");
	String address = request.getParameter("address");
	String coordinator = request.getParameter("coordinator");
	String telephone = request.getParameter("telephone");
	String metoremail = request.getParameter("metoremail");
	String website = request.getParameter("website");
	String metorfacebook = request.getParameter("metorfacebook");
	

	Student stu = new Student(studentid,studentname,studentlastname,password,workposition,null,null,"",0,0);

	EditStudentProfileDB sm = new EditStudentProfileDB();
     error = sm.UPDATEStudent(stu);

		LoginbyStudentDB LS = new LoginbyStudentDB();
		stu = LS.verifyLoginSTU(stu);
		session.setAttribute("student", stu);
		request.setAttribute("error", error);
		
		return "EditStudentProfile";
	
}

@RequestMapping(value = "/loadEditStudentProfileT" , method = RequestMethod.GET)
public String loadEditStudentProfileT(HttpServletRequest request ,Model md , HttpSession session) {
	
	EditStudentProfileDB ESP = new EditStudentProfileDB();
	
	String studentid = request.getParameter("studentid");
	Student STU = ESP.verifySTU(studentid);
	
	session.setAttribute("studentE", STU);
	
	return "EditStudentProfileT";
}


}
