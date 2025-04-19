<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

 
<%Mentor mentor = (Mentor)session.getAttribute("Ementor");%>
<%String id = (String)session.getAttribute("STUid");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit mentor</title>

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

.avatar-upload {
  position: relative;
  max-width: 250px;
  margin: 50px auto;
}
.avatar-upload .avatar-edit {
  position: absolute;
  right: 12px;
  z-index: 1;
  top: 10px;
}
.avatar-upload .avatar-edit input {
  display: none;
}
.avatar-upload .avatar-edit input + label {
  display: inline-block;
  width: 50px;
  height: 50px;
  margin-bottom: 0;
  border-radius: 100%;
  background: #FFFFFF;
  border: 1px solid transparent;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
  cursor: pointer;
  font-weight: normal;
  transition: all 0.2s ease-in-out;
}
.avatar-upload .avatar-edit input + label:hover {
  background: #f1f1f1;
  border-color: #d6d6d6;
}
.avatar-upload .avatar-edit input + label:after {
  content: "\f040";
  font-family: 'FontAwesome';
  color: #757575;
  position: absolute;
  top: 10px;
  left: 0;
  right: 0;
  text-align: center;
  margin: auto;
}
.avatar-upload .avatar-preview {
  width: 275px;
  height: 275px;
  position: relative;
  border-radius: 100%;
  border: 10px solid #FF445B;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
}
.avatar-upload .avatar-preview > div {
  width: 100%;
  height: 100%;
  border-radius: 100%;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
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
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลนักศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"> <a href="${pageContext.request.contextPath}/loadlistStuEPage" style="color:#FFFFFF;">รายชื่อนักศึกษา </a> / <a href="loadEditStudentProfileT?studentid=<%=id%>" style="color:#FFFFFF;">แก้ไขข้อมูลนักศึกษา </a> / <a class="a2" href="#" style="color:#E28A06;">ข้อมูลพี่เลี้ยง </a></div>

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
								
                                        
<div class="container">
    <div class="avatar-upload">
       
        <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url(./imagesMT/<%=mentor.getMentorimg()%>);">
            </div>
        </div>
    </div>
</div>
                     
								<h5 style="color:#850000" > ข้อมูลของพนักงานพี่เลี้ยง</h5>
								<hr class="style13">
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">รหัสพนักงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentorID" name="mentorID"
											class="form-control data" value="<%=mentor.getMentorid()%>" readonly >
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อพนักงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentorname" name="mentorname"
											class="form-control data" value="<%=mentor.getMentorname()%>" readonly>
									</div>
									<label class="col-sm-2 col-form-label text-right">นามสกุล</label>
									<div class="col-sm-4">
										<input type="text" name="lastname" id="lastname"
											class="form-control data" value="<%=mentor.getMentorlastname()%>" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อเล่นพนักงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentornickname" name="mentornickname"
											class="form-control data" value="<%=mentor.getMentornickname()%>" readonly>
									</div>						
								</div>
                                <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ตำแหน่งงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentorposition" name="mentorposition"
											class="form-control data" value="<%=mentor.getMentorposition()%>" readonly>
									</div>						
								</div>
					
								
<script>

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
});
</script>

								<br>
						      <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-phone-square" aria-hidden="true" style="color: #81BE1A"></i> เบอร์โทรศัพท์</label>
									<div class="col-sm-4">
										<input type="text" id="phonenumber" name="phonenumber"
											class="form-control data" value="<%=mentor.getPhonenumber()%>" readonly>
									</div>	
									
									<label class="col-sm-2 col-form-label text-right"><img src="./images/Line.png" width="20" height="20"> line</label>
									<div class="col-sm-4">
										<input type="text" id="metorline" name="metorline"
											class="form-control data" value="<%=mentor.getMentorline()%>" readonly>
									</div>							
								</div>
								 
							<div class="form-group row">
					
						<label class="col-sm-2 col-form-label text-right"> ข้อมูลติดต่อ </label>		
			           <ul class="social-icons">  
			           <%if(mentor.getMentorfacebook() == "-"){ %>         
                        <li><a class="facebook" href="<%=mentor.getMentorfacebook() %>"><i class="fa fa-facebook"></i></a></li>    
                        <%} %>     
                        <li><a class="linkedin" href="mailto:<%=mentor.getMetoremail() %>"><i class="fa fa-envelope"></i></a></li>   
                        </ul>												
											         
					</div>
                         

                   <br><br><br>
         
                    
							</div>
						</div>
					</div>
				</div>
			</section>

		</form>


	</div>

	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>