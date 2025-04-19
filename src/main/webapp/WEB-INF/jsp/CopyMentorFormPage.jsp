<%@page import="com.springmvc.controller.AddTeachercontroller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    String formattedDate = formatter.format(new Date());
%>
<%
int errorsession = 0;
teacher Teacher = null;
try {
	Teacher = (teacher) session.getAttribute("teacher");
} catch (Exception e) {
	errorsession = 1;
}
%>
<%AddQuestionDB aqDB = new AddQuestionDB();
List<question> Listq = aqDB.ListAllQuestion();
Mentorassessmentform mf = (Mentorassessmentform) session.getAttribute("mf");
CreateformDB cfDB = new CreateformDB();
List<formmenterdetail> Listfd = cfDB.getformmenterdetailById(mf.getMentorassessmentformid());
%>
<% String yearsemester = mf.getSemester(); 
		String year = yearsemester.substring(13,17);//ex 2566
		String semester = yearsemester.substring(11,12);//ex 1
								
%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="./css/Alert.css">
<link rel="stylesheet" href="./css/web_css.css">
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
p {
	font-family: "Webly Sleek SemiLight", Helvetica-, droid sans, sans-serif;
	font-weight: normal;
	margin: 0 0 1rem;
}

.centerbox {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%); /* IE 9 */
	-webkit-transform: translate(-50%, -50%); /* Chrome, Safari, Opera */
	width: 620px;
	min-height: 52px;
	z-index: 2
}

.centerbox h1 {
	margin-bottom: 25px;
	font-size: 36px;
	font-family: "Webly Sleek SemiLight";
	font-weight: normal;
	text-align: center;
}

.centerbox p.description {
	margin-bottom: 40px;
	text-align: center;
}

.description a {
	text-decoration: none;
}

.main-input {
	background: #fff;
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
	padding: 0px 0px 0px 57px;
	font-size: 16px;
	border-right: 0px;
	background: #ffffff
		url("http://seodesigns.com/projects/TD/images/search.png") 18px 15px
		no-repeat;
	background-size: 18px 18px;
	float: left;
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
	width: 141px;
	height: 50px;
	border: 0pxpadding-top:0px;
	float: left;
}

#main-submit:hover {
	background: #00a221;
	color: #fff !important;
	-webkit-appearance: none;
}

#main-submit-mobile {
	display: none;
}

footer {
	border-top: 0px;
}

.main-btn {
	display: inline-block;
	width: 150px;
	height: 50px;
	border: 1px solid #cccccc;
	padding: 0px;
	position: relative;
	float: left;
	border-right: 0px;
	background: #ffffff;
	background-size: 6px 6px;
	cursor: pointer;
}

.search-small {
	font-size: 12px;
	margin: 0px;
	color: #9B9B9B;
	position: absolute;
	top: 6px;
	left: 16px;
	display: inline-block;
	width: 80px;
	height: 20px;
	text-align: left;
}

.search-large {
	font-size: 16px;
	margin: 0px;
	color: #4A4A4A;
	position: absolute;
	top: 19px;
	left: 16px;
	display: inline-block;
	width: 105px;
	height: 20px;
	font-weight: 900;
	text-align: left;
}

.main-form-container {
	height: 50px;
	position: relative;
}

ul.search-description {
	width: 150px;
	position: absolute;
	background: #fff;
	right: 143px;
	top: 55px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	padding: 14px 0px;
	border: 1px solid #E5E5E5;
	display: none;
	-webkit-box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
}

.search-description li {
	font-size: 16px;
	color: #4A4A4A;
	font-weight: 900;
	padding: 6px 0px;
	display: block;
	padding-left: 16px;
	cursor: pointer;
}

.search-description li:hover {
	background: #f8f8f8;
}

/* responsive css below */
@media only screen and (max-width: 680px) {
	.main-btn {
		border-radius: 0px 4px 4px 0px;
		-moz-border-radius: 0px 4px 4px 0px;
		-webkit-border-radius: 0px 4px 4px 0px;
		border-right: 1px solid #cccccc;
	}
	ul.search-description {
		right: 0px;
		z-index: 9999;
	}
	.centerbox p.description {
		width: 284px;
		margin: 0 auto 40px auto;
	}
	.centerbox {
		width: auto;
		transform: translate(-50%, -60%);
		-ms-transform: translate(-50%, -60%); /* IE 9 */
		-webkit-transform: translate(-50%, -60%); /* Chrome, Safari, Opera */
	}
	.main-form-container {
		width: 477px
	}
	#main-submit {
		display: none;
	}
	#main-submit-mobile {
		background: #3cb13c;
		color: #fff;
		display: block;
		font-size: 19px;
		font-weight: 500;
		text-align: center;
		cursor: pointer;
		margin-bottom: 0px;
		-webkit-appearance: none;
		border-radius: 0px;
		-moz-border-radius: 0px;
		-webkit-border-radius: 0px;
		width: 141px;
		height: 50px;
		border: 0px;
		padding-top: 0px;
		float: none;
		border: 0px;
		position: fixed;
		bottom: 0px;
		right: 0px;
		width: 100%;
		z-index: 1;
	}
	#main-submit-mobile:hover {
		background: #00a221;
		color: #fff !important;
		-webkit-appearance: none;
	}
	footer {
		padding-bottom: 50px;
	}
}

