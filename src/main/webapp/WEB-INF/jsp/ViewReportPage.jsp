<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<% Student student1 = (Student)session.getAttribute("student1"); 
report Report = (report)session.getAttribute("report"); 
String getSemester = (String)session.getAttribute("getSemester"); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadReport</title>

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
<link rel='stylesheet' href='css/UploadReport.css' type='text/css' />



<style>

/* * {
	box-sizing: border-box;
} */

/* style the container */
.container2 {
	position: relative;
	border-radius: 5px;

	padding: 20px 0 30px 0;
}


input:hover, .btn:hover {
	opacity: 1;
}

/* add appropriate colors to fb, twitter and google buttons */
.mju {

/* style inputs and link buttons */

	width: 60%;
	 height: 50px;
	border: none;
	border-radius: 4px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 18px;
    text-align: center;
    text-decoration: none;
	margin-top: 9%;
	background-color: #45a049;
	color: white;
}



input[type=button]:hover {
	background-color: #45a049;
}


/* Two-column layout */
.col2 {
	float: left;
	width: 50%;
	margin: auto;
	padding: 0 50px;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row2:after {
	content: "";
	display: table;
	clear: both;
}

/* vertical line */
.vl2 {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	border: 2px solid #ddd;
	height: 250px;
}

/* text inside the vertical line */
.vl-innertext2 {
	position: absolute;
	top: 50%;
	padding: 8px 10px;
}

/* hide some text on medium and large screens */
.hide-md-lg2 {
	display: none;
}

/* bottom container */
.bottom-container2 {
	text-align: center;
	background-color: #666;
	border-radius: 0px 0px 4px 4px;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
	.col2 {
		width: 50%;
		margin-top: 0;
	}
	/* hide the vertical line */
	.vl2 {
		display: none;
	}
	/* show the hidden text on small screens */
	.hide-md-lg2 {
		display: block;
		text-align: center;
	}
}

hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
    width: 80%;
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

<h3 style="color:#7EBC1B;" >ระบบให้คะแนนเอกสารรายงานฉบับสมบูรณ์  </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadlistStuPage?getCompanyid=<%=student1.getCompany_companyid()%>&getSemester=<%=getSemester%>" style="color:#FFFFFF;">รายชื่อนักศึกษา</a> / <a class="a2" href="#" style="color:#E28A06;"> ให้คะแนนเอกสารรายงานฉบับสมบูรณ์ </a></div>

</div></div></div>


<br>
</div>

<%if(Report != null){ %>
	    <%	
                 Date dt = new Date(student1.getStartdate().getTime());
				 Calendar c = Calendar.getInstance();
				 c.setTime(dt);
				 c.add(Calendar.DATE, 112);
				 dt = c.getTime();
				 String date = new SimpleDateFormat("dd/MM/yyyy").format(dt);
				 
				 
				  SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
                  Date dateString = formatter1.parse(Report.getSentdate().toString());
                 
                 String dateFString = new SimpleDateFormat("dd/MM/yyyy").format(dateString); 
                 String TString = new SimpleDateFormat("HH:mm").format(dateString); 
		%> 

		<div class="container2">
			<div class="row2">
				<h3 style="text-align: center; color:#850000;"> เอกสารรายงานผลการปฏิบัติงานสหกิจศึกษาฉบับสมบูรณ์ </h3>
				<br>
				<div class="vl2">
					<span class="vl-innertext2"></span>
				</div>

				<div class="col2" align="center">
					<a 	href="./document/<%=Report.getFilename()%>" class="mju btn"> <i class="fa fa-file-pdf-o" aria-hidden="true"></i> <%=Report.getFilename() %> </a>
					<br>
					<hr class="style13">
					<h5> <i class="fa fa-calendar" aria-hidden="true"></i> กำหนดส่งเอกสาร : <%=date%></h5>
					<h5> <i class="fa fa-calendar" aria-hidden="true"></i> ส่งเอกสารแล้วเมื่อ : <%=dateFString%> <i class="fa fa-clock-o" aria-hidden="true"></i> เวลา <%=TString%> น.</h5>
				</div>
                    <br> 
                 
               
				 <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right"> คะแนน </label>
									<div class="col-sm-4">
										<input type="text" id="score" name="score"
											class="form-control data" value="0">	
											
									</div>	
									<br><br><br><br>
					<div class="col-sm-12 text-center" >
										<a href="#"><button type="submit" class="btn btn-success">
												บันทึกการให้คะแนน </button></a>
										<button type="reset" class="btn btn-warning">ยกเลิก</button>
									</div>							
				 </div>
				 
				<br>
				

			</div>

		</div>

	<%}else{ %>
	<div class="container" style="margin-top: 35px;">
<div class="container" style="margin-top: -20px">
					<div class="row">
					<div class="col-lg-12">
							<div class="container">
							<br><br>						
								<hr class="colorgraph" size="10">
                                <br><br><br><br>
                                <h3 style="color:red">*นักศึกษายังไม่ได้ส่งเอกสารรายงานผลการปฏิบัติงานสหกิจศึกษาฉบับสมบูรณ์  ! </h3>              
                                <br><br><br><br>
							</div>
					</div>
					</div>
</div>
</div>
	<%} %>
	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>