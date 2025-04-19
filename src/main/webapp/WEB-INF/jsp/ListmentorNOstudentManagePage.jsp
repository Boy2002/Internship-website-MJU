<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

 <%EditStudentProfileDB SM = new EditStudentProfileDB(); %>
 <%teacherManager TM = new teacherManager(); %>
 <%int errormen_stu = 0; %>

<%
try{
	errormen_stu = (int)request.getAttribute("errormen_stu");
}catch(Exception e) {
	errormen_stu = 0;
	}
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
<% List<Mentor> listmentor = (List)session.getAttribute("listmentors"); 
String getSemester = (String)session.getAttribute("getSemester");
ListStudentDB ListStu = new ListStudentDB();
%>
<%int error = 0; %>
<%
try{
	error = (int)session.getAttribute("error");
}catch(Exception e) {
	error = 0;
	session.removeAttribute("error");
	
	}
%>
<%String mentoridforDeleteCASCADE = null; %>
<%
try{
	mentoridforDeleteCASCADE = (String)session.getAttribute("mentoridforDeleteCASCADE");
}catch(Exception e) {
	mentoridforDeleteCASCADE = null;
	session.removeAttribute("mentoridforDeleteCASCADE");
	
	}
%>
<%List<String> listmen_stu = new ArrayList<>(); %>
<%
try{
	listmen_stu = (List)session.getAttribute("listmen_stu");
}catch(Exception e) {
	listmen_stu = null;
	session.removeAttribute("listmen_stu");
	}
//System.out.println("listmen_stu = "+listmen_stu);
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
<title>Edit Student Profile</title>

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="https://kit.fontawesome.com/e18a64822c.js"></script>


<style type="text/css">
p {
font-family: "Webly Sleek SemiLight",Helvetica-,droid sans,sans-serif;
font-weight: normal;
margin: 0 0 1rem;
}

.centerbox {position: absolute;top:60%;
left:50%;
transform: translate(-50%, -50%);
-ms-transform: translate(-50%, -50%); /* IE 9 */
-webkit-transform: translate(-50%, -50%); /* Chrome, Safari, Opera */
width:620px;
min-height:52px;z-index:2
}

.centerbox h1 {
margin-bottom: 25px;
font-size:36px;font-family: "Webly Sleek SemiLight";
font-weight: normal;text-align: center;
}

.centerbox p.description {
margin-bottom:40px;
text-align: center;
}

.description a {
text-decoration:none;
}

.main-input { background: #fff;
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
padding:0px 0px 0px 57px;
font-size:16px;border-right:0px;
background: #ffffff url("http://seodesigns.com/projects/TD/images/search.png") 18px 15px no-repeat;
background-size:18px 18px;
float:left;
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
  width:141px;
  height:50px;
  border: 0pxpadding-top:0px;
  float:left;
  }
  