@media only screen and (max-width: 515px) {
	.main-input {
		width: 210px;
	}
	.main-form-container {
		width: 360px
	}
	.centerbox h1 {
		width: 280px;
		margin: 0 auto 15px auto;
	}
	.centerbox {
		position: absolute;
		top: 50%;
		left: 50%;
	}
}

@media only screen and (max-width: 375px) {
	.cover {
		background: rgba(0, 0, 0, 0)
			url("seodesigns.com/projects/TD/images/background.jpg") no-repeat
			center -175px;
	}
	.main-input {
		width: 185px;
		padding-left: 42px;
		background: #ffffff
			url("http://seodesigns.com/projects/TD/images/search.png") 12px 15px
			no-repeat;
		background-size: 18px 18px;
	}
	.main-btn {
		width: 108px;
		background: #ffffff
			url("http://seodesigns.com/projects/TD/images/main-bullet.png") 85px
			23px no-repeat;
		background-size: 6px 6px;
	}
	.main-form-container {
		width: 293px
	}
	.search-small {
		left: 13px;
	}
	.search-large {
		left: 13px;
	}
}

hr.style13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #880000 inset;
}

.circle-button {
    width: 50px;
    height: 50px;
    background-color: #009688; /* สีของปุ่ม */
    color: white; /* สีของข้อความ */
    border: none; /* ลบเส้นขอบ */
    border-radius: 50%; /* ทำให้เป็นวงกลม */
    font-size: 16px; /* ขนาดของข้อความ */
    text-align: center; /* จัดข้อความให้อยู่ตรงกลาง */
    line-height: 50px; /* จัดข้อความในแนวตั้งให้อยู่ตรงกลาง */
    cursor: pointer; /* เปลี่ยนเคอร์เซอร์เมื่อโฮเวอร์ */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* แสงเงา */
    transition: background-color 0.3s; /* แอนิเมชันเมื่อเปลี่ยนสี */
    outline: none;
    margin-bottom: 5px;
}

.circle-button2 {
    width: 50px;
    height: 50px;
    background-color: #3DC2EC; /* สีของปุ่ม */
    color: white; /* สีของข้อความ */
    border: none; /* ลบเส้นขอบ */
    border-radius: 50%; /* ทำให้เป็นวงกลม */
    font-size: 16px; /* ขนาดของข้อความ */
    text-align: center; /* จัดข้อความให้อยู่ตรงกลาง */
    line-height: 50px; /* จัดข้อความในแนวตั้งให้อยู่ตรงกลาง */
    cursor: pointer; /* เปลี่ยนเคอร์เซอร์เมื่อโฮเวอร์ */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* แสงเงา */
    transition: background-color 0.3s; /* แอนิเมชันเมื่อเปลี่ยนสี */
    outline: none;
    margin-bottom: 5px;
}

.circle-button:hover {
    background-color: #45a049; /* สีของปุ่มเมื่อโฮเวอร์ */
    
}

.circle-button2:hover {
    background-color: #4C3BCF; /* สีของปุ่มเมื่อโฮเวอร์ */
    
}

.circle-button:focus {
    outline: none; /* ลบขอบเมื่อถูกโฟกัส */
}

.circle-button2:focus {
    outline: none; /* ลบขอบเมื่อถูกโฟกัส */
}

.btn-horizontal{
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	width: 260px;
}

.vl {
  border-left: 2px solid #686D76 ;
  height: 60px;
  width: 1px

}

 .table-header {
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    background-color: #E85C0D;
    border-radius: 5px;
    color: white;
    padding: 15px;
    margin-bottom: 5px; 
}

.header-item {
    width: 30%;
    padding-right: 20px;
    padding-left: 20px;
    
}

.question-item {
    margin-bottom: 5px; 
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.question-label {
    width: 65%;
}

.full-score-label {
    width: 20%;
    text-align: center;
}

.question-input {
    width: 15%;
    text-align: right;
    padding-right: 2%;
}

.question-input2 {
    width: 60%;
}

.below-input {
    width: 100%;
    margin-top: 10px;
}

.radio-group label {
    margin-right: 10px;
}

 .form-control.question-input.inline-input {
    display: inline-block;
    width: 60%; /* หรือกำหนดขนาดที่เหมาะสมเช่น width: 10%; */ /* ปรับระยะห่างระหว่าง input */
    vertical-align: middle;
} 


.container-headerform {
            display: flex;
            width: 100%;
        }
        
        .left {
            flex: 0 0 30%; /* คอลัมน์ซ้ายกินพื้นที่ 70% */
        }

        .right {
            flex: 0 0 70%; /* คอลัมน์ขวากินพื้นที่ 30% */
        }
        
         .label-group-headerform {
            padding-left: 20px;
            
        }

	.background-A4{
		background-color: white; 
		border-radius: 15px; 
		padding: 2%; 
		margin-bottom:5px; 
		box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2); 
		border-top: 30px solid #28A745;
	}
</style>

