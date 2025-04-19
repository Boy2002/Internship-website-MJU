<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<Student> student = (List)session.getAttribute("StuSemester"); 
List<teacher> teacherList = (List)session.getAttribute("teacherList"); 

ListStudentDB ListStu = new ListStudentDB();
teacher Teacher = (teacher)session.getAttribute("teacher");

String getSemester = (String)session.getAttribute("getSemester");


%>

<!DOCTYPE html>
<html>
<head>
<title>เว็บไซต์รายงานสหกิจศึกษา </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<%
String Rid = null;
for(int i = 0;i<student.size();i++){ 
 Rid = ListStu.AllReportStuid(student.get(i).getIdstudent()); 
if(Rid != null){
	break;
}
} %>


<%List<teacher> TC = ListStu.AllReportTname(Rid);%>
<%response.setContentType("application/vnd.ms-excel"); %>
<%response.setHeader("Content-Disposition", "inline; filename=employee.xls"); %>

	<div style="margin-top: 0px;">
	
	<table class="table table-bordered" id="myTable" style="width:95%" >
								<thead class="table-info" align = "center">
								<tr>
								 <th colspan="<%=TC.size()+TC.size()+6 %>"> <%=getSemester%> </th>
								</tr>
									<tr>
										<th rowspan="2"> รหัสนักศึกษา </th>
										<th rowspan="2"> ชื่อนักศึกษา </th>										
										<th rowspan="2" > ระยะเวลาการฝึก </th>		
										<th rowspan="2"> ต้องการฝึกในตำแหน่ง </th>	
										<th  colspan="<%=TC.size()+1%>"> คะแนนรายงาน (10) </th>
										<th  colspan="<%=TC.size()+1%>"> คะแนนการนำเสนอ (10) </th>	
																																				
									</tr>
									<tr>
									<%for(teacher T : TC){ %>
										<th> <%=T.getTeachername() %> </th>
										<%} %>
									<th> คะแนนรายงานเฉลี่ย </th>
									<%for(teacher T : TC){ %>
										<th> <%=T.getTeachername() %> </th>
										<%} %>
									<th> คะแนนนำเสนอเฉลี่ย </th>
									</tr>
								</thead>
								<tbody>
								
								<%for(Student stu : student){ %>
								<%double scoreSUM = 0; %>
								<%double scoreVDOSUM = 0; %>
								<%int SUMTC = 0; %>
                                        <tr align = "center"> 
                                        <th><%=stu.getIdstudent() %></th>   
                                        <th><%=stu.getStudentname()%> <%=stu.getStudentlastname() %></th> 
                                        
                                        
                                        <% Date dt = new Date(stu.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								c.setTime(dt); 
								dt = c.getTime();
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									 <% Date dt2 = new Date(stu.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<th style="white-space:nowrap"><i class='fa fa-calendar'></i> วันที่ <%=date%> - <%=date2%></th>	
								
								<th><%=stu.getWorkposition() %></th>
								<%String RidSUM = ListStu.AllReportStuid(stu.getIdstudent()); %>
								
								<%for(teacher T : TC){ %>		
								<%double score = ListStu.scoreSTU(RidSUM , T.getTeacherid()); %>
								<%if(score < 0){ %>
									 <th>-</th> 
								<%}else{ %>
								  <%scoreSUM = scoreSUM+score; %>
									<%SUMTC ++; %>
									 <th><%=score %></th>  
								  <%} %>
								    <%} %>
								  
								  <%Double AVG = scoreSUM/SUMTC;%>
								   <%Double avgscore = ( Math.floor(AVG * 100) / 100 );%> 
	   
								   <%if(Double.isNaN(avgscore)){ %>
								        <th style = "background-color: #FF8F8F;">0</th> 
								     <%}else{ %>  							      
								        <th style = "background-color: #61DD99;"><%=avgscore%></th> 
								     <%} %>        
								   
								   <%SUMTC = 0; %>  
								<%for(teacher T : TC){ %>		
								<%double scorevdo = ListStu.scoreSTUVDO(stu.getIdstudent() , T.getTeacherid()); %>
								
								<%if(scorevdo<0){ %>
								 <th>-</th>
								  <%}else{ %>
								  <%scoreVDOSUM = scoreVDOSUM+scorevdo; %>
								  <%SUMTC ++; %>
								  <th><%=scorevdo %></th>
								 
								  <%} %>
								  <%} %> 
								  
								       <%Double AVGvdo = scoreVDOSUM/SUMTC;%>
								   <%Double avgscorevdo = ( Math.floor(AVGvdo * 100) / 100 );%>
								   
								   <%if(Double.isNaN(avgscorevdo)){ %>
								        <th style = "background-color: #FF8F8F;">0</th> 
								     <%}else{ %>  							      
								        <th style = "background-color: #61DD99;"><%=avgscorevdo%></th> 
								     <%} %>                       
                                        </tr>
                                 <%} %>
								</tbody>
							</table>
	</div>




</body>
</html>