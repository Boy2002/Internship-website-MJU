<%@page import="com.springmvc.controller.AddTeachercontroller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int errorsession = 0;
teacher Teacher = null;
try {
	Teacher = (teacher) session.getAttribute("teacher");
} catch (Exception e) {
	errorsession = 1;
}
%>
<%int error = 0; %>
<%
try{
	error = (int)request.getAttribute("error");
}catch(Exception e) {
	error = 0;
}
%>
<%AddQuestionDB aqDB = new AddQuestionDB();
List<question> Listq = aqDB.ListAllQuestion();
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

        cell1.innerHTML = rowCount + '<input type="hidden" class="form-control" id="questionText' + (rowCount) + '" name="questions[' + rowCount + '].questionText">';

        var selectQuestion = document.createElement("select");
        selectQuestion.className = "form-control";
        selectQuestion.name = "questions[" + rowCount + "].questionId";
        selectQuestion.setAttribute("onchange", "updateQuestionTypeAndScore(this, " + (rowCount) + ")");

        <% if (Listq != null) {
            for (question qt : Listq) { %>
                var option = document.createElement("option");
                option.value = "<%= qt.getQuestionid() %>";
                option.text = "<%= qt.getQuestiontext() %> | ประเภท <%=qt.getQuestiontype()%>";
                selectQuestion.appendChild(option);
            <% }
        } %>

        cell2.appendChild(selectQuestion);
        cell3.innerHTML = '<select class="form-control" id="questionType' + (rowCount) + '" name="questions[' + rowCount + '].questionType" readonly="readonly"> </select>';
        cell4.innerHTML = '<input type="text" class="form-control" id="questionScore' + (rowCount ) + '" name="questions[' + rowCount + '].score" readonly="readonly" required>';
        cell5.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeQuestion(this)"><i class="fa-solid fa-trash"></i></button>';

        updateQuestionTypeAndScore(selectQuestion, rowCount);
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

        cell1.innerHTML = rowCount;

        // สร้าง input สำหรับกรอกคำถาม
        var inputQuestion = document.createElement("input");
        inputQuestion.type = "text";
        inputQuestion.className = "form-control";
        inputQuestion.name = "questions[" + rowCount + "].questionText";
        inputQuestion.placeholder = "กรอกคำถาม";
        inputQuestion.required = true;
        cell2.appendChild(inputQuestion);

        // สร้าง select สำหรับเลือกประเภทคำถาม
        var selectType = document.createElement("select");
        selectType.className = "form-control";
        selectType.id = "questionType" + rowCount;
        selectType.name = "questions[" + rowCount + "].questionType";
        selectType.required = true;
        selectType.innerHTML = '<option value="กรอกคะแนน">กรอกคะแนน</option><option value="ใช่หรือไม่">ใช่หรือไม่</option><option value="ข้อความ">ข้อความ</option>';
        cell3.appendChild(selectType);

        // สร้าง input สำหรับกรอกคะแนน
       updateCell4(selectType.value, rowCount, cell4);

        // สร้างปุ่มลบคำถาม
        cell5.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeQuestion(this)"><i class="fa-solid fa-trash"></i></button>';

        // เพิ่ม event onchange ใน select เพื่อปิดการใช้งานช่องกรอกคะแนนเมื่อเลือกประเภทใช่หรือไม่หรือข้อความ
         selectType.onchange = function() {
            updateCell4(selectType.value, rowCount, cell4);
        };

        // อัปเดตลำดับคำถามและคะแนนรวม
        updateRowCount();
        updateTotalScore();
        reindexQuestions();
    }



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
            cell4.innerHTML = '<input type="hidden" name="questions[' + rowCount + '].score" value="0"><textarea class="form-control" name="questions[' + rowIndex + '].answer" rows="3"></textarea>';
        } else {
            cell4.innerHTML = '<input value="5" type="text" class="form-control" name="questions[' + rowIndex + '].score" placeholder="กรอกคะแนน" required oninput="updateTotalScore()">';
        }
    }



    var totalscoresum = 0;

    function updateQuestionTypeAndScore(selectElement, rowIndex) {
        var questionId = selectElement.value;
        console.log("Selected question ID:", questionId);

        var questionText = questionData[questionId]?.text || "";
        var questionType = questionData[questionId]?.type || "";
        var questionScore = questionData[questionId]?.score || "";

        var questionTypeElement = document.getElementById("questionType" + rowIndex);
        var questionScoreElement = document.getElementById("questionScore" + rowIndex);
        var questionTextElement = document.getElementById("questionText" + rowIndex);
        var answerCell = document.getElementById("questionTable").rows[rowIndex].cells[3];

        // เคลียร์เนื้อหาใน questionTypeElement
        questionTypeElement.innerHTML = "";
        var option = document.createElement("option");
        option.value = questionType;
        option.text = questionType;
        questionTypeElement.appendChild(option);

        /* questionScoreElement.value = questionScore;
        questionTextElement.value = questionText; */

        // เคลียร์เซลล์คำตอบ
        answerCell.innerHTML = ""; // ล้างเนื้อหาก่อน

        // สร้าง input ตามประเภทคำถาม
        if (questionType === "ใช่หรือไม่") {
            answerCell.innerHTML = 
                '<input type="hidden" name="questions[' + rowCount + '].score" value="0"><div class="form-check form-check-inline">' +
                    '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" id="yes' + rowIndex + '" value="ใช่">' +
                    '<label class="form-check-label" for="yes' + rowIndex + '">ใช่</label>' +
                '</div>' +
                '<div class="form-check form-check-inline">' +
                    '<input class="form-check-input" type="radio" name="questions[' + rowIndex + '].answer" id="no' + rowIndex + '" value="ไม่">' +
                    '<label class="form-check-label" for="no' + rowIndex + '">ไม่</label>' +
                '</div>';
        } else if (questionType === "ข้อความ") {
            answerCell.innerHTML = '<input type="hidden" name="questions[' + rowCount + '].score" value="0"><textarea class="form-control" id="questionAnswer' + rowIndex + '" name="questions[' + rowIndex + '].answer" rows="3"></textarea>';
        } else {
            answerCell.innerHTML = '<input type="text" class="form-control" id="questionScore' + rowIndex + '" name="questions[' + rowIndex + '].score" value="' + questionScore + '" readonly="readonly" required>';
        }

        updateTotalScore();
    }

    function updateTotalScore() {
        totalscoresum = 0;
        var table = document.getElementById("questionTable");
        var rows = table.rows;

        for (var i = 1; i < rows.length; i++) {
            var scoreCell = rows[i].cells[3].getElementsByTagName('input')[0];
            var score = parseInt(scoreCell.value);
            if (!isNaN(score)) {
                totalscoresum += score;
            }
        }

        var totalscore = document.getElementById("totalscore");
        totalscore.innerText = "คะแนนรวม " + totalscoresum + " คะแนน";

        document.getElementById('totalscorevalue').value = totalscoresum;
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

    
    function reindexQuestions() {
        var table = document.getElementById("questionTable");
        var rows = table.rows;

        for (var i = 1; i < rows.length; i++) {
        	var questionTextValue = rows[i].cells[1].getElementsByTagName('select').length > 0 
            ? rows[i].cells[1].getElementsByTagName('select')[0].options[rows[i].cells[1].getElementsByTagName('select')[0].selectedIndex].text.split('|')[0].trim()
            : rows[i].cells[1].getElementsByTagName('input')[0].value;

       		rows[i].cells[0].innerHTML = i + '<input type="hidden" class="form-control" id="questionText' + i + '" name="questions[' + i + '].questionText" value="' + questionTextValue + '">';


            if (rows[i].cells[1].getElementsByTagName('select').length > 0) {
                rows[i].cells[1].getElementsByTagName('select')[0].name = "questions[" + i + "].questionId";
                rows[i].cells[1].getElementsByTagName('select')[0].setAttribute("onchange", "updateQuestionTypeAndScore(this, " + i + ")");
                rows[i].cells[2].getElementsByTagName('select')[0].id = "questionType" + i;
                rows[i].cells[3].getElementsByTagName('input')[0].id = "questionScore" + i;
            } else {
                rows[i].cells[1].getElementsByTagName('input')[0].name = "questions[" + i + "].questionText";
                rows[i].cells[2].getElementsByTagName('select')[0].id = "questionType" + i;
                rows[i].cells[3].getElementsByTagName('input')[0].id = "questionScore" + i;
            }

            rows[i].cells[2].getElementsByTagName('select')[0].name = "questions[" + i + "].questionType";
            rows[i].cells[3].getElementsByTagName('input')[0].name = "questions[" + i + "].score";
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
                rows[i].cells[1].style.backgroundColor = "red";
                rows[questionTexts[questionText]].cells[1].style.backgroundColor = "red";
                hasDuplicates = true;
            } else {
                // ถ้าไม่ซ้ำ ให้เก็บลง questionTexts
                questionTexts[questionText] = i;
                // รีเซ็ตสีถ้าเคยถูกทำให้เป็นสีแดงมาก่อน
                rows[i].cells[1].style.backgroundColor = "";
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

					<h3 style="color: #7EBC1B;">ระบบสร้างแบบฟอร์มสหกิจศึกษาสำหรับพนักงานพี่เลี้ยง</h3>
					<div class="nav1" style="color: #FFFFFF;">
						<a href="${pageContext.request.contextPath}/loadhome"
							style="color: #FFFFFF;">แบบฟอร์มทั้งหมด</a> / <a class="a2"
							href="#" style="color: #E28A06;"> สร้างฟอร์ม
						</a>
					</div>

				</div>
			</div>
		</div>
		<br>
	</div>
<%if(error == -1){ %>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> เพิ่มข้อมูลไม่สำเร็จ : </strong> กรุณาเพิ่มคำถาม
</div>
<%} %>
<%if(error == -2){ %>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> เพิ่มข้อมูลไม่สำเร็จ : </strong> พบภาคเทอมนี้ในระบบแล้ว
</div>
<%} %>
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

    <div class="container">
    	<br>
        <h3 style="color: #850000;">สร้างแบบฟอร์มสหกิจศึกษาสำหรับพนักงานพี่เลี้ยง</h3>
		<hr class="style13">

		<div style="background-color: white; border-radius: 15px; padding: 50px;  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.2);" >
        <form action="CreateFormMentor" method="post" onsubmit="return handleFormSubmit()">
            <input type="hidden" id="rowCount" name="rowCount" value="0">
            <input type="hidden" id="totalscorevalue" name="totalscorevalue">
            	<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right">ปีการศึกษา </label>
									<div class="col-sm-4">
										<input type="number" min="2566" max="2700" maxlength="4" id="yearE" name="yearE"
											class="form-control data" required>
									</div>
									<div class="col-sm-5">	
									<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่1" required>
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 1 </label>
                                        </div>  
										<div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่2">
                                             <label class="form-check-label" for="inlineRadio1">ภาคเรียนที่ 2 </label>
                                        </div>   
                                        <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadio1" id="inlineRadio1" value="ภาคเรียนที่3">
                                             <label class="form-check-label" for="inlineRadio1"> ภาคเรียนที่ 3 </label>
                                        </div>                                    
									</div>
									
									
								</div>
         	<span>ชื่อฟอร์ม</span>  
         	<input class="form-control" style="width: 50%" name="title" required>
         	<span>คำอธิบาย</span>  
         	<input class="form-control" style="width: 50%" name="description" required>
         	
         	<br>
         	<hr>
         	<br>
         	
         	<h6><b>&nbsp;&nbsp;&nbsp;&nbsp; แบบฟอร์มการประเมินสหกิจศึกษาสำหรับพนักงานพี่เลี้ยงคะแนนเต็มคิดเป็นร้อยละ 60 คะแนน</b></h6>
            <table class="table" id="questionTable" >
                <thead style="background-color: #efebe9;" align="center">
                    <tr style="background-color: #DD5746; color:#eeeeee;" align="center">
                        <th width="5%">ข้อที่</th>
                        <th width="50%">หัวข้อการประเมินการฝึกสหกิจศึกษา</th>
                        <th width="15%">ประเภทคำตอบ</th>
                        <th width="15%">คะแนนเต็ม</th>
                        <th width="5%">ลบ</th>
                    </tr>
                </thead>
             	
                <tbody>
                    <!-- Existing questions will be listed here -->
                </tbody>
               
            </table>
            <hr>
            <br>
            <div align="right" style="margin-right: 50px">          
            <a onclick="updateTotalScore()" style="cursor: pointer;"><i class="fa-solid fa-arrows-rotate"></i><span id="totalscore"></span></a>
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
            <button type="submit" class="btn btn-success" >บันทึก</button>
            <a href="${pageContext.request.contextPath}/listform"
						class="btn btn-warning">ยกเลิก </a>
            </div>

        </form>
        </div>
    </div>
<% } %>
 <jsp:include page="com/footer.jsp"></jsp:include>
  <script type="text/javascript">

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
</body>
</html>
