<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Student student = (Student) session.getAttribute("student");
%>
<%
	String Reportname = (String) session.getAttribute("Reportname");
%>
<%
	String Reportid = (String) session.getAttribute("Reportid");
    report FRP = (report) session.getAttribute("FRP");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditReport</title>
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
<link rel='stylesheet' href='css/UploadReport.css' type='text/css'/>





<style type="text/css">
.container1 {
  padding: 50px 10%;
}

.box {
  position: relative;
  background: #FCFAF1;
  width: 100%;
}

.box-header {
  color: #444;
  display: block;
  padding: 10px;
  position: relative;
  border-bottom: 1px solid #f4f4f4;
  margin-bottom: 10px;
}

.box-tools {
  position: absolute;
  right: 10px;
  top: 5px;
}

.dropzone-wrapper {
  border: 2px dashed #91b0b3;
  color: #92b0b3;
  position: relative;
  height: 150px;
}

.dropzone-desc {
  position: absolute;
  margin: 0 auto;
  left: 0;
  right: 0;
  text-align: center;
  width: 40%;
  top: 50px;
  font-size: 16px;
}

.dropzone,
.dropzone:focus {
  position: absolute;
  outline: none !important;
  width: 50%;
  height: 150px;
  cursor: pointer;
  opacity: 0;
}

.dropzone-wrapper:hover,
.dropzone-wrapper.dragover {
  background: #ecf0f5;
}

.preview-zone {
  text-align: center;
}

.preview-zone .box {
  box-shadow: none;
  border-radius: 0;
  margin-bottom: 0;
}

</style>

<script type="text/javascript">

function validateForm(frm){
	if(frm.img_logo.value == ""){
		alert("กรุณาส่งไฟล์นามสกุลไฟล์  PDF");
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

<h3 style="color:#7EBC1B;" >ระบบอัปโหลดแก้ไขเอกสาร</h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadnotifyPage" style="color:#FFFFFF;">ส่งเอกสารรายงานความก้าวหน้าการฝึกสหกิจ</a> / <a class="a2" href="#" style="color:#E28A06;">อัปโหลดแก้ไขเอกสาร </a></div>

</div></div></div>
<br>
</div>

	<div class="container" style="margin-top: 35px;">
	<form name="frm" method="POST" enctype="multipart/form-data"action="${pageContext.request.contextPath}/EditReport">
	    <section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					<div class="col-lg-12">
							<div class="container">
							<br><br>
							                             
                         <div class="form-group row" style = "margin-left:200px">
									<label class="col-sm-2 col-form-label text-right">ชื่อเอกสาร </label>
									<div class="col-sm-4">
										<input type="text" id="Reportname" name="Reportname"
											class="form-control data" value="<%=Reportname%>"  readonly>
									</div>	
									
										
								</div>
									<div class="form-group row" style = "margin-left:370px">
											 <a href="./document/<%=FRP.getFilename()%>" target="_blank" ><h5><i class="fa fa-file-pdf-o" ></i> เปิดไฟล์เอกสาร </h5></a> 
									</div>	
								
							
								<div class="form-group" align = "center" >
								
								   <div class="col-sm-6">								   	 
												<div class="preview-zone hidden" >
													<div class="box box-solid">
														<div class="box-header with-border">
															<div class="box-tools pull-right">
																
															</div>
														</div>
														<div class="box-body"></div>
													</div>
												</div>
												
												<div class="dropzone-wrapper">
													<div class="dropzone-desc">
														<i class="glyphicon glyphicon-download-alt"></i>
														<p><i class='fa fa-file-pdf-o' style='font-size:36px'></i></p>
														<p>เลือกไฟล์หรือลากมาที่นี่. </p>
													</div>
													<input type="file" name="img_logo" class="dropzone"
														accept=".pdf">
												</div>
											</div>
                                           </div>
											<script src="assets/app.js"></script>
	<script>
		function readFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					var htmlPreview = '<img width="200" src="' + e.target.result + '" />'
							+ '<p>' + input.files[0].name + '</p>';
					var wrapperZone = $(input).parent();
					var previewZone = $(input).parent().parent().find(
							'.preview-zone');
					var boxZone = $(input).parent().parent().find(
							'.preview-zone').find('.box').find('.box-body');

					wrapperZone.removeClass('dragover');
					previewZone.removeClass('hidden');
					boxZone.empty();
					boxZone.append(htmlPreview);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}

		function reset(e) {
			e.wrap('<form>').closest('form').get(0).reset();
			e.unwrap();
		}

		$(".dropzone").change(function() {
			readFile(this);
		});

		$('.dropzone-wrapper').on('dragover', function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).addClass('dragover');
		});

		$('.dropzone-wrapper').on('dragleave', function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).removeClass('dragover');
		});

		$('.remove-preview').on('click', function() {
			var boxZone = $(this).parents('.preview-zone').find('.box-body');
			var previewZone = $(this).parents('.preview-zone');
			var dropzone = $(this).parents('.form-group').find('.dropzone');
			boxZone.empty();
			previewZone.addClass('hidden');
			reset(dropzone);
		});
	</script>
									
																																								
								
							
								<br><br>
									<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" OnClick ="return validateForm(frm)" class="btn btn-success">
												อัปโหลดเอกสาร </button></a>
									<a href = "${pageContext.request.contextPath}/loadnotifyPage" class="btn btn-warning" >ยกเลิก </a>
									</div>
								</div>
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