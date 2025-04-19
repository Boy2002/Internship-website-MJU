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



<%
CreateformDB cfDB = new CreateformDB();
List<Mentorassessmentform> Listmf = cfDB.ListAllMentorassessmentform();
List<Teacherassessmentform> Listtf = cfDB.ListAllTeacherassessmentform();
%>


<%
int error = 0;
int DoubleQuestion = 0;
%>
<%
try {
	error = (int) request.getAttribute("error");
	System.out.println("ListFormPage error = " + error);
} catch (Exception e) {
	error = 0;
}
try {
	DoubleQuestion = (int) request.getAttribute("DoubleQuestion");
	System.out.println("ListFormPage DoubleQuestion = " + DoubleQuestion);
} catch (Exception e) {
	DoubleQuestion = 0;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Question</title>

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

.tab {
	display: inline-block;
	border-radius: 5px;
	padding: 10px 20px;
	border: 1px solid #ddd;
	cursor: pointer;
}

.tab.active {
	background-color: #007bff;
	color: white;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
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

					<h3 style="color: #7EBC1B;">ระบบจัดการแบบฟอร์มสหกิจศึกษา</h3>
					<div class="nav1" style="color: #FFFFFF;">
						<a class="a2" href="#" style="color: #E28A06;">จัดการแบบฟอร์ม
						</a>
					</div>

				</div>
			</div>
		</div>
		<br>
	</div>
	<%
	if (error == -1) {
	%>
	<div class="alert">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-check"></i> ไม่สามารถลบได้ :
		</strong> เกิดข้อผิดพลาดในการลบฟอร์ม
	</div>
	<%
	}
	%>
	<%
	if (error == 1) {
	%>
	<div class="alert success">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-check"></i> บันทึกข้อมูลสำเร็จ :
		</strong> บันทึกข้อมูลเรียนร้อยแล้ว
	</div>
	<%
	}
	%>
	<%
	if (error == 2) {
	%>
	<div class="alert success">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-check"></i> แก้ไขสถานะมูลสำเร็จ :
		</strong> บันทึกข้อมูลเรียนร้อยแล้ว
	</div>
	<%
	}
	%>

	<%
	if (error == 3) {
	%>
	<div class="alert success">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-check"></i> ลบมูลสำเร็จ :
		</strong> บันทึกข้อมูลเรียนร้อยแล้ว
	</div>
	<%
	}
	%>
	
	<%
	if (DoubleQuestion == -1) {
	%>
	<div class="alert">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-check"></i> ตรวจพบคำถามซ้ำ :
		</strong> คำถามที่ซ้ำจะถูกนำออกจากฟอร์ม
	</div>
	<%
	}
	%>
	<%
	if (errorsession == 1 || Teacher == null) {
	%>
	<script>
		Swal
				.fire(
						{
							icon : 'error',
							title : 'SESSION ERROR !',
							text : 'กรุณาเข้าสู่ระบบใหม่ !',
							confirmButtonText : '<a href="${pageContext.request.contextPath}/loadlogin" style="color:#FFFFFF">ตกลง</a>'
						})
	</script>

	<%
	} else {
	%>

	<div class="container" style="margin-top: 35px;">
		<br> <br>
		<section id="content">
			<div class="container" style="margin-top: -20px">
				<div class="row">
					<div class="col-lg-12">
						<div class="container">
							<h3 style="color: #850000">
								แบบฟอร์มทั้งหมด จำนวน
								<%=Listmf.size()+Listtf.size()%>
								ฟอร์ม
							</h3>							
							<hr class="style13">

						</div>

						<div
							style="background-color: white; border-radius: 15px; padding: 50px; box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2);">

							<div align="right"
								style="width: 100%; margin-right: 20px; margin-bottom: 20px;">
								<a href="${pageContext.request.contextPath}/createformmentor"
									class="btn btn-success"><i class="fa-solid fa-plus"></i>
									สร้างฟอร์มพี่เลี้ยง </a> &nbsp; <a
									href="${pageContext.request.contextPath}/createformteacher"
									class="btn btn-success"><i class="fa-solid fa-plus"></i>
									สร้างฟอร์มอาจารย์ </a>
							</div>


							<div id="tabs">
								<div class="tab active" onclick="toggleTab('tablementorform')">พี่เลี้ยง</div>
								<div class="tab" onclick="toggleTab('tableteacherform')">อาจารย์</div>
							</div>
							<div id="content">
								<div id="tablementorform" class="tab-content active">
									<!-- รายการพี่เลี้ยง -->
									<hr>
									<h6 style="color: #850000">
										แบบฟอร์มพี่เลี้ยงทั้งหมด จำนวน
											<%=Listmf.size()%>
											ฟอร์ม
										</h6>
									<table class="table table-bordered" id="myTableMentor"
										style="width: 100%;">										
										<thead class="table-info" align="center">
											<tr>
												<th style="width: 7%;">ลำดับที่</th>
												<th style="width: 48%;">แบบฟอร์มพนักงานพี่เลี้ยง</th>
												<th style="width: 10%;">ปีการศึกษา</th>
												<th style="width: 5%;">ดูแบบประเมิน</th>
												<th style="width: 10%;">ทำสำเนา</th>
												<th style="width: 10%;">แก้ไข</th>
												<th style="width: 10%;">ลบ</th>
											</tr>
										</thead>
										<tbody>
											<%
											if (Listmf != null) {
											%>
											<%
											for (Mentorassessmentform mf : Listmf) {
											%>
											<tr>
												<td align="center"><%=mf.getMentorassessmentformid()%></td>
												<td style="padding-left: 30px;"><%=mf.getTitle()%></td>
												<td align="center"><%=mf.getSemester()%></td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/viewformmentorpage?fid=<%= mf.getMentorassessmentformid() %>"
													class="btn btn-success">ดู </a> </td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/copymentorformpage?mfid=<%= mf.getMentorassessmentformid() %>"
													class="btn btn-success">ทำสำเนา </a></td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/editmentorformpage?mfid=<%= mf.getMentorassessmentformid() %>"
													class="btn btn-primary">แก้ไข </a></td>
												<%-- <td align="center"><a
													href="${pageContext.request.contextPath}/deleteformmentorCasCade?mfid=<%= mf.getMentorassessmentformid() %>"
													class="btn btn-danger">ลบ </a></td> --%>
												<%List<mentoranswer> Checkmentorformhasanswer = cfDB.checkFormInMentorAnswer(mf.getMentorassessmentformid()); %>
												
												<td align="center">
												<%if(Checkmentorformhasanswer.isEmpty()){ %>
													<button class="btn btn-danger" onclick="alertDeleteFormMentor(<%= mf.getMentorassessmentformid() %>)">ลบ</button>
												<%}else{ %>
													<button class="btn btn-danger" onclick="alertDeleteFormMentorhasanswer(<%= mf.getMentorassessmentformid() %>)">ลบ</button>
												<%} %>
												</td>
											</tr>
											<%
											}
											%>
											<%
											} else {
											%>
											<tr>
												<td colspan="4" align="center">
													<h5 style="color: #850000">
														<i class="fa fa-ban"></i> ไม่มีข้อมูลฟอร์ม
													</h5>
												</td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
									<div style="width: 100%;" align="center">
									<div id="navMentor" class="pagination"></div>
									</div>
								</div>
								<div id="tableteacherform" class="tab-content">
									<!-- รายการอาจารย์ -->
									<hr>
										<h6 style="color: #850000">
										แบบฟอร์มอาจารย์ทั้งหมด จำนวน
											<%=Listtf.size()%>
											ฟอร์ม
										</h6>
									<table class="table table-bordered" id="myTableTeacher"
										style="width: 100%;">
										<thead class="table-info" align="center">
											<tr>
												<th style="width: 7%;">เลขที่</th>
												<th style="width: 48%;">แบบฟอร์มอาจารย์นิเทศสหกิจ</th>
												<th style="width: 10%;">ปีการศึกษา</th>
												<th style="width: 5%;">ดูแบบประเมิน</th>
												<th style="width: 10%;">ทำสำเนา</th>
												<th style="width: 10%;">แก้ไข</th>
												<th style="width: 10%;">ลบ</th>
											</tr>
										</thead>
										<tbody>
											<%
											if (Listtf != null) {
											%>
											<%
											for (Teacherassessmentform tf : Listtf) {
											%>
											<tr>
												<td align="center"><%=tf.getTeacherassessmentformid()%></td>
												<td style="padding-left: 30px;"><%=tf.getTitle()%></td>
												<td align="center"><%=tf.getSemester()%></td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/viewformteacherpage?fid=<%= tf.getTeacherassessmentformid() %>"
													class="btn btn-success">ดู </a> </td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/copyteacherformpage?tfid=<%= tf.getTeacherassessmentformid() %>"
													class="btn btn-success">ทำสำเนา </a></td>
												<td align="center"><a
													href="${pageContext.request.contextPath}/editteacherformpage?tfid=<%= tf.getTeacherassessmentformid() %>"
													class="btn btn-primary">แก้ไข </a></td>
												<%-- <td align="center"><a
													href="${pageContext.request.contextPath}/deleteformteacherCasCade?tfid=<%= tf.getTeacherassessmentformid() %>"
													class="btn btn-danger">ลบ </a></td> --%>
												<%	
													List<teacheranswer> Checkteacherformhasanswer = cfDB.checkFormInTeacherAnswer(tf.getTeacherassessmentformid());
													//System.out.println("Checkteacherformhasanswer ="+Checkteacherformhasanswer+" tf.getTeacherassessmentformid() ="+tf.getTeacherassessmentformid());
												%>
												<td align="center">
												<%if (Checkteacherformhasanswer.isEmpty()) {%>
													<button class="btn btn-danger" onclick="alertDeleteFormTeacher(<%= tf.getTeacherassessmentformid() %>)">ลบ</button>
												<%}else{ %>
													<button class="btn btn-danger" onclick="alertDeleteFormTeacherhasanswer(<%= tf.getTeacherassessmentformid() %>)">ลบ</button>
												<%} %>
												</td>	
											</tr>
											<%
											}
											%>
											<%
											} else {
											%>
											<tr>
												<td colspan="4" align="center">
													<h5 style="color: #850000">
														<i class="fa fa-ban"></i> ไม่มีข้อมูลฟอร์ม
													</h5>
												</td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
									<div style="width: 100%;" align="center">
									<div id="navTeacher" class="pagination"></div>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%
	}
	%>
	<script type="text/javascript">
        function toggleTab(tabId) {
            var tabs = document.querySelectorAll('.tab');
            tabs.forEach(function(tab) {
                tab.classList.remove('active');
            });

            document.querySelector('.tab[onclick="toggleTab(\'' + tabId + '\')"]').classList.add('active');

            var contents = document.querySelectorAll('.tab-content');
            contents.forEach(function(content) {
                content.classList.remove('active');
            });

            document.getElementById(tabId).classList.add('active');
        }

        function paginateTable(tableId, navId) {
            var rowsShown = 10;
            var rowsTotal = $('#' + tableId + ' tbody tr').length;
            var numPages = Math.ceil(rowsTotal / rowsShown);

            $('#' + navId).empty();
            for (var i = 0; i < numPages; i++) {
                var pageNum = i + 1;
                $('#' + navId).append('<a href="#" rel="' + i + '">' + pageNum + '</a> ');
            }

            $('#' + tableId + ' tbody tr').hide();
            $('#' + tableId + ' tbody tr').slice(0, rowsShown).show();
            $('#' + navId + ' a:first').addClass('active');

            $('#' + navId + ' a').bind('click', function(e) {
                e.preventDefault();
                $('#' + navId + ' a').removeClass('active');
                $(this).addClass('active');

                var currPage = $(this).attr('rel');
                var startItem = currPage * rowsShown;
                var endItem = startItem + rowsShown;

                $('#' + tableId + ' tbody tr').css('opacity', '0.0').hide()
                    .slice(startItem, endItem).css('display', 'table-row').animate({ opacity: 1 }, 300);
            });
        }

        $(document).ready(function() {
            paginateTable('myTableMentor', 'navMentor');
            paginateTable('myTableTeacher', 'navTeacher');
        });
    </script>
	<script>
		var close = document.getElementsByClassName("closebtn");
		var i;

		for (i = 0; i < close.length; i++) {
			close[i].onclick = function() {
				var div = this.parentElement;
				div.style.opacity = "0";
				setTimeout(function() {
					div.style.display = "none";
				}, 600);
			}
		}
	</script>
	<script>
function alertDeleteFormTeacher(formid) {
    Swal.fire({
        icon: 'warning',
        title: 'คุณต้องการลบหรือไม่',
        text: "เมื่อลบฟอร์ม คำตอบที่เกี่ยวข้องฟอร์มทั้งหมดจะถูกลบ!",
        showDenyButton: true,
        confirmButtonText: 'ตกลง',
        denyButtonText: 'ยกเลิก'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '${pageContext.request.contextPath}/deleteformteacherCasCade?tfid=' + formid;
        }
    });
}
function alertDeleteFormTeacherhasanswer(formid) {
    Swal.fire({
        icon: 'warning',
        title: 'ฟอร์มนี้มีการใช้งานอยู่!, คุณต้องการลบหรือไม่',
        text: "เมื่อลบฟอร์ม คำตอบที่เกี่ยวข้องฟอร์มทั้งหมดจะถูกลบ!",
        showDenyButton: true,
        confirmButtonText: 'ตกลง',
        denyButtonText: 'ยกเลิก'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '${pageContext.request.contextPath}/deleteformteacherCasCade?tfid=' + formid;
        }
    });
}

function alertDeleteFormMentor(formid) {
    Swal.fire({
        icon: 'warning',
        title: 'คุณต้องการลบหรือไม่',
        text: "เมื่อลบฟอร์ม คำตอบที่เกี่ยวข้องฟอร์มทั้งหมดจะถูกลบ!",
        showDenyButton: true,
        confirmButtonText: 'ตกลง',
        denyButtonText: 'ยกเลิก'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '${pageContext.request.contextPath}/deleteformmentorCasCade?mfid=' + formid;
        }
    });
}

function alertDeleteFormMentorhasanswer(formid) {
    Swal.fire({
        icon: 'warning',
        title: 'ฟอร์มนี้มีการใช้งานอยู่!, คุณต้องการลบหรือไม่',
        text: "เมื่อลบฟอร์ม คำตอบที่เกี่ยวข้องฟอร์มทั้งหมดจะถูกลบ!",
        showDenyButton: true,
        confirmButtonText: 'ตกลง',
        denyButtonText: 'ยกเลิก'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '${pageContext.request.contextPath}/deleteformmentorCasCade?mfid=' + formid;
        }
    });
}
</script>
	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

