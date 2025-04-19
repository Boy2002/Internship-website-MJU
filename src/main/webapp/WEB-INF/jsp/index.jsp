<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %> 
<%ReviewCompanyDB RVC = new ReviewCompanyDB(); %>
<%ViewReportDB VR = new ViewReportDB(); %>
<%ViewVDODB vdo = new ViewVDODB(); %>
<%teacherManager TM = new teacherManager(); %>
<%ListCompanyDB com = new ListCompanyDB(); %>

<%
String error = null; 
String errorRV = null;
%>
<%
try{
	error = (String)request.getAttribute("Error");
}catch(Exception e) {
	error = null;
	}

try{
	errorRV = (String)request.getAttribute("ErrorRV");
}catch(Exception e) {
	errorRV = null;
	}
%>	



<%int Level = 0;%>
<%Student studenti = null;%>
<%teacher teacheri = null;%>
  <%try{ 
	 studenti = (Student)session.getAttribute("student"); 
	 String id = studenti.getIdstudent();
	   Level = 1;
   } catch(Exception e){
	   try{ 
	   teacheri = (teacher)session.getAttribute("teacher"); 
	   Level = Integer.parseInt(teacheri.getTeachertype());
	   } catch(Exception t){
		   Level = 0;
	   }
   }%>

<!DOCTYPE html>
<html>
<head>
<title>เว็บไซต์รายงานสหกิจศึกษา </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href='https://fonts.googleapis.com/css?family=Kanit'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">
<link rel="stylesheet" href="./css/Alertindex.css">
<link rel="stylesheet" href="./css/VReport.css">
<link rel="stylesheet" href="./css/index.css">


<script src="https://kit.fontawesome.com/e18a64822c.js"></script>

 <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style type="text/css">

.zoom {
	padding: 50px;
	background-color: green;
	transition: transform .2s;
	width: 200px;
	height: 200px;
	margin: 0 auto;
}

.zoom:hover {
	-ms-transform: scale(1.5); /* IE 9 */
	-webkit-transform: scale(1.5); /* Safari 3-8 */
	transform: scale(1.5);
}

.section {
	padding: 100px 0;
	position: relative;
}

.gray-bg {
	background-color: #ebf4fa;
}
/* Blog 
---------------------*/
.blog-grid {
	margin-top: 15px;
	margin-bottom: 15px;
}

.blog-grid .blog-img {
	position: relative;
	border-radius: 5px;
	overflow: hidden;
}

.blog-grid .blog-img .date {
	position: absolute;
	background: #3a3973;
	color: #ffffff;
	padding: 8px 15px;
	left: 0;
	top: 10px;
	font-size: 14px;
}

.blog-grid .blog-info {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	background: #ffffff;
	padding: 20px;
	margin: -30px 20px 0;
	position: relative;
}

.blog-grid .blog-info h5 {
	font-size: 22px;
	font-weight: 500;
	margin: 0 0 10px;
}

.blog-grid .blog-info h5 a {
	color: #3a3973;
}

.blog-grid .blog-info p {
	margin: 0;
}

.blog-grid .blog-info .btn-bar {
	margin-top: 20px;
}

.px-btn-arrow {
	padding: 0 50px 0 0;
	line-height: 20px;
	position: relative;
	display: inline-block;
	color: #fe4f6c;
	-moz-transition: ease all 0.3s;
	-o-transition: ease all 0.3s;
	-webkit-transition: ease all 0.3s;
	transition: ease all 0.3s;
}

.px-btn-arrow .arrow {
	width: 13px;
	height: 2px;
	background: currentColor;
	display: inline-block;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	right: 25px;
	-moz-transition: ease right 0.3s;
	-o-transition: ease right 0.3s;
	-webkit-transition: ease right 0.3s;
	transition: ease right 0.3s;
}

.px-btn-arrow .arrow:after {
	width: 8px;
	height: 8px;
	border-right: 2px solid currentColor;
	border-top: 2px solid currentColor;
	content: "";
	position: absolute;
	top: -3px;
	right: 0;
	display: inline-block;
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}





.cta-100 {
  margin-top: 100px;
  padding-left: 8%;
  padding-top: 7%;
}
.col-md-4{
    padding-bottom:20px;
}

.white {
  color: #fff !important;
}
.mt{float: left;margin-top: -20px;padding-top: 20px;}
.bg-blue-ui {
  background-color: #708198 !important;
}
figure img{width:300px;}

#blogCarousel {
  padding-bottom: 100px;
}

.blog .carousel-indicators {
  left: 0;
  top: -50px;
  height: 50%;
}

#Button4
{
   box-sizing: border-box;
   line-height: 21px;
   text-decoration: none;
   vertical-align: top;
   border: 2px solid #00A65A;
   border-radius: 3px;
   background-color: #FFFFFF;
   background-image: none;
   color: #00A65A;
   font-family: Arial;
   font-weight: normal;
   font-style: normal;
   font-size: 13px;
   padding: 0;
   text-align: center;
   -webkit-appearance: none;
   margin: 15px 0px 10px 10px;
}


