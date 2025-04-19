<%@page import="com.springmvc.controller.AddTeachercontroller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    String formattedDate = formatter.format(new Date());
%>
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
int formnotfound = 0;
Teacherassessmentform tf = null;
Student stu = null;
List<formteacherdetail> Listfd = null;
List<teacheranswer> Listans  = null;
try{
	tf = (Teacherassessmentform) session.getAttribute("tf");
	stu = (Student) session.getAttribute("stu");
	
}catch(Exception e) {
	formnotfound = 1;
}
%>
<%
AddQuestionDB aqDB = new AddQuestionDB();
List<question> Listq = aqDB.ListAllQuestion();
%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="./css/Alert.css">
<link rel="stylesheet" href="./css/web_css.css">
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
p {
	font-family: "Webly Sleek SemiLight", Helvetica-, droid sans, sans-serif;
	font-weight: normal;
	margin: 0 0 1rem;
}

.centerbox {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%); /* IE 9 */
	-webkit-transform: translate(-50%, -50%); /* Chrome, Safari, Opera */
	width: 620px;
	min-height: 52px;
	z-index: 2
}

.centerbox h1 {
	margin-bottom: 25px;
	font-size: 36px;
	font-family: "Webly Sleek SemiLight";
	font-weight: normal;
	text-align: center;
}

.centerbox p.description {
	margin-bottom: 40px;
	text-align: center;
}

.description a {
	text-decoration: none;
}

.main-input {
	background: #fff;
	height: 50px;
	width: 327px;
	color: #a7b1ab;
	border: 1px solid #cccccc;
	margin-bottom: 0px;
	webkit-appearance: none;
	border-radius: 4px 0px 0px 4px;
	-moz-border-radius: 4px 0px 0px 4px;
	-webkit-border-radius: 4px 0px 0px 4px;
	display: inline-block;
	text-align: left;
	font-size: 16px;
	font-weight: 500;
	padding: 0px 0px 0px 57px;
	font-size: 16px;
	border-right: 0px;
	background: #ffffff
		url("http://seodesigns.com/projects/TD/images/search.png") 18px 15px
		no-repeat;
	background-size: 18px 18px;
	float: left;
}

.main-location {
	display: none;
}

#main-submit {
	background: #3cb13c;
	color: #fff;
	display: inline-block;
	font-size: 19px;
	font-weight: 500;
	text-align: center;
	cursor: pointer;
	margin-bottom: 0px;
	-webkit-appearance: none;
	border-radius: 0px 4px 4px 0px;
	-moz-border-radius: 0px 4px 4px 0px;
	-webkit-border-radius: 0px 4px 4px 0px;
	width: 141px;
	height: 50px;
	border: 0pxpadding-top:0px;
	float: left;
}

#main-submit:hover {
	background: #00a221;
	color: #fff !important;
	-webkit-appearance: none;
}

#main-submit-mobile {
	display: none;
}

footer {
	border-top: 0px;
}

.main-btn {
	display: inline-block;
	width: 150px;
	height: 50px;
	border: 1px solid #cccccc;
	padding: 0px;
	position: relative;
	float: left;
	border-right: 0px;
	background: #ffffff;
	background-size: 6px 6px;
	cursor: pointer;
}

.search-small {
	font-size: 12px;
	margin: 0px;
	color: #9B9B9B;
	position: absolute;
	top: 6px;
	left: 16px;
	display: inline-block;
	width: 80px;
	height: 20px;
	text-align: left;
}

.search-large {
	font-size: 16px;
	margin: 0px;
	color: #4A4A4A;
	position: absolute;
	top: 19px;
	left: 16px;
	display: inline-block;
	width: 105px;
	height: 20px;
	font-weight: 900;
	text-align: left;
}

.main-form-container {
	height: 50px;
	position: relative;
}

ul.search-description {
	width: 150px;
	position: absolute;
	background: #fff;
	right: 143px;
	top: 55px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	padding: 14px 0px;
	border: 1px solid #E5E5E5;
	display: none;
	-webkit-box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
}

