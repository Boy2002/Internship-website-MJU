<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>


<%
 Company company = (Company)session.getAttribute("vCompany");
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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบประเมินให้คะแนนเอกสารสหกิจ </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadlistcomPage" style="color:#FFFFFF;">รายชื่อบริษัท</a> / <a class="a2" href="#" style="color:#E28A06;"> ข้อมูลบริษัท </a></div>

</div></div></div>


<br>
</div>

	<div class="container" style="margin-top: 35px;">
<br><br>

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">						
								                            
								<h5 style="color:#850000;"> ข้อมูลของบริษัท</h5>
								<hr class="style13">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right" > ชื่อบริษัท </label>
									<div class="col-sm-4">
										<input type="text" id="namecom" name="namecom"
											class="form-control data" value="<%=company.getCompanyname()%>" readonly>
									</div>
									
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ที่อยู่บริษัท </label>
									<div class="col-sm-4">
									<textarea id="add" name="add" rows="4" cols="50" style="background-color:#E9ECEF;" readonly><%=company.getCompanyaddress()%></textarea>
										
									</div>	
												
								</div>
								<br><br>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ผู้ประสานงาน </label>
									<div class="col-sm-4">
									<input type="text" id="coordinator" name="coordinator"
											class="form-control data" value="<%=company.getCoordinatorname()%>" readonly>	
									</div>	
											
								</div>
								
								<div class="form-group row">
                             		<label class="col-sm-2 col-form-label text-right"> เบอร์โทรศัพท์ </label>
									<div class="col-sm-4">
									<input type="text" id="coordinator" name="coordinator"
											class="form-control data" value="<%=company.getPhonenumber()%>" readonly>	
									</div>		
								</div>	
					<br>
					<div class="form-group row">
					
						<label class="col-sm-2 col-form-label text-right"> ข้อมูลติดต่อ </label>		
			<ul class="social-icons">           
              <li><a class="facebook" href="<%=company.getFacebook() %>"><i class="fa fa-facebook"></i></a></li>
              <li><a class="dribbble" href="<%=company.getWebsite()%>"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="mailto:<%=company.getEmail()%>"><i class="fa fa-envelope"></i></a></li>   
            </ul>												
											         
					</div>
					</div>
						</div>					
					</div>
				</div>				
			</section>    		     			      
	</div>


	             <jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>