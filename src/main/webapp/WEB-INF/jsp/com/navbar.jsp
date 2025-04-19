<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %> 

<%-- <%int Level = 0;%>
<%Student studenti = null;%>
<%teacher teacheri = null;%>
  <%try{ 
	 studenti = (Student)session.getAttribute("student"); 
	 String id = studenti.getIdstudent();
	   Level = 1;
   } catch(Exception e){
	   try{ 
	   teacheri = (teacher)session.getAttribute("teacher"); 
	   Level = Integer.parseInt(teacheri.getTeachertype());
	   } catch(Exception t){
		   Level = 0;
	   }
   }%>
 --%>
 <style>
@media (min-width: 1200px) {
    .container, .container-lg, .container-md, .container-sm, .container-xl {
        max-width: 1400px;
    }
}
</style>
<%int Level = 0;%>
<%Student studenti = null;%>
<%teacher teacheri = null;%>
<%Mentor mentori = null;%>

 <!----------session student-->
<%try{ 
	 studenti = (Student)session.getAttribute("student"); 
	 String id = studenti.getIdstudent();
	 if (studenti != null){
		 Level = 1;	 
	 }
	 
	/*  System.out.println(" session student "+studenti);
	 System.out.println(" sessionlevel "+Level); */
   } catch(Exception e){
	   Level = 0;
   }
  //-------session teacher
	   try{ 
	   teacheri = (teacher)session.getAttribute("teacher");
	   if (teacheri != null){
		   Level = Integer.parseInt(teacheri.getTeachertype());
		 }
	   
	   /* System.out.println(" session techer "+teacheri);
	   System.out.println(" sessionlevel "+Level); */
	   } catch(Exception t){
		   Level = 0;
	   }
	   //-----------------session mentor
		  try{ 
			 mentori = (Mentor)session.getAttribute("mentor");
			 if (mentori != null){
			 Level = 4;
			 }
			 
			 /* System.out.println(" sessionlevel "+Level);
			 System.out.println(" session mentor "+mentori); */
		  }catch(Exception m){
			   Level = 0; 
		   
   }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
	function LineAuth() {
		var URL = 'https://notify-bot.line.me/oauth/authorize?';
		URL += 'response_type=code';
		URL += '&client_id=LI9HWJcCJ9MROcOlByMDCt';
		URL += '&redirect_uri=http://www.itsci.mju.ac.th/ScientificInstrumentService/lineRegister';
		URL += '&scope=notify';
		URL += '&state=true';

		window.open(URL);
	}
	
	
</script>
<style type="text/css">

a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease; 
	}
    a:hover {
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; /* IE 8 */
        filter: alpha(opacity=50); /* IE7 */
        opacity: 0.6;
        text-decoration: none;
    }
    
