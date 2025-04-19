<%@page import="com.springmvc.controller.AddTeachercontroller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int errorsession = 0;
teacher Teacher = null;
try {
	Teacher = (teacher) session.getAttribute("teacher");
} catch (Exception e) {
	errorsession = 1;
}
%>
<% question qt = (question)session.getAttribute("qt"); %>
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
}

.circle-button:hover {
    background-color: #45a049; /* สีของปุ่มเมื่อโฮเวอร์ */
    
}

.circle-button:focus {
    outline: none; /* ลบขอบเมื่อถูกโฟกัส */
}


</style>

<script type="text/javascript">
	var patt = /^[0-9]{1,2}([.])?$/;
	var patt1 = /^[0-9]{1,2}([.][0-9]{1})?$/;

	function checkNumber(elm) {
		if (elm.value.match(/[^\d|.]/)) {
			alert('กรอกตัวเลขเท่านั้น');
			elm.value = '';

		} else if (elm.value > 10 || elm.value < 0) {
			alert('กรอกคะแนนได้ไม่เกิน 10 คะแนนเท่านั้น');
			elm.value = '';

		} else if (!patt.test(elm.value)) {
			if (!patt1.test(elm.value)) {
				alert('กรอกตัวเลขให้ถูกต้อง');
				elm.value = '';
			}

		}
	}
	
</script>
</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>
	<div style="background-color: #2B2C2F;">
		<br>
		<div class="container">
			<div class="row no-gutter">
				<div class="col-xs-12 col-md-12"
					style="background-image: url('./images/TEACHER1.png'); background-position: right; background-repeat: no-repeat">

					<h3 style="color: #7EBC1B;">ระบบแก้ไขคำถามแบบฟอร์มการนิเทศสหกิจศึกษา</h3>
					<div class="nav1" style="color: #FFFFFF;">
						<a href="${pageContext.request.contextPath}/loadhome"
							style="color: #FFFFFF;">คำถามทั้งหมด</a> / <a class="a2"
							href="#" style="color: #E28A06;"> แก้ไขคำถาม
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
})
</script>
<%}else { %>

    <div class="container">
    	<br>
        <h3 style="color: #850000;">แก้ไขคำถามสหกิจศึกษา</h3>
		<hr class="style13">

		<div style="background-color: white; border-radius: 15px; padding: 50px;  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2);" >
        <form action="${pageContext.request.contextPath}/EditQuestion" method="post" >
        
            
            <table class="table" id="questionTable" >
                <thead style="background-color: #efebe9;" align="center">
                    <tr style="background-color: #6c757d; color:#eeeeee;" align="center">
                        <th>ข้อที่</th>
                        <th>หัวข้อการประเมินการฝึกสหกิจศึกษา</th>
                        <th>ประเภทคำตอบ</th>
                        <th>คะแนนเต็ม</th>
                    </tr>
                </thead>
                <tbody>
                <%
                %>
                    <tr align="center">
                    <th><input name="questionid" type="text" class="form-control" value="<%=qt.getQuestionid() %>" readonly="readonly"></th>
                    <th><input name="questiontext" type="text" class="form-control" value="<%=qt.getQuestiontext() %>"></th>
                    <th><select name="questiontype" class="form-control"  id="questiontype">
                    <%if("กรอกคะแนน".equals(qt.getQuestiontype())) {%>
                    <option value="กรอกคะแนน" selected="selected">กรอกคะแนน</option>
                    <option value="ใช่หรือไม่">ใช่หรือไม่</option>
                    <option value="ข้อความ">ข้อความ</option>
                    <%}else if("ใช่หรือไม่".equals(qt.getQuestiontype())) {%>
                    <option value="กรอกคะแนน" >กรอกคะแนน</option>
                    <option value="ใช่หรือไม่" selected="selected">ใช่หรือไม่</option>
                    <option value="ข้อความ">ข้อความ</option>
                    <%}else if("ข้อความ".equals(qt.getQuestiontype())) {%>
                    <option value="กรอกคะแนน" >กรอกคะแนน</option>
                    <option value="ใช่หรือไม่" >ใช่หรือไม่</option>
                    <option value="ข้อความ" selected="selected">ข้อความ</option>
                    <%}else{ %>
                    <option value="<%=qt.getQuestiontype()%>" selected="selected"><%=qt.getQuestiontype()%></option>
                    <option value="กรอกคะแนน">กรอกคะแนน</option>
                    <option value="ใช่หรือไม่">ใช่หรือไม่</option>
                    <option value="ข้อความ">ข้อความ</option>
                    <%} %>
                    </select></th>
                    <%if("ข้อความ".equals(qt.getQuestiontype())||"ใช่หรือไม่".equals(qt.getQuestiontype())) {%>
                  	 <th><input name="score" type="text" class="form-control" value="<%=qt.getScore() %>"></th>
                    <%}else{ %>
                     <th><input name="score" type="text" class="form-control" value="<%=qt.getScore() %>"></th>
                    <%} %>
                    </tr>
                </tbody>
            </table>
            <hr>
            <br>
            <div align="center">
            <br>
            <br>
            <button type="submit" class="btn btn-success">แก้ไข</button>
            <a href="${pageContext.request.contextPath}/listquestion"
						class="btn btn-warning">ยกเลิก </a>
            </div>

        </form>
        </div>
    </div>
<% } %>
<script>
var selectType = document.getElementById("questiontype");
var inputScore = document.querySelector('input[name="score"]'); 

window.onload = function() {
	 if (selectType.value === "ใช่หรือไม่" || selectType.value === "ข้อความ") {
	        inputScore.value = 0;
	        inputScore.style.display = "none";
	    } else {
	        inputScore.style.display = "block";
	    }
};

selectType.onchange = function() {
    if (selectType.value === "ใช่หรือไม่" || selectType.value === "ข้อความ") {
        inputScore.value = 0;
        inputScore.style.display = "none";
    } else {
    	inputScore.value = <%=qt.getScore() %>;
        inputScore.style.display = "block";
    }
};
</script>
 <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>
