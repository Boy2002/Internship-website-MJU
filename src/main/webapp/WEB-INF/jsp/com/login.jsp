<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

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
<meta charset="UTF-8">
<title>Login : </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
    crossorigin="anonymous">



<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href='https://fonts.googleapis.com/css?family=Kanit'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">
<link rel="stylesheet" href="./css/Alert.css">
<link rel='stylesheet' href='css/login.css' type='text/css' />
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
.overlay {
    background: #B73743;
    background: linear-gradient(#DC3545,#FF7682) no-repeat 0 0 / cover;
    color: #fff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateY(0);
    transition: transform .6s ease-in-out;
}

a {
    color: #333;
    font-size: 16px;
    text-decoration: none;
    margin: 15px 0;
}
</style>


</head>
<%if(error == -1){ %>
<script>
Swal.fire({
	  title: 'เข้าสู่ระบบไม่สำเร็จ',
	  text: 'รหัสผ่านไม่ถูกต้องกรุณาเข้าสู่ระบบใหม่  !',
	})
</script>
<%} %>

<%if(error == -2){ %>

<script>
Swal.fire({
	  title: 'เข้าสู่ระบบไม่สำเร็จ',
	  text: 'อีเมลไม่ถูกต้องกรุณาเข้าสู่ระบบใหม่ !',
	})
</script>
<%} %>
<body>

<script type="text/javascript">


</script>

<br><br>
<div class="container1" id="container1">
        <div class="form-container1 sign-up-container1">
            <form name="frm" method="post" action="${pageContext.request.contextPath}/loginTC" >
                <h2> เข้าสู่ระบบอาจารย์ </h2>
              
           
               <input type="email" name="unameE" id="unameE" placeholder=" อีเมล " />
                <input type="password" name="pwdE" id="pwdE"  placeholder="รหัสผ่าน ">
                <br>
                <button style="background-color:#FF7682; border: 1px solid #FF7682;" > เข้าสู่ระบบ </button>
            </form>
        </div>
        <div class="form-container1 sign-in-container1">
            <form name="frm" method="post" action="${pageContext.request.contextPath}/login">
                <h2> เข้าสู่ระบบนักศึกษา </h2>
                          
                <input type="text" name="uname" id="uname" placeholder=" รหัสนักศึกษา " />
                <input type="password" name="pwd" id="pwd"  placeholder="รหัสผ่าน " />
                <br>
                <button style="background-color:#1EAE98;  border: 1px solid #1EAE98;"> เข้าสู่ระบบ </button>
            </form>
        </div>
        <div class="overlay-container1" >
            <div class="overlay" >
                <div class="overlay-panel overlay-left">
                    <h1> เข้าสู่ระบบนักศึกษา </h1>
                    <p>สำหรับนักศึกษาฝึกสหกิจสาขาเทคโนโลยีสารสนเทศ </p>
                    <button class="ghost" id="signIn"> < </button>
                </div>
                <div class="overlay-panel overlay-right" style ="background: linear-gradient(#15A701 , #1EAE98) no-repeat 0 0 / cover;">
                    <h1>เข้าสู่ระบบอาจารย์ </h1>
                    <p>สำหรับอาจารย์สาขาเทคโนโลยีสารสนเทศ </p>
                    <button class="ghost" id="signUp"> > </button>
                </div>
            </div>   
        </div>      
    </div>
        <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container1 = document.getElementById('container1');

        signUpButton.addEventListener('click', () =>
        container1.classList.add('right-panel-active'));

        signInButton.addEventListener('click', () =>
        container1.classList.remove('right-panel-active'));
        </script>
        
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

</body>
</html>