<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<%  List<Student> student = (List)session.getAttribute("student"); 
String getSemester = (String)session.getAttribute("getSemester");
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
	ListStudentDB ListStu = new ListStudentDB();
	ListmentorDB Listmentor = new ListmentorDB();
    ListCompanyDB company = new ListCompanyDB();
    AssessmentDB asDB = new AssessmentDB();
    AddQuestionDB aqDB = new AddQuestionDB();
%>

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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลนักศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"> <a class="a2" href="#" style="color:#E28A06;"> รายชื่อนักศึกษา </a></div>

</div></div></div>
<br>
</div>

<%if(error == 1){ %>
<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> ลบข้อมูลสำเร็จ : </strong> บันทึกข้อมูลเรียนร้อยแล้ว  
</div>
<%} %>
<%if(error == -1){ %>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-xmark"></i> ลบข้อมูลไม่สำเร็จ : </strong> กรุณากรอกข้อมูลใหม่  
</div>
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

	<div class="container" style="margin-top: 35px;">
		<br> <br>
		<section id="content">
			<div class="container" style="margin-top: -20px">
				<div class="row">
					<div class="col-lg-12">
					 <form name="frm" method="post" action="${pageContext.request.contextPath}/SearhAllAnswerMentor" >
						<div class="container">
							<h3 style="color:#850000;" >รายชื่อนักศึกษาฝึกสหกิจ </h3>
							<hr class="style13">
							
							<div class="form-group row">
							<div class="centerbox">
                           <div class="main-form-container">
                          
                           
                           <input type="text" class="main-input main-name" name="NAME" placeholder ="รหัสนักศึกษา" onfocus="clearText(this)" onblur="replaceText(this)" />                                  
        
                           <% List<String> semester =  ListStu.AllListsemester(); %>
                                        <select class="main-btn" name="searchDate" id="searchDate" >                                                                                    
                                             <%for(int i = 0; i<semester.size(); i++){ %>  
                                                 <%if(semester.get(i).equals(getSemester)){ %>
                                                 <option selected value="<%=semester.get(i)%>"><%=semester.get(i)%></option>         
                                                 <%}else{ %> 
                                                 <option value="<%=semester.get(i)%>"><%=semester.get(i)%></option>  
                                                 <%} %> 
                                                
                                             <%} %>
                                       
                                        </select>
                      
                         
                           <input id="main-submit" class="" type="submit" value="ค้นหา" />
                           
                           </div>
                           </div>
                           </div>
                           <br><br> <br><br><br> <br>
                      
               			
						</div>
						 </form>
					</div>
					
			

				</div>
			</div>
		</section>
	</div>
	<div class="container" style="margin-top: 35px;">
    <div align="right">
        <a href="${pageContext.request.contextPath}/ExportAllAnswerMentor?searchDate=<%=getSemester%>" class="btn btn-primary">
            <i class="fa-solid fa-file-export"></i> Export Excel File
        </a>
    </div>
    <h3><span style="color:#006ebc;">ผลการประเมินสหกิจศึกษาของอาจารย์นิเทศ</span> <%=getSemester%> </h3>
    <h5>จำนวนนักศึกษา <%=student.size() %> คน </h5>
    <hr>
	
    <table class="table table-bordered" id="myTable">
        <thead class="table-info">
            <tr align="center">
                <th>อาจารย์นิเทศสหกิจศึกษา</th>
                <th>บริษัท</th>
                <th>รายชื่อนักศึกษา</th> 
                <%List<Mentor> ListM = Listmentor.AllListmentorManage(getSemester);%>
                <% Set<Integer> answeredQuestions = new HashSet<>(); %>
                <% List<question> ListQ = aqDB.ListAllQuestion(); %>
                <% if (ListM != null && !ListM.isEmpty()) { %>
                  
                    <% for (Mentor m : ListM) { %>
                        <% if (student != null && !student.isEmpty()) { %>
                            <% for (Student S : student) { %>
                                <% List<mentoranswer> mans = asDB.CheckAssessmentMentorAnswer(m.getMentorid(), S.getIdstudent()); %>
                                <% if (mans != null && !mans.isEmpty()) { %>
                                    <% for (mentoranswer ma : mans) { %>
                                        <% answeredQuestions.add(ma.getQuestionid_ans()); %>
                                    <% } %>
                                <% } %>
                            <% } %>
                        <% } %>
                    <% } %>

                     <%int contquestion = 1; %>
                    <% for (question que : ListQ) { %>
                        <% if (answeredQuestions.contains(Integer.parseInt(que.getQuestionid()))) { %>
                            <th><%=contquestion%>. <%= que.getQuestiontext() %></th>
                            <%contquestion = contquestion+1; %>
                        <% } %>
                    <% } %>
                <% } else { %>
                    <th colspan="6" align="center"><h5 style="color:#850000"><i class="fa fa-ban"></i> ไม่มีข้อมูลนักศึกษา </h5></th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <% if (ListM != null && !ListM.isEmpty()) { %>
                <% for (Mentor m : ListM) { %>
                    <% if (student != null && !student.isEmpty()) { %>
                        <% for (Student S : student) { %>
                            <% List<mentoranswer> mans = asDB.CheckAssessmentMentorAnswer(m.getMentorid(), S.getIdstudent()); %>
                            <% if (mans != null && !mans.isEmpty()) { %>
                                <% Company com = company.Searchcompanyid(S.getCompany_companyid()); %>
                                <tr align="center">
                                    <td><%= m.getMentorname()%> <%= m.getMentorlastname() %></td>
                                    <td><%= com.getCompanyname() %></td>
                                    <td><%= S.getIdstudent() %> <%= S.getStudentname() %> <%= S.getStudentlastname() %></td>
                                    <% for (question que : ListQ) { %>
                                        <% if (answeredQuestions.contains(Integer.parseInt(que.getQuestionid()))) { %>
                                            <% boolean answered = false; %>
                                            <% for (mentoranswer ma : mans) { %>
                                                <% if (Integer.parseInt(que.getQuestionid()) == ma.getQuestionid_ans()) { %>
                                                    <td><%= ma.getScore() %></td>
                                                    <% answered = true; %>
                                                <% } %>
                                            <% } %>
                                            <% if (!answered) { %>
                                                <td>-</td> <!-- หรือช่องว่างแทน "-" ถ้าต้องการ -->
                                            <% } %>
                                        <% } %>
                                    <% } %>
                                </tr>
                            <% } %>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="6" align="center"><h5 style="color:#850000"><i class="fa fa-ban"></i> ไม่มีข้อมูลนักศึกษา </h5></td>
                        </tr>
                    <% } %>
                <% } %>
            <% } %>
        </tbody>
    </table>
</div>
<%} %>
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

<!-- <script type="text/javascript">
$(document).ready(
        function() {
            $('#myTable').after(
                    '<div id="nav" class="pagination" ></div>');
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
</script>   -->
	             <jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>