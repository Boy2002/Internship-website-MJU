<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
List<Student> student = (List)session.getAttribute("StuSemester"); 
List<teacher> teacherList = (List)session.getAttribute("teacherList"); 

ListStudentDB ListStu = new ListStudentDB();

String getSemester = (String)session.getAttribute("getSemester");


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
<link rel="stylesheet" href="./css/web_css.css">


<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
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

<h3 style="color:#7EBC1B;" >สรุปคะแนนเอกสารสหกิจ </h3>
<div class="nav1" style="color:#E28A06;"><a href="${pageContext.request.contextPath}/loadlistcomPage" style="color:#E28A06;"> สรุปคะแนนเอกสารสหกิจ </a></div>

</div></div></div>
<br>
</div>
<!-- mobile submit -->

<br><br>


<%
String Rid = null;
for(int i = 0;i<student.size();i++){ 
 Rid = ListStu.AllReportStuid(student.get(i).getIdstudent()); 
if(Rid != null){
	break;
}
} %>

<%List<teacher> TC = ListStu.AllReportTname(Rid);%>

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

	<div align = "center">
	
	<div class="col-lg-12">
	<div class="container">	
	<h3 style="color:#850000;" align = "left">  สรุปคะแนนรายงานเอกสารฉบับสมบูรณ์และวิดีโอนำเสนอ </h3>
	<hr class="style13">
	</div>
	</div>
	
	
	 <form name="frm" method="post" action="${pageContext.request.contextPath}/SearchListAllAssessmentBySemesterPage" >
	 <div class="form-group row" style = "margin-right:100px">
	 
									<div class="col-sm-12" align = "center">
							<label class="col-sm-2 col-form-label text-right"> ภาคการศึกษา </label>
                           <% List<String> semester =  ListStu.AllListsemester(); %>
                                       <select name="searchDate" id="searchDate" >                                                                                    
                                             <%for(int i = 0; i<semester.size(); i++){ %>  
                                              
                                                 
                                                 <%if(semester.get(i).equals(getSemester)){ %>
                                                 <option selected value="<%=semester.get(i)%>"><%=semester.get(i)%></option>         
                                                 <%}else{ %> 
                                                 <option value="<%=semester.get(i)%>"><%=semester.get(i)%></option>  
                                                 <%} %>  
                                             <%} %>                                   
                                        </select>
                                      &nbsp;   <a href="#"><button type="submit" class="btn btn-success">
												<i class="fa-sharp fa-solid fa-magnifying-glass"></i> </button></a>
                                       
                           </div>
                           
                           </div>	
                 </form>          
     <table class="table table-bordered" id="myTable" style="width:40%" > 
     <thead class="table-info" align = "center">
     <tr>
      <th>  รหัสอาจารย์ </th>
      <th>  ชื่ออาจารย์ </th>
     </tr>    
     </thead>
     <tbody>
      <%if(TC.size() != 0 ){ %>
     <%for(teacher TE : TC){ %>
     <tr>
      <th> T<%=TE.getTeacherid() %> </th>
      <th> <%=TE.getTeachername()%> <%=TE.getTeacherlastname() %></th>
     </tr>
	 <%} %>
	  <%}else{ %>
	  <tr>
        <td colspan = "6" align="center"><h5 style="color:#850000"> <i class="fa fa-ban"></i> ไม่มีข้อมูลอาจารย์ </h5></td>
      </tr>
	  <%} %>
     </tbody>
     </table>                   
      <br><br>     
      
       <%--  <%System.out.println(getSemester); %> --%>   
       
       <%if(Teacher.getTeachertype().equals("3")){ %>    
               <div align = "right" style = "margin-right:45px; padding: 10px">
             
               <a href = "${pageContext.request.contextPath}/ExportAllAnswerTeacher?searchDate=<%=getSemester%>" class="btn btn-primary" ><i class="fa-solid fa-file-export"></i> คำตอบอาจารย์ </a>
               <a href = "${pageContext.request.contextPath}/ExportAllAnswerMentor?searchDate=<%=getSemester%>" class="btn btn-primary" ><i class="fa-solid fa-file-export"></i> คำตอบพี่เลี้ยง  </a>
				<a href = "${pageContext.request.contextPath}/ExportListAllAssessmentBySemester?getsemester=<%=getSemester%>" class="btn btn-success" ><i class="fa-solid fa-file-export"></i> Export file Excel </a>
				
				</div>  
		<%} %>                      					
	<table class="table table-bordered" id="myTable" style="width:95%" >
								<thead class="table-info" align = "center">
								<tr>
								 <th colspan="<%=TC.size()+TC.size()+7 %>"> <%=getSemester%> </th>
								</tr>
									<tr>									
										<th rowspan="2"> รหัสนักศึกษา </th>
										<th rowspan="2"> ชื่อนักศึกษา </th>										
										<th  colspan="<%=TC.size()+1%>"> คะแนนรายงาน (10) </th>
										<th  colspan="<%=TC.size()+1%>"> คะแนนการนำเสนอ (10) </th>	
										<th  colspan="1"> คะแนนประเมินอาจารย์ (20) </th>
										<th  colspan="1"> คะแนนประเมินพี่เลี้ยง (60) </th>	
										<th  colspan="1"> คะแนนรวม (100) </th>	
																																				
									</tr>
									<tr>
									<%for(teacher T : TC){ %>
										<th> T<%=T.getTeacherid() %> </th>
										<%} %>
									<th> คะแนนรายงานเฉลี่ย </th>
									<%for(teacher T : TC){ %>
										<th> T<%=T.getTeacherid() %> </th>
										<%} %>
									<th> คะแนนนำเสนอเฉลี่ย </th>
									<th> คะแนนอาจารย์เฉลี่ย </th>
									<th> คะแนนพี่เลี้ยงเฉลี่ย </th>
									<th> คะแนนรวม </th>
									</tr>
								</thead>
								<tbody>
								
								<%for(Student stu : student){ %>
								<%double totalScore = 0; %>
								<%double scoreSUM = 0; %>
								<%double scoreVDOSUM = 0; %>
								<%int SUMTC = 0; %>
                                        <tr align = "center"> 
                                        <th><%=stu.getIdstudent() %></th>   
                                        <th><%=stu.getStudentname()%> <%=stu.getStudentlastname() %></th> 
                                        
                    
								<%String RidSUM = ListStu.AllReportStuid(stu.getIdstudent()); %>
								
								<%for(teacher T : TC){ %>		
								<%double score = ListStu.scoreSTU(RidSUM , T.getTeacherid()); %>
								<%if(score<0){ %>
									 <th>-</th>  
								<%}else{ %>					
								  <%scoreSUM = scoreSUM+score; %>
									<%SUMTC ++; %>
									 <th><%=score %></th>  
									 
								  <%} %>
								    <%} %>
								  
								    <%Double AVG = scoreSUM/SUMTC;%>
								   <%Double avgscore = ( Math.floor(AVG * 100) / 100 );%> 
	   
								   <%if(Double.isNaN(avgscore)){ %>
								        <th style = "background-color: #FF8F8F;">0</th> 
								         <%totalScore = totalScore+0; %>
								     <%}else{ %>  							      
								        <th style = "background-color: #61DD99;"><%=avgscore%></th>
								         <%totalScore = totalScore+avgscore; %> 
								     <%} %>   
								   
								 <%SUMTC = 0; %>  
								<%for(teacher T : TC){ %>		
								<%double scorevdo = ListStu.scoreSTUVDO(stu.getIdstudent() , T.getTeacherid()); %>
								
								<%if(scorevdo<0){ %>
								  <th>-</th>
								  <%}else{ %>
								  <%scoreVDOSUM = scoreVDOSUM+scorevdo; %>
								<%SUMTC ++; %>
								  <th><%=scorevdo %></th>
								  <%} %>
								  <%} %> 
								  
								    <%Double AVGvdo = scoreVDOSUM/SUMTC;%>
								   <%Double avgscorevdo = ( Math.floor(AVGvdo * 100) / 100 );%>
								   
								   <%if(Double.isNaN(avgscorevdo)){ %>
								        <th style = "background-color: #FF8F8F;">0</th> 
								        <%totalScore = totalScore+0; %> 
								     <%}else{ %>  							      
								        <th style = "background-color: #61DD99;"><%=avgscorevdo%></th> 
								        <%totalScore = totalScore+avgscorevdo; %> 
								     <%} %>
								     
								     <%ScoreAssessmentDB asDB = new ScoreAssessmentDB();
								     
								     List<teacheranswer> Listtans = asDB.Allteacheranswer(stu.getIdstudent());
								     List<mentoranswer> Listmans = asDB.Allmentoranswer(stu.getIdstudent());
								     List<mentoranswer> countmentoranswer = asDB.countmentoranswer(stu.getIdstudent());
								     
								     //System.out.println("Size countmentoranswer = "+countmentoranswer.size()+" of Studentid "+stu.getIdstudent());
								     
								     double sumScoreTeacher = 0.0; 
								      double sumScoreMentor =0.0;
								      double totalFormtea =0.0;
								      double totalFormmen =0.0;
								     
								     
								     CreateformDB cfDB = new CreateformDB();
								     Teacherassessmentform tf = new Teacherassessmentform();
								   		if(!Listtans.isEmpty()){
								   			//System.out.println(Listtans.get(0).getTeacherformid_answer());
								   			tf = cfDB.getTeacherFormById(Listtans.get(0).getTeacherformid_answer());
								   			//System.out.println(tf.getTotalscore());
								   			totalFormtea = tf.getTotalscore();
								   		}
								     Mentorassessmentform mf = new Mentorassessmentform();
								   		if(!Listmans.isEmpty()){
								   			//System.out.println(Listtans.get(0).getTeacherformid_answer());
								   			mf = cfDB.getMentorFormById(Listmans.get(0).getMentorformid_ans());
								   			//System.out.println(mf.getTotalscore());
								   			totalFormmen = mf.getTotalscore();
								   		}
								     %>
     
								      
								     <%if (Listtans != null && !Listtans.isEmpty()){ %>
								     <%for(teacheranswer ta :Listtans) {%>
								    <%
								     sumScoreTeacher =sumScoreTeacher+ta.getScore();
								    
/* 								    System.out.println(ta.getStudentid_answer());
								    System.out.println(sumScoreTeacher); */
								     %>
								        <%} %>
								        
								        <% double percenttea = (totalFormtea != 0) ? (sumScoreTeacher / totalFormtea) : 0; %>
								        <% double scoreTeacher =   (percenttea != 0) ? percenttea * 20 : 0; %>
								         <% totalScore = totalScore+scoreTeacher; %>
								         <th>
								          <%= String.format("%.2f", scoreTeacher) %></th> 
								         
								      <%}else{%>  
								       <th>-</th>  
								      <%} %> 
								           
								     <%if (Listmans != null && !Listmans.isEmpty()){ %>
								     <%for(mentoranswer ma :Listmans) {%>
								     <%
								     sumScoreMentor =sumScoreMentor+ma.getScore(); 
								     %> 
								     
								        <%} %>
								        
								         <%if (countmentoranswer.size()>=2 ) {
								         sumScoreMentor = sumScoreMentor/countmentoranswer.size();
								        }%>
								        
								         <% double percentmen = (totalFormmen != 0) ? (sumScoreMentor / totalFormmen) * 100 : 0; %>
								        <% double scoreMentor =   (percentmen != 0) ? (percentmen / 100) * 60 : 0; %>
								         <% totalScore = totalScore+scoreMentor; %>
								         <th>
								         <%= String.format("%.2f", scoreMentor) %></th> 
								     
								          
								      <%}else{ %>  
								       <th>-</th>  
								      <%} %> 
								       
								       <th><%= String.format("%.2f", totalScore) %></th>   
								             
                                        </tr>
                                 <%} %>
								</tbody>
							</table>
							
								
							</form>
</div>
	<%} %>

  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

