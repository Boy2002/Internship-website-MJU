<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<%
String Companyname = null;
try{
	
 Companyname = (String)session.getAttribute("Companyname"); 

}catch (Exception e) {
	e.printStackTrace();
	Companyname = null;
}
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

</head>

<script type="text/javascript">

function validateForm(frm){
		
	var regexpname =/^[ก-์|A-Za-z|0-9|.]{2,50}$/;
	var regexpcoordinator =/^[ก-์|.| ]{2,60}$/;
	var regexpnameC =/^[ก-์|A-Za-z|,| |0-9|.]{2,50}$/;
	
	if(frm.namecom.value == ""){
		alert("กรุณากรอกชื่อบริษัท");
		return false;
		}
	
	if(document.getElementById('namecom').value.length>60 ){
		alert("กรุณากรอกชื่อบริษัทเป็นภาษาไทยหรือภาษาอังกฤษความยาว 2-60 ตัวอักษร");
		return false ;
		}
	
}
</script>

<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลบริษัท </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadListCompanyE" style="color:#FFFFFF;">รายชื่อบริษัท</a> / <a class="a2" href="#" style="color:#E28A06;"> เพิ่มข้อมูลบริษัท </a></div>

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
								                            
								<h5 style="color:#850000;"> ข้อมูลของบริษัท</h5>
								<hr class="style13">
								
								
								  <form name="frm" method="post" action="${pageContext.request.contextPath}/AddCompanyE" >
								<div class="form-group row">
								<br>
									<label class="col-sm-2 col-form-label text-right" > ชื่อบริษัท </label>
									<div class="col-sm-4">
									
									<%if(Companyname == null){ %>
										<input type="text" id="namecom" name="namecom"
											class="form-control data" >
										<%}else{%>
										<input type="text" id="namecom" name="namecom"
											class="form-control data" value="<%=Companyname%>" >
										<%} %>
										
									</div>
									
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ที่อยู่บริษัท </label>
									<div class="col-sm-4">
									<textarea id="address" name="address" rows="4" cols="50" maxlength="200" ></textarea>
										
									</div>	
												
								</div>
								<br><br>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ผู้ประสานงาน </label>
									<div class="col-sm-4">
									<input type="text" id="coordinator" name="coordinator"
											class="form-control data" >	
									</div>	
											
								</div>
								
								<div class="form-group row">
                             		<label class="col-sm-2 col-form-label text-right"><i class="fa fa-phone" aria-hidden="true" style="color: #28A745"></i> เบอร์โทรศัพท์ </label>
									<div class="col-sm-4">
									<input type="text" id="telephone" name="telephone"
											class="form-control data" >	
									</div>	
									
										<label class="col-sm-2 col-form-label text-right"><i class="fa fa-envelope" aria-hidden="true" style="color: #FD4648"></i> อีเมล </label>
									<div class="col-sm-4">
										<input type="text" id="metoremail" name="metoremail"
											class="form-control data">
											
									</div>		
								</div>	
								
								 <div class="form-group row">
								
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-chrome" aria-hidden="true" style="color: #007BFF"></i> เว็บไซต์ </label>
									<div class="col-sm-4">
										<input type="text" id="website" name="website"
											class="form-control data" >
											
									</div>	
									
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-facebook-official" style="color: #17A8FC"></i> เฟซบุ๊ก </label>
									<div class="col-sm-4">
										<input type="text" id="metorfacebook" name="metorfacebook"
											class="form-control data" >
									</div>						
								</div>
					<br>
					
						<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" OnClick ="return validateForm(frm)" class="btn btn-success">
												เพิ่มข้อมูลบริษัท </button></a>
										<a href = "${pageContext.request.contextPath}/loadListCompanyE" class="btn btn-warning" >ยกเลิก </a>
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