.search-description li {
	font-size: 16px;
	color: #4A4A4A;
	font-weight: 900;
	padding: 6px 0px;
	display: block;
	padding-left: 16px;
	cursor: pointer;
}

.search-description li:hover {
	background: #f8f8f8;
}

/* responsive css below */
@media only screen and (max-width: 680px) {
	.main-btn {
		border-radius: 0px 4px 4px 0px;
		-moz-border-radius: 0px 4px 4px 0px;
		-webkit-border-radius: 0px 4px 4px 0px;
		border-right: 1px solid #cccccc;
	}
	ul.search-description {
		right: 0px;
		z-index: 9999;
	}
	.centerbox p.description {
		width: 284px;
		margin: 0 auto 40px auto;
	}
	.centerbox {
		width: auto;
		transform: translate(-50%, -60%);
		-ms-transform: translate(-50%, -60%); /* IE 9 */
		-webkit-transform: translate(-50%, -60%); /* Chrome, Safari, Opera */
	}
	.main-form-container {
		width: 477px
	}
	#main-submit {
		display: none;
	}
	#main-submit-mobile {
		background: #3cb13c;
		color: #fff;
		display: block;
		font-size: 19px;
		font-weight: 500;
		text-align: center;
		cursor: pointer;
		margin-bottom: 0px;
		-webkit-appearance: none;
		border-radius: 0px;
		-moz-border-radius: 0px;
		-webkit-border-radius: 0px;
		width: 141px;
		height: 50px;
		border: 0px;
		padding-top: 0px;
		float: none;
		border: 0px;
		position: fixed;
		bottom: 0px;
		right: 0px;
		width: 100%;
		z-index: 1;
	}
	#main-submit-mobile:hover {
		background: #00a221;
		color: #fff !important;
		-webkit-appearance: none;
	}
	footer {
		padding-bottom: 50px;
	}
}

@media only screen and (max-width: 515px) {
	.main-input {
		width: 210px;
	}
	.main-form-container {
		width: 360px
	}
	.centerbox h1 {
		width: 280px;
		margin: 0 auto 15px auto;
	}
	.centerbox {
		position: absolute;
		top: 50%;
		left: 50%;
	}
}

@media only screen and (max-width: 375px) {
	.cover {
		background: rgba(0, 0, 0, 0)
			url("seodesigns.com/projects/TD/images/background.jpg") no-repeat
			center -175px;
	}
	.main-input {
		width: 185px;
		padding-left: 42px;
		background: #ffffff
			url("http://seodesigns.com/projects/TD/images/search.png") 12px 15px
			no-repeat;
		background-size: 18px 18px;
	}
	.main-btn {
		width: 108px;
		background: #ffffff
			url("http://seodesigns.com/projects/TD/images/main-bullet.png") 85px
			23px no-repeat;
		background-size: 6px 6px;
	}
	.main-form-container {
		width: 293px
	}
	.search-small {
		left: 13px;
	}
	.search-large {
		left: 13px;
	}
}

hr.style13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #880000 inset;
}

.circle-button {
    width: 50px;
    height: 50px;
    background-color: #009688; /* สีของปุ่ม */
    color: white; /* สีของข้อความ */
    border: none; /* ลบเส้นขอบ */
    border-radius: 50%; /* ทำให้เป็นวงกลม */
    font-size: 16px; /* ขนาดของข้อความ */
    text-align: center; /* จัดข้อความให้อยู่ตรงกลาง */
    line-height: 50px; /* จัดข้อความในแนวตั้งให้อยู่ตรงกลาง */
    cursor: pointer; /* เปลี่ยนเคอร์เซอร์เมื่อโฮเวอร์ */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* แสงเงา */
    transition: background-color 0.3s; /* แอนิเมชันเมื่อเปลี่ยนสี */
    outline: none;
    margin-bottom: 5px;
}

