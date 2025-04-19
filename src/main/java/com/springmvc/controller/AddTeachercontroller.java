package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.*;
import util.AssisgnTeacherDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.UploadReportDB;
import util.UploadVDODB;
import util.ViewReportDB;
import util.ViewVDODB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;

@MultipartConfig
@Controller
public class AddTeachercontroller {

	public AddTeachercontroller() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/loadAddTeacherPage", method = RequestMethod.GET)
	public String loadAddTeacherPage() {
		return "AddTeacherProfile";
	}

	@RequestMapping(value = "/loadListTeacherPage", method = RequestMethod.GET)
	public String loadListTeacherPage(HttpServletRequest request, HttpSession session) {

		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();

		session.setAttribute("teacherlist", Teacher);

		return "ListTeacherProfile";
	}

	@RequestMapping(value = "/loadStatusTeacher", method = RequestMethod.GET)
	public String loadStatusTeacher(HttpServletRequest request, HttpSession session) {

		int error = 0;

		String Teacherid = request.getParameter("Teacherid");
		String getStatus = request.getParameter("getStatus");
		teacherManager ListTM = new teacherManager();

		ViewVDODB vdo = new ViewVDODB();
		ViewReportDB ViewReport = new ViewReportDB();
		addTeacherDB teacher = new addTeacherDB();
		ListStudentDB ListStu = new ListStudentDB();
		UploadVDODB UR = new UploadVDODB();
		UploadReportDB URP = new UploadReportDB();
		error = teacher.UPDATEStatusTeacher(Teacherid, getStatus);

		if (getStatus.equals("กำลังศึกษาต่อ")) {
			List<String> semesterList = ListStu.AllListsemester();

			List<VDO> VDODT = vdo.AllListStuvdoDESC2(semesterList.get(0));
			List<Student> ListSTU = ListStu.AllListStuSemester(semesterList.get(0));

			for (VDO v : VDODT) {
				error = ListTM.DELETEevaluatevideo1(Teacherid, v.getVideoid());
			}
			for (Student stu : ListSTU) {

				try {
					report R = ViewReport.Viewreport(stu.getIdstudent());
					error = ListTM.DELETEevaluatereport(Teacherid, R.getReportid());
				} catch (Exception e) {
					// Block of code to handle errors
				}

			}

		} else {
			List<String> semesterList = ListStu.AllListsemester();
			List<VDO> VDODT = vdo.AllListStuvdoDESC2(semesterList.get(0));
			List<Student> ListSTU = ListStu.AllListStuSemester(semesterList.get(0));

			int idtc = Integer.parseInt(Teacherid);
			for (VDO vdo1 : VDODT) {
				List<Student> Lstd = UR.Liststudentidvdo(vdo1.getVideoid());
				for (Student S : Lstd) {
					evaluatevideo evvideo = new evaluatevideo(S.getIdstudent(), vdo1.getVideoid(), -1, null, idtc);
					error = UR.addevaluatevideo(evvideo);
				}
			}

			for (Student stu : ListSTU) {
				try {
					report R = ViewReport.Viewreport(stu.getIdstudent());
					error = ListTM.DELETEevaluatereport(Teacherid, R.getReportid());
					evaluatereport evvreport = new evaluatereport(R.getReportid(), idtc, 0, null);
					error = URP.addevaluatereport(evvreport);
				} catch (Exception e) {
					// Block of code to handle errors
				}

			}

		}

		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();

		if (error == 1) {
			request.setAttribute("error", 2);
		}
		request.setAttribute("error", error);
		session.setAttribute("teacherlist", Teacher);

		return "ListTeacherProfile";
	}