.alert{
  background: #C3F3D7;
  padding: 20px 40px;
  min-width: 420px;
  position: absolute;
  right: 0;
  top: 10px;
  border-radius: 4px;
  border-left: 8px solid #2FD574;
  overflow: hidden;
  opacity: 0;
  pointer-events: none;
}
.alert.showAlert{
  opacity: 1;
  pointer-events: auto;
}
.alert.show{
  animation: show_slide 1s ease forwards;
}
@keyframes show_slide {
  0%{
    transform: translateX(100%);
  }
  40%{
    transform: translateX(-10%);
  }
  80%{
    transform: translateX(0%);
  }
  100%{
    transform: translateX(-10px);
  }
}
.alert.hide{
  animation: hide_slide 1s ease forwards;
}
@keyframes hide_slide {
  0%{
    transform: translateX(-10px);
  }
  40%{
    transform: translateX(0%);
  }
  80%{
    transform: translateX(-10%);
  }
  100%{
    transform: translateX(100%);
  }
}
.alert .fa-exclamation-circle{
  position: absolute;
  left: 20px;
  top: 50%;
  transform: translateY(-50%);
  color: #2FD574;
  font-size: 30px;
}
.alert .msg{
  padding: 0 20px;
  font-size: 18px;
  color: #24AD5D;
}
.alert .close-btn{
  position: absolute;
  right: 0px;
  top: 50%;
  transform: translateY(-50%);
  background: #C3F3D7;
  padding: 20px 18px;
  cursor: pointer;
}
.alert .close-btn:hover{
  background: #2FD574;
}
.alert .close-btn .fas{
  color: #24AD5D;
  font-size: 22px;
  line-height: 40px;
}

</style>





<body>

	<jsp:include page="com/navbar.jsp"></jsp:include>

