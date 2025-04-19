package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
import util.EditStudentProfileDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ReviewCompanyDB;
@Controller
public class ListCompanycontroller {

	public ListCompanycontroller() {
		// TODO Auto-generated constructor stub
	}
	///////new system///2567
	@RequestMapping(value = "/loadlistcomassignPage" , method = RequestMethod.GET)
	public String loadlistcomassignPag(HttpSession session) {
		
		
		ListCompanyDB ListCom = new ListCompanyDB();
		ListStudentDB ListStu = new ListStudentDB();
				
		List<String> semesterList =  ListStu.AllListsemester();
		List<Company>company = ListCom.SearchcompanyALL(semesterList.get(0));
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",semesterList.get(0));
		
		return "ListCompanyAssignPage";
	}
	
	@RequestMapping(value = "/loadnamecomassignPage" , method=RequestMethod.POST)
	public String loadnamecomassignPage(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String NAME = request.getParameter("NAME");
		String searchDate = request.getParameter("searchDate");
	
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = null;
				
		company = ListStu.Searchcompanyname(NAME,searchDate);
		
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",searchDate);
		
		return "ListCompanyAssignPage";
	}
	///////end system///2567
	
	
	@RequestMapping(value = "/loadlistcomPage" , method = RequestMethod.GET)
	public String loadlistcomPage(HttpSession session) {
		
		
		ListCompanyDB ListCom = new ListCompanyDB();
		ListStudentDB ListStu = new ListStudentDB();
				
		List<String> semesterList =  ListStu.AllListsemester();
		List<Company>company = ListCom.SearchcompanyALL(semesterList.get(0));
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",semesterList.get(0));
		
		return "ListCompanyPage";
	}
	
	
	
	@RequestMapping(value = "/loadnamecomPage" , method=RequestMethod.POST)
	public String loadnamecomPage(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String NAME = request.getParameter("NAME");
		String searchDate = request.getParameter("searchDate");
	
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = null;
				
		company = ListStu.Searchcompanyname(NAME,searchDate);
		
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",searchDate);
		
		return "ListCompanyPage";
	}
	
	@RequestMapping(value = "/loadViewcomPage" , method = RequestMethod.GET)
	public String loadViewcomPage(HttpServletRequest  request ,HttpSession session) {
		
		String Companyid = request.getParameter("getCompanyid");
		
		int Companyidint = Integer.parseInt(Companyid);
		ListCompanyDB ListStu = new ListCompanyDB();
		
		Company company = ListStu.Searchcompanyid(Companyidint);
		
		session.setAttribute("vCompany",company);
		
		return "ViewCompany";
	}

	@RequestMapping(value = "/loadListCompanyE" , method = RequestMethod.GET)
	public String loadListCompanyE(HttpSession session) {
		
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = ListStu.SearchcompanyALL1();
		
		session.setAttribute("ListCompany",company);
		
		return "ListCompanyE";
	}
	
	@RequestMapping(value = "/loadListCompanyEname" , method = RequestMethod.POST)
	public String loadListCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = ListStu.SearchcompanyALL1();
				
		String NAME = request.getParameter("NAME");
			
		company = ListStu.SearchcompanyALLname(NAME);
			
