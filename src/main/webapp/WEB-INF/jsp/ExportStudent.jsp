<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<Student> student = (List)session.getAttribute("student"); 
ListCompanyDB company = new ListCompanyDB();
ListmentorDB mentor = new ListmentorDB();
String getSemester = (String)session.getAttribute("getSemester");
%>

<!DOCTYPE html>
<html>
<head>
<title>เว็บไซต์รายงานสหกิจศึกษา </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<%response.setContentType("application/vnd.ms-excel"); %>
<%response.setHeader("Content-Disposition", "inline; filename=employeeStudent.xls"); %>

	<div style="margin-top: 0px;">
	
	<table class="table table-bordered" id="myTable" style="width:95%" >
								<thead class="table-info" align = "center">
								
								 <tr align = "center">
                                 <th colspan="11"> <%=getSemester%> </th>
                                 </tr>
									<tr>
										<th> รหัสนักศึกษา </th>
										<th> ชื่อ-นามสกุลนักศึกษา </th>										
										<th> ระยะเวลาการฝึก </th>		
										<th> ต้องการฝึกในตำแหน่ง </th>										
										<th> บริษัท </th>
										<th> ชื่อ-นามสกุลพนักงานพี่เลี้ยง </th>	
										<th> ชื่อเล่นพนักงานพี่เลี้ยง </th>
										<th> เบอร์โทรศัพท์ </th>	
										<th> line </th>	
										<th> facebook </th>		
										<th> Email </th>																												
									</tr>
								</thead>
								<tbody>
								<%for(Student S : student){ %>
								
								
								
								<tr>
								<th><%=S.getIdstudent() %></th>
								<th><%=S.getStudentname()%> <%=S.getStudentlastname() %></th>
								
								<% Date dt = new Date(S.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								c.setTime(dt); 
								dt = c.getTime();
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									<% Date dt2 = new Date(S.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<th> วันที่ <%=date%> - <%=date2%></th>			
								<th> <%=S.getWorkposition()%></th>
								
								<%Company com = company.Searchcompanyid(S.getCompany_companyid()); %>
								<th> <%=com.getCompanyname()%></th>
								
								
								<%
								List<Mentor> m = mentor.AllListmentor(S.getIdstudent());
								%>	
								<th>
								<%for(Mentor M : m){ %>
								<%=M.getMentorname()%> <%=M.getMentorlastname() %> <br>
								<%} %>
								</th>
								
								<th>
								<%for(Mentor M : m){ %>
								<%=M.getMentornickname() %> <br>
								<%} %>
								</th>
								
								<th>
								<%for(Mentor M : m){ %>							
								0<%=M.getPhonenumber() %> <br>
								<%} %>
								</th>
								
								<th>
								<%for(Mentor M : m){ %>
								<%=M.getMentorline() %> <br>
								<%} %>
								</th>
								
								<th>
								<%for(Mentor M : m){ %>
								<%=M.getMentorfacebook() %> <br>
								<%} %>
								</th>
								
								<th>
								<%for(Mentor M : m){ %>
								<%=M.getMetoremail() %> <br>
								<%} %>
								</th>
														
								<th>
								</th>
								
								</tr>
								<%} %>
								</tbody>
							</table>
	</div>




</body>
</html>