<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
    List<reportname> Reportname = (List) session.getAttribute("Listreportname");
    Student student1 = (Student)session.getAttribute("student1");
    notifysendingreportDB HM = new notifysendingreportDB();
    String getSemester = (String) session.getAttribute("getSemester");
    
%>
<%
	//notifysendingreportDB HM = new notifysendingreportDB();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Weekly Report</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kanit'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">
	
<style type="text/css">
hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
}
</style>

</head>
<body>
	<jsp:include page="com/navbar.jsp"></jsp:include>
	
	<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบประเมินให้คะแนนเอกสารสหกิจ </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadlistStuPage?getCompanyid=<%=student1.getCompany_companyid()%>&getSemester=<%=getSemester%>" style="color:#FFFFFF;">รายชื่อนักศึกษา</a> / <a class="a2" href="#" style="color:#E28A06;">เอกสารรายงานความก้าวหน้าการฝึกสหกิจประจำสัปดาห์ </a></div>

</div></div></div>
<br>
</div>

	<div class="container" style="margin-top: 35px;">
		<br> <br>
		<section id="content">
			<div class="container" style="margin-top: -20px">
				<div class="row">
					<div class="col-lg-12">
						<div class="container">
							<h3 style="color:#850000;" >เอกสารรายงานความก้าวหน้าการฝึกสหกิจประจำสัปดาห์ </h3>
							<h6 style="color:#850000;"><%=student1.getIdstudent()%> : <%=student1.getStudentname() %> <%=student1.getStudentlastname()%></h6>
							<hr class="style13">
							<br> <br>						
							<table class="table table-bordered" id="myTable">
								<thead class="table-info">
									<tr>
										<th>ชื่อเอกสาร</th>
										<th>กำหนดส่ง</th>
										<th>สถานะ</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%for (reportname R : Reportname) { %>
										<%if(R.getReportnameid() != 17 && R.getReportnameid() != 18){ %>	
										<%									  
                                        report Lreport = null;
                                        int reportnameid = 0;
                                        try{
                                           Lreport = HM.AllListmyreport(student1.getIdstudent() , R.getReportnameid()); 
                                           reportnameid = Lreport.getReportName_reportnameid();
                                           }catch(Exception e){
	                                       reportnameid = 0;
                                           }
                                     %>
										
										<%
										Date dt = new Date(student1.getStartdate().getTime());
											Calendar c = Calendar.getInstance();
											c.setTime(dt);
											c.add(Calendar.DATE, R.getDelivery());
											dt = c.getTime();
											String date = new SimpleDateFormat("dd/MM/yyyy").format(dt);

											Date dd = new Date();
											Calendar c1 = Calendar.getInstance();
											c1.setTime(dd);
											c1.add(Calendar.YEAR,543);
											dd = c1.getTime();
											String date1 = new SimpleDateFormat("dd/MM/yyyy").format(dd);
									%>
										
								    <%if(reportnameid == R.getReportnameid()){ %>
								    
								     <% SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                                     <% Date dateString = formatter1.parse(Lreport.getSentdate().toString());%>
                                     
                                     <%String dateFString = new SimpleDateFormat("dd/MM/yyyy").format(dateString); %>
                                     <%String TString = new SimpleDateFormat("HH:mm").format(dateString); %>
                                     
									<tr>
                                         <td><%=R.getReportname()%></td>
                                         <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                         <td style="color:#28A745;">ส่งเอกสารแล้ว <i class="fa fa-check"></i> <br><i class='fa fa-calendar'></i> เมื่อวันที่ <%=dateFString%> <i class='fa fa-clock-o'></i> เวลา <%=TString%> น.</td>
                                         <td><a href="./document/<%=Lreport.getFilename()%>"><button class="btn btn-success"><i class="fa fa-file-pdf-o" style="font-size:17px"></i></button></a></td>
                                    </tr>
                                     <%}else{ %>
                                     
                                     <tr>
                                         <td><%=R.getReportname()%></td>
                                         <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                         <td style="color:#FD4648;"> <i class="fa fa-exclamation-triangle"></i> ยังไม่ได้ส่งเอกสาร  </td>
                                         <td style="color:#FD4648;"> <i class="fa fa-times-circle fa-3x"></i> </td>
                                    </tr>
                                    
                                     <%} %>
										<%}else{break;} %>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>
  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

</body>
</html>