</style>
<body>

	

		<header>
			<div class="navbar navbar-default navbar-static-top" style="background-color: #FCFAF1;">
				<div class="container">
					<div class="navbar-header" >
						<a class="navbar-brand" href="${pageContext.request.contextPath}/loadhome"> <img
							src="./images/Slide1.jpg" class="hidden-xs" alt="" width=""
							height="100" style="margin-left: -30px;">
						</a>

					</div>
					
					<div class="widget hidden-xs hidden-sm"
						style="margin-right: -40px;">
						<div class="pull-right top1">
						
						<%if(Level == 0) {%>	
							<span style="color: forestgreen;"> <a href="${pageContext.request.contextPath}/loadlogin"
								class=" btn btn-success"> <i class="fa fa-sign-in">&nbsp;เข้าสู่ระบบ
								</i>
							</a>
							</span>
                        <%} %>
                       <%if(Level == 1) {%> 
							<span style="color: green;"> <i class="fa fa-user"></i>
								ผู้ใช้งานระบบ :  <%=studenti.getStudentname()%> <%=studenti.getStudentlastname()%>  
							</span> &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/loadlogout"
								class="btn btn-danger btn-xs"> <i class="fa fa-sign-out">ออกจากระบบ </i>
							</a> 
						<%}%>
						 <%if(Level == 2 || Level == 3) {%> 
							<span style="color: green;"> <i class="fa fa-user"></i>
								ผู้ใช้งานระบบ :  <%=teacheri.getTeachername()%> <%=teacheri.getTeacherlastname() %>  
							</span> &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/loadlogout"
								class="btn btn-danger btn-xs"> <i class="fa fa-sign-out">ออกจากระบบ </i>
							</a> 
						<%}%>	
						<!-------------------new system 2567---------------------------->	
							<%if(Level == 4 && mentori != null) {%>
						<span style="color: green;"> <i class="fa fa-user"></i>
							ผู้ใช้งานระบบ : <%=mentori.getMentorname()%> <%=mentori.getMentorlastname()%>
						</span> &nbsp;&nbsp; <a
							href="${pageContext.request.contextPath}/loadlogout"
							class="btn btn-danger btn-xs"> <i class="fa fa-sign-out">ออกจากระบบ
						</i>
						</a>
						<%}%>										
						</div>
					</div>
					
				</div>
			</div>			
		</header>

		
		<div style="width: 100%; background-color: #990000;">
			<nav class="navbar navbar-expand-sm navbar-dark container" style="width: 100%;">

				<ul class="nav navbar-nav pull-center">
					<li class="nav-item  active "><a href="${pageContext.request.contextPath}/loadhome"
						class="nav-link"> <i class="fa-solid fa-house"></i> หน้าหลัก </a></li>

				<%if(Level == 1) {%>		
				    <li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadViewStudentProfile" class="nav-link">แก้ไขข้อมูลสหกิจศึกษา </a></li>
						
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadListmentor" class="nav-link"> จัดการข้อมูลพี่เลี้ยง  </a></li>	
						
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadnotifyPage" class="nav-link"> ส่งรายงานและวิดีโอสหกิจศึกษา </a></li>
						
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadReviewCompanyPage" class="nav-link"> รีวิวผลการฝึกสหกิจศึกษา  </a></li>
					
																
				<%}else if(Level == 2 || Level == 3){%>
				    <li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadViewTeacherProfile" class="nav-link"> แก้ไขข้อมูลส่วนตัว </a></li>		
					
					 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> การประเมิน</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadlistcomPage" > การประเมินรายงานและวิดีโอ </a>
				    		<a class="dropdown-item" href="${pageContext.request.contextPath}/loadcompanyStuTeacher?tid=<%=teacheri.getTeacherid()%>" > การประเมินการฝึกปฏิบัติสหกิจ </a>
				    		<a class="dropdown-item" href="${pageContext.request.contextPath}/loadTrackAssessment">ตรวจสอบสถานะการประเมิน </a>
						</div></li>
						
				   
					<%if(Level == 2){ %>	
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadtableassignPage" class="nav-link"> ดูข้อมูลตารางการนิเทศ </a></li>
						
						 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> สรุปผลการฝึกสหกิจศึกษา </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/ViewSummaryReportPage"> สรุปคะแนนรายงานและวีดีโอ </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/ListAllAssessmentBySemesterPage"> สรุปคะแนนการประเมินการฝึกสหกิจศึกษา</a>
						</div></li>	
						<%} %>
						
					<%if(Level == 3){ %>
					 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> จัดการข้อมูล</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadlistStuEPage ">จัดการข้อมูลนักศึกษา</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/loadListTeacherPage" class="nav-link">จัดการข้อมูลอาจารย์ </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadListmentorManage" class="nav-link">จัดการข้อมูลพี่เลี้ยง</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadListCompanyE" class="nav-link">จัดการข้อมูลบริษัท</a>	
						</div></li>
						
					 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> จัดการข้อมูลการนิเทศ </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item " href="${pageContext.request.contextPath}/loadlistcomassignPage">จัดตารางการนิเทศสหกิจศึกษา </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadtableassignPage">ดูข้อมูลตารางการนิเทศ</a>			
							
						</div></li>
						
						<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> จัดการการอนุมัติ </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item " href="${pageContext.request.contextPath}/loadApproveReviewPage"> อนุมัติการรีวิว </a>
							<a class="dropdown-item " href="${pageContext.request.contextPath}/loadApproveVDOPage">อนุมัติวิดีโอ </a>
						</div></li>
						
						 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> สร้างแบบสอบถามประเมิน </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/listquestion">จัดการคำถาม </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/listform">จัดการฟอร์ม </a>
									
							
						</div></li>
						
						 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> สรุปผลการฝึกสหกิจศึกษา </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/ViewSummaryReportPage"> สรุปคะแนนรายงานและวีดีโอ </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/ListAllAssessmentBySemesterPage"> สรุปคะแนนการประเมินการฝึกสหกิจศึกษา</a>
						</div></li>
						
						
												
						<%} %>	
						<%}else if(Level == 4){%>
				<li class="nav-item  active">
				<a href="${pageContext.request.contextPath}/loadEditmentorPageNew?idMentor=<%=mentori.getMentorid()%>"
					class="nav-link"> แก้ไขข้อมูลส่วนตัว </a></li>

				<li class="nav-item  active"><a
					href="${pageContext.request.contextPath}/loadlistStuMentorPage?mid=<%=mentori.getMentorid()%>"
					class="nav-link"> ประเมินให้คะแนนการฝึกสหกิจศึกษา </a></li>
		
				<%} %>
						
				</ul>
				<div class="navbar-nav ml-auto">
					<div class="hidden-lg hidden-md hidden-sm">
						<div style="height: 40px; line-height: 40px; text-align: left">
							<!-- <span style="color: #000;">
					<i class="fa fa-bell"></i>
					</span>	 -->
						</div>
					</div>
				</div>
			</nav>
	
	


	</div>

</body>

</html>