<script type="text/javascript">
    var questionData = {};
    <% if (Listq != null) {
        for (question qt : Listq) { %>
            questionData["<%= qt.getQuestionid() %>"] = {
                text: "<%= qt.getQuestiontext() %>",
                type: "<%= qt.getQuestiontype() %>",
                score: "<%= qt.getScore() %>"
            };
    <% } 
    } %>

    function addQuestion() {
        var table = document.getElementById("questionTable");
        var rowCount = table.rows.length;
        var row = table.insertRow(rowCount);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        
        cell1.style.width = "8%";
        cell2.style.width = "12%";
        cell3.style.width = "50%";
        cell4.style.width = "12%";
        cell5.style.width = "5%";
        cell6.style.width = "3%";

        cell1.innerHTML = rowCount + '<input type="hidden" class="form-control" id="questionText' + rowCount + '" name="questions[' + rowCount + '].questionText">';


        // ใส่ select สำหรับประเภทคำถาม
        var selectType2 = document.createElement("select");
        selectType2.className = "form-control cell2-css";
        selectType2.id = "questionType" + rowCount;
        selectType2.name = "questions[" + rowCount + "].questionType";
        selectType2.required = true;
        selectType2.innerHTML = '<option value="กรอกคะแนน">กรอกคะแนน</option><option value="ใช่หรือไม่">ใช่หรือไม่</option><option value="ข้อความ">ข้อความ</option>';
        cell2.appendChild(selectType2);
		
        
        var selectQuestion = document.createElement("select");
        selectQuestion.className = "form-control cell3-css";
        selectQuestion.name = "questions[" + rowCount + "].questionId";
        selectQuestion.setAttribute("onchange", "updateScore(this, " + rowCount + ")");

        <% if (Listq != null) { 
            for (question qt : Listq) { %>
            if ("กรอกคะแนน" === "<%= qt.getQuestiontype() %>") {
                var option = document.createElement("option");
                option.value = "<%= qt.getQuestionid() %>";
                option.text = "<%= qt.getQuestiontext() %>";
                selectQuestion.appendChild(option);   
	            }
        <% } } %>
        // ใส่ select สำหรับเลือกคำถาม
        cell3.appendChild(selectQuestion);

        // สร้าง input สำหรับกรอกคะแนน
        cell4.innerHTML = '<input type="text" class="form-control cell4-css" id="questionScore' + rowCount + '" name="questions[' + rowCount + '].score" readonly="readonly" required>';

        // สร้างปุ่มลบคำถาม
        cell5.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeQuestion(this)"><i class="fa-solid fa-trash"></i></button>';
		
    	cell6.innerHTML = `
      	    <button type="button" class="btn btn-secondary" onclick="moveUp(this)"><i class="fa-solid fa-arrow-up"></i></button>
      	    <button type="button" class="btn btn-secondary" onclick="moveDown(this)"><i class="fa-solid fa-arrow-down"></i></button>
      	`;
        
        
        // Event onchange สำหรับเปลี่ยนประเภทคำถาม
        selectType2.onchange = function() {
            updateCell2(selectType2.value, rowCount, cell3, cell4);
        };
        
        updateScore(selectQuestion, rowCount);
        updateRowCount();
        reindexQuestions();
    }

    function addQuestionNew() {
        var table = document.getElementById("questionTable");
        var rowCount = table.rows.length;
        var row = table.insertRow(rowCount);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        
        cell1.style.width = "8%";
        cell2.style.width = "12%";
        cell3.style.width = "50%";
        cell4.style.width = "12%";
        cell5.style.width = "5%";
        cell6.style.width = "3%";

        cell1.innerHTML = rowCount;
		
        // สร้าง select สำหรับเลือกประเภทคำถาม
        var selectType = document.createElement("select");
        selectType.className = "form-control cell2-css";
        selectType.id = "questionType" + rowCount;
        selectType.name = "questions[" + rowCount + "].questionType";
        selectType.required = true;
        selectType.innerHTML = '<option value="กรอกคะแนน">กรอกคะแนน</option><option value="ใช่หรือไม่">ใช่หรือไม่</option><option value="ข้อความ">ข้อความ</option>';
        cell2.appendChild(selectType);
        
        // สร้าง input สำหรับกรอกคำถาม
        var inputQuestion = document.createElement("input");
        inputQuestion.type = "text";
        inputQuestion.className = "form-control cell3-css";
        inputQuestion.name = "questions[" + rowCount + "].questionText";
        inputQuestion.placeholder = "กรอกคำถาม";
        inputQuestion.required = true;
        cell3.appendChild(inputQuestion);

       

        // สร้าง input สำหรับกรอกคะแนน
       updateCell4(selectType.value, rowCount, cell4);

        // สร้างปุ่มลบคำถาม
        cell5.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeQuestion(this)"><i class="fa-solid fa-trash"></i></button>';

    	cell6.innerHTML = `
      	    <button type="button" class="btn btn-secondary" onclick="moveUp(this)"><i class="fa-solid fa-arrow-up"></i></button>
      	    <button type="button" class="btn btn-secondary" onclick="moveDown(this)"><i class="fa-solid fa-arrow-down"></i></button>
      	`;
        
        
        // เพิ่ม event onchange ใน select เพื่อปิดการใช้งานช่องกรอกคะแนนเมื่อเลือกประเภทใช่หรือไม่หรือข้อความ
         selectType.onchange = function() {
            updateCell4(selectType.value, rowCount, cell4);
        };

        // อัปเดตลำดับคำถามและคะแนนรวม
        updateRowCount();
        updateTotalScore();
        reindexQuestions();
    }

	
    function updateCell2(questionType2, rowIndex, cell3, cell4) {
	    // เคลียร์ cell3 ก่อนที่จะเพิ่ม select ใหม่
	    cell3.innerHTML = '';
	
	    // สร้าง select ใหม่ใน cell3
	    var selectQuestion = document.createElement("select");
	    selectQuestion.className = "form-control cell3-css";
	    selectQuestion.name = "questions[" + rowIndex + "].questionId";
	    selectQuestion.setAttribute("onchange", "updateScore(this, " + rowIndex + ")");
	
	    // ตรวจสอบประเภทคำถามและเพิ่มตัวเลือก
	    <% if (Listq != null) {
	        for (question qt : Listq) { %>
	            if (questionType2 === "<%= qt.getQuestiontype() %>") {
	                var option = document.createElement("option");
	                option.value = "<%= qt.getQuestionid() %>";
	                option.text = "<%= qt.getQuestiontext() %>";
	                selectQuestion.appendChild(option);
	            }
	    <% } } %>
	
	    // เพิ่ม select ลงใน cell3
	    cell3.appendChild(selectQuestion);
	
	    if (questionType2 === "ใช่หรือไม่") {
	        cell4.innerHTML = 
	            '<input type="hidden" name="questions[' + rowIndex + '].score" value="0">' +
	            '<div class="form-check form-check-inline">' +
	                '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" value="ใช่">' +
	                '<label class="form-check-label">ใช่</label>' +
	            '</div>' +
	            '<div class="form-check form-check-inline">' +
	                '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" value="ไม่">' +
	                '<label class="form-check-label">ไม่</label>' +
	            '</div>';
	    } else if (questionType2 === "ข้อความ") {
	        cell4.innerHTML = '<textarea class="form-control cell4-css" name="questions[' + rowIndex + '].answer" rows="3"></textarea>';
	    } else {
	    	 cell4.innerHTML = '<input readonly="readonly" type="text" class="form-control cell4-css" name="questions[' + rowIndex + '].score" id="questionScore'+ rowIndex +'"  placeholder="กรอกคะแนน" required oninput="updateTotalScore()">';
	        updateScore(selectQuestion, rowIndex);
	    }
	    reindexQuestions();
	}


    
	//กับปุ่ม addquestionnew
    function updateCell4(questionType, rowIndex, cell4) {
        if (questionType === "ใช่หรือไม่") {
            cell4.innerHTML = 
                '<input type="hidden" name="questions[' + rowCount + '].score" value="0"><div class="form-check form-check-inline">' +
                    '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" value="ใช่">' +
                    '<label class="form-check-label">ใช่</label>' +
                '</div>' +
                '<div class="form-check form-check-inline">' +
                    '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" value="ไม่">' +
                    '<label class="form-check-label">ไม่</label>' +
                '</div>';
        } else if (questionType === "ข้อความ") {
            cell4.innerHTML = '<input type="hidden" name="questions[' + rowCount + '].score" value="0"><textarea class="form-control cell4-css" name="questions[' + rowIndex + '].answer" rows="3"></textarea>';
        } else {
            cell4.innerHTML = '<input value="5" type="text" class="form-control cell4-css" name="questions[' + rowIndex + '].score" placeholder="กรอกคะแนน" required oninput="updateTotalScore()">';
        }
        reindexQuestions();
    }
    

    var totalscoresum = 0;

    function updateScore(selectElement, rowIndex) {
        var questionId = selectElement.value;
        console.log("Selected question ID:", questionId);

        // Get the corresponding score from questionData
        var questionScore = questionData[questionId]?.score || "";
        console.log("Retrieved score:", questionScore);

        // Get the score input element for the current row
        var questionScoreElement = document.getElementById("questionScore" + rowIndex);
        console.log("Score element for row " + rowIndex + ":", questionScoreElement);

        if (questionScoreElement) {
            if (questionScore !== "0.0" && questionScore !== "") {
                questionScoreElement.value = questionScore; // Update the score field if not 0 or empty
                questionScoreElement.style.display = "block"; // Show the score field
            } else {
                questionScoreElement.value = ""; // Clear the score field
                 // Hide the score field if score is 0 or empty
            }
        } else {
            console.error("Score input field not found for row " + rowIndex);
        }

        updateTotalScore();
    }


    function updateTotalScore() {
        totalscoresum = 0;
        var table = document.getElementById("questionTable");
        var rows = table.rows;

        for (var i = 1; i < rows.length; i++) {
            var scoreCell = rows[i].cells[3].getElementsByTagName('input')[0];
            try {
            	var score = parseInt(scoreCell.value);
			} catch (e) {
				var score = 0.0;
			}
            if (!isNaN(score)) {
                totalscoresum += score;
            }
        }

        var totalscore = document.getElementById("totalscore");
        totalscore.innerText = "คะแนนรวม " + totalscoresum + " คะแนน";

        document.getElementById('totalscorevalue').value = totalscoresum;
        reindexQuestions();
    }

    function removeQuestion(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
        updateRowCount();
        updateTotalScore();
        reindexQuestions();
    }

    function updateRowCount() {
        var table = document.getElementById("questionTable");
        var rowCount = table.rows.length - 1;
        document.getElementById("rowCount").value = rowCount;
    }

    function moveUp(button) {
        var row = button.parentNode.parentNode;
        var previousRow = row.previousElementSibling;

        if (previousRow && previousRow.rowIndex > 0) {
            row.parentNode.insertBefore(row, previousRow);
            reindexQuestions();
        }
    }

    function moveDown(button) {
        var row = button.parentNode.parentNode;
        var nextRow = row.nextElementSibling;

        if (nextRow) {
            row.parentNode.insertBefore(nextRow, row);
            reindexQuestions();
        }
    }
    
    function reindexQuestions() {
        var table = document.getElementById("questionTable");
        var rows = table.rows;

        for (var i = 1; i < rows.length; i++) {
        	var questionTextValue = rows[i].cells[2].getElementsByTagName('select').length > 0 
            ? rows[i].cells[2].getElementsByTagName('select')[0].options[rows[i].cells[2].getElementsByTagName('select')[0].selectedIndex].text.split('|')[0].trim()
            : rows[i].cells[2].getElementsByTagName('input')[0].value;

       		rows[i].cells[0].innerHTML = i + '<input type="hidden" class="form-control" id="questionText' + i + '" name="questions[' + i + '].questionText" value="' + questionTextValue + '">';


       		if (rows[i].cells[2].getElementsByTagName('select').length > 0) {
       		    // ตั้งค่าชื่อสำหรับ select ของคำถาม
       		    rows[i].cells[2].getElementsByTagName('select')[0].name = "questions[" + i + "].questionId";
       		    rows[i].cells[2].getElementsByTagName('select')[0].setAttribute("onchange", "updateScore(this, " + i + ")");
       		    rows[i].cells[1].getElementsByTagName('select')[0].id = "questionType" + i;

       		    // ตรวจสอบและตั้งค่า id ให้กับ input, select, หรือ radio ใน cell 3
       		    if (rows[i].cells[3].getElementsByTagName('input').length > 0) {
       		        rows[i].cells[3].getElementsByTagName('input')[0].id = "questionScore" + i;
       		    } else if (rows[i].cells[3].getElementsByTagName('textarea').length > 0) {
       		        rows[i].cells[3].getElementsByTagName('textarea')[0].id = "questionScore" + i;
       		    } else if (rows[i].cells[3].getElementsByTagName('input[type="radio"]').length > 0) {
       		        rows[i].cells[3].getElementsByTagName('input[type="radio"]')[0].id = "questionScore" + i;
       		    } else {
       		        console.error("ไม่พบองค์ประกอบ input, textarea, หรือ radio ใน cell 3 ของแถว " + i);
       		    }

       		} else {
                rows[i].cells[2].getElementsByTagName('input')[0].name = "questions[" + i + "].questionText";
                rows[i].cells[1].getElementsByTagName('select')[0].id = "questionType" + i;
                rows[i].cells[3].getElementsByTagName('input')[0].id = "questionScore" + i;
            }

           
       		rows[i].cells[1].getElementsByTagName('select')[0].name = "questions[" + i + "].questionType";
            if (rows[i].cells[3].getElementsByTagName('input').length > 0) {
            	rows[i].cells[3].getElementsByTagName('input')[0].name = "questions[" + i + "].score";
   		    } else if (rows[i].cells[3].getElementsByTagName('textarea').length > 0) {
   		    	rows[i].cells[3].getElementsByTagName('textarea')[0].name = "questions[" + i + "].score";
   		    } else if (rows[i].cells[3].getElementsByTagName('input[type="radio"]').length > 0) {
   		    	rows[i].cells[3].getElementsByTagName('input[type="radio"]')[0].name = "questions[" + i + "].score";
   		    } else {
   		        console.error("ไม่พบองค์ประกอบ input, textarea, หรือ radio ใน cell 3 ของแถว " + i);
   		    }
            
        }
    }


    window.onload = function() {
        document.getElementById("addQuestionBtn").addEventListener("click", addQuestion);
        document.getElementById("addQuestionNew").addEventListener("click", addQuestionNew);
        updateRowCount();
    };
    
    function checkDuplicateQuestions() {
        var table = document.getElementById("questionTable");
        var rows = table.rows;
        var questionTexts = {}; // เก็บคำถามเพื่อเช็คซ้ำ
        var hasDuplicates = false;

        for (var i = 1; i < rows.length; i++) {
            var questionText = rows[i].cells[0].getElementsByTagName('input')[0].value; // ดึงค่าจาก input hidden
            
            // เช็คว่าคำถามนี้มีอยู่แล้วใน questionTexts หรือไม่
            if (questionTexts[questionText]) {
                // ถ้าซ้ำ ให้เปลี่ยนสี background ของ cell ที่คำถามซ้ำ
                rows[i].cells[2].style.backgroundColor = "red";
                rows[questionTexts[questionText]].cells[2].style.backgroundColor = "red";
                hasDuplicates = true;
            } else {
                // ถ้าไม่ซ้ำ ให้เก็บลง questionTexts
                questionTexts[questionText] = i;
                // รีเซ็ตสีถ้าเคยถูกทำให้เป็นสีแดงมาก่อน
                rows[i].cells[2].style.backgroundColor = "";
            }
        }

        return hasDuplicates;
    }

    
    function handleFormSubmit() {
        // เรียกใช้ reindexQuestions ก่อนการส่งฟอร์ม
        reindexQuestions();
        
        // ตรวจสอบคำถามซ้ำ
        if (checkDuplicateQuestions()) {
            alert("พบคำถามซ้ำในฟอร์ม กรุณาตรวจสอบและแก้ไขก่อนส่งข้อมูล.");
            return false; // ยกเลิกการส่งฟอร์มถ้าพบคำถามซ้ำ
        }
        
        return true; // ส่งฟอร์มถ้าไม่มีคำถามซ้ำ
    }


    document.addEventListener('DOMContentLoaded', (event) => {
        var selectRadioSemester1 = document.getElementById("inlineRadio1");
        var selectRadioSemester2 = document.getElementById("inlineRadio2");
        var selectRadioSemester3 = document.getElementById("inlineRadio3");
        
        if (<%=semester%> == "1") {
            selectRadioSemester1.checked = true;
        } else if (<%=semester%> == "2") {
            selectRadioSemester2.checked = true;
        } else if (<%=semester%> == "3") {
            selectRadioSemester3.checked = true;
        }
        
        var table = document.getElementById("questionTable");
        var rowCount = table.rows.length;
        
        <% if (Listfd != null && Listq != null) { %>
    <% for (formmenterdetail fd : Listfd) { %>
        var row = table.insertRow(rowCount);
        var currentRow = rowCount;
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        
        cell1.style.width = "8%";
        cell2.style.width = "12%";
        cell3.style.width = "50%";
        cell4.style.width = "12%";
        cell5.style.width = "5%";
        cell6.style.width = "3%";

        // Set cell1 with hidden input for question text
        cell1.innerHTML = rowCount + '<input type="hidden" class="form-control" id="questionText' + rowCount + '" name="questions[' + rowCount + '].questionText">';

     // สร้าง select สำหรับประเภทคำถาม
        var selectType2 = document.createElement("select");
        selectType2.className = "form-control cell2-css";
        selectType2.id = "questionType" + rowCount; // ทำให้ ID มีความเฉพาะตาม rowCount
        selectType2.name = "questions[" + rowCount + "].questionType";
        selectType2.required = true;
/*         selectType2.onchange = function() {
        	console.log("this.value = "+this.value+" rowCount ="+rowCount+" cell3 ="+cell3+" cell4 ="+cell4);
          updateCell2(this.value, rowCount, cell3, cell4);
        }; */
        
     // เก็บค่า cell3 และ cell4 เฉพาะสำหรับแถวนี้
     //closure เรื่องใหม่ ใช้ในการจดจำค่าผ่านการสร้างfunction ทำงานและจดจำค่าได้ต่อเมื่อ functionหลักหยุดทำงานไปแล้ว
        (function(cell3, cell4, currentRow) {
            selectType2.onchange = function() {
                console.log("this.value = " + this.value + " currentRow =" + currentRow + " cell3 =", cell3, " cell4 =", cell4);
                updateCell2(this.value, currentRow, cell3, cell4); // ใช้ค่า currentRow แทน rowCount ที่เป็นตัวแปรรวม
            };
        })(cell3, cell4, rowCount); // ส่งค่า cell3, cell4 และ currentRow ไปยัง closure


        
     // สร้าง select สำหรับลิสต์คำถาม
        var selectQuestion = document.createElement("select");
        selectQuestion.className = "form-control";
        selectQuestion.id = "questionList" + rowCount; // ทำให้ selectQuestion มี ID ที่เฉพาะเจาะจง
        selectQuestion.name = "questions[" + rowCount + "].questionId";
        selectQuestion.setAttribute("onchange", "updateScore(this, " + rowCount + ")");
        cell3.appendChild(selectQuestion);

        // ประเภทที่เลือกไว้ (ค่าเริ่มต้นจากฝั่งเซิร์ฟเวอร์)
        var selectedType = ""; // ประกาศตัวแปร
        var selectQuestion = document.getElementById("questionList" + rowCount); // ใช้ ID เฉพาะของแต่ละ row
        selectQuestion.innerHTML = "";
       	
        
        //loop find typequestion
        <% for (question qt : Listq) { %>      
            <% if (Integer.parseInt(qt.getQuestionid()) == fd.getQuestionid_detail()) { %>
            <%-- console.log("qt.getQuestionid() = "+<%=qt.getQuestionid()%>+"fd.getQuestionid_detail() ="+<%=fd.getQuestionid_detail()%>); --%>
                selectedType = "<%= qt.getQuestiontype() %>";
            <% } %>
            
        <% } %>
        
        //loop show all quetion and question selected
        <% for (question qt : Listq) { %>      
        var option = document.createElement("option");
            <% if (Integer.parseInt(qt.getQuestionid()) == fd.getQuestionid_detail()) { %>
           <%-- console.log("qt.getQuestionid() = "+<%=qt.getQuestionid()%>+"fd.getQuestionid_detail() ="+<%=fd.getQuestionid_detail()%>); --%>
     	         
                    option.value = "<%= qt.getQuestionid() %>";
                    option.text = "<%= qt.getQuestiontext() %>";
                    option.selected = true;
                    selectQuestion.appendChild(option);
               
            <% } %>
            
            if (selectedType === "<%= qt.getQuestiontype() %>") {  
            option.value = "<%= qt.getQuestionid() %>";
            option.text = "<%= qt.getQuestiontext() %>";
            selectQuestion.appendChild(option);
            }
            
        <% } %>

        // สร้างตัวเลือกสำหรับประเภทคำถามใน selectType2
        selectType2.innerHTML = `
            <option value="กรอกคะแนน" ${selectedType == 'กรอกคะแนน' ? 'selected' : ''}>กรอกคะแนน</option>
            <option value="ใช่หรือไม่" ${selectedType == 'ใช่หรือไม่' ? 'selected' : ''}>ใช่หรือไม่</option>
            <option value="ข้อความ" ${selectedType == 'ข้อความ' ? 'selected' : ''}>ข้อความ</option>
        `;

        // เพิ่ม selectType2 เข้าไปใน cell2 ก่อน
        cell2.appendChild(selectType2);

        // ตั้งค่า selected หลังจากที่ selectType2 ถูกเพิ่มเข้าไปใน DOM
        document.querySelector("#questionType" + rowCount).value = selectedType;

		
        var questionType2 = selectType2.value; // Define questionType2 as the selected value

        if (questionType2 === "ใช่หรือไม่") {
            cell4.innerHTML = 
                '<input type="hidden" name="questions[' + rowCount + '].score" value="0">' +
                '<div class="form-check form-check-inline">' +
                    '<input readonly="readonly" class="form-check-input" type="radio" name="questions[' + rowCount + '].answer" value="0">' +
                    '<label class="form-check-label">ใช่</label>' +
                '</div>' +
                '<div class="form-check form-check-inline">' +
                    '<input readonly="readonly" class="form-check-input" type="radio" name="questions[' + rowCount + '].answer" value="0">' +
                    '<label class="form-check-label">ไม่</label>' +
                '</div>';
        } else if (questionType2 === "ข้อความ") {
            cell4.innerHTML = '<textarea readonly="readonly" class="form-control cell4-css" name="questions[' + rowCount + '].answer" rows="3"></textarea>';
        } else {
            cell4.innerHTML = '<input readonly="readonly" type="text" class="form-control cell4-css" name="questions[' + rowCount + '].score" id="questionScore'+ rowCount +'"  placeholder="กรอกคะแนน" required oninput="updateTotalScore()">';
            updateScore(selectQuestion, rowCount);
        }
		
        cell5.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeQuestion(this)"><i class="fa-solid fa-trash"></i></button>';
		 
    	cell6.innerHTML = `
      	    <button type="button" class="btn btn-secondary" onclick="moveUp(this)"><i class="fa-solid fa-arrow-up"></i></button>
      	    <button type="button" class="btn btn-secondary" onclick="moveDown(this)"><i class="fa-solid fa-arrow-down"></i></button>
      	`;
        
        
        rowCount++;
    <% } %>
<% } %>

        
        updateRowCount();
        updateTotalScore();
    });

