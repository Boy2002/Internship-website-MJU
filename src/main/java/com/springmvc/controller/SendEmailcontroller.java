package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.Mentor;
import util.EmailSender;
import util.ListStudentDB;
import util.ListmentorDB;

@Controller
public class SendEmailcontroller {
    
	@RequestMapping(value = "/sendEmail", method = {RequestMethod.POST, RequestMethod.GET})
	public String sendEmail(HttpServletRequest request, HttpSession session) {
	    int sendemail = 0;
	    String to = request.getParameter("to");
	    String subject = request.getParameter("subject");
	    String content = request.getParameter("content");
	    
	    try {
	        EmailSender.sendEmail(to, subject, content);
	        sendemail = 1; // ส่งอีเมลสำเร็จ
	    } catch (Exception e) {
	    	sendemail = -1; // มีข้อผิดพลาดในการส่งอีเมล
	    }
	    
	    ListmentorDB   HM = new ListmentorDB();
	    ListStudentDB ListStu = new ListStudentDB();
	    List<String> semesterList =  ListStu.AllListsemester();
		List<Mentor> st = HM.AllListmentorManage(semesterList.get(0));
		session.setAttribute("listmentors", st);
		session.setAttribute("getSemester", semesterList.get(0));
		session.setAttribute("sendemail", sendemail);
	    return "ListmentorManagePage";
	}

}
