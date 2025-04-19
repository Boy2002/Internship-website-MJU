<%@ page language="java" contentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" pageEncoding="UTF-8"%> 
<%@ page import="java.io.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook, org.apache.poi.ss.util.CellRangeAddress, java.util.*"%>
<%@ page import="bean.Student, bean.Mentor, bean.question, bean.mentoranswer, util.ListStudentDB, util.ListCompanyDB, util.AssessmentDB, util.AddQuestionDB, util.ListmentorDB" %>

<%
    // ตั้งค่า Content-Type และ Header
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=AllAnswerMentor.xlsx");

    if (response.isCommitted()) {
        return; // ถ้า response ถูกคอมมิทแล้ว ให้หยุดการดำเนินการ
    }
    
    XSSFWorkbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Answers");

    List<Student> student = (List<Student>) session.getAttribute("student");
    String getSemester = (String)session.getAttribute("getSemester");
    List<question> ListQ = new AddQuestionDB().ListAllQuestion();
    AssessmentDB asDB = new AssessmentDB();
    ListmentorDB Listmentor = new ListmentorDB();
    Map<Integer, String> answeredQuestionsMap = new LinkedHashMap<>(); 
    List<Mentor> ListM = Listmentor.AllListmentorManage(getSemester);
    
    // ตรวจสอบคำถามที่มีการตอบ
    if (ListM != null && !ListM.isEmpty()) {
        for (Mentor m : ListM) {
            if (student != null && !student.isEmpty()) {
                for (Student S : student) {
                    List<mentoranswer> mans = asDB.CheckAssessmentMentorAnswer(m.getMentorid(), S.getIdstudent());
                    if (mans != null && !mans.isEmpty()) {
                        for (mentoranswer ma : mans) {
                            answeredQuestionsMap.put(ma.getQuestionid_ans(), null); // บันทึกคำถามที่มีการตอบ
                        }
                    }
                }
            }
        }
    }

    // สร้างแถวหัวตาราง
    Row headerRow = sheet.createRow(0);
    headerRow.createCell(0).setCellValue("พี่เลี้ยง");
    headerRow.createCell(1).setCellValue("บริษัท");
    headerRow.createCell(2).setCellValue("รายชื่อนักศึกษา");

    int colIndex = 3; // เริ่มต้นคอลัมน์คำถาม
    for (question que : ListQ) {
        if (answeredQuestionsMap.containsKey(Integer.parseInt(que.getQuestionid()))) {
            headerRow.createCell(colIndex++).setCellValue(que.getQuestiontext());
            answeredQuestionsMap.put(Integer.parseInt(que.getQuestionid()), que.getQuestiontext());
        }
    }

    // เพิ่มคอลัมน์สำหรับคะแนนรวม
    headerRow.createCell(colIndex).setCellValue("คะแนนรวม");
    colIndex++; // ปรับให้ colIndex สำหรับแถวถัดไป

    // ใส่ข้อมูลลงในตาราง
    int rowIndex = 1;
    if (ListM != null && !ListM.isEmpty()) {
        for (Mentor m : ListM) {
            if (student != null && !student.isEmpty()) {
                for (Student S : student) {
                    List<mentoranswer> mans = asDB.CheckAssessmentMentorAnswer(m.getMentorid(), S.getIdstudent());
                    if (mans != null && !mans.isEmpty()) {
                        Row row = sheet.createRow(rowIndex++);
                        row.createCell(0).setCellValue(m.getMentorname() + " " + m.getMentorlastname());
                        row.createCell(1).setCellValue(new ListCompanyDB().Searchcompanyid(S.getCompany_companyid()).getCompanyname());
                        row.createCell(2).setCellValue(S.getIdstudent() + " " + S.getStudentname() + " " + S.getStudentlastname());

                        colIndex = 3;
                        int totalScore = 0; // ตัวแปรสำหรับเก็บคะแนนรวม
                        for (Map.Entry<Integer, String> entry : answeredQuestionsMap.entrySet()) {
                            boolean answered = false;
                            for (mentoranswer ma : mans) {
                                if (entry.getKey() == ma.getQuestionid_ans()) {
                                    row.createCell(colIndex).setCellValue(ma.getMentoranswertext());
                                    totalScore += ma.getScore(); // เพิ่มคะแนนลงใน totalScore
                                    answered = true;
                                    break;
                                }
                            }
                            if (!answered) {
                                row.createCell(colIndex).setCellValue("-");
                            }
                            colIndex++;
                        }
                        // ใส่คะแนนรวมที่คอลัมน์สุดท้าย
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
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        try {
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
%>
