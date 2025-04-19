<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ page import = "bean.*, util.*,java.util.*,com.springmvc.controller.AESpassword" %>
<%@ page import="javax.crypto.Cipher" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="javax.crypto.SecretKey" %>
<%@ page import="java.util.Base64" %>

 
<%Mentor mentor = (Mentor)session.getAttribute("Ementor");%>
<%mentor_student mentor_student = (mentor_student)session.getAttribute("mentor_student");%>

<%int error = 0; %>

<%
try{
	error = (int)request.getAttribute("error");
}catch(Exception e) {
	error = 0;
	}
%>

<%
teacher Teacher = null;
try {
	Teacher = (teacher) session.getAttribute("teacher");
} catch (Exception e) {
	Teacher = null;
}
%>
<%int errormen_stu = 0; %>

<%
try{
	errormen_stu = (int)request.getAttribute("errormen_stu");
}catch(Exception e) {
	errormen_stu = 0;
	}
%>
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
<link rel="stylesheet" href="./css/Alert.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

<script type="text/javascript">

function validateForm(frm){
	var patt = /^[0]{1}[8|9|6]{1}[0-9]{8,}/;
	var regexp =/^[ก-์|A-Za-z|.]{2,45}$/;
	var regex_email = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*\@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.([a-zA-Z]){2,4})$/;
	var regexpPW =/^[A-Za-z|0-9]{10,}$/;
	var regenameC =/^[ก-์|A-Za-z|.| ]{2,20}$/;
	var regename =/^[ก-์|A-Za-z|.]{2,20}$/;
	
	if (regexp.test(frm.mentorname.value)==false){
		alert("กรุณากรอกชื่อเป็นภาษาไทยและภาษาอังกฤษ  ความยาว 2-45 ตัวอักษร");
		frm.mentorname.value ="";
		return false;
		}
	
	if (regexp.test(frm.lastname.value)==false){
		alert("กรุณากรอกนามสกุลเป็นภาษาไทยและภาษาอังกฤษ  ความยาว 2-45 ตัวอักษร");
		frm.lastname.value ="";
		return false;
		}
	
	if (regename.test(frm.mentornickname.value)==false){
		alert("กรุณากรอกชื่อเล่นเป็นภาษาไทยและภาษาอังกฤษ  ความยาว 2-20 ตัวอักษร");
		frm.mentornickname.value ="";
		return false;
		}
	
	
	if(frm.mentorposition.value == ""){
		alert("กรุณากรอกตำแหน่งงานพี่เลี้ยง");
		return false;
		}
	if (regenameC.test(frm.mentorposition.value)==false){
		alert("กรุณากรอกตำแหน่งงานพี่เลี้ยงเป็นภาษาไทยและภาษาอังกฤษ  ความยาว 2-20 ตัวอักษร");
		frm.mentorposition.value ="";
		return false;
		}
	
	if(!patt.test(document.getElementById('phonenumber').value)){
		alert("กรุณากรอกเบอร์โทรเป็นตัวเลขเท่านั้น 0 - 9 เเละ ความยาว 10 ตัวเลข ");
		return false ;
		}
	
	if (regex_email.test(frm.metoremail.value)==false){
		alert("รูปแบบ email ไม่ถูกต้อง");
		frm.metoremail.value ="";
		return false;
		}
	
	if(frm.metorline.value == ""){
		alert("กรุณากรอกข้อมูลline");
		return false;
		}
	
	if(frm.metorfacebook.value == ""){
		alert("กรุณากรอกข้อมูลfacebook");
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

<h3 style="color:#7EBC1B;" >ระบบแก้ไขข้อมูลพนักงานพี่เลี้ยง </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadListmentor" style="color:#FFFFFF;">รายชื่อพนักงานพี่เลี้ยง</a> / <a class="a2" href="#" style="color:#E28A06;">แก้ไขข้อมูลพนักงานพี่เลี้ยง  </a></div>

</div></div></div>
<br>
</div>
<%if(errormen_stu == -1){ %>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ : </strong> ไม่พบรหัสนักศึกษาที่ระบุ  
</div>
<%} %>
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
	<!-- ใช้สำหรับสลับการทำงานเมื่อแอคเคาท์คนละประเภทใช้งาน อาจารย์/นักเรียน  -->
		<%
		    HttpServletRequest httpRequest = (HttpServletRequest) request;
		    String contextPath = httpRequest.getContextPath();
		    String formAction = contextPath + "/Editmentor";
		    String backward = contextPath + "/loadListmentor";
		    if (Teacher != null) {
		        formAction = contextPath + "/EditmentorforTeacher";
		        backward = contextPath + "/loadListmentorManage";
		    }
		%>
		 
		<form id="frm" method="POST" enctype="multipart/form-data" action="<%= formAction %>" >
<br><br>

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
						<div class="col-lg-12">
							<div class="container">
								
                                        
<div class="container">
    <div class="avatar-upload">
        <div class="avatar-edit">
            <input type='file' id="imageUpload" name="imageUpload" accept=".png, .jpg, .jpeg"/>
            <label for="imageUpload"></label>
        </div>
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
										<input type="text" id="mentorid" name="mentorid"
											class="form-control data" value="<%=mentor.getMentorid()%>" readonly >
									</div>
								</div>
								
								<div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">คํานําหน้าชื่อ</label>
								<div class="col-sm-4">
								<%if(mentor.getMentorprefix().equals("นาย") ){ %>
								<input type="radio" id="mentorprefix" name="mentorprefix" value="นาย" checked> นาย
								<%}else{ %>
								<input type="radio" id="mentorprefix" name="mentorprefix" value="นาย"> นาย
								<%}if(mentor.getMentorprefix().equals("นางสาว")){ %>
								&nbsp;<input type="radio" id="mentorprefix" name="mentorprefix" value="นางสาว" checked> นางสาว
								<%}else{ %>
								&nbsp;<input type="radio" id="mentorprefix" name="mentorprefix" value="นางสาว"> นางสาว
								<%} %>
								<%if(mentor.getMentorprefix().equals("นาง")){ %>
								&nbsp;<input type="radio" id="mentorprefix" name="mentorprefix" value="นาง" checked> นาง
								<%}else{ %>
								&nbsp;<input type="radio" id="mentorprefix" name="mentorprefix" value="นาง"> นาง
								<%} %>
								</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อพนักงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentorname" name="mentorname"
											class="form-control data" value="<%=mentor.getMentorname()%>" >
									</div>
									<label class="col-sm-2 col-form-label text-right">นามสกุล</label>
									<div class="col-sm-4">
										<input type="text" name="lastname" id="lastname"
											class="form-control data" value="<%=mentor.getMentorlastname()%>" >
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อเล่นพนักงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentornickname" name="mentornickname"
											class="form-control data" value="<%=mentor.getMentornickname()%>" >
									</div>						
								</div>
                                <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ตำแหน่งงานพี่เลี้ยง</label>
									<div class="col-sm-4">
										<input type="text" id="mentorposition" name="mentorposition"
											class="form-control data" value="<%=mentor.getMentorposition()%>" >
									</div>						
								</div>
					
								


								<br>
						      <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-phone-square" aria-hidden="true" style="color: #81BE1A"></i> เบอร์โทรศัพท์</label>
									<div class="col-sm-4">
										<input type="text" id="phonenumber" name="phonenumber"
											class="form-control data" value="<%=mentor.getPhonenumber()%>" >
									</div>	
									
									<label class="col-sm-2 col-form-label text-right"><img src="./images/Line.png" width="20" height="20"> line</label>
									<div class="col-sm-4">
										<input type="text" id="metorline" name="metorline" placeholder="กรณีไม่มีข้อมูลให้ใส่ - "
											class="form-control data" value="<%=mentor.getMentorline()%>" >
									</div>							
								</div>
								  <div class="form-group row">

									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-envelope" aria-hidden="true" style="color: #FD4648"></i> email</label>
									<div class="col-sm-4">
										<input type="text" id="metoremail" name="metoremail" 
											class="form-control data" value="<%=mentor.getMetoremail()%>" >			
									</div>
	
											
									<label class="col-sm-2 col-form-label text-right"><i class="fa fa-facebook-official" style="color: #17A8FC"></i> facebook</label>
									<div class="col-sm-4">
										<input type="text" id="metorfacebook" name="metorfacebook" placeholder="กรณีไม่มีข้อมูลให้ใส่ - "
											class="form-control data" value="<%=mentor.getMentorfacebook()%>" >
									</div>						
								</div>
								<% if (Teacher != null) {	%>	
								<div class="form-group row" >
							    <label class="col-sm-2 col-form-label text-right">
							        <i class="fa fa-key fa-fw" style="color: orange"></i> Password
							    </label>
							    <div class="col-sm-4">
							    <button type="button" id="changePasswordButton" onclick="togglePasswordField()" class="btn btn-primary">
           						 เปลี่ยนรหัส
       							 </button>
        						<div id="passwordContainer" style="display: none;">
							        <div class="input-group">
							        <%
							        LoginbyStudentDB sm = new LoginbyStudentDB();
							        String decryptedPassword = "";
							        // ค้นหารหัสผ่านที่เข้ารหัสในฐานข้อมูล
							        String encryptedPassword = sm.getEncryptedPasswordByUsername(mentor.getMetoremail()); 
							        String encodedKey = sm.getEncryptedKeyByUsername(mentor.getMetoremail()); 
							        
							        if(encodedKey != null && !encodedKey.isEmpty()){
							        byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
							        SecretKey secretKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
							        
							        // ถอดรหัสรหัสผ่าน
							        decryptedPassword = AESpassword.decrypt(encryptedPassword, secretKey);
							        }else{
							       	decryptedPassword = mentor.getPassword();
							        }
							        
							        %>
							           <input type="password" id="password" name="password" 
								       class="form-control data" value="<%=decryptedPassword %>" 
								       placeholder="กรอกรหัสผ่านใหม่" autocomplete="new-password">

							            <div class="input-group-append">
							                <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer;">
							                    <i id="eyeIcon" class="fa fa-eye-slash"></i>
							                </span>
							            </div>
							        </div>
							    </div>
							</div>
                         
							</div>
								
						
										<br>
								<h5 style="color:#850000" > นักศึกษาในการดูแลของพนักงานพี่เลี้ยง</h5>
								<hr class="style13">
							
						<div style="margin-left: 5%">	
						<input class="form-control data"  style="width: 35%" name="stuid" placeholder="เพิ่มรหัสนักศึกษา">										
						<br>
						<%ListmentorDB lmDB = new ListmentorDB(); 
						  List<mentor_student> listmen_stu = lmDB.Listmentor_studentByid(mentor.getMentorid());
						 
						  ListStudentDB lsDB = new ListStudentDB();
						  
						  
						%>
						<%for(mentor_student ms : listmen_stu) {%>
						  <%Student stu = lsDB.SStuid(ms.getStudent_studentid()); %>
						<input class="form-control data"  style="width: 35%" placeholder="รหัสนักศึกษา" value="<%=ms.getStudent_studentid()%> <%=stu.getStudentname() %> <%=stu.getStudentlastname() %> " readonly="readonly">
                       <%} %>
						</div>
                         <%} %>	

                         

                   <br><br><br>
         
								<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" OnClick ="return validateForm(frm)" class="btn btn-success">
												บันทึกการแก้ไข </button></a>								
										<a href = "<%=backward %>" class="btn btn-warning" >ยกเลิก </a>
									</div>
								</div>
                    
							</div>
						</div>
					</div>
				</div>
			</section>

		</form>

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
<script>
    function togglePassword() {
        var passwordField = document.getElementById('password');
        var eyeIcon = document.getElementById('eyeIcon');
        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
        } else {
            passwordField.type = "password";
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
        }
    }
</script>
<script>
function togglePasswordField() {
    const passwordContainer = document.getElementById('passwordContainer');
    passwordContainer.style.display = passwordContainer.style.display === 'none' ? 'block' : 'none';
}
    function togglePassword() {
        var passwordField = document.getElementById('password');
        var eyeIcon = document.getElementById('eyeIcon');
        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
        } else {
            passwordField.type = "password";
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
        }
    }
</script>
	</div>

	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>