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

<%
Assignsupervision As = null;
try {
	As = (Assignsupervision) request.getAttribute("As");
} catch (Exception e) {
	As = null;
}
%>
<%
List<Student> student = (List) session.getAttribute("student");
String Companyid = (String) session.getAttribute("Companyid");
String getSemester = (String) session.getAttribute("getSemester");

if (getSemester.equals("")) {
	getSemester = "แสดงทั้งหมด";
}
%>
<%
ListStudentDB ListStu = new ListStudentDB();
ViewReportDB ReportDB = new ViewReportDB();
ViewVDODB VDODB = new ViewVDODB();
ListCompanyDB ListCompany = new ListCompanyDB();
int number = Integer.parseInt(Companyid);
Company Com = ListCompany.Searchcompanyid(number);

ViewReportDB VReport = new ViewReportDB();
ViewVDODB Vvdo = new ViewVDODB();
%>
<%
    // Get current date details
    Calendar calendar = Calendar.getInstance();
    int yearNow = calendar.get(Calendar.YEAR);
    int monthNow = calendar.get(Calendar.MONTH) + 1; // Month is zero-based
    int dayNow = calendar.get(Calendar.DAY_OF_MONTH);

    // Add one day to exclude today
    calendar.add(Calendar.DAY_OF_MONTH, 1);
    int minYear = calendar.get(Calendar.YEAR);
    int minMonth = calendar.get(Calendar.MONTH) + 1;
    int minDay = calendar.get(Calendar.DAY_OF_MONTH);

    // Format the min date in yyyy-MM-dd
    String minDateString = String.format("%04d-%02d-%02d", minYear, minMonth, minDay);
    %>
   <%
    String formattedAsDate = "";
    if (As != null) {
        // Assuming As.getDate() returns a date in the format dd/MM/yyyy
        String asDateString = As.getDate(); // เช่น "24/10/2567"
        
        // Parse the date and format it to yyyy-MM-dd
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date date = inputFormat.parse(asDateString);
            formattedAsDate = outputFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<%
////// new system 2567 ///// list teacher
addTeacherDB atc = new addTeacherDB();
List<teacher> Lteacher = atc.AllListTeachers();
%>


<%
int error = 0;
%>
<%
try {
	error = (int) request.getAttribute("error");
} catch (Exception e) {
	error = 0;
}
%>
<%
String errordate = (String)session.getAttribute("errordate");
String errortime = (String)session.getAttribute("errortime");
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

					<h3 style="color: #7EBC1B;">ระบบจัดการการนิเทศสหกิจศึกษา</h3>
					<div class="nav1" style="color: #FFFFFF;">
						<a href="${pageContext.request.contextPath}/loadlistcomassignPage"
							style="color: #FFFFFF;">รายชื่อบริษัท</a> / <a class="a2"
							href="#" style="color: #E28A06;"> กำหนดอาจารย์นิเทศสหกิจศึกษา
						</a>
					</div>

				</div>
			</div>
		</div>
		<br>
	</div>

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
	if (error == -1) {
	%>
    <div class="alert">
        <span class="closebtn">&times;</span> 
        <strong><i class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ:</strong> 
        วันที่ <%=errordate%> ได้กำหนดการนิเทศสหกิจศึกษาทั้ง2ช่วงเวลาแล้ว (ช่วง เช้า 10:00น.-12.00น. ช่วงบ่าย 13:00น.-15.00น.) กรุณาเลือกวันที่ใหม่
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        var background = document.getElementById("dateAssign");
        if (background) {
        	background.style.backgroundColor='#f44336';
            background.style.color = 'white';
        }
    });
</script>
	<%
	}
	%>

	<%
	if (error == -2) {
	%>
	<div class="alert">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ
			:
		</strong>วันที่ <%=errordate%> เวลา <%=errortime%> ไม่สามารถกำหนดได้เนื่องจากพบกำหนดการซ้ำกรุณาเปลี่ยนแปลงวัน-เวลา
	</div>
	
	 <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        var background = document.getElementById("timeAssign");
        if (background) {
            background.style.backgroundColor='#f44336';
            background.style.color = 'white';
        }
    });
</script>
	<%
	}
	%>
	<%
	if (error == -3) {
	%>
	<div class="alert">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ
			:
		</strong>วันที่ <%=errordate%> เวลา <%=errortime%> ไม่สามารถกำหนดได้เนื่องจาก <B>ช่วงเวลาเช้า</B> ได้ถูกกำหนดไปแล้ว กรุณาเลือกช่วงเวลา 13.00น. เป็นต้นไป
	</div>
	
	 <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        var background = document.getElementById("timeAssign");
        if (background) {
            background.style.backgroundColor='#f44336';
            background.style.color = 'white';
        }
    });
</script>
	<%
	}
	%>
	<%
	if (error == -4) {
	%>
	<div class="alert">
		<span class="closebtn">&times;</span> <strong> <i
			class="fa-sharp fa-solid fa-circle-xmark"></i> บันทึกข้อมูลไม่สำเร็จ
			:
		</strong>วันที่ <%=errordate%> เวลา <%=errortime%> ไม่สามารถกำหนดได้เนื่องจาก <B>ช่วงเวลาบ่าย</B> ได้ถูกกำหนดไปแล้ว กรุณาเลือกช่วงเวลาไม่เกิน 12.00น.
	</div>
	
	 <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        var background = document.getElementById("timeAssign");
        if (background) {
            background.style.backgroundColor='#f44336';
            background.style.color = 'white';
        }
    });
