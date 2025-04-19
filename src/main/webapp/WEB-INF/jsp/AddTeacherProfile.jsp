<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

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
<title>Edit Teacher Profile</title>

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


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
	
	var patt = /^[0]{1}[8|9|6|5]{1}[0-9]{7,8}/;
	var regexp =/^[ก-์|.]{2,45}$/;
	var regex_email = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*\@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.([a-zA-Z]){2,4})$/;
	var regexpPW =/^[A-Za-z|0-9]{10,}$/;

	
	
	if(frm.teachername.value == ""){
		alert("กรุณากรอกชื่อ");
		return false;
		}
	
	if (regexp.test(frm.teachername.value)==false){
		alert("กรุณากรอกชื่อเป็นภาษาไทย  ความยาว 2-50 ตัวอักษร");
		frm.teachername.value ="";
		return false;
		}
	
	
	if(frm.teacherlastname.value == ""){
		alert("กรุณากรอกนามสกุล");
		return false;
		}
	
	if (regexp.test(frm.teacherlastname.value)==false){
		alert("กรุณากรอกนามสกุลเป็นภาษาไทย  ความยาว 2-50 ตัวอักษร");
		frm.teacherlastname.value ="";
		return false;
		}
	
	if(!patt.test(document.getElementById('phonenumber').value)){
		alert("กรุณากรอกเป็นตัวเลขเท่านั้น 0 - 9 เเละ ความยาว 10 ตัวเลข ");
		return false ;
		}
	
	if(!regex_email.test(document.getElementById('teacheremail').value)){
		alert("รูปแบบ email ไม่ถูกต้อง ");
		return false ;
		}
	
	if(!regexpPW.test(document.getElementById('password').value)){
		alert("กรุณากรอกรหัสผ่านเป็นภาษาอังกฤษหรือตัวเลข  ความยาว 10 ตัวอักษร  ");
		return false ;
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
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลอาจารย์ </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadListTeacherPage" style="color:#FFFFFF;"> รายชื่ออาจารย์ </a> / <a class="a2" href="#" style="color:#E28A06;"> เพิ่มข้อมูลอาจารย์ </a></div>

</div></div></div>
<br>
</div>


<%if(error == -1){ %>
<div class="alert" >
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> เพิ่มข้อมูลในระบบไม่สำเร็จ : </strong> กรุณากรอกข้อมูลใหม่   
</div>
<%} %>

	<div class="container" style="margin-top: 35px;">
<br><br>

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">						
			
                            
                 <form method="POST" id="frm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/addTeacher" >
                                
<div class="container">
                                
    <div class="avatar-upload">
        <div class="avatar-edit">
            <input type='file' id="imageUpload" name="imageUpload" accept=".png, .jpg, .jpeg"/>
            <label for="imageUpload"></label>
        </div>
        <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url(./images/user.png);">
            </div>
        </div>
    </div>
</div>

								<h5 style="color:#850000;"> ข้อมูลของอาจารย์ </h5>
								<hr class="style13">
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> ชื่ออาจารย์ </label>
									<div class="col-sm-4">
										<input type="text" id="teachername" name="teachername"
											class="form-control data" >
									</div>	
									
									<label class="col-sm-2 col-form-label text-right">นามสกุล</label>
									<div class="col-sm-4">
										<input type="text" name="teacherlastname" id="teacherlastname"
											class="form-control data" >
									</div>					
								</div>
							    <br>
                                <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> เบอร์โทรศัพท์ </label>
									<div class="col-sm-4">
										<input type="text" id="phonenumber" name="phonenumber" maxlength="10"
											class="form-control data" >
									</div>		
									
									<label class="col-sm-2 col-form-label text-right"> email </label>
									<div class="col-sm-4">
										<input type="text" name="teacheremail" id="teacheremail"
											class="form-control data" >
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
                  				
				<br><br>
				
				
								
					<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" OnClick ="return validateForm(frm)" class="btn btn-success" >
												เพิ่มข้อมูลอาจารย์ </button></a>
										<a href = "${pageContext.request.contextPath}/loadListTeacherPage" class="btn btn-warning" >ยกเลิก </a>
									</div>
								</div>
								</form>	 
							</div>
						</div>					
					</div>
				</div>				
			</section>    		     			      
	</div>
	
	

	             <jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>