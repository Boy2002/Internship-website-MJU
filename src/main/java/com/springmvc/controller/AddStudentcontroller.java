package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;


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
import ddf.ReadWriteExcel1;
import util.EditmentorDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;

@Controller
public class AddStudentcontroller {

	public AddStudentcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadAddStudentPage" , method = RequestMethod.GET)
	public String loadAddStudentPage() throws Exception {	
	
		return "AddStudentPage";
	}
//	@RequestMapping(value = "/AddStudentPage" , method = RequestMethod.POST)
//	public ModelAndView doImportExcel(HttpSession session, HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//	
//		ListCompanyDB LC = new ListCompanyDB();
//		teacherManager TM = new teacherManager();
//		ListStudentDB LSTU = new ListStudentDB();
//		
//		List<AddStudent> listStudent = new ArrayList<>();
//		List<Student> Student = new ArrayList<>();
//		String yearE = null;	 
//		String inlineRadio1 = null;
//		int error = 0;
//		List errorlist = new ArrayList<>();
//		int errorCOM = 0;
//		
//		Date dd = new Date();
//		Calendar c1 = Calendar.getInstance();
//		c1.setTime(dd);
//		c1.add(Calendar.YEAR,543);
//		dd = c1.getTime();
//		String dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
//		
//	
//			if (ServletFileUpload.isMultipartContent(request)) {
//				request.setCharacterEncoding("UTF-8");
//				try {
//					List<FileItem> multiFileItem = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//
//	
//					 yearE = new String(multiFileItem.get(0).get(),StandardCharsets.UTF_8);
//					 inlineRadio1 = new String(multiFileItem.get(1).get(),StandardCharsets.UTF_8);
//					System.out.println(yearE+inlineRadio1);
//					
//					
//					String fileName = multiFileItem.get(2).getName();
//
//					System.out.println("fileName : " + fileName);
//					
//					String path = request.getSession().getServletContext().getRealPath("/") + "//EX//";
//					
//					
//					
//					
//					String file = path + File.separator + dateFormat + fileName;
//					
//					multiFileItem.get(2).write(new File(file));
//
//					ReadWriteExcel1 readWriteExcel = new ReadWriteExcel1();
//					
//					System.out.println(file);
//					
//					try {
//						readWriteExcel.xlRead(file, 0);
//						// System.out.println(readWriteExcel.getxRows()); 
//						String[][] data = readWriteExcel.getData();
//						// System.out.println(data[0][0]); 
//						for (int i = 1; i < data.length; i++) {
//
//							String student_id = data[i][0];
//							String firstname = data[i][1];
//							String lastname = data[i][2];
//							String Company = data[i][3];
//							String Teachername = data[i][4];
//							String Teacherlastname = data[i][5];
//							String startdate = data[i][6];
//							String enddate = data[i][7];
//                            
//												
//							
//							Date date1 =  new SimpleDateFormat("dd/MM/yyyy").parse(startdate);  
//							Date date2 =  new SimpleDateFormat("dd/MM/yyyy").parse(enddate); 
//							
//							long ligdate1 = date1.getTime();
//							long ligdate2 = date2.getTime();
//							
//						   java.sql.Date SQLdate1 = new java.sql.Date(ligdate1);
//						   java.sql.Date SQLdate2 = new java.sql.Date(ligdate2);
//							
//							AddStudent ST = new AddStudent(student_id,firstname,lastname,student_id,"Tester",SQLdate1,SQLdate2,Teachername,Teacherlastname,Company);
//							listStudent.add(ST);													
//							
//						}
//
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//			
//			
//			for(AddStudent s : listStudent) {
//				
//				int COMid = 0;
//				  int TSid = 0;
//					try {
//					COMid = LC.SearchcompanyName(s.getCompany_companyname());							
//					} catch (Exception e) {
//						e.printStackTrace();
//						COMid = 0;
//					}
//					
//					try {
//						TSid = TM.Searchteachername(s.getTeacher_teachername(),s.getTeacher_teacherlastname());														
//					} catch (Exception e) {
//						e.printStackTrace();
//						TSid = 0;
//					}
//					
//					String semester = null;		
//					if(inlineRadio1.equals("ภาคเรียนที่ 1")) {
//						semester = "ภาคเรียนที่1/"+yearE;
//					}else if(inlineRadio1.equals("ภาคเรียนที่ 2")) {
//						semester = "ภาคเรียนที่2/"+yearE;
//					}else {
//						semester = "ภาคเรียนที่3/"+yearE;
//					}
//						
//					Student STU = null;
//					if(COMid != 0) {
//					 STU = new Student (s.getIdstudent(),s.getStudentname(),s.getStudentlastname(),s.getPassword(),s.getWorkposition(),s.getStartdate(),s.getEnddate(),semester,TSid,COMid);
//					error = LSTU.addStudent(STU);
//					System.out.println("dddddddddddd");
//					}
//					
//					if(error == -1 || STU == null) {			
//						if(COMid == 0) {
//							errorCOM = 1;
//							errorlist.add(s.getIdstudent());
//						}else {
//							errorlist.add(s.getIdstudent());
//						}
//					}else {
//						Student.add(STU);
//					}
//					
//				
//			}
//			if(errorlist.size() == 0) {
//				errorlist.add("1");
//			}
//			request.setAttribute("errorlist", errorlist);
//			session.setAttribute("listSTU", Student);
//			session.setAttribute("listStudent", listStudent);	
//			session.setAttribute("errorCOM", errorCOM);	
//			
//			ModelAndView mav = new ModelAndView("AddStudentPage");
//			return mav;
//		}
	
