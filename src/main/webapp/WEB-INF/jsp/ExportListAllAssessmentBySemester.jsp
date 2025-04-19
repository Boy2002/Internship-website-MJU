<%@ page language="java" contentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*, java.util.*, java.text.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook, org.apache.poi.ss.util.CellRangeAddress" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // Get data from session
    List<Student> student = (List<Student>) session.getAttribute("StuSemester"); 
    List<teacher> teacherList = (List<teacher>) session.getAttribute("teacherList"); 
    ListStudentDB ListStu = new ListStudentDB();
    teacher Teacher = (teacher) session.getAttribute("teacher");
    String getSemester = (String) session.getAttribute("getSemester");

    // Prepare Excel file
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=AllAssessmentBySemester.xlsx");
    
    // Create Workbook and Sheet
    XSSFWorkbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Assessment Report");
    
    // Create a DataFormat object to set the format
    DataFormat format = workbook.createDataFormat();
    
    // Create a CellStyle for 2 decimal places with leading zero
    CellStyle decimalStyle = workbook.createCellStyle();
    decimalStyle.setDataFormat(format.getFormat("0.00")); // Change to "0.00" for leading zero
   
    		// Create a CellStyle for merged cells
    CellStyle mergeStyle = workbook.createCellStyle();
    mergeStyle.setAlignment(HorizontalAlignment.CENTER);
    mergeStyle.setVerticalAlignment(VerticalAlignment.CENTER);
    Font mergeFont = workbook.createFont();
    mergeFont.setBold(true);
    mergeStyle.setFont(mergeFont);
    mergeFont.setFontHeightInPoints((short) 16);
    		
 // Add the semester information to the merged cell
    Row mergeRow = sheet.createRow(0);
    Cell mergeCell = mergeRow.createCell(0);
    mergeCell.setCellValue("ภาคเทอม: " + getSemester);
    mergeCell.setCellStyle(mergeStyle);

    // Merge cells across 7 columns
    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
    
    
    // Fetch additional data needed
    String Rid = null;
    for(int i = 0; i < student.size(); i++) { 
        Rid = ListStu.AllReportStuid(student.get(i).getIdstudent()); 
        if (Rid != null) {
            break;
        }
    }
    List<teacher> TC = ListStu.AllReportTname(Rid);

    // Create header row
    int headerRowIdx = 1;
    Row headerRow = sheet.createRow(headerRowIdx++);
    int colIdx = 0;
  
    headerRow.createCell(colIdx++).setCellValue("รหัสนักศึกษา");
    headerRow.createCell(colIdx++).setCellValue("ชื่อนักศึกษา");

    for (teacher T : TC) {
        headerRow.createCell(colIdx++).setCellValue("คะแนนรายงาน T" + T.getTeacherid());
    }
    headerRow.createCell(colIdx++).setCellValue("คะแนนรายงานเฉลี่ย");

    for (teacher T : TC) {
        headerRow.createCell(colIdx++).setCellValue("คะแนนการนำเสนอ T" + T.getTeacherid());
    }
    headerRow.createCell(colIdx++).setCellValue("คะแนนนำเสนอเฉลี่ย");
    headerRow.createCell(colIdx++).setCellValue("คะแนนประเมินอาจารย์");
    headerRow.createCell(colIdx++).setCellValue("คะแนนประเมินพี่เลี้ยง");
    headerRow.createCell(colIdx++).setCellValue("คะแนนรวม");

    // Fill data rows
    for (Student stu : student) {
        Row row = sheet.createRow(headerRowIdx++);
        colIdx = 0;
        row.createCell(colIdx++).setCellValue(stu.getIdstudent());
        row.createCell(colIdx++).setCellValue(stu.getStudentname() + " " + stu.getStudentlastname());

        double totalScore = 0.0;
        double scoreSUM = 0.0;
        double scoreVDOSUM = 0.0;
        int SUMTC = 0;

        String RidSUM = ListStu.AllReportStuid(stu.getIdstudent());
        
        for (teacher T : TC) {
            double score = ListStu.scoreSTU(RidSUM, T.getTeacherid());
            if (score < 0) {
                row.createCell(colIdx++).setCellValue("-");
            } else {
                scoreSUM += score;
                SUMTC++;
                Cell cell = row.createCell(colIdx++);
                cell.setCellValue(score);
                cell.setCellStyle(decimalStyle); // Set the decimal style for numeric cell
            }
        }

        double avgscore = (SUMTC != 0) ? (scoreSUM / SUMTC) : 0;
        Cell cellAvgScore = row.createCell(colIdx++);
        cellAvgScore.setCellValue(avgscore);
        cellAvgScore.setCellStyle(decimalStyle); // Set the decimal style
        totalScore += avgscore;

        SUMTC = 0;
        for (teacher T : TC) {
            double scorevdo = ListStu.scoreSTUVDO(stu.getIdstudent(), T.getTeacherid());
            if (scorevdo < 0) {
                row.createCell(colIdx++).setCellValue("-");
            } else {
                scoreVDOSUM += scorevdo;
                SUMTC++;
                Cell cellVdoScore = row.createCell(colIdx++);
                cellVdoScore.setCellValue(scorevdo);
                cellVdoScore.setCellStyle(decimalStyle); // Set the decimal style
            }
        }

        double avgscorevdo = (SUMTC != 0) ? (scoreVDOSUM / SUMTC) : 0;
        Cell cellAvgVdoScore = row.createCell(colIdx++);
        cellAvgVdoScore.setCellValue(avgscorevdo);
        cellAvgVdoScore.setCellStyle(decimalStyle); // Set the decimal style
        totalScore += avgscorevdo;

        ScoreAssessmentDB asDB = new ScoreAssessmentDB();
        List<teacheranswer> Listtans = asDB.Allteacheranswer(stu.getIdstudent());
        List<mentoranswer> Listmans = asDB.Allmentoranswer(stu.getIdstudent());

        double sumScoreTeacher = 0.0;
        double sumScoreMentor = 0.0;
        double totalFormtea = 0.0;
        double totalFormmen = 0.0;

        CreateformDB cfDB = new CreateformDB();
        Teacherassessmentform tf = new Teacherassessmentform();
        if (!Listtans.isEmpty()) {
            tf = cfDB.getTeacherFormById(Listtans.get(0).getTeacherformid_answer());
            totalFormtea = tf.getTotalscore();
        }
        Mentorassessmentform mf = new Mentorassessmentform();
        if (!Listmans.isEmpty()) {
            mf = cfDB.getMentorFormById(Listmans.get(0).getMentorformid_ans());
            totalFormmen = mf.getTotalscore();
        }

        for (teacheranswer ta : Listtans) {
            sumScoreTeacher += ta.getScore();
        }
        double percenttea = (totalFormtea != 0) ? (sumScoreTeacher / totalFormtea) * 100 : 0;
        double scoreTeacher = (percenttea != 0) ? (percenttea / 100) * 20 : 0;
        totalScore += scoreTeacher;
        Cell cellScoreTeacher = row.createCell(colIdx++);
        cellScoreTeacher.setCellValue(scoreTeacher);
        cellScoreTeacher.setCellStyle(decimalStyle); // Set the decimal style

        for (mentoranswer ma : Listmans) {
            sumScoreMentor += ma.getScore();
        }
        double percentmen = (totalFormmen != 0) ? (sumScoreMentor / totalFormmen) * 100 : 0;
        double scoreMentor = (percentmen != 0) ? (percentmen / 100) * 60 : 0;
        totalScore += scoreMentor;
        Cell cellScoreMentor = row.createCell(colIdx++);
        cellScoreMentor.setCellValue(scoreMentor);
        cellScoreMentor.setCellStyle(decimalStyle); // Set the decimal style

        Cell cellTotalScore = row.createCell(colIdx++);
        cellTotalScore.setCellValue(totalScore);
        cellTotalScore.setCellStyle(decimalStyle); // Set the decimal style
    }

    // Adjust the column widths to fit the content
    for (int i = 0; i < colIdx; i++) {
        sheet.autoSizeColumn(i);
    }

    // Write Excel file to response output stream
    try (ServletOutputStream Output = response.getOutputStream()) {
        workbook.write(Output);
    } finally {
        workbook.close();
    }
%>