<%if(error != null){ %>	
 <div class="alert hide">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">กรุณาส่ง : <%=error%> <a href="${pageContext.request.contextPath}/loadnotifyPage">ส่งเอกสาร</a> </span>
        <div class="close-btn">
          <span class="fas fa-times"></span>
        </div>
</div>

<%}else if(errorRV != null){ %>	
 <div class="alert hide">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">กรุณาประเมินความพึงพอใจที่มีต่อบริษัท <a href="${pageContext.request.contextPath}/loadReviewCompanyPage">รีวิวผลการฝึกสหกิจศึกษา</a> </span>
        <div class="close-btn">
          <span class="fas fa-times"></span>
        </div>
</div>
<%} %>


	<div style="margin-top: 0px; width: 80%;  margin-left: auto;  margin-right: auto;">

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
       <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
 <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-80" src="./images/banner2.jpg" alt="First slide" width = "100%" height ="30%" >
    </div>
    <div class="carousel-item">
      <img class="d-block w-80" src="./images/banner5.png" alt="Second slide" width = "100%" height ="30%">
    </div>
    <div class="carousel-item">
      <img class="d-block w-80" src="./images/banner3.png" alt="Second slide" width = "100%" height ="30%">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	
	</div>
	
	
	<br>
	<br>

         <%List<Company> listCOM = RVC.companyALLDESC(); %>

				<section class="section " id="blog" style="margin-top: -60px; " >
		<div class="container" style="background-image:url('./img/line_bg.gif')">
			<h2 class="text-header text-center"> รีวิวบริษัทสหกิจศึกษา </h2>
			<hr class="colorgraph">
			<%
				String date = "";
			%>
			<%
			if( listCOM.size() > 0){
				for (int i = 0; i < listCOM.size(); i++) {
					String img = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr = img.split(","); 
			%>
			<div class="row">

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img" >
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./imagesReview/<%=arr[0]%>"
								width="350" height="230"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div  style="height:  130px;" align = "center">
							<b style="word-wrap: break-word;">		
                               <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>
                
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
						</div>
						
							
						
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

				<%
					i++;
				if (i < listCOM.size()) {
					String img1 = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr1 = img1.split(","); 
				%>

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img">
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./imagesReview/<%=arr1[0]%>"
								width="350" height="230"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div style="height:  130px;" align = "center">
							<b style="word-wrap: break-word;">	
                                <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>      
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
							
						</div>
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>

				<%
					i++;
				if (i < listCOM.size()) {
					String img2 = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr2 = img2.split(","); 
				%>

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img">
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./imagesReview/<%=arr2[0] %>"
								width="350" height="230"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div style="height:  130px;" align = "center">
							<b style="word-wrap: break-word;">			
                                <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>                      
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
							
						</div>
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
				</div>
				<% 
					}
				%>

			<%
				}
			%>
			
			<br>
			<div align = "center">
			<a id="Button4" href="${pageContext.request.contextPath}/loadComReviewPage"  onmouseover="AnimateCss('Button4', 'animate-box-shadow', 0, 500);return false;" style="display: inline-block; width: 175px; height: 25px; z-index: 26; animation-delay: 0ms; animation-duration: 500ms; animation-fill-mode: both; animation-name: animate-box-shadow;"> Read More </a>
			</div>
		</div>
		
		
		<br><br><br><br>
		<div class="main">
  <h2 class="text-header text-center"> ตัวอย่างเอกสารสหกิจ </h2>
			<hr class="colorgraph">
  <ul class="cards">
  
    <%//List<report> listVR = VR.ViewreportDESC();
    String[] vr = {"5904106315.pdf","5904106340.pdf","5804106361.pdf"};
    %>
    
  <%for(int i= 0; i<3 ; i++){ %>
    <li class="cards_item">
      <div class="card">
      
        <div class="card_image"><img src="./images/Reportimg.png" width = "100%" height ="340 px"></div>
        <div class="card_content" style ="background-color: #FF4361;" >
          <div align = "center">
          </div>
          <div class="btn-bar">
				<a  href="./document/<%=vr[i]%>" target="_blank" style = "color: #FFFFFF;" class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
				</a>
		  </div>
        </div>
      </div>
    </li>
 <%} %>
  </ul>
  <br>
  <div align = "center">
    <a id="Button4" href="https://secretary-science.mju.ac.th/wtms_document.aspx?bID=7577&lang=th-TH&fbclid=IwAR22p9PGsVe8X8B53GIxgHr0MpwxrW73nCTKank8soFb8jlCaudq3XTIHOc"  onmouseover="AnimateCss('Button4', 'animate-box-shadow', 0, 500);return false;" style="display: inline-block; width: 175px; height: 25px; z-index: 26; animation-delay: 0ms; animation-duration: 500ms; animation-fill-mode: both; animation-name: animate-box-shadow;"> เอกสารเผยแพร่ </a>
  </div>
</div>

<br><br><br><br>
<div class="main">
  <h2 class="text-header text-center"> วีดีโอผลการปฏิบัติงานสหกิจศึกษา  </h2>
			<hr class="colorgraph">
  <ul class="cards">
  
  <%List<VDO> Listvdo = vdo.AllListStuvdoDESC(); %>
  <%for(int i= 0; i<Listvdo.size() ; i++){ %>
    <li class="cards_item">
	  <% String[] arr = Listvdo.get(i).getFilename().split("https://youtu.be/"); %>
	 <div class="card_image">  
	  <div class="container position-relative">
  <div class="card mt-4 mb-4">
    <div class="card-body">
      <div class="media">
        <div class="media-body">
          <div class="row">
            <div class="hover-name col-auto pr-0">
            <%if(Level == 3){ %>
            <div style = "margin-left:300px">
             <a href="${pageContext.request.contextPath}/EdApproveVDOindex?getvideoid=<%=Listvdo.get(i).getVideoid() %>"><i class="fa-solid fa-circle-xmark" style="color: #880000;  font-size: 30px;"></i></a>
            </div>
             <%}%>
              <div class="text-dark position-relative">                         
              <%Company c = com.Searchcompanyid(Listvdo.get(i).getCompany_companyid()); %>
                <h5>บริษัท <%=c.getCompanyname() %></h5>         
              </div>
              <div>
                <span class="text-muted"><i class="fa-sharp fa-solid fa-earth-americas"></i> <%=Listvdo.get(i).getSemester() %></span>                    
              </div>
            </div>
            <div class="col-auto pr-0">     
                      
            </div>
          </div>
           <iframe width="350" height="300" src="https://www.youtube.com/embed/<%=arr[1]%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
          </div>
          </div>
          </div>
         </div> 
	  
      
      </div>
    </li>
<%}%>
  </ul>
  <br>
			<div align = "center">
			<a id="Button4" href="${pageContext.request.contextPath}/loadViewVDOALLPage"  onmouseover="AnimateCss('Button4', 'animate-box-shadow', 0, 500);return false;" style="display: inline-block; width: 175px; height: 25px; z-index: 26; animation-delay: 0ms; animation-duration: 500ms; animation-fill-mode: both; animation-name: animate-box-shadow;"> Read More </a>
			</div>
</div>

<br><br><br><br>
<div class="main">
 <h2 class="text-header text-center"> บุคลากรของหลักสูตร  </h2>
			<hr class="colorgraph">
<div class="row" align = "center">
<%List<teacher> tc = TM.SearchteacherALL(); %>
  <%for(int i= 0; i<tc.size() ; i++){ %>
  <%if(tc.get(i).getStatus().equals("อยู่") || tc.get(i).getStatus().equals("กำลังศึกษาต่อ") ){ %>
          <div class="col-lg-4">
            <div class="team-member">
                <img class="mx-auto rounded-circle" src="./imagesTC/<%=tc.get(i).getTeacherimg() %>" alt="" width = "180px" height ="180px">
                <br>
                <h4 style="color: #880000;"><b><%=tc.get(i).getTeachername()%> <%=tc.get(i).getTeacherlastname() %></b></h4>
                  <br><br>
   
            </div>
        </div>
      <%} %>
        <%} %>
      </div>
</div>			
	</section>
	


<script>
    
        $('.alert').addClass("show");
        $('.alert').removeClass("hide");
        $('.alert').addClass("showAlert");
       
     
      $('.close-btn').click(function(){
        $('.alert').removeClass("show");
        $('.alert').addClass("hide");
      });
           
    </script>
    


    

	<jsp:include page="com/footer.jsp"></jsp:include>




</body>
</html>