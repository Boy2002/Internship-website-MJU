<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<%Student student = (Student)session.getAttribute("student");%>
<%String Reportname = (String)session.getAttribute("Reportname");%>
<%String Reportid = (String)session.getAttribute("Reportid");%>
<%List<Student> Lstd = (List)session.getAttribute("Lstd"); %>
<%VDO Fvdo = (VDO)session.getAttribute("Fvdo"); %>
	
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
<link rel="stylesheet" href="./css/StepVDO.css">
<link rel='stylesheet' href='css/UploadReport.css' type='text/css' />

<script src="https://kit.fontawesome.com/e18a64822c.js"></script>

<style type="text/css">

hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
}
</style>

<script type="text/javascript">

function validateForm(frm){
		
	if(frm.URLvdo.value == ""){
		alert("กรุณากรอก URL วิดีโอ");
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

<h3 style="color:#7EBC1B;" >ระบบอัปโหลดวิดีโอการฝึกปฏิบัติงานสหกิจศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadnotifyPage" style="color:#FFFFFF;">ส่งเอกสารรายงานความก้าวหน้าการฝึกสหกิจ</a> / <a class="a2" href="#" style="color:#E28A06;">อัปโหลดวิดีโอ </a></div>

</div></div></div>
<br>
</div>




<div class="container position-relative">
  <div class="card mt-4 mb-4">
    <div class="card-body">
      <div class="media">
        <div class="media-body">
        
        <div class="container" align = "left">
  

  
  <form  method="POST" id="frm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/EditVDO" >
    
  
    <div class="form-group" align = "center">
     <%String[] arr = Fvdo.getFilename().split("https://youtu.be/"); %>
     <%if(Fvdo.getFilename().contains("https://youtu.be/")){ %>
      <iframe width="350" height="300" src="https://www.youtube.com/embed/<%=arr[1]%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 
     <%}else{ %>
     <h5>*URL youtube ไม่ถูกต้องกรุณาส่งใหม่ </h5>
     <%} %> 
        </div>   
    <div class="form-group">
      <h3>ขั้นตอนที่ 1 </h3>
      <h5>ให้นักศึกษาทำการอัพวิดีโอลง youtube  <a href="https://support.google.com/youtube/answer/57407?hl=th&co=GENIE.Platform%3DDesktop"> <i class="fa-solid fa-circle-info"></i> อ่านเพิ่มเติม </a> </h5>
      <br>
    </div>
    
    
     <div class="form-group">
      <h3>ขั้นตอนที่ 2 </h3>
      <h5>ให้นักศึกษาทำการกดแชร์วิดีโอ <i class="fa-solid fa-arrow-right"></i> กดไปที่แชร์วิดีโอ <i class="fa-solid fa-arrow-right"></i> คัดลอก URL ทั้งหมด <a href="https://support.google.com/youtube/answer/57741?hl=th&co=GENIE.Platform%3DDesktop"> <i class="fa-solid fa-circle-info"></i> อ่านเพิ่มเติม </a> </h5>
      <img src="./images/exampleVDO.png"
								width="500" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">
     
      <br>
    </div>
   
    
    
      <br>
      <div class="form-group">
      <h3>ขั้นตอนที่ 3 </h3>
      <h5>ให้นักศึกษาทำการ ใส่ URL วิดีโอ </h5>
      <input type="text" id="URLvdo" name="URLvdo" class="form-control data" >
      <br>
       <button class="btn btn-primary nextBtn btn-lg" OnClick ="return validateForm(frm)" type="submit" >Submit</button>
    </div>
						

  </form>
  
</div>

        </div>
        </div>
        </div>
       </div>
      </div>




	<div class="container" style="margin-top: 35px;">
	
	    <section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					<div class="col-lg-12">
							<div class="container">
							<br><br>
							
     
							
							    <br> <br>
								<h5 style="color:#850000" > รายชื่อนักศึกษาที่เข้าร่วมฝึกสหกิจ</h5>								
						        <hr class="style13">
								<br>
													
							  <table class="table table-bordered" id="myTable">
                    <thead class="table-info">
                        <tr>
                            <th> รหัสนักศึกษา </th>
                            <th> ชื่อ - นามสกุล </th>
                            <th> ตำแหน่งงาน </th>
              
                        </tr> 
                    </thead>   
                    <tbody>
              
                    <%for(Student stu : Lstd){ %>
                        <tr>
                            <th><%=stu.getIdstudent()%></th>
                            <th><%=stu.getStudentname()%> <%=stu.getStudentlastname()%></th> 
                             <th><%=stu.getWorkposition()%></th> 
                        </tr>                    
                    <%} %>
                    </tbody>              
                </table>
								<br><br>
								
															
							</div>
					</div>
					</div>
				</div>
		</section>
	</div> 
	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>