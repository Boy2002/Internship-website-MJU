<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	Student student = (Student) session.getAttribute("student");
%>
<%
	List<reportname> Reportname = (List) session.getAttribute("Listreportname");
%>
<%
	notifysendingreportDB HM = new notifysendingreportDB();
    UploadVDODB UR = new UploadVDODB();
%>

<%int error = 0; %>

<%
try{
	error = (int)request.getAttribute("error");
}catch(Exception e) {
	error = 0;
	}
%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
}
</style>

<meta charset="UTF-8">
<title>notify sending report</title>

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
<link rel="stylesheet" href="./css/Alert.css">
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>	
	


</head>
<body>
	<jsp:include page="com/navbar.jsp"></jsp:include>
	
	<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/student.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบส่งเอกสารรายงานความก้าวหน้าการฝึกสหกิจ</h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadhome" style="color:#E28A06;">ส่งเอกสารรายงานความก้าวหน้าการฝึกสหกิจ</a> </div>

</div></div></div>
<br>
</div>

<%if(error == 1){ %>
<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> บันทึกข้อมูลสำเร็จ : </strong> บันทึกข้อมูลเรียนร้อยแล้ว  
</div>
<%} %>
<%if(error == -1){ %>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ : </strong> กรุณากรอกข้อมูลใหม่  
</div>
<%} %>

	<div class="container" style="margin-top: 35px;">
		<br> <br>
		<section id="content">
			<div class="container" style="margin-top: -20px">
				<div class="row">
					<div class="col-lg-12">
						<div class="container">
							<h3 style="color:#850000" > เอกสารรายงานความก้าวหน้าการฝึกสหกิจ </h3>
								<hr class="style13">
								
							<br> 
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
								
										Date dt = new Date(student.getStartdate().getTime());
											Calendar c = Calendar.getInstance();
											c.setTime(dt);
											c.add(Calendar.DATE, R.getDelivery());
											c.add(Calendar.YEAR,-543);
											dt = c.getTime();
											String date = new SimpleDateFormat("dd/MM/yyyy").format(dt);

											Date dd = new Date();
											Calendar c1 = Calendar.getInstance();
											c1.setTime(dd);
											//c1.add(Calendar.YEAR,-543);
											dd = c1.getTime();
											String date1 = new SimpleDateFormat("dd/MM/yyyy").format(dd);
											
											//System.out.println("date ="+date+" date1 ="+date1);
									%>
                                                                  
									<%if(date.equals(date1) || dd.after(dt)){ %>
									<%									  
                                        report Lreport = null;
                                        int reportnameid = 0;
                                        try{
                                           Lreport = HM.AllListmyreport(student.getIdstudent() , R.getReportnameid()); 
                                           reportnameid = Lreport.getReportName_reportnameid();
                                           }catch(Exception e){
	                                       reportnameid = 0;
                                           }
                                     %>
                                    <%  
                                     int reportid = 0;
                                     try{
                                    	 
                                    	 reportid = HM.AllListreportid(student.getIdstudent() , R.getReportnameid()-1);  
                                    	                                  	 
                                         }catch(Exception e){
                                         reportid = 0;
                                         } 
                                     
                                         %>                        
                                     
                                     <%if(reportnameid == R.getReportnameid()){ %>
                                                       
                                     <% SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                                     <% Date dateString = formatter1.parse(Lreport.getSentdate().toString());%>
                                     
                                     <%String dateFString = new SimpleDateFormat("dd/MM/yyyy").format(dateString); %>
                                     <%String TString = new SimpleDateFormat("HH:mm").format(dateString); %>
                                    
                                    <form method="POST" action="${pageContext.request.contextPath}/loadEditReportPage">        
                                     <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="reportname">
                                     <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="reportnameid">
                                     <tr>
                                         <td><%=R.getReportname()%></td>
                                         <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                         <td style="color:#28A745;">ส่งเอกสารแล้ว <i class="fa fa-check"></i> <br><i class='fa fa-calendar'></i> เมื่อวันที่ <%=dateFString%></td>
                                         <td><button class="btn btn-warning" ><i class="fa-solid fa-file-pen" style="font-size:17px"></i></button></td>
                                     </tr>
                                   </form>
                                     
                                    <% }else if (reportid+1 == R.getReportnameid()){%>     
                                    <form method="POST" action="${pageContext.request.contextPath}/loadUploadReportPage">        
                                     <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="reportname">
                                     <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="reportnameid">
                                     <tr>
									    <td><%=R.getReportname()%></td>
                                        <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                        <td style="color:#F18811;"><i class="fa fa-exclamation-triangle"></i> ยังไม่ได้ส่งเอกสาร</td>
                                        <td><button class="btn btn-success" ><i class="fa-solid fa-file-circle-plus" style="font-size:17px"></i></button></td>
                                     <tr>
                                    </form>  
                                   <% }else{%>
									   
									  <tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#FD4648;" > <i class="fa fa-exclamation-triangle"></i> กรุณาส่งเอกสารรายงานประจําสัปดาห์ที่  <%=R.getReportnameid()-1%> ก่อน</td>
                                              <td style="color:#FD4648;"> <i class="fa fa-times-circle fa-3x"></i> </td>
                                     <tr>
									
									<%} %>
									<%}else{%>
									<tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#FD4648;"> <i class="fa fa-exclamation-triangle"></i> ยังไม่เปิดให้ส่ง</td>
                                              <td style="color:#FD4648;"> <i class="fa fa-times-circle fa-3x"></i> </td>
                                     <tr>
									<%} %>
									<%}else{ break; } %>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>








		<div class="col-lg-12">
		<br><br><br><br>
						<div class="container">
							<h3 style="color:#850000" > เอกสารรายงานสรุปการฝึกสหกิจ </h3>
								<hr class="style13">
								
							<br> 
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
																									
									<%}else{ %>
										<%
										Date dt = new Date(student.getStartdate().getTime());
											Calendar c = Calendar.getInstance();
											c.setTime(dt);
											c.add(Calendar.DATE, R.getDelivery());
											c.add(Calendar.YEAR,-543);
											dt = c.getTime();
											String date = new SimpleDateFormat("dd/MM/yyyy").format(dt);

											Date dd = new Date();
											Calendar c1 = Calendar.getInstance();
											c1.setTime(dd);
											//c1.add(Calendar.YEAR,-543);
											dd = c1.getTime();
											String date1 = new SimpleDateFormat("dd/MM/yyyy").format(dd);
											
											System.out.println("date ="+date+" date1 ="+date1);
									%>
                                                                  
									<%if(date.equals(date1) || dd.after(dt)){ %>
									<%									  
                                        report Lreport = null;
                                        int reportnameid = 0;
                                        try{
                                           Lreport = HM.AllListmyreport(student.getIdstudent() , R.getReportnameid()); 
                                           reportnameid = Lreport.getReportName_reportnameid();
                                           }catch(Exception e){
	                                       reportnameid = 0;
                                           }
                                     %>
                                    <%  
                                     int reportid = 0;
                                     try{
                                    	 
                                    	 reportid = HM.AllListreportid(student.getIdstudent() , R.getReportnameid()-1);  
                                    	                                  	 
                                         }catch(Exception e){
                                         reportid = 0;
                                         } 
                                     
                                         %>                        
                                     
                                     <%if(reportnameid == R.getReportnameid()){ %>
                                                       
                                     <% SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                                     <% Date dateString = formatter1.parse(Lreport.getSentdate().toString());%>
                                     
                                     <%String dateFString = new SimpleDateFormat("dd/MM/yyyy").format(dateString); %>
                                     <%String TString = new SimpleDateFormat("HH:mm").format(dateString); %>
                                     
                                     
                                     <form method="POST" action="${pageContext.request.contextPath}/loadEditReportPage">        
                                     <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="reportname">
                                     <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="reportnameid">
                                     <tr>
                                         <td><%=R.getReportname()%></td>
                                         <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                         <td style="color:#28A745;">ส่งเอกสารแล้ว  <br> <i class="fa fa-check"></i> เมื่อวันที่ <%=dateFString%></td>
                                         <td><button class="btn btn-warning" ><i class="fa-solid fa-file-pen" style="font-size:17px"></i></button></td>
                                     </tr>
                                    </form> 
                                     <!--แก้ให้สามารถส่งเอกสารสรุปก่อนกำหนด  -->
                                    <%-- <% }else if (reportid+1 == R.getReportnameid() && R.getReportnameid() == 17){%> --%>     
                                    <% }else if (R.getReportnameid() > 5){%>     
                                    
                                     <form method="POST" action="${pageContext.request.contextPath}/loadUploadReportPage">
                                     <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="reportname">
                                     <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="reportnameid"> 
                                    <tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#F18811;"> <i class="fa fa-exclamation-triangle"></i> ยังไม่ได้ส่งเอกสาร</td>
                                              <td><button class="btn btn-success" ><i class="fa-solid fa-file-circle-plus" style="font-size:17px"></i></button></td>
                                     </tr>
                                     </form>
                                  <% }else if (R.getReportnameid() == 18){%>     
                                    
                                    <%
                                          evaluatevideo ev1 = null;
                                           String id = null;
                                              try{
	                                               ev1 = HM.AllListVDO(student.getIdstudent()); 
	                                               id = ev1.getStudent_studentid();
                                                 }catch(Exception e){
	                                               reportnameid = 0;
                                                 }%>
                                    <%if(id == null){ %> 
                                       <form method="POST" action="${pageContext.request.contextPath}/loadUploadVDOPage">     
                                         <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="getReportname">
                                         <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="Reportid">
                                    <tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#F18811;"> <i class="fa fa-exclamation-triangle"></i> ยังไม่ได้ส่งวิดีโอ</td>
                                              <td><button class="btn btn-success" ><i class="fa-solid fa-file-circle-plus" style="font-size:17px"></i></button></td>
                                     </tr>
                                     </form>
                                     <%}else{ %>  
                                    
                                     <%int getMaxVOD = UR.getIDVOD(student.getIdstudent()); %>    
                                     <%VDO vdo = UR.getVOD(getMaxVOD); %>    
                                     <% SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                                     <% Date dateVDOString = formatter1.parse(vdo.getSentdate().toString());%>
                                     
                                     <%String dateVDOring = new SimpleDateFormat("dd/MM/yyyy").format(dateVDOString); %>
                                     <%String VDOtring = new SimpleDateFormat("HH:mm").format(dateVDOString); %>
                                      
                                      
                                      <form method="POST" action="${pageContext.request.contextPath}/loadEditVDOPage">
                                      <input type="hidden" class="form-control" value="<%=R.getReportname()%>" name="getReportname">
                                      <input type="hidden" class="form-control" value="<%=R.getReportnameid()%>" name="Reportid">
                                      <input type="hidden" class="form-control" value="<%=getMaxVOD%>" name="VDOid">
                                       <tr>
                                         <td><%=R.getReportname()%></td>
                                         <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                         <td style="color:#28A745;">ส่งเอกสารแล้ว  <br> <i class="fa fa-check"></i> เมื่อวันที่ <%=dateVDOring%></td>       
                                          <td><button class="btn btn-warning" ><i class="fa-solid fa-file-pen" style="font-size:17px"></i></button></td>                          
                                     </tr>
                                     </form>
                                       <%} %>
                                   <% }else{%>
									   
									  <tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#FD4648;"> <i class="fa fa-exclamation-triangle"></i> กรุณาส่งเอกสารรายงานประจําสัปดาห์ที่  <%=R.getReportnameid()-1%> ก่อน</td>
                                              <td style="color:#FD4648;"> <i class="fa fa-times-circle fa-3x"></i> </td>
                                     </tr>
									
									<%} %>
									<%}else{%>
									<tr>
									          <td><%=R.getReportname()%></td>
                                              <td><i class='fa fa-calendar'></i> วันที่ <%=date%></td>
                                              <td style="color:#FD4648;"> <i class="fa fa-exclamation-triangle"></i> ยังไม่เปิดให้ส่ง</td>
                                              <td style="color:#FD4648;"> <i class="fa fa-times-circle fa-3x"></i> </td>
                                     </tr>
									<%} %>
									<% } %>
									<%} %>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script> 
  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>
