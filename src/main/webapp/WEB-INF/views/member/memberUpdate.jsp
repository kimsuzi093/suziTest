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
<style type="text/css">
.profile{
	width: 200px;
	height: 200px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#delete").click(function(){
		var check = confirm("정말 삭제 하시겠습니까?");
		if(check){
			var id = "${sessionScope.memberDTO.id}";
			var fname = "${sessionScope.memberDTO.fname}";
			
			$.post("memberFileDelete", {
				id:id,
				fname:fname
			}, function(data){
				$("#filedelete").html(data);
			})
		}
	});
});
</script>
</head>
<body>

	<h2>Member Update</h2>
	<form action="memberUpdate" method="POST" enctype="multipart/form-data">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>ID <input type="text" class="form-control" name="id" readonly="readonly" value="${memberDTO.id}"></td>
			</tr>

			<tr>
				<td>PW <input type="text" class="form-control" name="password" value="${memberDTO.password}"></td>
			</tr>

			<tr>
				<td>NAME <input type="text" class="form-control" name="name" value="${memberDTO.name}"></td>
			</tr>

			<tr>
				<td>PHONE <input type="text" class="form-control" name="phone" value="${memberDTO.phone}"></td>
			</tr>

			<tr>
				<td>ADDRESS <input type="text" class="form-control" name="address" value="${memberDTO.address}"></td>
			</tr>

			<tr>
				<td>EMAIL <input type="email" class="form-control" name="email" value="${memberDTO.email}"></td>
			</tr>
			
			<tr>
				<td>IMG 
					<c:if test="${memberDTO.getFname() ne ' '}">
						<span id="filedelete">
							<img class="profile" src="${pageContext.request.contextPath}/resources/upload/member/${memberDTO.fname}">
						</span>
						<input type="button" id="delete" class="btn btn-warning" value="삭제">
					</c:if>

					<c:if test="${memberDTO.getFname() eq ' '}">
						<input type="file" class="form-control" name="f1">
					</c:if>
				</td>
			</tr>
		</table>
		<button>OK</button>
	</form>
</body>
</html>