.circle-button2 {
    width: 50px;
    height: 50px;
    background-color: #3DC2EC; /* สีของปุ่ม */
    color: white; /* สีของข้อความ */
    border: none; /* ลบเส้นขอบ */
    border-radius: 50%; /* ทำให้เป็นวงกลม */
    font-size: 16px; /* ขนาดของข้อความ */
    text-align: center; /* จัดข้อความให้อยู่ตรงกลาง */
    line-height: 50px; /* จัดข้อความในแนวตั้งให้อยู่ตรงกลาง */
    cursor: pointer; /* เปลี่ยนเคอร์เซอร์เมื่อโฮเวอร์ */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* แสงเงา */
    transition: background-color 0.3s; /* แอนิเมชันเมื่อเปลี่ยนสี */
    outline: none;
    margin-bottom: 5px;
}

.circle-button:hover {
    background-color: #45a049; /* สีของปุ่มเมื่อโฮเวอร์ */
    
}

.circle-button2:hover {
    background-color: #4C3BCF; /* สีของปุ่มเมื่อโฮเวอร์ */
    
}

.circle-button:focus {
    outline: none; /* ลบขอบเมื่อถูกโฟกัส */
}

.circle-button2:focus {
    outline: none; /* ลบขอบเมื่อถูกโฟกัส */
}

.btn-horizontal{
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	width: 260px;
}

.vl {
  border-left: 2px solid #686D76 ;
  height: 60px;
  width: 1px

}


.table-header {
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    background-color: #E85C0D;
    border-radius: 5px;
    color: white;
    padding: 15px;
    margin-bottom: 5px; 
}

.header-item {
    width: 30%;
    padding-right: 20px;
    padding-left: 20px;
    
}

.question-item {
    margin-bottom: 5px; 
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.question-label {
    width: 65%;
}

.full-score-label {
    width: 20%;
    text-align: center;
}

.question-input {
    width: 15%;
    text-align: right;
    padding-right: 2%;
}

.question-input2 {
    width: 60%;
}

.below-input {
    width: 100%;
    margin-top: 10px;
}

.radio-group label {
    margin-right: 10px;
}

 .form-control.question-input.inline-input {
    display: inline-block;
    width: 60%; /* หรือกำหนดขนาดที่เหมาะสมเช่น width: 10%; */ /* ปรับระยะห่างระหว่าง input */
    vertical-align: middle;
} 


.container-headerform {
            display: flex;
            width: 100%;
        }
        
        .left {
            flex: 0 0 50%; /* คอลัมน์ซ้ายกินพื้นที่ 70% */
        }

        .right {
            flex: 0 0 50%; /* คอลัมน์ขวากินพื้นที่ 30% */
        }
        
         .label-group-headerform {
            padding-left: 20px;
            
        }

	.background-A4{
		background-color: white; 
		border-radius: 15px; 
		padding: 2%; 
		margin-bottom:5px; 
		box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2); 
		border-top: 30px solid #28A745;
	}
	
	/* ซ่อนลูกศรใน input ประเภท number สำหรับเบราว์เซอร์ต่าง ๆ */
        /* สำหรับ Chrome, Safari, Edge, Opera */
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        
        /* จัดตำแหน่งตัวเลขให้อยู่ตรงกลางและเพิ่ม padding */
        input[type="number"] {
            text-align: center; /* จัดตัวเลขให้อยู่ตรงกลาง */
            padding: 10px; /* เพิ่ม padding เพื่อไม่ให้ติดขอบ */
            width: 100px; /* กำหนดความกว้างของ input */
            box-sizing: border-box; /* ให้ padding อยู่ในขอบเขตของ input */
        }
      

</style>

