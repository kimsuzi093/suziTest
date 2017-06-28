<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/part/bootStrap.jspf" %>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<title>Home</title>
<script type="text/javascript">
$(function(){	
	var message = '${message}';

	if(message != ""){
		alert(message);
	}
	
	$(".menu").click(function(){
		var go = $(this).attr("id");
		
		if(go == "left"){
			location.href="./movie/movieHome";
		} else if(go == "right"){
			location.href="./user/userHome";
		}
	})
});
</script>
<style type="text/css">
video{
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}

.menu{
	position: fixed;
	min-width: 500px;
	min-height: 500px;
	width: auto;
	height: auto;
	opacity : 0.6;
	border-radius: 1000px;
	cursor: pointer;
	margin: 13% auto;
	z-index: 2;
}

.center{
	background-image: url("${pageContext.request.contextPath}/resources/img/start.jpg");
	background-size: cover;
	min-width: 600px;
	min-height: 600px;
	margin-left: 34%;
}

.left{
	background-image: url("${pageContext.request.contextPath}/resources/img/left.jpg");
	background-size: cover;
	left: 400px;
}

.right{
	background-image: url("${pageContext.request.contextPath}/resources/img/right.jpg");
	background-size: cover;
	right: 400px;
}
</style>
</head>
<body>	
	<video autoplay="autoplay" loop="loop">
		<source src="${pageContext.request.contextPath}/resources/video/Another_Day_of_Sun.mp4">
	</video>
	
	<section>
		<c:if test="${memberDTO eq null }">
			<!-- Trigger the modal with a button -->
			<button class="menu center" data-toggle="modal" data-target="#myModal">
				<p>'로그인'을 해주셔야 이용가능합니다.</p>
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">LOGIN</h4>
						</div>

						<div class="modal-body">
							<form action="${pageContext.request.contextPath}/member/memberLogin" method="post">
								<table class="table">
									<tr>
										<td>ID <input type="text" class="form-control" name="id"></td>
									</tr>
									<tr>
										<td>PW <input type="password" class="form-control" name="password"></td>
									</tr>
								</table>

								<p id="result"></p>
								<input class="btn btn-success" type="submit" value="LOGIN">
							</form>
						</div>

						<div class="modal-footer">
							<div class="btn-group">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberJoin">JOIN</a>
								<a class="btn btn-warning" href="${pageContext.request.contextPath}/member/memberSearch?kind=id">ID search</a>
								<a class="btn btn-warning" href="${pageContext.request.contextPath}/member/memberSearch?kind=password">PW search</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${memberDTO ne null }">
			<button class="menu left" id="left"></button>

			<button class="menu right" id="right"></button>
		</c:if>
	</section>
	
	<%-- <%@ include file="/resources/part/footer.jspf" %> --%>
</body>
</html>