#main-submit:hover { background: #00a221; color: #fff !important; -webkit-appearance: none; }
#main-submit-mobile {display: none;}
footer { border-top: 0px;}
.main-btn {display: inline-block;width:150px;height:50px;border: 1px solid #cccccc;padding:0px;position: relative;float:left;border-right:0px;background: #ffffff ;background-size:6px 6px;cursor: pointer;}
.search-small {font-size:12px;margin:0px;color:#9B9B9B;position: absolute;top: 6px;left:16px;display: inline-block;width:80px;height:20px;text-align:left;}
.search-large {font-size:16px;margin:0px;color:#4A4A4A;position: absolute;top: 19px;left:16px;display: inline-block;width:105px;height:20px;font-weight:900;text-align:left;}
.main-form-container {height:50px;position: relative;}
ul.search-description {width:150px;position: absolute; background: #fff;right:143px;top:55px;
border-radius: 2px; -moz-border-radius: 2px; -webkit-border-radius: 2px;padding:14px 0px;border: 1px solid #E5E5E5;display: none;
-webkit-box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
-moz-box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
}
.search-description li {font-size:16px;color:#4A4A4A;font-weight:900;padding:6px 0px;display:block;padding-left:16px;cursor: pointer;}
.search-description li:hover {background:#f8f8f8;}


/* responsive css below */
@media only screen and (max-width: 680px) {
    .main-btn {border-radius: 0px 4px 4px 0px; -moz-border-radius: 0px 4px 4px 0px; -webkit-border-radius: 0px 4px 4px 0px;border-right:1px solid #cccccc;}
    ul.search-description {right:0px;z-index:9999;}
    .centerbox p.description {width:284px;margin:0 auto 40px auto;}
    .centerbox {width:auto;transform: translate(-50%, -60%);
    -ms-transform: translate(-50%, -60%); /* IE 9 */
    -webkit-transform: translate(-50%, -60%); /* Chrome, Safari, Opera */
    }
    .main-form-container {width:477px}
    #main-submit {display: none;}
    #main-submit-mobile { background: #3cb13c;color: #fff; display:block; font-size: 19px; font-weight: 500;text-align: center; cursor: pointer;margin-bottom: 0px; -webkit-appearance: none;border-radius: 0px; -moz-border-radius: 0px; -webkit-border-radius: 0px;width:141px;height:50px;border: 0px;padding-top:0px;float:none;border:0px;position: fixed;bottom: 0px;right:0px;width: 100%;z-index:1;}
    #main-submit-mobile:hover { background: #00a221; color: #fff !important; -webkit-appearance: none; }
    footer {padding-bottom:50px;}
}

@media only screen and (max-width: 515px) {
    .main-input {width:210px;}
    .main-form-container {width:360px}
    .centerbox h1 {width:280px;margin:0 auto 15px auto;}
    .centerbox {position: absolute;top:50%;left:50%;
    }
}

@media only screen and (max-width: 375px) {
    .cover {background: rgba(0, 0, 0, 0) url("seodesigns.com/projects/TD/images/background.jpg") no-repeat center -175px;}
    .main-input {width: 185px;padding-left:42px;background: #ffffff url("http://seodesigns.com/projects/TD/images/search.png") 12px 15px no-repeat;background-size:18px 18px;}
    .main-btn {width:108px;background: #ffffff url("http://seodesigns.com/projects/TD/images/main-bullet.png") 85px 23px no-repeat;background-size:6px 6px;}
    .main-form-container {width:293px}
    .search-small {left:13px;}
    .search-large {left:13px;}
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
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/student.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลพนักงานพี่เลี้ยง </h3>
<div class="nav1" style="color:#FFFFFF;"> <a class="a2" href="#" style="color:#E28A06;"> รายชื่อพนักงานพี่เลี้ยง </a></div>

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
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> ส่งข้อมูลสำเร็จ : </strong> ส่งข้อมูลเรียบร้อยแล้ว  
</div>
<%session.removeAttribute("error"); %>
<%} %>
<%if(error == -1){ %>
 <script>
            Swal.fire({
                icon: 'error',
                title: 'มีนักเรียนที่ดูแลอยู่!',
                html: '<p>รายการรหัสนักเรียนที่พี่เลี้ยงดูแล:</p><ul style="display: inline-block; text-align: left;">' + 
                      '<c:forEach items="${listmen_stu}" var="listmen_stu">' +
                      '<li>${listmen_stu}</li>' +
                      '</c:forEach></ul>',
                showCancelButton: true,
                confirmButtonText: '<a href="${pageContext.request.contextPath}/loaddeletementorforteacher?idMentor=<%=mentoridforDeleteCASCADE%>" style="color:#FFFFFF">ยืนยันการลบ</a>',
                cancelButton:'ยกเลิก'
            });
        </script>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> ส่งข้อมูลไม่สำเร็จ : </strong> กรุณาตรวจสอบข้อมูลพี่เลี้ยง 
</div>

        <%session.removeAttribute("error"); %>
        <%session.removeAttribute("listmen_stu"); %>
<%} %>
<%if(errorsession == 1 || Teacher == null){ %>
<script>
Swal.fire({
  icon: 'error',
  title: 'SESSION ERROR !',
  text: 'กรุณาเข้าสู่ระบบใหม่ !',
  confirmButtonText: '<a href="${pageContext.request.contextPath}/loadlogin" style="color:#FFFFFF">ตกลง</a>'
})
</script>
<%}else{ %>
<br><br>


	<div class="container" style="margin-top: 35px;">
   				
					         
                 <br> 
                      
				<div id="tableSericeRequestForm">
				<div align = "right">
				<a href = "${pageContext.request.contextPath}/loadaddmentorPage" class="btn btn-primary" ><i class="fa fa-fw -square -circle fa-plus-square" ></i> เพิ่มข้อมูลพี่เลี้ยง </a>
				</div>
				<br>
                <table class="table table-bordered" id="myTable">
                    <thead class="table-info">
                        <tr>
                            <th>ชื่อพนักงานพี่เลี้ยง</th>
                            <th>นามสกุลพนักงานพี่เลี้ยง</th>
                            <th>ตำแหน่งงานพี่เลี้ยง</th>
                            <th>อีเมล</th>
                            <th>เบอร์โทรศัพท์</th>
                            <th>รหัสผ่าน</th>
                            <th>ส่งบัญชีเข้าใช้งาน</th>
                            <th>แก้ไข</th>
                           <th>ลบ</th>
                           
                        </tr> 
                    </thead>   
                    <tbody>
 
            		<%if(listmentor != null && !listmentor.isEmpty() ){ %>
                    <%for(Mentor MM : listmentor){ %>
                        <tr>
                            <th><%=MM.getMentorprefix() %> <%=MM.getMentorname()%></th>
                            <th><%=MM.getMentorlastname()%></th>
                            <th><%=MM.getMentorposition() %></th>
                            <th><%=MM.getMetoremail()%></th>
                            <th><%=MM.getPhonenumber()%></th> 
                            <th><%=MM.getPassword()%></th> 
						<th align="center" style="text-align: center;">
						    <a href="${pageContext.request.contextPath}/sendEmail?to=wanchai.w16@gmail.com&subject=Email Mentor for Assessment&content=เรียน%20คุณ <%=MM.getMentorname() %> <%=MM.getMentorlastname() %>,%0A%0Aเราขอแจ้งให้ทราบว่าเว็บไซต์สหกิจศึกษาของสาขาเทคโนโลยีสารสนเทศ%20มหาวิทยาลัยแม่โจ้เชียงใหม่%20ได้ดำเนินการจัดส่งนักศึกษาไปฝึกสหกิจศึกษาตามบริษัทที่กำหนดเรียบร้อยแล้ว%0A%0Aหลังจากการฝึกสหกิจศึกษาเสร็จสิ้น%20ทางเราขอให้พี่เลี้ยงทำการล็อกอินเข้าสู่เว็บไซต์เพื่อทำการประเมินนักศึกษา%20โดยรายละเอียดการเข้าล็อกอินจะถูกส่งไปยังอีเมล์ที่นักศึกษาได้รับ%0A%0Aรายละเอียดการเข้าล็อกอิน:%0Aอีเมล์:%20<%=MM.getMetoremail()%>%0Aรหัสผ่าน:%20<%=MM.getPassword()%>%0Aเว็บไซต์สหกิจศึกษาสาขาเทคโนโลยีสารสนเทศ:%20https://itsci.mju.ac.th/coopedu/%0A%0Aหากมีข้อสงสัยหรือต้องการความช่วยเหลือเพิ่มเติม%20สามารถติดต่อได้ที่ฝ่ายสนับสนุนของเว็บไซต์.%0A%0Aขอบคุณมากค่ะ/ครับ,%0Aทีมงานสหกิจศึกษามหาวิทยาลัยแม่โจ้เชียงใหม่">
						        <i class="fa-solid fa-envelope" style="font-size:30px; color: #f2ae2e;" ></i>
						    </a>
						</th>


   
                            
                            <th>
                            <a href ="${pageContext.request.contextPath}/loadEditmentorPage?idMentor=<%=MM.getMentorid()%>"><i class="fa-solid fa-user-pen" style="font-size:30px;"></i></a>     
                            </th>
                            <th><button style="background-color: transparent; border: 0px"  onclick="alertDelete(<%=MM.getMentorid()%>)"><i class="fa-solid fa-delete-left" style="font-size:30px; color:red;"></i></button></th>
                        </tr>                    
                    <%} %>
                      <%}else{ %>
                 <tr>
                    	 <td colspan = "6" align="center"><h5 style="color:#850000"> <i class="fa fa-ban"></i> ไม่มีข้อมูลพนักงานพี่เลี้ยง </h5></td>
                </tr>
                    <%} %>
                    </tbody>    
                              
                </table>
				</div>	
<!--Test Send Email sevlet /sendEmail  -->				
<%-- 				
<form action="${pageContext.request.contextPath}/sendEmail" method="post">
    <label for="to">To:</label>
    <input type="email" id="to" name="to"><br><br>
    <label for="subject">Subject:</label>
    <input type="text" id="subject" name="subject"><br><br>
    <label for="content">Content:</label><br>
    <textarea id="content" name="content" rows="4" cols="50"></textarea><br><br>
    <input type="submit" value="Send Email">
</form> --%>



					  			      
	</div>
 <%} %>
<script type="text/javascript">
$(document).ready(
        function() {
            $('#myTable').after(
                    '<div id="nav" class="pagination"  style="margin-left: 40%; width:100%;"></div>');
            var rowsShown = 10;
            var rowsTotal = $('#myTable tbody tr').length;
            var numPages = rowsTotal / rowsShown;
            for (i = 0; i < numPages; i++) {
                var pageNum = i + 1;
                $('#nav')
                        .append(
                                '<a href="#" rel="'+i+'" >' + pageNum
                                        + '</a> ');
            }
            $('#myTable tbody tr').hide();
            $('#myTable tbody tr').slice(0, rowsShown).show();
            $('#nav a:first').addClass('active');
            $('#nav a').bind(
                    'click',
                    function() {

                        $('#nav a').removeClass('active');
                        $(this).addClass('active');
                        var currPage = $(this).attr('rel');
                        var startItem = currPage * rowsShown;
                        var endItem = startItem + rowsShown;
                        $('#myTable tbody tr').css('opacity', '0.0')
                                .hide().slice(startItem, endItem).css(
                                        'display', 'table-row')
                                .animate({
                                    opacity : 1
                                }, 300);
                    });
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
function alertDelete(mentorid) {
    Swal.fire({
        icon: 'warning',
        title: 'คุณต้องการลบหรือไม่',
        showDenyButton: true,
        confirmButtonText: 'ตกลง',
        denyButtonText: 'ยกเลิก'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "${pageContext.request.contextPath}/loaddeletmentorforTeacher?idMentor=" + mentorid;
        }
    });
}
</script>
<jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>