		session.setAttribute("ListCompany",company);
		
		
		return "ListCompanyE";
	}
	
	@RequestMapping(value = "/loadAddCompanyE" , method = RequestMethod.GET)
	public String loadAddCompanyE(HttpServletRequest  request ,HttpSession session) {
		
	
		try {
		String Companyname = request.getParameter("Companyname");
		session.setAttribute("Companyname",Companyname);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "AddCompany";
	}
	
	
	@RequestMapping(value = "/AddCompanyE" , method=RequestMethod.POST)
	public String AddCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		int error = 0;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String namecom = request.getParameter("namecom");
		String address = request.getParameter("address");
		String coordinator = request.getParameter("coordinator");
		String telephone = request.getParameter("telephone");
		String metoremail = request.getParameter("metoremail");
		String website = request.getParameter("website");
		String metorfacebook = request.getParameter("metorfacebook");
		
	
		ListCompanyDB ListStu = new ListCompanyDB();
		
		int MaxCompany = ListStu.getMaxCompany();
		int Companyid = MaxCompany+1;
		
		Company com = new Company(Companyid,namecom,address,coordinator,telephone,metoremail,website,metorfacebook,0);
		
		error = ListStu.addCompany(com);
		
		if(error == 1) {
			List<Company> company = ListStu.SearchcompanyALL1();
			session.setAttribute("ListCompany",company);
			request.setAttribute("error",error);
		    return "ListCompanyE";
		}else {
			request.setAttribute("error",error);
			return "AddCompany";
		}
	}
	
	
	
	@RequestMapping(value = "/EditloadCompanyE" , method = RequestMethod.GET)
	public String EditloadCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		String IDcom = request.getParameter("getCompanyid");
		int IDcomint = Integer.parseInt(IDcom);
		
		ListCompanyDB ListStu = new ListCompanyDB();
		Company company = ListStu.Searchcompanyid(IDcomint);
		
		session.setAttribute("Company",company);
		
		return "EditCompany";
	}
	
	
	
	
	@RequestMapping(value = "/EditCompanyE" , method=RequestMethod.POST)
	public String EditCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		int error = 0;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String IDcom = request.getParameter("IDcom");
		String namecom = request.getParameter("namecom");
		String address = request.getParameter("address");
		String coordinator = request.getParameter("coordinator");
		String telephone = request.getParameter("telephone");
		String metoremail = request.getParameter("metoremail");
		String website = request.getParameter("website");
		String metorfacebook = request.getParameter("metorfacebook");
		
		 int IDcomint = Integer.parseInt(IDcom);
	
		ListCompanyDB ListStu = new ListCompanyDB();
		
		
		Company com = new Company(IDcomint,namecom,address,coordinator,telephone,metoremail,website,metorfacebook,0);
		
		error = ListStu.UPDATECompany(com);
		
		
			
			Company company = ListStu.Searchcompanyid(IDcomint);
			
			session.setAttribute("Company",company);
			request.setAttribute("error",error);
			
			List<Company> company1 = ListStu.SearchcompanyALL1();
			
			session.setAttribute("ListCompany",company1);
			
		    return "ListCompanyE";
		
	}

	@RequestMapping(value = "/loadComReviewPage" , method = RequestMethod.GET)
	public String loadComReviewPage(HttpSession session) {
		
		
		return "ListCompanyReviewPage";
	}
	
	@RequestMapping(value = "/loadComReviewEPage" , method = RequestMethod.GET)
	public String loadComReviewEPage(HttpServletRequest request ,Model md , HttpSession session) {
		
        String Companyid = request.getParameter("getCompanyid");
		
		int Companyidint = Integer.parseInt(Companyid);
		ListCompanyDB ListStu = new ListCompanyDB();
		ReviewCompanyDB RC = new ReviewCompanyDB();
		
		
		Company company = ListStu.Searchcompanyid(Companyidint);
		List<Review> review = RC.reviewALL(Companyidint);
		
		session.setAttribute("vCompany",company);
		session.setAttribute("reviewList",review);
		
		
		return "ListCompanyReviewEPage";
	}
	
	
	@RequestMapping(value = "/loadApproveReviewPage" , method = RequestMethod.GET)
	public String loadApproveReviewPage(HttpServletRequest request ,Model md , HttpSession session) {
		
       
		ListCompanyDB ListStu = new ListCompanyDB();
		ReviewCompanyDB RC = new ReviewCompanyDB();
		
		
		List<Review> review = RC.reviewstatus();
		
		session.setAttribute("reviewList",review);
		
		
		return "approveReviewPage";
	}

	
	@RequestMapping(value = "/EdApproveReviewPage" , method = RequestMethod.GET)
	public String EdApproveReviewPage(HttpServletRequest request ,Model md , HttpSession session) {
		
        String status = request.getParameter("getstatus");
        String idreview = request.getParameter("getidreview");
        String getSTUid = request.getParameter("getSTUid");
        
        int error = 0;
		
		ReviewCompanyDB RC = new ReviewCompanyDB();
		EditStudentProfileDB ES = new EditStudentProfileDB();
		String S = null;
		if(status.equals("1") ) {
	     S = "ไม่อนุมัติ";
		error = RC.UPDATEstatusreview(S,idreview);
		}else {
		 S = "ผ่าน";
		error = RC.UPDATEstatusreview(S,idreview);
		}
		
		Student st = ES.verifySTU(getSTUid);
		double AVG = RC.getscoreAVG(st.getCompany_companyid());
		
		 Double avg= ( Math.floor(AVG * 100) / 100 );
		 error = RC.UPDATEAVG(avg,st.getCompany_companyid());
		
        List<Review> review = RC.reviewstatus();
		session.setAttribute("reviewList",review);
		
		return "approveReviewPage";
	}
	
	
	@RequestMapping(value = "/loadApproveVDOPage" , method = RequestMethod.GET)
	public String loadApproveVDOPage(HttpServletRequest request ,Model md , HttpSession session) {
		
       
		ListCompanyDB ListStu = new ListCompanyDB();
		ReviewCompanyDB RC = new ReviewCompanyDB();
		
		
		List<VDO> VDO = RC.Approvevdo();		
		session.setAttribute("VDOList",VDO);
		
		
		return "approveVDOPage";
	}
	
	@RequestMapping(value = "/EdApproveVDOPage" , method = RequestMethod.GET)
	public String EdApproveVDOPage(HttpServletRequest request ,Model md , HttpSession session) {
		
        String status = request.getParameter("getstatus");
        String videoid = request.getParameter("getvideoid");
        
        int error = 0;
		
		ReviewCompanyDB RC = new ReviewCompanyDB();
		EditStudentProfileDB ES = new EditStudentProfileDB();
		String S = null;
		if(status.equals("1") ) {
			 S = "ไม่อนุมัติ";
		error = RC.UPDATEstatusreVDO(S,videoid);
		}else {
			 S = "ผ่าน";
		error = RC.UPDATEstatusreVDO(S,videoid);
		}
		
		List<VDO> VDO = RC.Approvevdo();		
		session.setAttribute("VDOList",VDO);
		
		return "approveVDOPage";
	}
	
	
	
	@RequestMapping(value = "/EdApproveVDOindex" , method = RequestMethod.GET)
	public String EdApproveVDOindex(HttpServletRequest request ,Model md , HttpSession session) {		
 
        String videoid = request.getParameter("getvideoid");
        
        int error = 0;
		
		ReviewCompanyDB RC = new ReviewCompanyDB();
		EditStudentProfileDB ES = new EditStudentProfileDB();
		
		error = RC.UPDATEstatusreVDO("ไม่อนุมัติ",videoid);
		
		List<VDO> VDO = RC.Approvevdo();		
		session.setAttribute("VDOList",VDO);
		
		return "index";
	}
	

}