	private int DELETEevaluatevideo(String teacherid, int videoid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@RequestMapping(value = "/loadStatusTeacherposition", method = RequestMethod.GET)
	public String loadStatusTeacherposition(HttpServletRequest request, HttpSession session) {

		int error = 0;

		String Teacherid = request.getParameter("Teacherid");
		String Tid = request.getParameter("Tid");

		addTeacherDB teacher = new addTeacherDB();
		error = teacher.UPDATEStatusTeacherposition(Teacherid);

		error = teacher.UPDATEStatusTeacheris2(Tid);

		session.setMaxInactiveInterval(1);
		session.removeAttribute("student");
		session.removeAttribute("teacher");
		return "index";

	}

	@RequestMapping(value = "/loadDETeacher", method = RequestMethod.GET)
	public String loadDETeacher(HttpServletRequest request, HttpSession session) {

		int error = 0;

		String Teacherid = request.getParameter("Teacherid");

		addTeacherDB teacher = new addTeacherDB();
		error = teacher.UPDATEDETeacher(Teacherid);

		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();

		if (error == 1) {
			request.setAttribute("error", 3);
		}
		request.setAttribute("error", error);
		session.setAttribute("teacherlist", Teacher);

		return "ListTeacherProfile";
	}

//	@RequestMapping(value="/addTeacher", method=RequestMethod.POST)
//	public String addmentor(HttpServletRequest  request, HttpSession session) {
//		int error = 0;
//		teacher errorM = null ;		
//		
//		if (ServletFileUpload.isMultipartContent(request)) {
//			try {
//				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
//				
//		String imageUpload = new File(data.get(0).getName()).getName();	
//		String teachername = new String(data.get(1).get(),StandardCharsets.UTF_8);
//		String teacherlastname = new String(data.get(2).get(),StandardCharsets.UTF_8);
//		String phonenumber = new String(data.get(3).get(),StandardCharsets.UTF_8);
//		String teacheremail = new String(data.get(4).get(),StandardCharsets.UTF_8);
//	
//
//	
//		addTeacherDB sm = new addTeacherDB();	
//	
//	      
//		
//			int MaxTeacher = sm.getMaxTeacher();
//			int Teacherid = MaxTeacher+1;
//			
//			
//			if(imageUpload != "") {
//				teacher Teacher = new teacher(Teacherid,teachername,teacherlastname,phonenumber,teacheremail,phonenumber,"2",MaxTeacher+"_Mentor.png","อยู่");
//			 error = sm.addTeacher(Teacher);
//			}else {
//				teacher Teacher = new teacher(Teacherid,teachername,teacherlastname,phonenumber,teacheremail,phonenumber,"2","user.png","อยู่");
//				 error = sm.addTeacher(Teacher);
//			}
//			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//TC//";
//			 if(imageUpload != "") {			 
//				 data.get(0).write(new File(path +File.separator +MaxTeacher+"_Mentor.png"));	
//			 }
//		
//			}catch (Exception e) {
//				e.printStackTrace();
//				error = -1;
//				}
//	}
//		
//		if(error == 1) {
//			addTeacherDB Listteacher = new addTeacherDB();
//			List<teacher> Teacher = Listteacher.AllListteacher();
//			
//			session.setAttribute("teacherlist", Teacher);
//			request.setAttribute("error",error);
//			return "ListTeacherProfile";
//		}else {
//			request.setAttribute("error",error);
//			return "AddTeacherProfile";
//		}
//		
//	}
//	

	@RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
	public String addteacher(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int error = 0;

		try {
			String imageUpload = "";
			String teachername = request.getParameter("teachername");
			String teacherlastname = request.getParameter("teacherlastname");
			String phonenumber = request.getParameter("phonenumber");
			String teacheremail = request.getParameter("teacheremail");
			String password = request.getParameter("password");
			// ดึงข้อมูลอื่นๆ จาก part ตามลำดับที่ต้องการ

			System.out.println(teachername);// เทสการรับค่า//ดูค่า

			// ตรวจสอบและบันทึกไฟล์ภาพ (ถ้ามี)
			Part filePart = request.getPart("imageUpload");
			if (filePart != null && filePart.getSize() > 0) {
				imageUpload = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				String path = request.getServletContext().getRealPath("/") + "//images//TC//";
				filePart.write(path + File.separator + imageUpload);
			}

			// เพิ่มข้อมูลลงฐานข้อมูล
			addTeacherDB sm = new addTeacherDB();
			int MaxTeacher = sm.getMaxTeacher();
			int Teacherid = MaxTeacher + 1;
			String profileImage = (imageUpload != "") ? Teacherid + "_Mentor.png" : "user.png";
			teacher Teacher = new teacher(Teacherid, teachername, teacherlastname, phonenumber, teacheremail, "123456",
					"2", profileImage, "อยู่");
			error = sm.addTeacher(Teacher);

		} catch (Exception e) {
			e.printStackTrace();
			error = -1;
		}

		// ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
		if (error == 1) {
			addTeacherDB Listteacher = new addTeacherDB();
			List<teacher> Teacher = Listteacher.AllListteacher();

			session.setAttribute("teacherlist", Teacher);
			request.setAttribute("error", error);
			return "ListTeacherProfile";
		} else {
			request.setAttribute("error", error);
			return "AddTeacherProfile";
		}
	}

	///////// new system///////
	@RequestMapping(value = "/assignSupervision", method = RequestMethod.POST)
	public String assignSupervision(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int error = 0;
		Assignsupervision As = new Assignsupervision();

		try {
			String datesupervision = request.getParameter("datesupervision");
			String timeSupervision = request.getParameter("timeSupervision");
			String methodSupervision = request.getParameter("methodSupervision");
			String Semester = request.getParameter("Semester");
			String companyid = request.getParameter("companyid");
			String teacherSupervision = request.getParameter("teacherSupervision");

			String formattedDate = formatDate(datesupervision);
			System.out.println(Semester);// เทสการรับค่า//ดูค่า
			System.out.println(formattedDate);// เทสการรับค่า//ดูค่า

			// ตรวจสอบบริษัทซ้ำในเทอมเดียวกัน
			AssisgnTeacherDB at = new AssisgnTeacherDB();
			int Companyid = Integer.parseInt(companyid);
			List<Assignsupervision> asdate = at.CheckDate(formattedDate, teacherSupervision);
			Assignsupervision asdatetime = at.CheckDateTime(formattedDate, timeSupervision, teacherSupervision);
			As = new Assignsupervision(companyid, teacherSupervision, Semester, formattedDate, timeSupervision,
					methodSupervision, "รอดำเนินการ");

			///////////////////////////////////////
			// เวลา
			int checkTimeAdd = 0; // เช้คช่วงเวลาเช้าหรือบ่ายของเข้าที่รับมาก่อนนำไปเพิ่ม
			int checkTime = 0; // เช็คช่วงเวลาเช้าหรือบ่ายของข้อมูลที่มีอยู่ ป้องกันการทับช่วงเวลากัน
			int doubleperiod = 0;

			if (!asdate.isEmpty()) {
				checkTimeAdd = checkTime(timeSupervision);

				checkTime = checkTime(asdate.get(0).getTime());

				if (checkTimeAdd == checkTime) {
					doubleperiod = 1;
				}
			}
			System.out.println(
					"checkTimeAdd=" + checkTimeAdd + " checkTime=" + checkTime + " doubleperiod=" + doubleperiod);

			if (asdate.size() < 2) {
				if (asdatetime == null && doubleperiod == 0) {
					// เพิ่มข้อมูลลงฐานข้อมูล
					addTeacherDB sm = new addTeacherDB();
					As = new Assignsupervision(companyid, teacherSupervision, Semester, formattedDate, timeSupervision,
							methodSupervision, "รอดำเนินการ");
					error = sm.assignSupervision(As);
				} else {
					// เวลาซ้ำ

					error = -2;
					session.setAttribute("errortime", timeSupervision);
					session.setAttribute("errordate", formattedDate);
					// System.out.println("time "+timeSupervision+"Date "+formattedDate);
					if (asdatetime == null) {
						if (checkTimeAdd == 1) {
							error = -3;
							session.setAttribute("errortime", timeSupervision);
							session.setAttribute("errordate", formattedDate);
						} else {
							error = -4;
							session.setAttribute("errortime", timeSupervision);
							session.setAttribute("errordate", formattedDate);
						}
					}
				}
			} else {
				// เลือก 2 ช่วงเวลาไปแล้ว
				error = -1;
				session.setAttribute("errordate", formattedDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			error = -1;
		}

		// ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
		if (error == 1) {
//	        addTeacherDB Listteacher = new addTeacherDB();
//	        List<teacher> Teacher = Listteacher.AllListteacher();
//
//	        session.setAttribute("teacherlist", Teacher);
			request.setAttribute("error", error);
			return "ListCompanyAssignPage";
		} else {
			request.setAttribute("error", error);
			request.setAttribute("As", As);
			/*
			 * System.out.println(As.getDate()); System.out.println(As.getTime());
			 */
			return "AssignTeacherPage";
		}
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/EditassignSupervision", method = RequestMethod.POST)
	public String EditassignSupervision(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int error = 0;
		Assignsupervision As = new Assignsupervision();

		try {
			String datesupervision = request.getParameter("datesupervision");
			String timeSupervision = request.getParameter("timeSupervision");
			String methodSupervision = request.getParameter("methodSupervision");
			String Semester = request.getParameter("Semester");
			String companyid = request.getParameter("companyid");
			String teacherSupervision = request.getParameter("teacherSupervision");
			// ดึงข้อมูลอื่นๆ จาก part ตามลำดับ
			String formattedDate = formatDate(datesupervision);
			System.out.println(Semester);// เทสการรับค่า//ดูค่า
			// ตรวจสอบบริษัทซ้ำในเทอมเดียวกัน
			AssisgnTeacherDB at = new AssisgnTeacherDB();
			int Companyid = Integer.parseInt(companyid);
			List<Assignsupervision> asdate = at.CheckDate(formattedDate, teacherSupervision); // เช็ควันที่ซ้ำ
			Assignsupervision asdatetime = at.CheckDateTime(formattedDate, timeSupervision, teacherSupervision);// เช็ควันที่และเวลาที่ซ้ำ
			As = new Assignsupervision(companyid, teacherSupervision, Semester, formattedDate, timeSupervision,
					methodSupervision, "รอดำเนินการ");
			///////////////////////////////////////
			// เวลา
			int checkTimeAdd = 0; // เช้คช่วงเวลาเช้าหรือบ่ายของเข้าที่รับมาก่อนนำไปเพิ่ม
			int checkTime = 0; // เช็คช่วงเวลาเช้าหรือบ่ายของข้อมูลที่มีอยู่ ป้องกันการทับช่วงเวลากัน
			int doubleperiod = 0;

			if (!asdate.isEmpty()) {
				checkTimeAdd = checkTime(timeSupervision);

				for (Assignsupervision as : asdate) {
					if (!as.getCompanyid().equals(companyid)) {
						checkTime = checkTime(as.getTime());
					}
				}

				if (checkTimeAdd == checkTime) {
					doubleperiod = 1;
				}
			}

			System.out.println(
					"checkTimeAdd=" + checkTimeAdd + " checkTime=" + checkTime + " doubleperiod=" + doubleperiod);

			System.out.println(asdate.size());
			// วันที่เดียวกันซ้ำได้2record = จำกัดช่วงเวลา เช้า บ่าย ในวันเดียวกัน
			if (asdate.size() < 2 || companyid.equals(asdate.get(0).getCompanyid())
					|| companyid.equals(asdate.get(1).getCompanyid())) { // เช็คเรื่องของวันที่ 1วัน มีได้แค่2record
																			// เช้า บ่าย
				if (asdatetime == null && doubleperiod == 0) {
					// เพิ่มข้อมูลลงฐานข้อมูล
					addTeacherDB sm = new addTeacherDB();
					As = new Assignsupervision(companyid, teacherSupervision, Semester, formattedDate, timeSupervision,
							methodSupervision, "รอดำเนินการ");
					error = sm.EditassignSupervision(As);
				} else {
					error = -2;
					session.setAttribute("errortime", timeSupervision);
					session.setAttribute("errordate", formattedDate);
					// System.out.println("time "+timeSupervision+"Date "+formattedDate);

					if (doubleperiod == 1) {
						if (checkTimeAdd == 1) {
							error = -3;
							session.setAttribute("errortime", timeSupervision);
							session.setAttribute("errordate", formattedDate);
						} else {
							error = -4;
							session.setAttribute("errortime", timeSupervision);
							session.setAttribute("errordate", formattedDate);
						}
					}
				}
			} else {
				error = -1;
				session.setAttribute("errordate", formattedDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			error = -1;
		}

		// ตรวจสอบและคืนค่าผลลัพธ์ไปยังหน้าเว็บที่เหมาะสม
		if (error == 1) {
//	        addTeacherDB Listteacher = new addTeacherDB();
//	        List<teacher> Teacher = Listteacher.AllListteacher();
//
//	        session.setAttribute("teacherlist", Teacher);
			request.setAttribute("error", error);
			return "ListCompanyAssignPage";
		} else {
			request.setAttribute("error", error);
			request.setAttribute("As", As);
			return "EditAssignTeacherPage";
		}
	}

	public int checkTime(String timeSupervision) {

		// สร้าง Set สำหรับช่วงเวลาเช้าและบ่าย
		Set<String> morningTimes = new HashSet<>();
		Set<String> afternoonTimes = new HashSet<>();

		// เพิ่มช่วงเวลาใน Set
		morningTimes.add("10:00น.-12.00น.");
		morningTimes.add("10:30น.-12.00น.");
		morningTimes.add("11:00น.-12.00น.");
		afternoonTimes.add("13:00น.-15.00น.");
		afternoonTimes.add("13:30น.-15.00น.");
		afternoonTimes.add("14:00น.-15.00น.");

		// ตรวจสอบช่วงเวลาที่เลือก
		int timePeriod = 0;
		if (morningTimes.contains(timeSupervision)) {
			timePeriod = 1; // ช่วงเช้า
		} else if (afternoonTimes.contains(timeSupervision)) {
			timePeriod = 2; // ช่วงบ่าย
		} else {
			timePeriod = 0; // ไม่อยู่ในช่วงเวลา
		}

		// แสดงผลลัพธ์
		switch (timePeriod) {
		case 1:
			System.out.println("ช่วงเวลาที่เลือก: ช่วงเช้า");
			break;
		case 2:
			System.out.println("ช่วงเวลาที่เลือก: ช่วงบ่าย");
			break;
		default:
			System.out.println("ช่วงเวลาที่เลือกไม่ถูกต้อง");
			break;
		}

		return timePeriod;
	}

	private String formatDate(String beDateString) {
		try {
			// Define input and output formats
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

			// Convert BE year to AD
			String[] parts = beDateString.split("-");
			int yearBe = Integer.parseInt(parts[0]);
			int month = Integer.parseInt(parts[1]);
			int day = Integer.parseInt(parts[2]);

			// Convert BE to AD
			int yearAd = yearBe;

			// Format date in AD
			String adDateString = String.format("%d-%02d-%02d", yearAd, month, day);
			Date date = inputFormat.parse(adDateString);

			// Return formatted date
			return outputFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/ComfirmStatus", method = RequestMethod.POST)
	public String ComfirmStatus(HttpServletRequest request, HttpSession session) {
		int error = 0;
		try {
			int comid = Integer.parseInt(request.getParameter("comid"));
			String Semester = request.getParameter("Semester");
			String status = request.getParameter("status");

			System.out.println(comid);// เทสการรับค่า//ดูค่
			addTeacherDB atDB = new addTeacherDB();
			error = atDB.ComfirmStatusDB(comid, Semester, status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String Semester = request.getParameter("Semester");
		AssisgnTeacherDB ListAsBysemester = new AssisgnTeacherDB();
		List<Assignsupervision> ListAs = ListAsBysemester.SearchAssignSemester(Semester);

		session.setAttribute("ListAs", ListAs);
		session.setAttribute("semester", Semester);
		session.setAttribute("error", error);
		return "TableAssign";

	}

	@RequestMapping(value = "/AutoChange", method = RequestMethod.POST)
	public String AutoChange(HttpServletRequest request, HttpSession session) {
		int error = 0;
		try {
			int comid = Integer.parseInt(request.getParameter("comid"));
			String Semester = request.getParameter("Semester");
			System.out.println(comid);// เทสการรับค่า//ดูค่
			addTeacherDB atDB = new addTeacherDB();
			error = atDB.AutoChange(comid, Semester);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String Semester = request.getParameter("Semester");
		AssisgnTeacherDB ListAsBysemester = new AssisgnTeacherDB();
		List<Assignsupervision> ListAs = ListAsBysemester.SearchAssignSemester(Semester);

		session.setAttribute("ListAs", ListAs);
		session.setAttribute("semester", Semester);
		session.setAttribute("error", error);
		return "TableAssign";

	}

}
