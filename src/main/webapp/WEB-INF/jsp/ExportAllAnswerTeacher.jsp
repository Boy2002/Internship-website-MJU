<%@ page language="java" contentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook, org.apache.poi.ss.util.CellRangeAddress, java.util.*"%>
<%@ page import="bean.Student, bean.teacher, bean.question, bean.teacheranswer, util.ListStudentDB, util.ListCompanyDB, util.AssessmentDB, util.AddQuestionDB" %>

<%
    // ตั้งค่า Content-Type และ Header
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=AllAnswerTeacher.xlsx");

    // ตรวจสอบว่าไม่มีกระบวนการเขียนข้อมูลอื่นๆ
    if (response.isCommitted()) {
        return; // ถ้า response ถูกคอมมิทแล้ว ให้หยุดการดำเนินการ
    }
    
    // สร้าง Workbook และ Sheet
    XSSFWorkbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Answers");

    // ดึงข้อมูลที่จำเป็น
    List<Student> student = (List<Student>) session.getAttribute("student");
    List<teacher> Listteacher = (List<teacher>) session.getAttribute("Listteacher");
    List<question> ListQ = new AddQuestionDB().ListAllQuestion();
    AssessmentDB asDB = new AssessmentDB();
    Map<Integer, String> answeredQuestionsMap = new LinkedHashMap<>(); // ใช้เพื่อเก็บคำถามที่มีการตอบ

    // ตรวจสอบคำถามที่มีการตอบ
    if (Listteacher != null && !Listteacher.isEmpty()) {
        for (teacher t : Listteacher) {
            if (student != null && !student.isEmpty()) {
                for (Student S : student) {
                    List<teacheranswer> tans = asDB.CheckAssessmentTeacherAnswer(t.getTeacherid(), S.getIdstudent());
                    if (tans != null && !tans.isEmpty()) {
                        for (teacheranswer ta : tans) {
                            answeredQuestionsMap.put(ta.getQuestionid_answer(), null); // บันทึกคำถามที่มีการตอบ
                        }
                    }
                }
            }
        }
    }

    // สร้างแถวหัวตาราง
    Row headerRow = sheet.createRow(0);
    headerRow.createCell(0).setCellValue("อาจารย์นิเทศสหกิจศึกษา");
    headerRow.createCell(1).setCellValue("บริษัท");
    headerRow.createCell(2).setCellValue("รายชื่อนักศึกษา");

    int colIndex = 3; // เริ่มต้นคอลัมน์คำถาม
    for (question que : ListQ) {
        if (answeredQuestionsMap.containsKey(Integer.parseInt(que.getQuestionid()))) {
            headerRow.createCell(colIndex++).setCellValue(que.getQuestiontext());
            answeredQuestionsMap.put(Integer.parseInt(que.getQuestionid()), que.getQuestiontext()); // อัปเดตคำถามที่มีการตอบ
        }
    }
	
    // เพิ่มคอลัมน์สำหรับคะแนนรวม
    headerRow.createCell(colIndex).setCellValue("คะแนนรวม");
    colIndex++; // ปรับให้ colIndex สำหรับแถวถัดไป
    
    // ใส่ข้อมูลลงในตาราง
    int rowIndex = 1;
    if (Listteacher != null && !Listteacher.isEmpty()) {
        for (teacher t : Listteacher) {
            if (student != null && !student.isEmpty()) {
                for (Student S : student) {
                    List<teacheranswer> tans = asDB.CheckAssessmentTeacherAnswer(t.getTeacherid(), S.getIdstudent());
                    if (tans != null && !tans.isEmpty()) {
                        Row row = sheet.createRow(rowIndex++);
                        row.createCell(0).setCellValue(t.getTeachername() + " " + t.getTeacherlastname());
                        row.createCell(1).setCellValue(new ListCompanyDB().Searchcompanyid(S.getCompany_companyid()).getCompanyname());
                        row.createCell(2).setCellValue(S.getIdstudent() + " " + S.getStudentname() + " " + S.getStudentlastname());

                        colIndex = 3;
                        int totalScore = 0;
                        for (Map.Entry<Integer, String> entry : answeredQuestionsMap.entrySet()) {
                            boolean answered = false;
                            for (teacheranswer ta : tans) {
                                if (entry.getKey() == ta.getQuestionid_answer()) {
                                    row.createCell(colIndex).setCellValue(ta.getTeacheranswertext());
                                    totalScore += ta.getScore();
                                    answered = true;
                                    break;
                                }
                            }
                            if (!answered) {
                                row.createCell(colIndex).setCellValue("-");
                            }
                            colIndex++;
                        }
                        row.createCell(colIndex).setCellValue(totalScore);
                    }
                }
            }
        }
    } else {
        // ถ้าไม่มีข้อมูล
        Row row = sheet.createRow(rowIndex++);
        row.createCell(0).setCellValue("ไม่มีข้อมูลนักศึกษา");
        sheet.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, colIndex - 1));
    }

    // เขียนข้อมูลไปยัง Response OutputStream
    try (ServletOutputStream output = response.getOutputStream()) {
        workbook.write(output);
    } finally {
        workbook.close();
    }
%>
