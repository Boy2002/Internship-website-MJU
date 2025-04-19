package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.UploadReportDB;
import util.UploadVDODB;
@Controller
public class UploadReportcontroller {

	public UploadReportcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadUploadReportPage" , method = RequestMethod.POST)
	public String loadaddmentorPage(HttpServletRequest  request ,HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		String Reportname = request.getParameter("reportname");
		String Reportid = request.getParameter("reportnameid");
		
		System.out.println(Reportname);
		System.out.println(Reportid);
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		return "UploadReportPage";
	}
	

	@RequestMapping(value = "/loadEditReportPage" , method = RequestMethod.POST)
	public String loadEditReportPage(HttpServletRequest  request ,HttpSession session) throws UnsupportedEncodingException {
		UploadReportDB UR = new UploadReportDB();
		request.setCharacterEncoding("UTF-8");
		
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("reportname");
		String Reportid = request.getParameter("reportnameid");
		
		report RP = UR.Viewreport(Reportid,student.getIdstudent() );
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("FRP", RP);
		return "EditReportPage";
	}


//	@RequestMapping(value="/uploadReport", method=RequestMethod.POST)
//	public String uploadReport(HttpServletRequest  request, HttpSession session) {       
//
//	Student student = (Student)session.getAttribute("student");
//	String Reportid = (String)session.getAttribute("Reportid");
//	
//	int error = 0;
//	
//	 int Reportidint = Integer.parseInt(Reportid);
//	
//	/*if (ServletFileUpload.isMultipartContent(request)) {
//		try {
//			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//			
//			String profile_pic = new File(data.get(1).getName()).getName();
//			
//			UploadReportDB UR = new UploadReportDB();
//			int getMaxreport = UR.getMaxreport();
//			UploadVDODB VD = new UploadVDODB();
//			List<teacher> Teacher = VD.ListTeacher();
//			
//			Date dd = new Date();
//			Calendar c1 = Calendar.getInstance();
//			c1.setTime(dd);
//			c1.add(Calendar.YEAR,543);
//			dd = c1.getTime();
//			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
//			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//			report report = new report(getMaxreport+1,Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf",date1,"ยังไม่ได้ให้คะแนนเอกสาร",student.getIdstudent(),Reportidint);
//			
//			 error = UR.addreport(report);	
//			
//			
//			if(Reportidint == 17) {
//				for(teacher TH : Teacher) {
//					if(TH.getStatus().equals("อยู่")) {
//					evaluatereport evvreport = new evaluatereport(getMaxreport+1,TH.getTeacherid(),0,null);		
//					 error = UR.addevaluatereport(evvreport);	
//					}
//				}
//				}
//			
//			String path = request.getSession().getServletContext().getRealPath("/") + "//document//";
//			data.get(1).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf"));
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//			error = -1;
//			
//			}
//	}*/
//	request.setAttribute("error", error);
//	return "notifysendingreportPage";
//	}
	
	
	@RequestMapping(value="/uploadReport", method=RequestMethod.POST)
	public String uploadReport(HttpServletRequest  request, HttpSession session) {       

	        Student student = (Student) session.getAttribute("student");
	        String reportIdStr = (String) session.getAttribute("Reportid");

	        if (student == null || reportIdStr == null) {
	            request.setAttribute("error", -1);
	            return "notifysendingreportPage";
	        }

	        int error = 0;

	        try {
	            int reportId = Integer.parseInt(reportIdStr);

	            Part filePart = request.getPart("img_logo"); // Retrieves <input type="file" name="img_logo">
	            String fileName = getFileName(filePart);
	            
	            UploadReportDB uploadReportDB = new UploadReportDB();
	            int maxReportId = uploadReportDB.getMaxreport();

	            UploadVDODB uploadVDODB = new UploadVDODB();
	            List<teacher> teachers = uploadVDODB.ListTeacher();

	            Date date = new Date();
	            Calendar calendar = Calendar.getInstance();
	            calendar.setTime(date);
	           // calendar.add(Calendar.YEAR, +543);
	            date = calendar.getTime();

	            String formattedDate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
	            String formattedDate2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(date);

	            report report = new report(maxReportId + 1, reportId + "_" + student.getIdstudent() + "_" + formattedDate2 + ".pdf", formattedDate1, "ยังไม่ได้ให้คะแนนเอกสาร", student.getIdstudent(), reportId);
	            error = uploadReportDB.addreport(report);

	            if (reportId == 17) {
	                for (teacher teacher : teachers) {
	                    if ("อยู่".equals(teacher.getStatus())) {
	                        evaluatereport evaluateReport = new evaluatereport(maxReportId + 1, teacher.getTeacherid(), 0, null);
	                        error = uploadReportDB.addevaluatereport(evaluateReport);
	                    }
	                }
	            }

	            String path = request.getServletContext().getRealPath("/") + "document/";
	           // System.out.println("File path: " + path);
	            File file = new File(path + File.separator + reportId + "_" + student.getIdstudent() + "_" + formattedDate2 + ".pdf");
	            filePart.write(file.getAbsolutePath());

	        } catch (Exception e) {
	            e.printStackTrace();
	            error = -1;
	        }

	        request.setAttribute("error", error);
	        return "notifysendingreportPage";
	    }

