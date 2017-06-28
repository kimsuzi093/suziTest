<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/join.js"></script> --%>
<script type="text/javascript">
$(function() {
	var idCheck = false;
	var pwCheck = false;
	var answerCheck = false;
	var nameCheck = false;
	var emailCheck = false;
	
	$("#id").keyup(function(){
		var pattern = /^[A-Za-z0-9]{4,12}$/;
		var id = document.frm.id.value;
		
		$.post("memberIdCheck", {
			id: $("#id").val()
		}, function(data) {
			$("#id_result").html(data);
			
			if(pattern.test(id) == false){
				$("#id_result").html("아이디는 4~12자리 영문(대소문자 구별), 숫자");
				idCheck = false;
			} else if(id == "") {
				$("#id_result").html("아이디를 입력해주세요");
				idCheck = false;
			} else {
				idCheck = true;
			}
		})
	})
	
	$("#pw1").keyup(function(){
		var pattern = /^[A-Za-z0-9]{8,14}$/;
		var pw1 = document.frm.pw1.value;
		var pw2 = document.frm.pw2.value;
		
		if(pattern.test(pw1) == false){
			$("#pw_result1").html("비밀번호는 8~14자리 영문(대소문자 구별), 숫자");
		} else {
			$("#pw_result1").html("Check!!");
		}
		
		if(pw1 != pw2) {
			$("#pw_result2").html("비밀번호가 다릅니다.");
			pwCheck = false;
		} else {
			$("#pw_result2").html("Check!!");
			pwCheck = true;
		}
	})
	
	$("#pw2").keyup(function(){
		var pattern = /^[A-Za-z0-9]{8,14}$/;
		var pw1 = document.frm.pw1.value;
		var pw2 = document.frm.pw2.value;
		
		if(pw1 != pw2) {
			$("#pw_result2").html("비밀번호가 다릅니다.");
			pwCheck = false;
		} else {
			$("#pw_result2").html("Check!!");
			pwCheck = true;
		}
	})
	
	$("#answer").keyup(function(){
		var answer = document.frm.answer.value;
		
		if(answer == "") {
			answerCheck = false;
		} else {
			answerCheck = true;
		}
	})
	
	
	$("#name").keyup(function(){
		var name = document.frm.name.value;
		
		if(name == "") {
			nameCheck = false;
		} else {
			nameCheck = true;
		}
	})
	
	$("#email").keyup(function(){
		var pattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
		var email = document.frm.email.value;
		
		if(email == "") {
			emailCheck = false;
		} else {
			emailCheck = true;
		}
	})
	
	$("#kind").click(function(){
		var kind = document.frm.kind.value;
		
		if(kind == "일반") {
			$("#joinState").val("승인");
		} else if(kind == "배우" || kind == "감독" || kind == "평론가") {
			$("#joinState").val("대기");
		}
	})
	
	$("#frm").on("click", "#btn", function() {
		if(idCheck == false){
			alert("아이디를 다시 확인해주세요");
		} else if(pwCheck == false){
			alert("비밀번호를 다시 확인해주세요");
		} else if(answerCheck == false){
			alert("대답을 다시 확인해주세요");
		} else if(nameCheck == false){
			alert("이름을 다시 확인해주세요");
		} else if(emailCheck == false){
			alert("이메일을 다시 확인해주세요");
		} else {
			document.frm.submit("memberJoin");
		}
	})
});
</script>

</head>
<body>
	<h2>Member Join</h2>
	<form action="memberJoin" name="frm" id="frm" method="POST" enctype="multipart/form-data">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>*ID:<input type="text" class="form-control" name="id" id="id" required="required">
				<br><span id="id_result"></span></td>
			</tr>
			
			<tr>
				<td>*PW:<input type="text" class="form-control" name="password" id="pw1">
				<br><p id="pw_result1"></p></td>
			</tr>
			<tr>
				<td>*PW Check:<input type="text" class="form-control" id="pw2">
				<br><p id="pw_result2"></p></td>
			</tr>
			
			<tr>
				<td>*Password Find Question
					<select class="form-control" name="question">
					<option value="초등학교">초등학교는?</option>
					<option value="배우자">배우자는?</option>
					<option value="별명">별명은?</option>
				</select></td>
			</tr>
			<tr>
				<td>*ANSWER:<input type="text" class="form-control" name="answer" id="answer"></td>
			</tr>
			
			<tr>
				<td>*NAME:<input type="text" class="form-control" name="name" id="name"></td>
			</tr>
			
			<tr>
				<td>DATE<input type="date" class="form-control" name="birth" value=1991-03-07></td>
			</tr>
			<tr>
				<td>ADDRESS<input type="text" class="form-control" name="address" value="2"></td>
			</tr>
			
			<tr>
				<td>PHONE<input type="text" class="form-control" name="phone" value="123456789"></td>
			</tr>
			<tr>
				<td>*EMAIL<input type="email" class="form-control" name="email" id="email"></td>
			</tr>
			
			<tr>
				<td>*KIND<select class="form-control" name="kind" id="kind">
					<option value="일반" selected="selected">일반</option>
					<option value="배우">배우</option>
					<option value="감독">감독</option>
					<option value="평론가">평론가</option>
				</select></td>
			</tr>
			
			<tr>
				<td>IMG<input type="file" class="form-control" name="f1"></td>
			</tr>
		</table>

		<input type="number" name="likes" readonly="readonly" hidden="hidden" value=0>
		<input type="number" name="point" readonly="readonly" hidden="hidden" value=0>
		<input type="number" name="avaliableLikes" readonly="readonly" hidden="hidden" value=0>
		grade<input type="text" name="grade" readonly="readonly" value="일반">
		joinstate<input type="text" name="joinState" id="joinState" value="승인">
		<input type="button" id="btn" class="btn btn-success" value="가입">
	</form>
	
</body>
</html>