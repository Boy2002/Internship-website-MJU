<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
int errorsession = 0;
teacher Teacher = null;
try{
Teacher = (teacher)session.getAttribute("teacher");
}catch(Exception e) {
	 errorsession = 1;
}
%>

<%
 Company company = (Company)session.getAttribute("vCompany");
 List<Review> reviewList = (List)session.getAttribute("reviewList");
 ListStudentDB STUDB = new ListStudentDB();
 ReviewCompanyDB RVC = new ReviewCompanyDB(); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Student</title>

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
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	
<style type="text/css">


@font-face {
  font-family: "ProximaNova-Regular";
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/64/ProximaNova-Regular.eot");
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/64/ProximaNova-Regular.eot?#iefix") format("embedded-opentype"), url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/64/ProximaNova-Regular.woff") format("woff"), url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/64/ProximaNova-Regular.ttf") format("truetype"), url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/64/ProximaNova-Regular.svg#rocketdesign-font") format("svg");
  font-weight: normal;
  font-style: normal;
}

* {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}


.font-14 {
  font-size: 14px;
}

.card {
  width: 100%;
  height: auto;
  border-radius: 16px;
  transition: .4s background-color;
}
.img-container {
  position: relative;
  border-radius: 50%;
  width: 70px;
  height: 70px;
  overflow: hidden;
}
.img-container img {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50%);
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    object-fit: cover;
    object-position: center;
}
.action-button {
  transition: .3s background-color;
}
.action-button:hover {
  background-color: rgba(101, 119, 134, .1);
}
.hover-name:hover {
  text-decoration: underline;
}
.info-card {
  display: none;
  min-width: 400px;
}
.info-card.show {
  display: block;
}
.pop-up{
  animation: popUp .3s ease;
}
i {
  transition: .4s color;
}
@keyframes popUp {
  0% {transform: scale(.5);}
  50% {transform: scale(1.2);}
  100% {transform: scale(1);}
}

.rt-active,
.rt-active:hover {
  color: #2ecc71;
}

.ht-active,
.ht-active:hover {
  color: #e74c3c;
}

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
					<div class="col-xs-12 col-md-12" >

<h3 style="color:#7EBC1B;" > จัดการการอนุมัติ  </h3>
<div class="nav1" style="color:#FFFFFF;"><a class="a2" href="#" style="color:#E28A06;"> อนุมัติการรีวิว </a></div>

</div></div></div>
<br>
</div>
<div class="container" style="margin-top: 35px;">
<br>   		     			      
	</div>
	
<br><br>
<div class="container">						
								                            
	<h5 style="color:#850000;"> ข้อมูลรีวิวบริษัท</h5>
	<hr class="style13">
</div>

