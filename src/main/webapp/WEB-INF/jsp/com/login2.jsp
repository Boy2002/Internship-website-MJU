<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int error = 0;
try {
    error = (int) request.getAttribute("error");
} catch (Exception e) {
    error = 0;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login :</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href='https://fonts.googleapis.com/css?family=Kanit' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">
<link rel="stylesheet" href="./css/Alert.css">
<link rel='stylesheet' href='css/login2.css' type='text/css' />
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.enlarged {
    transform: scale(1.2); /* Scale the button up */
    z-index: 10; /* Ensure it's on top */
}

.student-background {
    background: linear-gradient(#15A701 , #1EAE98) no-repeat 0 0 / cover;
}

.teacher-background {
    background: linear-gradient(#DC3545,#FF7682) no-repeat 0 0 / cover;
}

.mentor-background {
    background: linear-gradient(to bottom, rgb(6, 108, 100), rgb(14, 48, 122));
}

.input-group {
    position: relative;      /* ตั้ง position ของกลุ่ม input นี้เป็น relative */
    display: inline-block;    /* ให้ input-group เป็นบล็อคเล็กๆ ไม่ขยายเต็ม */
}

.input-field {
    padding-right: 10px;     /* เพิ่ม padding ทางขวาเผื่อปุ่ม */
    width: 250px;            /* กำหนดความกว้างตามต้องการ */
}

.toggle-password-btn {
    position: absolute;      /* ตั้งปุ่มให้อยู่ในตำแหน่งแบบ absolute */
    right: 28%;             /* จัดปุ่มให้อยู่ทางขวา */
    top: 50%;                /* จัดให้อยู่กลาง input แนวตั้ง */
    transform: translateY(-50%); /* ทำให้ปุ่มอยู่ตรงกลางพอดีแนวตั้ง */
    background: none;        /* ทำให้ปุ่มโปร่งใส */
    border: none;            /* ไม่มีกรอบปุ่ม */
    cursor: pointer;         /* เปลี่ยนเป็น cursor แบบมือ */
    padding: 0;
    font-size: 12px;         /* ขนาดข้อความของปุ่ม */
}

</style>
</head>

<%
if (error == -1) {
%>
<script>
Swal.fire({
    title: 'เข้าสู่ระบบไม่สำเร็จ',
    text: 'รหัสผ่านไม่ถูกต้องกรุณาเข้าสู่ระบบใหม่  !',
})
</script>
<%
}
%>

<%
if (error == -2) {
%>
<script>
Swal.fire({
    title: 'เข้าสู่ระบบไม่สำเร็จ',
    text: 'อีเมลไม่ถูกต้องกรุณาเข้าสู่ระบบใหม่ !',
})
</script>
<%
}
%>

<body>
<script type="text/javascript">
// ฟังก์ชันที่ใช้ในการขยายขนาดปุ่ม
function toggleEnlargeButton(clickedButton) {
    if (!clickedButton) {
        console.error("Button not found. Please check the button class.");
        return;
    }

    // เลือกปุ่มทั้งหมดและลบ class 'enlarged'
    const buttons = document.querySelectorAll('.content-holder button');
    buttons.forEach(button => {
        button.classList.remove('enlarged');
    });

    // เพิ่ม class 'enlarged' ให้กับปุ่มที่ถูกคลิก
    clickedButton.classList.add('enlarged');
}

// ฟังก์ชัน login สำหรับนักศึกษา
function login_student() {
    const studentButton = document.querySelector(".button-1");  // แคชปุ่ม
    toggleEnlargeButton(studentButton);  // ส่งปุ่มไปยังฟังก์ชัน toggleEnlargeButton

    // ซ่อนฟอร์มอื่น
    document.querySelector(".teacher-form-container").style.display = "none";
    document.querySelector(".mentor-form-container").style.display = "none";

    // แสดงฟอร์มนักศึกษา
    document.querySelector(".student-form-container").style.display = "block";

    // เปลี่ยน background
    document.querySelector(".container1").className = "container1 student-background";
}

// ฟังก์ชัน login สำหรับอาจารย์
function login_teacher() {
    const teacherButton = document.querySelector(".button-2");  // แคชปุ่ม
    toggleEnlargeButton(teacherButton);  // ส่งปุ่มไปยังฟังก์ชัน toggleEnlargeButton

    // ซ่อนฟอร์มอื่น
    document.querySelector(".student-form-container").style.display = "none";
    document.querySelector(".mentor-form-container").style.display = "none";

    // แสดงฟอร์มอาจารย์
    document.querySelector(".teacher-form-container").style.display = "block";

    // เปลี่ยน background
    document.querySelector(".container1").className = "container1 teacher-background";
}

// ฟังก์ชัน login สำหรับพี่เลี้ยง
function login_mentor() {
    const mentorButton = document.querySelector(".button-3");  // แคชปุ่ม
    toggleEnlargeButton(mentorButton);  // ส่งปุ่มไปยังฟังก์ชัน toggleEnlargeButton

    // ซ่อนฟอร์มอื่น
    document.querySelector(".student-form-container").style.display = "none";
    document.querySelector(".teacher-form-container").style.display = "none";

    // แสดงฟอร์มพี่เลี้ยง
    document.querySelector(".mentor-form-container").style.display = "block";

    // เปลี่ยน background
    document.querySelector(".container1").className = "container1 mentor-background";
}
</script>
<script type="text/javascript">
// ฟังก์ชันสำหรับดู/ซ่อนรหัสผ่าน
function togglePasswordVisibility(inputId, toggleButtonId) {
    const passwordInput = document.getElementById(inputId);
    const toggleButton = document.getElementById(toggleButtonId);

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        toggleButton.innerHTML = '<i class="fa-solid fa-eye-slash"></i>'; // เปลี่ยนข้อความปุ่มเมื่อแสดงรหัสผ่าน
    } else {
        passwordInput.type = "password";
        toggleButton.innerHTML = '<i class="fa-solid fa-eye"></i>'; // เปลี่ยนข้อความปุ่มเมื่อซ่อนรหัสผ่าน
    }
}
</script>

<div class="container1">
    <div class="box-1">
        <div class="content-holder">
            <h2>เข้าสู่ระบบ</h2>
            <button class="button-1" onclick="login_student()">
                นักศึกษา
            </button>
            <button class="button-2" onclick="login_teacher()">
                อาจารย์
            </button>
            <button class="button-3" onclick="login_mentor()">
                พี่เลี้ยง
            </button>
        </div>
    </div>

    <div class="box-2">
        <div class="student-form-container">
            <form name="frm" method="post" action="${pageContext.request.contextPath}/login">
                <h1>เข้าสู่ระบบ นักศึกษา</h1>
                <input type="text" name="uname" id="uname" placeholder=" รหัสนักศึกษา " class="input-field">
                <div class="input-group">
                <input type="password"name="pwd" id="pwd"  placeholder="รหัสผ่าน " class="input-field">
                <button type="button" id="togglePasswordStudent" class="toggle-password-btn" onclick="togglePasswordVisibility('pwd', 'togglePasswordStudent')">
            	<i class="fa-solid fa-eye"></i>
        	</button>
        	</div>
                <button class="login-student-button" type="submit">เข้าสู่ระบบ</button>
            </form>
        </div>

        <div class="teacher-form-container">
            <form name="frm" method="post" action="${pageContext.request.contextPath}/loginTC">
                <h1>เข้าสู่ระบบ อาจารย์</h1>
                <input type="email" name="unameE" id="unameE" placeholder=" อีเมล " class="input-field">
                <div class="input-group">
                <input type="password"  name="pwdE" id="pwdE"  placeholder="รหัสผ่าน " class="input-field">
                <button type="button" id="togglePasswordTeacher" class="toggle-password-btn" onclick="togglePasswordVisibility('pwdE', 'togglePasswordTeacher')">
                  <i class="fa-solid fa-eye"></i>
        		</button>
        		</div>
                <button class="login-teacher-button" type="submit">เข้าสู่ระบบ</button>
            </form>
        </div>

      <div class="mentor-form-container">
        <form name="frm" method="post" action="${pageContext.request.contextPath}/loginMentor">
            <h1>เข้าสู่ระบบ พี่เลี้ยง</h1>
            <input type="text" name="unameE" id="unameE" placeholder=" อีเมล " class="input-field">
            <div class="input-group">
			<input type="password" name="pwdE" id="pwdM" placeholder="รหัสผ่าน " class="input-field">
			<button type="button" id="togglePasswordMentor" class="toggle-password-btn" onclick="togglePasswordVisibility('pwdM', 'togglePasswordMentor')">
			 <i class="fa-solid fa-eye"></i>
			</button>
			</div>

            <button class="login-mentor-button" type="submit">เข้าสู่ระบบ</button>
            </form>
        </div>
    </div>
</div>

<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container1 = document.getElementById('container1');

signUpButton.addEventListener('click', () => container1.classList.add('right-panel-active'));
signInButton.addEventListener('click', () => container1.classList.remove('right-panel-active'));
</script>

<script>
var close = document.getElementsByClassName("closebtn");
for (var i = 0; i < close.length; i++) {
    close[i].onclick = function() {
        var div = this.parentElement;
        div.style.opacity = "0";
        setTimeout(function(){ div.style.display = "none"; }, 600);
    }
}
</script>

</body>
</html>
