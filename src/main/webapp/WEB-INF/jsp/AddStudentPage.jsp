<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>


<%
int errorsession = 0;
teacher Teacher = null;
try{
Teacher = (teacher)session.getAttribute("teacher");
}catch(Exception e) {
	 errorsession = 1;
}
%>

<%addTeacherDB Listteacher = new addTeacherDB();
ListCompanyDB LC = new ListCompanyDB();
teacherManager TM = new teacherManager();
String Companyid = (String)session.getAttribute("Companyid");
List<Student> listStu = null;
List<AddStudent> listStudent = null;
int errorCOM = 0;

try {
 listStu = (List)session.getAttribute("listSTU");
} catch (Exception e) {
	e.printStackTrace();
	listStu = null;
}

try {
	errorCOM = (int)session.getAttribute("errorCOM");
	} catch (Exception e) {
		e.printStackTrace();
		errorCOM = 0;
	}
%>


<% 
try {
listStudent = (List)session.getAttribute("listStudent");
} catch (Exception e) {
	e.printStackTrace();
	listStudent = null;
}
%>
	
	
<%List error = null; %>
<%
try{
	error = (List)request.getAttribute("errorlist");
}catch(Exception e) {
	error = null;
	}
%>	


<!DOCTYPE html>
<html>
<head>

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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >เพิ่มข้อมูลนักศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadlistStuEPage?getCompanyid=<%=Companyid%>" style="color:#FFFFFF;">รายชื่อนักศึกษา</a> / <a class="a2" href="#" style="color:#E28A06;"> เพิ่มข้อมูลนักศึกษา </a></div>

</div></div></div>

<br>
</div>



<%if(error != null){ %>
<%if(error.get(0).equals("1")){ %>
<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> บันทึกข้อมูลสำเร็จ : </strong> บันทึกข้อมูลเรียนร้อยแล้ว  
</div>
<%}else{ %>

<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ : </strong> <%if(errorCOM==0){ %>กรุณากรอกข้อมูลใหม่เนื่องจากมีข้อมูลซํ้ากันในระบบ<%}else{ %> กรุณากรอกข้อมูลใหม่เนื่องจากไม่พบข้อมูลบริษัทในระบบ <%} %>
  <%} %>
</div>
<%} %>

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



	<div class="container" style="margin-top: 35px;">
<br><br>

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
			<form method="POST" enctype="multipart/form-data"action="${pageContext.request.contextPath}/AddStudentPage">		
					    <div class="form-group row">
									<label class="col-sm-3 col-form-label text-right">ปีการศึกษา </label>
									<div class="col-sm-4">
										<input type="text" id="yearE" name="yearE"
											class="form-control data" required="required">
									</div>
									<div class="col-sm-5">	
									<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่ 1" required="required">
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 1 </label>
                                        </div>  
										<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่ 2">
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 2 </label>
                                        </div>   
                                        <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ปิดเทอมภาคฤดูร้อน">
                                             <label class="form-check-label" for="inlineRadio1"> ภาคเรียนที่ 3 </label>
                                        </div>                                    
									</div>
									
									
								</div>
						<div class="col-lg-12">
							<div class="container">	
																	                           
                               
                               <div class="custom-file">
                                 <input type="file" class="custom-file-input" id="EX" name="EX" accept=".xlsx" required="required">
                                 <label class="custom-file-label" for="customFile">ไฟล์ excel เท่านั้น </label>                                  
                                  </div>
                                  
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
 <br><br>

                               <div class="form-group row">
                              
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" class="btn btn-success"><i class="fa-sharp fa-solid fa-file-import"></i>
												Import File </button></a>
									</div>
									<br><br>
									
								</div>                        
							</div>
						</div>	
						 </form>
						 <div class="col-sm-12 text-center">									
										<a href="./document/ExcelFileExample.xlsx" download="ExcelFileExample"><button class="btn btn-primary"><i class="fa-solid fa-circle-down"></i>
												ตัวอย่างไฟล์ Excel </button></a>
									</div>
						 </div>
						 </div>
						 </div>
						 </div>
						 <%try { %>
						<%if(listStudent != null){ %>
						
						<div class="container">
							<h3 style="color:#850000;" >ข้อมูลนักศึกษา </h3>
						<hr class="style13">	
						</div> 
						        <table class="table table-bordered" id="myTable">
                    <thead class="table-info">
                        <tr align = "center">
                            <th>รหัสนักศึกษา</th>
                            <th>ชื่อนักศึกษา</th>
                            <th>ตำแหน่งงาน</th> 
                            <th>บริษัท</th>  
                            <th>ระยะเวลาการฝึกสหกิจศึกษา</th>   
                            <th>อาจารย์ที่ปรึกษา </th>                    
                        </tr> 
                    </thead>   
                    <tbody>   
                                
                   <%for(AddStudent S : listStudent){ %>
                   <%int E = 0;%>
                   <%String bgcolorString = "#FCFAF1";%>
                  <%for(int i=0;i<error.size();i++){ 
                       if(error.get(i).equals(S.getIdstudent())){ 
                       E = 1;
                       bgcolorString = "#F44336";
                       break;
                       } %>
                  <%} %>
                 <tr align = "center" bgcolor=<%=bgcolorString%>>
                  <th><%=S.getIdstudent()%></th>
                  <th style="white-space:nowrap"><%=S.getStudentname()%> <%=S.getStudentlastname()%></th>
                  <th><%=S.getWorkposition()%></th>
                  <th><%=S.getCompany_companyname()%></th>
                 
                  
                  
                 <% Date dt = new Date(S.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								dt = c.getTime();
								c.setTime(dt); 
								
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									<% Date dt2 = new Date(S.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<th style="white-space:nowrap"><i class='fa fa-calendar'></i> วันที่ <%=date%> - <%=date2%></th>	
		
					   
                  <th><%=S.getTeacher_teachername()%></th>
                
                   
                 </tr>   
     
                <%} %>  
                <%}%>
                <%} catch (Exception e) {
                	e.printStackTrace();
                } %>
				                             
                    </tbody>                                 
                </table>
					
							
								
						     <br><br><br><br>
					
					
						
									
					</div>
				</div>	
				</div>			
			</section>    		     			      
	</div>
	
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