<%if(errorsession == 1 || Teacher == null){ %>
<script>
Swal.fire({
  icon: 'error',
  title: 'SESSION ERROR !',
  text: 'กรุณาเข้าสู่ระบบใหม่ !',
  confirmButtonText: '<a href="${pageContext.request.contextPath}/loadlogin" style="color:#FFFFFF">ตกลง</a>'
})
</script>
<%}else{ %>

<%for(Review RV : reviewList){ %>
<div class="container position-relative">
  <div class="card mt-4 mb-4">
    <div class="card-body">
    
      <div class="media">
        <div class="navbar-brand">
          <div class="img-container">
            <img src="./images/user.png">
          </div>
        </div>
        <div class="media-body">
          <div class="row">
            <div class="hover-name col-auto pr-0">
              <div class="text-dark position-relative">
              
              <%Student S = STUDB.SStuid(RV.getStudent_studentid()); %>
              
                <h5><%=S.getStudentname()%> <%=S.getStudentlastname() %></h5>         
              </div>
            </div>
            <div class="col-auto pr-0">        
              <span class="text-muted"> <%=S.getSemester() %>  <i class="fa-sharp fa-solid fa-earth-americas"></i> <%=RV.getReviewdate()%></span>   
              <a href="${pageContext.request.contextPath}/EdApproveReviewPage?getstatus=1&getidreview=<%=RV.getReviewid()%>&getSTUid=<%=RV.getStudent_studentid()%>" style = "margin-left:200px"><button class="btn btn-danger" ><i class="fa-solid fa-circle-xmark" style="font-size:17px"> ไม่อนุมัติให้เผยแพร่ </i></button></a>  
              <a href="${pageContext.request.contextPath}/EdApproveReviewPage?getstatus=2&getidreview=<%=RV.getReviewid()%>&getSTUid=<%=RV.getStudent_studentid()%>" ><button class="btn btn-success" ><i class="fa-solid fa-circle-check" style="font-size:17px"> อนุมัติให้เผยแพร่ </i></button></a>         
            </div>
          </div>
           <b style="word-wrap: break-word; ">
							 <%if(RV.getReviewrating() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(RV.getReviewrating() >= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(RV.getReviewrating() >= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(RV.getReviewrating() >= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(RV.getReviewrating() >= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(RV.getReviewrating() >= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(RV.getReviewrating() >= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(RV.getReviewrating() >= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(RV.getReviewrating() >= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
          
          <p>
            <%=RV.getReviewdetails() %>
          </p>          
        </div>
      </div>
      <hr>
      <div class="media-footer">
      <%
      String img = RV.getReviewpicture();
      String[] arr = img.split(","); 
      %>
         <img src="./imagesReview/<%=arr[0]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">
								
		<img src="./imagesReview/<%=arr[1]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">
								
		<img src="./imagesReview/<%=arr[2]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">
		
		<img src="./imagesReview/<%=arr[3]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">
														
      </div>
    </div>
  </div>
</div>
<%} %>
<%if(reviewList.size() == 0){ %>
<br><br>
<div class="container" style="margin-top: 35px;">

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
			
			<div class="container position-relative">
  <div class="card mt-4 mb-4">
    <div class="card-body">
      <div class="media">
        <div class="navbar-brand">
        </div>
        <div class="media-body">	
           <h4 style="color:#FD4648;"><i class="fa-solid fa-circle-exclamation"></i> ไม่มีข้อมูลการรีวิว </h4>
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        </section>
        </div>

<br><br>
<br><br>
<br><br>
<%} %>
<%} %>

<script type="text/javascript">
$(".action-button > i").bind("webkitAnimationEnd mozAnimationEnd animationEnd", function(){
	  $(this).removeClass("pop-up")  
	});

	$(".action-button").mouseenter(function(){
	  $(this).find('i').addClass("pop-up");        
	});

	//Toggle card shadow
	$('.card').hover(function (){
	  $(this).toggleClass('shadow');
	});

	//Hover card animation
	$('.hover-name').hover(function() {
	  $(this).find('.info-card').addClass('show');
	}, function() {
	  $('.info-card').removeClass('show');
	})

	//Follow button functions
	$('.follow, .unfollow').on('click', function(e){
	  e.preventDefault();
	  var el = $(this);

	  var loader = $('<i>', {
	    class: 'fas fa-spinner fa-spin'
	  });
	  
	  el.html(loader);
	  
	  var btnClass, btnText;
	  if(el.hasClass('unfollow')) {
	    btnClass = 'follow btn btn-outline-primary font-weight-bold';
	    btnText = 'Follow'
	  } else {
	    btnClass = 'unfollow btn btn-outline-danger font-weight-bold';
	    btnText = 'Unfollow'
	  }
	  
	  setTimeout(function(){
	    el
	    .html(btnText)
	    .attr('class', btnClass);
	  }, 1000);
	});

	// Button Animation
	$('.action-button').on('click', function(){
	  var el = $(this);
	  el.find('i').toggleClass('pop-up');
	  
	  if(el.hasClass('retweet')) {
	    el.toggleClass('rt-active');
	  }
	  
	  if(el.hasClass('heart')) {
	    el.toggleClass('ht-active');
	    el.find('i').toggleClass('far fas');
	  }
	});
</script>
  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