	    private String getFileName(Part part) {
	        String contentDisposition = part.getHeader("content-disposition");
	        for (String cd : contentDisposition.split(";")) {
	            if (cd.trim().startsWith("filename")) {
	                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	                return new File(fileName).getName();
	            }
	        }
	        return null;
	    }
	
	
	
//	@RequestMapping(value="/EditReport", method=RequestMethod.POST)
//	public String EditReport(HttpServletRequest  request, HttpSession session) {       
//
//	Student student = (Student)session.getAttribute("student");
//	String Reportid = (String)session.getAttribute("Reportid");
//	int error = 0;
//	 int Reportidint = Integer.parseInt(Reportid);
//	
//	/*if (ServletFileUpload.isMultipartContent(request)) {
//		try {
//			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//			
//			String profile_pic = new File(data.get(1).getName()).getName();
//			
//			UploadReportDB UR = new UploadReportDB();
//			int getMaxreport = UR.getMaxreport();
//			
//			Date dd = new Date();
//			Calendar c1 = Calendar.getInstance();
//			c1.setTime(dd);
//			c1.add(Calendar.YEAR,543);
//			dd = c1.getTime();
//			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
//			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//			
//			report report = new report(getMaxreport+1,Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf",date1,"ยังไม่ได้ให้คะแนนเอกสาร",student.getIdstudent(),Reportidint);
//			
//			 error = UR.UPDATEreport(report);	
//			String path = request.getSession().getServletContext().getRealPath("/") + "//document//";
//			System.out.println(path);
//			data.get(1).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf"));
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//			error = -1;
//			
//			}
//	}*/
//	request.setAttribute("error", error);
//	return "notifysendingreportPage";
//	}
	   
	    
	    @RequestMapping(value="/EditReport", method=RequestMethod.POST)
		public String EditReport(HttpServletRequest  request, HttpSession session) { 
	    	
	    Student student = (Student) session.getAttribute("student");
        String reportIdStr = (String) session.getAttribute("Reportid");

        if (student == null || reportIdStr == null) {
            request.setAttribute("error", -1);
            return "notifysendingreportPage";
        }

        int error = 0;

        try {
            int reportId = Integer.parseInt(reportIdStr);

            Part filePart = request.getPart("img_logo"); // Retrieves <input type="file" name="img_logo">
            String fileName = getFileName(filePart);
            
            UploadReportDB uploadReportDB = new UploadReportDB();
            int maxReportId = uploadReportDB.getMaxreport();

            Date date = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.YEAR, 543);
            date = calendar.getTime();

            String formattedDate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
            String formattedDate2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(date);

            report report = new report(maxReportId + 1, reportId + "_" + student.getIdstudent() + "_" + formattedDate2 + ".pdf", formattedDate1, "ยังไม่ได้ให้คะแนนเอกสาร", student.getIdstudent(), reportId);
            error = uploadReportDB.UPDATEreport(report);

            String path = request.getServletContext().getRealPath("/") + "document/";
            File file = new File(path + File.separator + reportId + "_" + student.getIdstudent() + "_" + formattedDate2 + ".pdf");
            filePart.write(file.getAbsolutePath());

        } catch (Exception e) {
            e.printStackTrace();
            error = -1;
        }

        request.setAttribute("error", error);
        return "notifysendingreportPage";
    }


}
