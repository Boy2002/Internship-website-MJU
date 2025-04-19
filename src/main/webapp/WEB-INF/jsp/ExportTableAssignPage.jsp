<%@ page import="java.io.*, java.util.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.*" %>
<%@ page language="java" contentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*" %>
<%@ page import="org.apache.poi.ss.util.CellRangeAddress" %>

<%
    // สร้าง workbook ใหม่
    XSSFWorkbook workbook = new XSSFWorkbook();
    XSSFSheet sheet = workbook.createSheet("AssignSupervision");

    // สร้าง CellStyle สำหรับการจัดตำแหน่งชิดบน
    CellStyle topAlignStyle = workbook.createCellStyle();
    topAlignStyle.setVerticalAlignment(VerticalAlignment.TOP); // ตั้งค่าการจัดตำแหน่งแนวตั้งให้ชิดบน
    topAlignStyle.setAlignment(HorizontalAlignment.LEFT); // ตั้งค่าการจัดตำแหน่งแนวนอน

    // กำหนดข้อมูลเริ่มต้น เช่น ชื่อภาคเรียน และข้อมูลการนิเทศ
    String Semester = (String) session.getAttribute("Semester");
    List<Assignsupervision> ListAs = (List) session.getAttribute("ListAs");

    // สร้างหัวข้อของ sheet
    int rowNum = 0;
    Row headerRow = sheet.createRow(rowNum++);
    headerRow.createCell(0).setCellValue("ชื่อบริษัท");
    headerRow.createCell(1).setCellValue("วันที่นิเทศ");
    headerRow.createCell(2).setCellValue("เวลานิเทศ");
    headerRow.createCell(3).setCellValue("อาจารย์นิเทศ");
    headerRow.createCell(4).setCellValue("รูปแบบการนิเทศ");
    headerRow.createCell(5).setCellValue("นักศึกษา");
    headerRow.createCell(6).setCellValue("พี่เลี้ยง");

    // ดึงข้อมูลจาก ListAs และใส่ลงในแถวของ sheet
    if (ListAs != null) {
        ListCompanyDB lcDB = new ListCompanyDB();
        teacherManager tm = new teacherManager();
        ListStudentDB ListStu = new ListStudentDB();
        ListmentorDB lmDB = new ListmentorDB();

        for (Assignsupervision as : ListAs) {
            // ดึงข้อมูลบริษัทและอาจารย์
            int comid = Integer.parseInt(as.getCompanyid());
            int teaid = Integer.parseInt(as.getTeacherid());
            Company com = lcDB.Searchcompanyid(comid);
            teacher tea = tm.Searchteacherid(teaid);

            // ดึงรายชื่อนักศึกษาในบริษัทนั้น ๆ
            List<Student> liststudent = ListStu.AllListStu(as.getCompanyid(), Semester);
            int studentCount = liststudent.size();

            // สร้างแถวใหม่สำหรับข้อมูลบริษัท
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(com.getCompanyname());
            row.createCell(1).setCellValue(as.getDate());
            row.createCell(2).setCellValue(as.getTime());
            row.createCell(3).setCellValue(tea.getTeachername() + " " + tea.getTeacherlastname());
            row.createCell(4).setCellValue(as.getMethods());

            for (int ii = 0; ii < studentCount; ii++) {
                Student s = liststudent.get(ii);
                List<Mentor> listmentor_student = lmDB.AllListmentor(s.getIdstudent());
                int mentorCount = listmentor_student.size();

                // สร้างแถวใหม่สำหรับนักเรียน
                if (ii > 0) {
                    row = sheet.createRow(rowNum++);
                }

                row.createCell(5).setCellValue(s.getStudentname() + " " + s.getStudentlastname());

                // ถ้ามีพี่เลี้ยงมากกว่าหนึ่งคน ให้รวมเซลล์
                if (mentorCount > 1) {
                    StringBuilder mentors = new StringBuilder();
                    for (Mentor ms : listmentor_student) {
                        mentors.append(ms.getMentorname()).append(" ").append(ms.getMentorlastname()).append(" , ");
                    }
                    row.createCell(6).setCellValue(mentors.toString().trim());

                    // กำหนดค่าของ mentorCount เป็น final
                    final int startRow = rowNum - 1;
                    final int endRow = rowNum + mentorCount - 1;

                    boolean canMerge = true;
                    // ตรวจสอบว่ามีการรวมเซลล์อยู่หรือไม่
                       for (int r = startRow; r <= endRow; r++) {
       final int currentRow = r; // สร้างตัวแปรที่เป็น final
       // ใช้ currentRow แทน r ใน Lambda Expression หรือ Stream
       sheet.getMergedRegions().stream()
            .filter(range -> range.isInRange(currentRow, 6))
            .forEach(range -> {
                // ทำสิ่งที่คุณต้องการ
            });
   }

                   } else if (mentorCount == 1) {
                       row.createCell(6).setCellValue(listmentor_student.get(0).getMentorname() + " " + listmentor_student.get(0).getMentorlastname());
                   } else {
                       row.createCell(6).setCellValue(""); // ไม่มีพี่เลี้ยง
                   }
               }

            // รวมเซลล์สำหรับบริษัท, วันที่, เวลา, อาจารย์, รูปแบบการนิเทศ
            if (studentCount > 1) {
                sheet.addMergedRegion(new CellRangeAddress(rowNum - studentCount, rowNum - 1, 0, 0));
                sheet.addMergedRegion(new CellRangeAddress(rowNum - studentCount, rowNum - 1, 1, 1));
                sheet.addMergedRegion(new CellRangeAddress(rowNum - studentCount, rowNum - 1, 2, 2));
                sheet.addMergedRegion(new CellRangeAddress(rowNum - studentCount, rowNum - 1, 3, 3));
                sheet.addMergedRegion(new CellRangeAddress(rowNum - studentCount, rowNum - 1, 4, 4));
            }
        }
    }

    // ปรับขนาดคอลัมน์ให้พอดีกับข้อมูล
    sheet.autoSizeColumn(0);  // ชื่อบริษัท
    sheet.autoSizeColumn(1);  // วันที่นิเทศ
    sheet.autoSizeColumn(2);  // เวลานิเทศ
    sheet.autoSizeColumn(3);  // อาจารย์นิเทศ
    sheet.autoSizeColumn(4);  // รูปแบบการนิเทศ
    sheet.autoSizeColumn(5);  // นักศึกษา
    sheet.autoSizeColumn(6);  // พี่เลี้ยง

    // กำหนด response header ให้เป็นไฟล์ .xlsx
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=ExportAssignSupervision.xlsx");

    // เขียนข้อมูล workbook ลงใน output stream
    OutputStream outputStream = response.getOutputStream();
    workbook.write(outputStream);
    workbook.close();
    outputStream.close();
%>