</script>
	<%
	}
	%>

	<%
	if (errorsession == 1 || Teacher == null) {
	%>
	<script>
		Swal
				.fire({
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
						<form name="frm" method="post"
							action="${pageContext.request.contextPath}/loadnameSUTPage">
							<div class="container">
								<h3 style="color: #850000;">
									กำหนดอาจารย์นิเทศสหกิจศึกษาบริษัท
									<%=Com.getCompanyname()%></h3>
								<hr class="style13">
								<br> <br>
								<div style="margin-left: 300px">
									<div class="form-group row">



										<label class="col-sm-2 col-form-label text-right">
											ภาคการศึกษา </label>
										<div class="col-sm-4">
											<input type="text" id="Semester" name="Semester"
												class="form-control data" value="<%=getSemester%>" readonly>
										</div>

									</div>
								</div>

							</div>
						</form>
					</div>



				</div>
			</div>
		</section>
	</div>
	<div align="center">
		<%
		if (Teacher.getStatus().equals("อยู่")) {
		%>
		<form name="frm" method="post"
			action="${pageContext.request.contextPath}/assignSupervision">
			<table class="table table-bordered" id="myTable" style="width: 80%">
				<thead class="table-info" align="center">
					<tr>
						<th>บริษัท</th>
						<th>วันที่นิเทศ</th>
						<th>เวลานิเทศ</th>
						<th>อาจารย์นิเทศ</th>
						<th>รูปแบบการนิเทศ</th>


					</tr>
				</thead>
				<tbody>	
				<input  id="Semester" name="Semester"  value="<%=getSemester%>"  type="hidden">
				<input name="companyid" value="<%=Com.getCompanyid()%>" type="hidden">
					<tr>
						<th><%=Com.getCompanyname()%></th>
					    <%if (As!=null) {%>
					    <th>
                        <input type="date" name="datesupervision" class="form-control data" id="dateAssign" min="<%= minDateString %>" value="<%= formattedAsDate %>" required="required">
                    	</th>
						<th style="white-space: nowrap">
					    <select name="timeSupervision" class="form-control data" id="timeAssign">
					        <option value="10:00น.-12.00น." <%= As.getTime().equals("10:00น.-12.00น.") ? "selected" : "" %>>10:00น.-12.00น.</option>
					        <option value="10:30น.-12.00น." <%= As.getTime().equals("10:30น.-12.00น.") ? "selected" : "" %>>10:30น.-12.00น.</option>
					        <option value="11:00น.-12.00น." <%= As.getTime().equals("11:00น.-12.00น.") ? "selected" : "" %>>11:00น.-12.00น.</option>
					        <option value="13:00น.-15.00น." <%= As.getTime().equals("13:00น.-15.00น.") ? "selected" : "" %>>13:00น.-15.00น.</option>
					        <option value="13:30น.-15.00น." <%= As.getTime().equals("13:30น.-15.00น.") ? "selected" : "" %>>13:30น.-15.00น.</option>
					        <option value="14:00น.-15.00น." <%= As.getTime().equals("14:00น.-15.00น.") ? "selected" : "" %>>14:00น.-15.00น.</option>
					    </select>
						</th>

						<th style="white-space: nowrap"><select name="teacherSupervision" class="form-control data">
						<%System.out.println("minDateString = "+ minDateString ); %>
								<%if (Lteacher != null) {%>						
								<%for (teacher t : Lteacher) {%>

								<option value="<%=t.getTeacherid()%>" <%=Integer.parseInt(As.getTeacherid()) == (t.getTeacherid()) ? "selected" : ""  %>><%=t.getTeachername() + " " + t.getTeacherlastname()%></option>
									
								<%}%>				
								<%}%>
						</select></th>

						<th><select name="methodSupervision" class="form-control data">
								<option value="On-Site" <%= As.getMethods().equals("On-Site") ? "selected" : "" %>>On-Site</option>
								<option value="On-Line" <%= As.getMethods().equals("On-Line") ? "selected" : "" %>>On-Line</option>
						</select>
						</th>
						<%}else{ %>
						
						  <th>
                        <input type="date" name="datesupervision" class="form-control data" id="dateAssign" min="<%= minDateString %>" value="<%= minDateString %>" required="required">
                    	</th>
						<th style="white-space: nowrap"><select name="timeSupervision" class="form-control data" id="timeAssign">
								<option value="10:00น.-12.00น.">10:00น.-12.00น.</option>
								<option value="10:30น.-12.00น.">10:30น.-12.00น.</option>
								<option value="11:00น.-12.00น.">11:00น.-12.00น.</option>
								<option value="13:00น.-15.00น.">13:00น.-15.00น.</option>
								<option value="13:30น.-15.00น.">13:30น.-15.00น.</option>
								<option value="14:00น.-15.00น.">14:00น.-15.00น.</option>
						</select></th>
						<th style="white-space: nowrap"><select name="teacherSupervision" class="form-control data">
								<%if (Lteacher != null) {%>						
								<%for (teacher t : Lteacher) {%>

								<option value="<%=t.getTeacherid()%>"><%=t.getTeachername() + " " + t.getTeacherlastname()%></option>
									
								<%}%>				
								<%}%>
						</select></th>

						<th><select name="methodSupervision" class="form-control data">
								<option value="On-Site">On-Site</option>
								<option value="On-Line">On-Line</option>
						</select>
						</th>
						
						<%} %>
					</tr>
					<%
					}
					%>
					<%
					}
					%>

				</tbody>
			</table>
			<br>
			<br>
			<div class="form-group row">
				<div class="col-sm-12 text-center">
					<a href="#"><button type="submit" class="btn btn-success">
							บันทึก</button></a> <a
						href="${pageContext.request.contextPath}/loadlistcomassignPage"
						class="btn btn-warning">ยกเลิก </a>
				</div>
			</div>
		</form>

	</div>

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

	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

