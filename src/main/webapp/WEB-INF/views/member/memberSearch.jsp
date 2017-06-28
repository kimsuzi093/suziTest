<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript">

$(function() {
	$("#select").click(function(){
		var select = $(this).value;

		if(select == "phone") {
			var result = 'PHONE<input type="text" class="form-control" name="search" required="required">';
		} else {
			var result = 'E-mail<input type="email" class="form-control" name="search" required="required">';
		}
		$("#choice").html(result);
	})
	
	$("#id").keyup(function(){
		var id = $(this).value;
		
		$.post("memberQuestionCheck", {
			id: $("#id").val()
		}, function(data) {
			$("#question").html(data);
		})
	})
});

</script>
</head>
<body>
	<h2>Member Search</h2>
	<c:if test="${kind eq 'id'}">
	<form action="memberSearchID" method="POST">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>NAME<input type="text" class="form-control" name="name" required="required"></td>
			</tr>
			
			<tr>
				<td>인증수단<select name="select" id="select">
					<option value="phone" selected="selected">PHONE</option>
					<option value="email">EMAIL</option>
				</select></td>
			</tr>
			
			<tr>
				<td><span id="choice">PHONE<input type="text" class="form-control" name="search" required="required"></span></td>
			</tr>
		</table>
		<button>OK</button>
		<input type="button" id="btn1" class="btn btn-success" value="SEARCH">
	</form>
	</c:if>
	
	<c:if test="${kind eq 'password'}">
	<form action="memberSearchPW" method="POST">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>ID<input type="text" class="form-control" name="id" id="id" required="required"></td>
			</tr>
			
			<tr>
				<td>E-mail<input type="email" class="form-control" name="email" required="required"></td>
			</tr>
			
			<tr>
				<td>QUESTION<br>
					<span id="question"></span>
				</td>
			</tr>
			
			<tr>
				<td>ANSWER<br>
					<input type="text" class="form-control" name="answer" required="required">
				</td>
			</tr>
		</table>
		<button>OK</button>
	</form>
	</c:if>

</body>
</html>