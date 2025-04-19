<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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




.modal {
z-index:1;
display:none;
padding-top:10px;
position:fixed;
left:0;
top:0;
width:100%;
height:100%;
overflow:auto;
background-color:rgb(0,0,0);
background-color:rgba(0,0,0,0.8)
}

.modal-content{
margin: auto;
display: block;
    position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}


.modal-hover-opacity {
opacity:1;
filter:alpha(opacity=100);
-webkit-backface-visibility:hidden
}

.modal-hover-opacity:hover {
opacity:0.60;
filter:alpha(opacity=60);
-webkit-backface-visibility:hidden
}


.close {
text-decoration:none;font-size:24px;font-weight:bold;color:white
}
.container1 {
width:200px;
display:inline-block;
}
.modal-content, #caption {   
  
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}


@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
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

<h3 style="color:#7EBC1B;" > บริษัทฝึกสหกิจ </h3>
<div class="nav1" style="color:#FFFFFF;"><a class="a2" href="#" style="color:#E28A06;">รายชื่อบริษัท </a></div>

</div></div></div>
<br>
</div>
<div class="container" style="margin-top: 35px;">
<br>

			<section id="content">
					<div class="container position-relative" align = "center">
  <div class="card mt-3 mb-3" style= "width: 50%; height: auto;">
    <div class="card-body" >
      <div class="media">
        <div class="media-body">
        <b style="word-wrap: break-word;">
							 <a href="#" tabindex="0">
                                <h5> บริษัท <%=company.getCompanyname()%> </h5>
                              </a>
                              <b style="word-wrap: break-word;">
							  <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=company.getCompanyaddress() %></i>  </h6>    
							  </b>
							   <b style="word-wrap: break-word;">
							  <h6> <i style="color:#5392F9;" class="fa-solid fa-phone"></i> <i><%=company.getPhonenumber()%></i>  </h6>    
							  </b>
							 	<br>				 
						
			<ul class="social-icons">           
              <li><a class="facebook" href="<%=company.getFacebook() %>"><i class="fa fa-facebook"></i></a></li>
              <li><a class="dribbble" href="<%=company.getWebsite()%>"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="mailto:<%=company.getEmail()%>"><i class="fa fa-envelope"></i></a></li>   
            </ul>												
											         
					
					
							</b>
        </div>
        </div>
       </div>
     </div>
   </div>
			</section>    		     			      
	</div>
	
<br><br>
<div class="container">						
								                            
	<h5 style="color:#850000;"> ข้อมูลรีวิวบริษัท</h5>
	<hr class="style13">
</div>

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
								width="260" height="170"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="" onclick="onClick(this)" class="modal-hover-opacity">
								
		<img src="./imagesReview/<%=arr[1]%>"
								width="260" height="170"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="" onclick="onClick(this)" class="modal-hover-opacity">
								
		<img src="./imagesReview/<%=arr[2]%>"
								width="260" height="170"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="" onclick="onClick(this)" class="modal-hover-opacity">
		
		<img src="./imagesReview/<%=arr[3]%>"
								width="260" height="170"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="" onclick="onClick(this)" class="modal-hover-opacity">	
								
<div id="modal01" class="modal" onclick="this.style.display='none'">
  <span class="close">&times;&nbsp;&nbsp;&nbsp;&nbsp;</span>
  <div class="modal-content">
    <center><img id="img01" style="max-width:50%; max-height:50%;"></center>
  </div>
</div>
											
      </div>
    </div>
  </div>

</div>
<%} %>

<script type="text/javascript">

function onClick(element) {
	  document.getElementById("img01").src = element.src;
	  document.getElementById("modal01").style.display = "block";
	}
	
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