	@RequestMapping(value = "/AddStudentPage", method = RequestMethod.POST)
    public ModelAndView doImportExcel(@RequestParam("EX") MultipartFile multipartFile,
                                      @RequestParam("yearE") String yearE,
                                      @RequestParam("inlineRadio1") String inlineRadio1,
                                      HttpSession session, HttpServletRequest request) {

        ListCompanyDB LC = new ListCompanyDB();
        teacherManager TM = new teacherManager();
        ListStudentDB LSTU = new ListStudentDB();

        List<AddStudent> listStudent = new ArrayList<>();
        List<Student> studentList = new ArrayList<>();
        int errorCOM = 0;
        List<String> errorList = new ArrayList<>();

        Date currentDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.YEAR, +543);
        currentDate = calendar.getTime();
        String dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(currentDate);

        if (!multipartFile.isEmpty()) {
            try {
                String fileName = multipartFile.getOriginalFilename();
                String path = request.getSession().getServletContext().getRealPath("/") + "//EX//";
                String filePath = path + File.separator + dateFormat + fileName;
                multipartFile.transferTo(new File(filePath));

                ReadWriteExcel1 readWriteExcel = new ReadWriteExcel1();
                readWriteExcel.xlRead(filePath, 0);
                String[][] data = readWriteExcel.getData();

                for (int i = 1; i < data.length; i++) {
                    String student_id = data[i][0];
                    String firstname = data[i][1];
                    String lastname = data[i][2];
                    String company = data[i][3];
                    String teachername = data[i][4];
                    String teacherlastname = data[i][5];
                    String startdate = data[i][6];
                    String enddate = data[i][7];
                    
                    System.out.println("Row " + i + ":");
                    System.out.println("Student ID: " + student_id);
                    System.out.println("Firstname: " + firstname);
                    System.out.println("Lastname: " + lastname);
                    System.out.println("Company: " + company);
                    System.out.println("Teacher Name: " + teachername);
                    System.out.println("Teacher Lastname: " + teacherlastname);
                    System.out.println("Start Date: " + startdate);
                    System.out.println("End Date: " + enddate);
                    System.out.println("------------------------------");

                 // แปลงวันที่เริ่มต้น
                    Date startDate = new SimpleDateFormat("dd/MM/yyyy").parse(startdate);
                    Calendar startCalendar = Calendar.getInstance();
                    startCalendar.setTime(startDate);
                    startCalendar.add(Calendar.YEAR, 543);
                    Date adjustedStartDate = startCalendar.getTime();

                    // แปลงวันที่สิ้นสุด
                    Date endDate = new SimpleDateFormat("dd/MM/yyyy").parse(enddate);
                    Calendar endCalendar = Calendar.getInstance();
                    endCalendar.setTime(endDate);
                    endCalendar.add(Calendar.YEAR, 543);
                    Date adjustedEndDate = endCalendar.getTime();

                    // ใช้ adjustedStartDate และ adjustedEndDate
                    java.sql.Date SQLstartDate = new java.sql.Date(adjustedStartDate.getTime());
                    java.sql.Date SQLendDate = new java.sql.Date(adjustedEndDate.getTime());

                    AddStudent student = new AddStudent(student_id, firstname, lastname, student_id, "ยังไม่ระบุ", SQLstartDate, SQLendDate, teachername, teacherlastname, company);
                    listStudent.add(student);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        for (AddStudent student : listStudent) {
            int companyId = 0;
            int teacherId = 0;

            try {
                companyId = LC.SearchcompanyName(student.getCompany_companyname());
            } catch (Exception e) {
                e.printStackTrace();
                companyId = 0;
            }

            try {
                teacherId = TM.Searchteachername(student.getTeacher_teachername(), student.getTeacher_teacherlastname());
            } catch (Exception e) {
                e.printStackTrace();
                teacherId = 0;
            }

            String semester = null;
            if (inlineRadio1.equals("ภาคเรียนที่ 1")) {
                semester = "ภาคเรียนที่1/" + yearE;
            } else if (inlineRadio1.equals("ภาคเรียนที่ 2")) {
                semester = "ภาคเรียนที่2/" + yearE;
            } else {
                semester = "ภาคเรียนที่3/" + yearE;
            }

            Student studentObj = null;
            if (companyId != 0) {
                studentObj = new Student(student.getIdstudent(), student.getStudentname(), student.getStudentlastname(), student.getPassword(), student.getWorkposition(), student.getStartdate(), student.getEnddate(), semester, teacherId, companyId);
                int error = LSTU.addStudent(studentObj);
                if (error == -1 || studentObj == null) {
                    if (companyId == 0) {
                        errorCOM = 1;
                        errorList.add(student.getIdstudent());
                    } else {
                        errorList.add(student.getIdstudent());
                    }
                } else {
                    studentList.add(studentObj);
                }
            }
        }

        if (errorList.isEmpty()) {
            errorList.add("1");
        }

        request.setAttribute("errorlist", errorList);
        session.setAttribute("listSTU", studentList);
        session.setAttribute("listStudent", listStudent);
        session.setAttribute("errorCOM", errorCOM);

        ModelAndView mav = new ModelAndView("AddStudentPage");
        return mav;
    }

	
	

	

}
