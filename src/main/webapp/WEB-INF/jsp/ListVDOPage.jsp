<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
ViewVDODB vdo = new ViewVDODB(); 
ListCompanyDB com = new ListCompanyDB();
ListStudentDB ListStu = new ListStudentDB();
String Semester = (String)session.getAttribute("semester");
List<VDO> Listvdo = (List)session.getAttribute("Listvdo");
%>

<%int Level = 0;%>
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
<link rel="stylesheet" href="./css/VReport.css">

	
<style type="text/css">


	</style>


</head>




<body>
	<jsp:include page="com/navbar.jsp"></jsp:include>
	
	<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" >

<h3 style="color:#7EBC1B;" > วีดีโอผลการปฏิบัติงานสหกิจศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"><a class="a2" href="#" style="color:#E28A06;">วีดีโอผลการปฏิบัติงานสหกิจศึกษา </a></div>

</div></div></div>
<br>
</div>

	
<br><br><br><br>

<section class="section " id="blog" style="margin-top: -60px; " >
<div class="main">
  <h2 class="text-header text-center"> วีดีโอผลการปฏิบัติงานสหกิจศึกษา  </h2>
			<hr class="colorgraph">
<br><br>

<form name="frm" method="post" action="${pageContext.request.contextPath}/loadViewVDOALLsemesterPage" >
<div class="form-group row">
<div class="col-sm-12" align = "center">
<label class="col-sm-2 col-form-label text-right"> ภาคการศึกษา </label>		
<select name="searchDate" id="searchDate" >
      <% List<String> semester =  ListStu.AllListsemester(); %>
      <%if(Semester.equals("1")){ %>  
       <option selected value="1">แสดงทั้งหมด</option>  
       <%}else{ %>
       <option value="1">แสดงทั้งหมด</option>   
       <%} %>  
                                                                                
      <%for(int i = 0; i<semester.size(); i++){ %>                                               
                                             
   
<%if(semester.get(i).equals(Semester)){ %>
<option selected value="<%=semester.get(i)%>"><%=semester.get(i)%></option>         
<%}else{ %> 
<option value="<%=semester.get(i)%>"><%=semester.get(i)%></option>  
  <%} %> 
    <%} %> 
                                  
   </select>&nbsp;   <a href="#"><button type="submit" class="btn btn-success">
												<i class="fa-sharp fa-solid fa-magnifying-glass"></i> </button></a>	
   </div>   
     </div> 
 </form>
   		
<br><br>			
  <ul class="cards">

<%for(int i= 0; i<Listvdo.size() ; i++){ %>
    <li class="cards_item">
	  <% String[] arr = Listvdo.get(i).getFilename().split("https://youtu.be/"); %>
	 <div class="card_image">  
	  <div class="container position-relative">
  <div class="card mt-4 mb-4">
    <div class="card-body">
      <div class="media">
        <div class="media-body">
          <div class="row">
            <div class="hover-name col-auto pr-0">
            
            <%if(Level == 3){ %>
            <div style = "margin-left:300px">
             <a href="${pageContext.request.contextPath}/EdApproveVDOindex?getvideoid=<%=Listvdo.get(i).getVideoid() %>"><i class="fa-solid fa-circle-xmark" style="color: #880000;  font-size: 30px;"></i></a>
            </div>
             <%}%>
             
              <div class="text-dark position-relative">
              <%Company c = com.Searchcompanyid(Listvdo.get(i).getCompany_companyid()); %>
                <h5>บริษัท <%=c.getCompanyname() %></h5>         
              </div>
              <div>
              <span class="text-muted"><i class="fa-sharp fa-solid fa-earth-americas"></i> <%=Listvdo.get(i).getSemester() %> </span>                   
              </div>
            </div>
            <div class="col-auto pr-0">        
                 
            </div>
          </div>
           <iframe width="350" height="300" src="https://www.youtube.com/embed/<%=arr[1]%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
          </div>
          </div>
          </div>
         </div> 
	  
      
      </div>
    </li>
<%}%>
  </ul>
  <br>
</div>
</section>

  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