</head>
<body>
    <jsp:include page="com/navbar.jsp"></jsp:include>
    <div style="background-color: #2B2C2F;">
        <br>
        <div class="container">
            <div class="row no-gutter">
                <div class="col-xs-12 col-md-12"
                    style="background-image: url('./images/TEACHER1.png'); background-position: right; background-repeat: no-repeat">

                    <h3 style="color: #7EBC1B;">ระบบประเมินผลสหกิจศึกษาสำหรับอาจารย์นิเทศ</h3>
                    <div class="nav1" style="color: #FFFFFF;">
                        <a href="${pageContext.request.contextPath}/listform"
                            style="color: #FFFFFF;">นักศึกษาในการดูแล</a> / <a class="a2"
                            href="#" style="color: #E28A06;"> ระบบประเมิน
                        </a>
                    </div>

                </div>
            </div>
        </div>
        <br>
    </div>

    <% if (errorsession == 1 || Teacher == null) { %>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'SESSION ERROR !',
            text: 'กรุณาเข้าสู่ระบบใหม่ !',
            confirmButtonText: '<a href="${pageContext.request.contextPath}/loadlogin" style="color:#FFFFFF">ตกลง</a>'
        });
    </script>
        <%}else if (formnotfound == 1 || tf == null){ %>
     <script>
        Swal.fire({
            icon: 'warning',
            title: 'Form Not Found !',
            text: 'ไม่พบฟอร์มที่ภาคเทอมตรงกับภาคเทอมนักศึกษา !',
            confirmButtonText: 'ตกลง'
        }).then((result) => {
            if (result.isConfirmed) {
                window.history.back();
            }
        });
    </script>  
    <% } else { %>
	<%
	CreateformDB cfDB = new CreateformDB();
	Listfd = cfDB.getformteacherdetailById(tf.getTeacherassessmentformid());
	//////คำตอบของอาจารย์
	AssessmentDB asmDB = new AssessmentDB();
	System.out.println(Teacher.getTeacherid()+" "+stu.getIdstudent());
	Listans = asmDB.CheckAssessmentTeacherAnswer(Teacher.getTeacherid(),stu.getIdstudent());
	%>
	<% String yearsemester = tf.getSemester(); 
			String year = yearsemester.substring(13,17);//ex 2566
			String semester = yearsemester.substring(11,12);//ex 1
									
	%>
	
    <div class="container" style="width: 65%">
        <br>
       <!--  <h3 style="color: #850000;">ระบบประเมินผลสหกิจศึกษาสำหรับอาจารย์นิเทศ</h3>
        <hr class="style13"> -->
		<div class="background-A4">
		<div style="margin-left: 10%;" >
                    <h4 style="width: 100%;"><%= tf.getTitle() %></h4>
                    
                    <div class="container-headerform">
					    <div class="left label-group-headerform">
					        <span style="font-size: 18px; "><b>ผู้ประเมิน :</b></span>
                    		<span style="font-size: 18px;"><%= Teacher.getTeachername() %> <%= Teacher.getTeacherlastname() %> </span><br>
                    <br>
		                     <span style="font-size: 18px; "><b>ประเมินนักศึกษา :</b></span>
		                    <span style="font-size: 18px;"><%= stu.getIdstudent() %> <%= stu.getStudentname() %> <%= stu.getStudentlastname() %></span><br>
					    </div>
					    <br>
					    <div class="right label-group-headerform">
					         <span style="font-size: 18px;"><b>ปีการศึกษา :</b></span>
		                    <span style="font-size: 18px;"><%=yearsemester%></span><br>
		                   <br> 
		                     <span style="font-size: 16px;"><b>วันเวลาทำการประเมิน :</b></span>
		                    <span style="font-size: 18px;"><%= Listans.get(0).getEvalutiontime() %></span><br>
					    </div> 
					</div>  
					<br>
					<span style="font-size: 18px; padding-left: 20px"><b>คำชี้แจง :</b></span>
                    		<span style="font-size: 18px;"><%=tf.getDescription() %></span><br>
					
					 <!-- <span>สาขาวิชาเทคโนโลยีสารสนเทศ คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ โทรศัพท์ 053-873900 เว็บไซต์ <a href="https://www.itsci.mju.ac.th">www.itsci.mju.ac.th</a></span> -->
                </div>
                 <hr>
          
		</div>
		
       <div style="background-color: #F9F9F9; border-radius: 15px; padding: 4%; box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2); ">
            <form action="EditAssessmentTeacher" method="post">
                <input type="hidden" id="rowCount" name="rowCount" value="0">
                <input type="hidden" id="totalscorevalue" name="totalscorevalue">
                <input type="hidden" id="teacherid" name="teacherid" value="<%=Teacher.getTeacherid()%>">
                 <input type="hidden" id="stuid" name="stuid" value="<%=stu.getIdstudent()%>">
                <input type="hidden" id="teacherformid" name="teacherformid" value="<%=tf.getTeacherassessmentformid()%>">
                 <input type="hidden" id="evalutiontime" name="evalutiontime" value="<%= formattedDate %>">

                <div class="form-group row">
                <%--  <div align="center" style="width: 100%"><h3>ปีการศึกษา <%=yearsemester%></h3></div> --%>
                   <%--  <label class="col-sm-3 col-form-label text-right">ปีการศึกษา <%=yearsemester%> </label> --%>
                    
                    <div class="col-sm-5" style="display: none;">
                        <input type="text" id="yearE" name="yearE" class="form-control data" value="<%=year%>">
                    </div>
                    <div class="col-sm-5" style="display: none;">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่1" >
                            <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 1</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio2" value="ภาคเรียนที่2">
                            <label class="form-check-label" for="inlineRadio2">ภาคเรียนที่ 2</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio3" value="ภาคเรียนที่3">
                            <label class="form-check-label" for="inlineRadio3">ภาคเรียนที่ 3</label>
                        </div>
                    </div>
                </div>

                <!-- <h6><b>&nbsp;&nbsp;&nbsp;&nbsp; แบบฟอร์มการประเมินสหกิจศึกษาสำหรับพนักงานพี่เลี้ยง คะแนนเต็มคิดเป็นร้อยละ 20 คะแนน</b></h6> -->
				<!--  <h6><b>&nbsp;&nbsp;&nbsp;&nbsp;คะแนน (1 = น้อยที่สุด	2 = น้อย	3 = ปานกลาง 4 = มาก 5 = มากที่สุด หรือ มากที่สุดตามคะแนนเต็มของข้อนั้นๆ)</b></h6> -->
                <label style="font-size: 16px; margin-left: 20px"><b> ส่วนที่ 1 ให้คะแนนหัวข้อการประเมิน โดยให้คะแนนลงในช่องว่างต่อไปนี้</b></label>
               <div class="table-header">
				    <div class="header-item" style="width: 70%;">หัวข้อการประเมิน</div>
				    <div class="header-item" style="width: 15%;">คะแนนเต็ม</div>
				    <div class="header-item" style="text-align: right; width: 15%;">กรอกคะแนน</div>
				</div>
                <div id="questionContainer">
                    <!-- Questions will be dynamically inserted here -->
                </div>
                 <div align="right" style="margin-right: 50px;">
                    <a onclick="updateTotalScore()" style="cursor: pointer;">
                        <span id="totalscore" style="font-size: 18px;"></span><span style="font-size: 18px;">/<%=Math.round(tf.getTotalscore())%></span>
                        <input type="hidden" id="teachertotalscore" name="teachertotalscore" value="0">
                        
                    </a>
                </div>
                <hr>
               
                <label style="font-size: 16px; margin-left: 20px"><b> ส่วนที่ 2 ความคิดเห็น / ข้อเสนอแนะ</b></label>
                <div id="questionContainer2">
                    <!-- Questions will be dynamically inserted here -->
                </div>
				<hr>
               <br>
               <br>
                <br>
               <div align="center" >
                   
                   <a href="#" class="btn btn-warning" onclick="window.history.back(); return false;" style="margin: 20px; width: 150px;">ยกเลิก</a>

                </div>
            </form>
        </div>
    </div>
    <% } %>
    <jsp:include page="com/footer.jsp"></jsp:include>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function () {
    var questionData = {};
    var answerData = {}; // Initialize answerData

    <% if (Listq != null) {
        for (question qt : Listq) { %>
            questionData["<%= qt.getQuestionid() %>"] = {
                text: "<%= qt.getQuestiontext() %>",
                type: "<%= qt.getQuestiontype() %>",
                score: parseInt("<%= qt.getScore() %>")
            };
    <% } 
    } %>
    
    <% if (Listans != null) {
        for (teacheranswer ans : Listans) { %>
            answerData["<%= ans.getQuestionid_answer() %>"] = {
                anstext: "<%= ans.getTeacheranswertext() %>"
            };
    <% } 
    } %>

    var rowCount = 0;
    var questionnotype1 = 0;
    var questionnotype2 = 0;
    <% 
    if (Listfd != null) { %>
        <% for (formteacherdetail fd : Listfd) { %>
            rowCount++;
            var questionId = "<%= fd.getQuestionid_detail() %>";
            var questionDataObj = questionData[questionId];

            if (questionDataObj) {
                var questionText = questionDataObj.text;
                var questionType = questionDataObj.type;
                var questionScore = questionDataObj.score;

                var questionContainer = document.getElementById("questionContainer");
                var questionContainer2 = document.getElementById("questionContainer2");
                
                var questionDiv = document.createElement("div");
                questionDiv.className = "question-item";
                questionDiv.id = "questionItem" + rowCount;

                // คอลัมน์ซ้าย: คำถาม
                /* var questionLabel = document.createElement("label");
                questionLabel.className = "question-label";
                questionLabel.innerHTML = rowCount + ". " + questionText;
                questionDiv.appendChild(questionLabel); */
                
                if (questionType === "กรอกคะแนน") {
                	questionnotype1++;
                	
                	var questionLabel = document.createElement("label");
                    questionLabel.className = "question-label";
                    questionLabel.innerHTML = questionnotype1 + ". " + questionText;
                    questionDiv.appendChild(questionLabel);
                } else {
					questionnotype2++;	
					
                	var questionLabel = document.createElement("label");
                    questionLabel.className = "question-label";
                    questionLabel.innerHTML = questionnotype2 + ". " + questionText;
                    questionDiv.appendChild(questionLabel);
                }

                // ตรวจสอบประเภทคำถาม ถ้าไม่ใช่ textarea หรือ radio ให้แสดงคะแนนเต็ม
                if (questionType !== "ใช่หรือไม่" && questionType !== "ข้อความ" && questionScore > 0) {
                    // คอลัมน์กลาง: คะแนนเต็ม
                    var scoreLabel = document.createElement("div");
                    scoreLabel.className = "full-score-label";
                    scoreLabel.innerHTML = questionScore;
                    questionDiv.appendChild(scoreLabel);
                }

                var questionTypeContainer = document.createElement("div");
                questionTypeContainer.id = "questionTypeContainer" + rowCount;

                //var questionElement;

             // ดึงข้อมูลคำตอบถ้ามี
             var answerDataObj = answerData[questionId];
             if (answerDataObj) {
                 var answerText = answerDataObj.anstext;
				
                 var questionElement;
                 if (questionType === "ใช่หรือไม่") {
                     // แสดง radio ด้านล่างคำถาม
                     questionElement = `
                         <div class="radio-group below-input">
                    	 <label><input disabled="disabled" type="radio" name="questions[` + rowCount + `].answer" value="ใช่" data-score="` + questionScore + `" ` + (answerText === "ใช่" ? 'checked' : '') + ` required> ใช่</label>
                         <label><input disabled="disabled" type="radio" name="questions[` + rowCount + `].answer" value="ไม่ใช่" data-score="0" ` + (answerText === "ไม่ใช่" ? 'checked' : '') + `> ไม่ใช่</label>
                         </div>`;
                 } else if (questionType === "กรอกคะแนน") {
                     // แสดง input สำหรับกรอกคะแนน ด้านข้างคำถาม
                     questionElement = `
                    	 <input readonly="readonly" type="number" min="1" max="` + questionScore + `" class="form-control question-input inline-input" name="questions[` + rowCount + `].answer" data-score="` + questionScore + `" value="` + answerText + `" required>`;
                 } else if (questionType === "ข้อความ") {
                     // แสดง textarea ด้านล่างคำถาม
                     questionElement = `
                    	 <textarea readonly="readonly" class="form-control full-width below-input" name="questions[` + rowCount + `].answer" rows="3" data-score="` + questionScore + `" >` + answerText + `</textarea>`;
                 }
                 
                 if (questionType === "กรอกคะแนน") {
                     // ใช้ div แรกสำหรับกรอกคะแนน
                     questionInputDiv = document.createElement("div");
                     questionInputDiv.className = "question-input";
                     questionInputDiv.innerHTML = questionElement; // questionElement คือ input สำหรับกรอกคะแนน
                 } else {
                     // ใช้ div ที่สองสำหรับประเภทคำถามอื่นๆ
                     questionInputDiv = document.createElement("div");
                     questionInputDiv.className = "question-input2";
                     questionInputDiv.innerHTML = questionElement; // questionElement คือ textarea หรือ radio
                 }

                 questionDiv.appendChild(questionInputDiv);
             }

                //questionid
                var hiddenField = document.createElement("input");
                hiddenField.type = "hidden";
                hiddenField.name = "questions[" + rowCount + "].id";
                hiddenField.value = questionId;
                questionDiv.appendChild(hiddenField);

                var hiddenScoreField = document.createElement("input");
                hiddenScoreField.type = "hidden";
                hiddenScoreField.name = "questions[" + rowCount + "].score";
                hiddenScoreField.value = questionScore;
                hiddenScoreField.id = "score_" + rowCount;
                questionDiv.appendChild(hiddenScoreField);

                //กรอกคะแนนไปที่questionContainer อื่นๆไปที่questionContainer2
                if (questionType === "กรอกคะแนน") {
                    questionContainer.appendChild(questionDiv);
                } else {
                	questionContainer2.appendChild(questionDiv);
                }
                
                document.getElementById("rowCount").value = rowCount;
            }
        <% } %>
    <% } %>

    updateTotalScore();

    document.querySelectorAll("input[name*='answer'], textarea[name*='answer']").forEach(input => {
        input.addEventListener('input', updateTotalScore);
    });

    document.querySelectorAll("input[type='radio'][name*='answer']").forEach(input => {
        input.addEventListener('change', updateTotalScore);
    });
});

