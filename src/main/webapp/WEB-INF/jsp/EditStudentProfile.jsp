<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

 <%EditStudentProfileDB SM = new EditStudentProfileDB(); %>
 <%teacherManager TM = new teacherManager(); %>
 
<%Student student = (Student)session.getAttribute("student");%>

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
<title>Edit Student Profile</title>

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>

<script type="text/javascript">
function validateForm(frm){
	
	var patt = /^[0]{1}[8|9|6]{1}[0-9]{8,}/;
	var regexp =/^[ก-์|.| ]{2,35}$/;
	var regexpPW =/^[A-Za-z|0-9]{10,}$/;
	
	if (regexp.test(frm.studentname.value)==false){
		alert("กรุณากรอกชื่อเป็นภาษาไทย  ความยาว 2-35 ตัวอักษร");
		frm.studentname.value ="";
		return false;
		}
	
	if (regexp.test(frm.studentlastname.value)==false){
		alert("กรุณากรอกนามสกุลเป็นภาษาไทย  ความยาว 2-35 ตัวอักษร");
		frm.studentlastname.value ="";
		return false;
		}
	
}
</script>

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/student.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบแก้ไขข้อมูลสหกิจศึกษา</h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadViewStudentProfile" style="color:#FFFFFF;">ดูข้อมูลสหกิจศึกษา </a> / <a class="a2" href="#" style="color:#E28A06;">แก้ไขข้อมูลสหกิจศึกษา  </a></div>
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
<br><br>

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">						
								
                                <form name="frm" id = "frm" method="post" action="${pageContext.request.contextPath}/EditStudentProfile" >
								<h5 style="color:#850000;"> ข้อมูลของนักศึกษา</h5>
								<hr class="style13">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right" > รหัสนักศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="studentid" name="studentid"
											class="form-control data" value="<%=student.getIdstudent()%>"  readonly>
									</div>
									
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อนักศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="studentname" name="studentname"
											class="form-control data" value="<%=student.getStudentname()%>" >
									</div>	
									
									<label class="col-sm-2 col-form-label text-right">นามสกุล</label>
									<div class="col-sm-4">
										<input type="text" name="studentlastname" id="studentlastname"
											class="form-control data" value="<%=student.getStudentlastname()%>">
									</div>					
								</div>
                                <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">รหัสผ่าน</label>
									<div class="col-sm-4">
										<input type="text" id="password" name="password"
											class="form-control data" placeholder="รหัสผ่าน" value="<%=student.getPassword()%>" maxlength="10">
									</div>						
								</div>
								
								

								<br>
								<hr class="style13">
								<h5 style="color:#850000">ข้อมูลสหกิจศึกษา</h5>
                                  <%Company COname = SM.Searchcompanyid(student.getCompany_companyid()); %>
								  <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อบริษัท</label>
									<div class="col-sm-4">
										<input type="text" id="Company" name="Company"
											class="form-control data" value="<%=COname.getCompanyname()%>" readonly>
									</div>						
								</div>
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ที่อยู่บริษัท </label>
									<div class="col-sm-4">
									<textarea id="address" name="address" rows="4" cols="50" maxlength="200" disabled><%=COname.getCompanyaddress()%> </textarea>
										
									</div>	
												
								</div>
								<br>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ผู้ประสานงาน </label>
									<div class="col-sm-4">
									<input type="text" id="coordinator" name="coordinator" 
											class="form-control data" value="<%=COname.getCoordinatorname()%>" readonly>	
									</div>	
							</div>
							
							<div class="form-group row">
                             		<label class="col-sm-2 col-form-label text-right"><i class="fa fa-phone" aria-hidden="true" style="color: #28A745"></i> เบอร์โทรศัพท์บริษัท </label>
									<div class="col-sm-4">
									<input type="text" id="telephone" name="telephone" maxlength="10"
											class="form-control data" value="<%=COname.getPhonenumber()%>" readonly>	
									</div>	
									
										<label class="col-sm-2 col-form-label text-right"><i class="fa fa-envelope" aria-hidden="true" style="color: #FD4648"></i> อีเมลบริษัท </label>
									<div class="col-sm-4">
										<input type="text" id="metoremail" name="metoremail"
											class="form-control data" value="<%=COname.getEmail()%>" readonly>
											
									</div>		
								</div>	
								
								 <div class="form-group row">
								
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-chrome" aria-hidden="true" style="color: #007BFF"></i> เว็บไซต์บริษัท </label>
									<div class="col-sm-4">
										<input type="text" id="website" name="website"
											class="form-control data" value="<%=COname.getWebsite()%>" readonly>
											
									</div>	
									
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-facebook-official" style="color: #17A8FC"></i> เฟซบุ๊กบริษัท </label>
									<div class="col-sm-4">
										<input type="text" id="metorfacebook" name="metorfacebook"
											class="form-control data"  value="<%=COname.getFacebook()%>" readonly>
									</div>						
								</div>
							
							<%String[] cars = {"Mobile Developer", "Web Developer", "Tester" , "Backend Developer" , "Web Design/ux-ui" ,"Quality Assurance"}; %>
							
                               <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ตำแหน่งงาน</label>
									<div class="col-sm-4">
										<select name="workposition" id="workposition" class="form-control">                    
                                           <%String Work = student.getWorkposition();%>
                                          <%for(int i = 0; i<cars.length; i++){ %>
                                          <%if(cars[i].equals(Work)){ %>
                                           <option selected value="<%=cars[i]%>" > <%=cars[i]%></option>
                                          <%}else{ %>
                                          <option value="<%=cars[i]%>" > <%=cars[i]%></option>
                                          <%} %>
                                        <%} %>
                                         </select>
									</div>						
								</div>
								
								<% Date dt = new Date(student.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								c.setTime(dt); 
								c.add(Calendar.DATE, 1);
								dt = c.getTime();
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									<% Date dt2 = new Date(student.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								c2.add(Calendar.DATE, 1);
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">เวลาเริ่มสหกิจศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="mentornickname" name="mentornickname"
											class="form-control data" value="<%=date%>" readonly>
									</div>	
									
									
									<label class="col-sm-2 col-form-label text-right">เวลาสิ้นสุด</label>
									<div class="col-sm-4">
										<input type="text" name="lastname" id="lastname"
											class="form-control data" value="<%=date2%>" readonly>
									</div>					
								</div>
								<br><br><br>						 								
							
			
					<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" OnClick ="return validateForm(frm)" class="btn btn-success">
												บันทึกการแก้ไข </button></a>							
										<a href = "${pageContext.request.contextPath}/loadViewStudentProfile" class="btn btn-warning" >ยกเลิก </a>
									</div>
								</div>
								</form>	 
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