</script>

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>
	<div style="background-color: #2B2C2F;">
		<br>
		<div class="container">
			<div class="row no-gutter">
				<div class="col-xs-12 col-md-12"
					style="background-image: url('./images/TEACHER1.png'); background-position: right; background-repeat: no-repeat">

					<h3 style="color: #7EBC1B;">ระบบทำสำเนาแบบฟอร์มสหกิจศึกษาสำหรับพนักงานพี่เลี้ยง</h3>
					<div class="nav1" style="color: #FFFFFF;">
						<a href="${pageContext.request.contextPath}/listform"
							style="color: #FFFFFF;">แบบฟอร์มทั้งหมด</a> / <a class="a2"
							href="#" style="color: #E28A06;"> ทำสำเนาฟอร์ม
						</a>
					</div>

				</div>
			</div>
		</div>
		<br>
	</div>

<% if (errorsession == 1 || Teacher == null) { %>
<script>
Swal.fire({
  icon: 'error',
  title: 'SESSION ERROR !',
  text: 'กรุณาเข้าสู่ระบบใหม่ !',
  confirmButtonText: '<a href="${pageContext.request.contextPath}/loadlogin" style="color:#FFFFFF">ตกลง</a>'
})
</script>
<%}else { %>


    <div class="container" style="width: 70%;">
    	<br>
       <!--  <h3 style="color: #850000;">แก้ไขแบบฟอร์มสหกิจศึกษาสำหรับพนักงานพี่เลี้ยง</h3>
		<hr class="style13"> -->

		<!-- <div style="background-color: white; border-radius: 15px; padding: 50px;  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2);" > -->
        <form action="CreateFormMentor" method="post" onsubmit="return handleFormSubmit()">
            <input type="hidden" id="rowCount" name="rowCount" value="0">
             <input type="hidden" id="totalscorevalue" name="totalscorevalue">
                  
                 	<div class="background-A4">
		<%-- <div style="margin-left: 20px;" >
                   <h4 style="width: 100%;">ชื่อฟอร์ม</h4>
                    <input class="form-control" style="width: 50%" name="title" value="<%=mf.getTitle()%>" required>
                   
                    <div class="container-headerform">
					    <div class="left label-group-headerform">
					        <span style="font-size: 16px;"><b>ปีการศึกษา :</b></span>
		                    <div style="padding-left: 10px; width: 30%;"><input type="number" min="2566" max="2700" maxlength="4" id="yearE" name="yearE"
											class="form-control data" placeholder="เช่น 2566" value="<%=year%>" required></div>
		                    
		                     <span style="font-size: 16px; "><b>เทอมการศึกษา :</b></span><br>
		                    &nbsp;&nbsp;&nbsp;<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่1" required readonly="readonly">
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 1 </label>
                                        </div>  
										<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio2" value="ภาคเรียนที่2" readonly="readonly">
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 2 </label>
                                        </div>   
                                        <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio3" value="ภาคเรียนที่3" readonly="readonly">
                                             <label class="form-check-label" for="inlineRadio1"> ภาคเรียนที่ 3 </label>
                                        </div> 
             
                         <br>
					    </div>
					    <div class="right label-group-headerform">
					        
		                     <span style="font-size: 16px;"><b>วันเวลาสร้างแบบประเมิน :</b></span><br>
		                    <span style="font-size: 18px;">&nbsp;&nbsp;&nbsp;<%= formattedDate %></span><br >
					    </div> 
					</div>  
					<br>
					<span style="font-size: 16px; padding-left: 20px;"><b>คำชี้แจง :</b></span>
                    <div style="padding-left: 30px;"><textarea rows="2" cols="30" class="form-control" style="width: 50%" name="description"><%=mf.getDescription()%></textarea></div>
					 <hr>
					 <!-- <span>สาขาวิชาเทคโนโลยีสารสนเทศ คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ โทรศัพท์ 053-873900 เว็บไซต์ <a href="https://www.itsci.mju.ac.th">www.itsci.mju.ac.th</a></span> -->
                </div> --%>
                
                		<div style="margin-left: 20%;" >
					
 					<div style="display: flex; align-items: center;">
   					 <span style="font-size: 22px;">ชื่อฟอร์ม : </span>
   					 <input class="form-control" style="width: 60%; margin-left: 10px;" name="title" value="<%=mf.getTitle()%>" required>
					</div>

                   
                    <div class="container-headerform">
					    <div class="left label-group-headerform">
					    <div style="display: flex; align-items: center;">
					    <br><br><br>
					        <span style="font-size: 18px;">ปีการศึกษา :</span>
		                    <div style="padding-left: 10px; width: 70%;"><input type="number" min="2566" max="2700" maxlength="4" id="yearE" name="yearE"
											class="form-control data" placeholder="เช่น 2566" value="<%=year%>" required></div>
		                    </div>
               
                                <span style="font-size: 18px;">วันที่สร้างแบบประเมิน :</span>
		                    <span style="font-size: 18px;">&nbsp;&nbsp;&nbsp;<%= mf.getDate() %></span><br >
					    </div>
		                   
					    <div class="right label-group-headerform">
					    					
					    					<br>
					    					<span style="font-size: 18px; ">ภาคเรียนที่ :</span>
		                   					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    
					    
					          				<input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่1" required>
                                             <label class="form-check-label" for="inlineRadio1" style="font-size: 18px; ">1 </label>
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio2" value="ภาคเรียนที่2">
                                             <label class="form-check-label" for="inlineRadio1" style="font-size: 18px; ">2 </label>
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio3" value="ภาคเรียนที่3">
                                             <label class="form-check-label" for="inlineRadio1" style="font-size: 18px; ">3 </label>
					         
					        
		                     
					    </div> 
					</div>  
					<br>
					
					 <!-- <span>สาขาวิชาเทคโนโลยีสารสนเทศ คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ โทรศัพท์ 053-873900 เว็บไซต์ <a href="https://www.itsci.mju.ac.th">www.itsci.mju.ac.th</a></span> -->
                </div>
                
                <div style="display: flex; align-items: center; width: 100%; margin-left: 20%">
					<span style="font-size: 18px; padding-left: 20px; padding-bottom: 50px;">คำชี้แจง :</span>
                    <div style="padding-left: 10px;"><textarea rows="3" cols="50" class="form-control" style="width: 100%" name="description" ><%=mf.getDescription()%></textarea></div>
					 </div>
                
          <hr>
          <input type="hidden" class="form-control" style="width: 50%" name="mfid" required value="<%=mf.getMentorassessmentformid()%>">
		</div> 
                         
            
         
         	<div style="background-color: white; border-radius: 15px; padding: 50px;  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2);" >
         	
         	<h6><b>&nbsp;&nbsp;&nbsp;&nbsp; แบบฟอร์มการประเมินสหกิจศึกษาสำหรับพนักงานพี่เลี้ยงคะแนนเต็มคิดเป็นร้อยละ 60 คะแนน</b></h6>
             <div class="table-header">
				     <div class="header-item" style="width: 8%;">ข้อที่</div>
				    <div class="header-item" style="width: 14%;">ประเภทคำตอบ</div>
				    <div class="header-item" style="width: 50%;">หัวข้อการประเมิน</div>
				    <div class="header-item" style="width: 12%;">คะแนนเต็ม</div>
				    <div class="header-item" style="width: 5%;">ลบ</div>
				    <div class="header-item" style="width: 1%;"></div>
			</div>
            <table class="table" id="questionTable" >
                <thead style="background-color: #F9F9F9;" align="center">
                    <tr style="background-color: #E85C0D; color: white;" align="center">
                    </tr>
                </thead>
             	
                <tbody>
                    <!-- Existing questions will be listed here -->
                </tbody>
               
            </table>
            <hr>
               <div align="right" style="margin-right: 50px">          
            <a onclick="updateTotalScore()" style="cursor: pointer;"><i class="fa-solid fa-arrows-rotate"></i><span id="totalscore" style="font-size: 18px; margin-right: 20px"></span></a>
            </div>
            <div align="center">
            <div class="btn-horizontal" align="center">
            <div class="btn-item" align="center">
            <button type="button" class="circle-button" id="addQuestionBtn" ><i class="fa-solid fa-plus"></i></button>
            <h6>เพิ่มข้อคำถาม</h6>
            </div>
          <!--   <div class="btn-item" align="center">
            <div class="vl" align="center"></div>
            </div> -->
            <div class="btn-item" align="center">
             <button type="button" class="circle-button2" id="addQuestionNew" ><i class="fa-solid fa-plus"></i></button>
            <h6>เพิ่มคำถามใหม่</h6>
            </div>
            </div>
            </div>
            <hr>
            <br>
            <div align="center">
            <button type="submit" class="btn btn-success" style="margin: 0px 20px 20px 20px; width: 150px;">ทำสำเนา</button>
            <a href="${pageContext.request.contextPath}/listform"
						class="btn btn-warning" style="margin: 0px 20px 20px 20px; width: 150px;">ยกเลิก </a>
            </div>
			</div>
        </form>
        
        </div>
    
    
<% } %>

 <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>