function updateTotalScore() {
    var totalScore = 0;

 // Iterate through radio and number inputs
	document.querySelectorAll("input[name*='answer']").forEach(input => {
	    if (input.type === "radio" && input.checked) {
	        // If radio button is checked, add the score as a float
	        totalScore += parseFloat(input.dataset.score);
	        var scoreFieldId = "score_" + input.name.match(/\d+/)[0];
	        document.getElementById(scoreFieldId).value = input.dataset.score;
	    } else if (input.type === "number") {
	        // For number inputs, use input.value and ensure it's a valid number
	        var score = parseFloat(input.value);  // Changed from parseInt to parseFloat
	        if (!isNaN(score) && score > 0) {
	            totalScore += score;
	            var scoreFieldId = "score_" + input.name.match(/\d+/)[0];
	            document.getElementById(scoreFieldId).value = score;
	        } else {
	            // If input is empty or invalid, set the score field to 0
	            var scoreFieldId = "score_" + input.name.match(/\d+/)[0];
	            document.getElementById(scoreFieldId).value = 0;
	        }
	    }
	});

    // Iterate through textarea inputs (if applicable)
    document.querySelectorAll("textarea[name*='answer']").forEach(input => {
        var score = parseInt(input.dataset.score);
        if (!isNaN(score) && input.value.trim() !== "") {
            totalScore += score;
            var scoreFieldId = "score_" + input.name.match(/\d+/)[0];
            document.getElementById(scoreFieldId).value = score;
        }
    });

 // Update total score display
    var totalScoreElement = document.getElementById("totalscore");
    totalScoreElement.innerHTML = totalScore;
    totalScoreElement.innerText = "คะแนนรวม " + totalScore;

    // Update hidden total score field
    var teachertotalScoreElement = document.getElementById("teachertotalscore");
    teachertotalScoreElement.value = totalScore;
}
</script>



</body>

</html>
