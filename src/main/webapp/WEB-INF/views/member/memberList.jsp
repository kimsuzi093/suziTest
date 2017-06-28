<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/list.js"></script> --%>

<script type="text/javascript">
$(function(){	
	$(".update").click(function(){
		var value1 = ($(this).attr('class')).split(' ')[0]+"select";
		var value2 = ($(this).attr('class')).split(' ')[1]+"select";

		var selectId = $(this).attr("id");	
		var selectJoinState = $("."+value2).val();
		var selectGrade = $("."+value1).val();
		
		/* alert(" selectGrade(value1) : "+value1+"\n selectGrade : "+selectGrade+"\n selectGrade(value2) : "+value2+"\n selectJoinState : "+selectJoinstate); */
		
		$.post("managementUpdate", {
			id: selectId,
			joinState : selectJoinState,
			grade : selectGrade
		}, function(data) {
			$("#result").html(data);
		})
	})

	$(".delete").click(function(){
		var selectId = $(this).attr("id");
		
		$.post("managementDelete", {
			id: selectId
		}, function(data) {
			$("#result").html(data);
		})
	})
	
	$("#back").click(function(){
		location.href="javascript:history.back()";
	})
	
	$("#refreash").click(function(){
		location.href="javascript:location.reload()";
	})
	
	$("#home").click(function(){
		location.href="../";
	});
	
	$(".go").click(function(){
		var curPage=$(this).attr("id"); 
		location.href="./memberList?curPage="+curPage+"&kind=${kind}&search=${search}";
	});
	
	//js 파일로 하려면  함수를 불러들이는 걸 만들라??
});
</script>

<style type="text/css">
.down{
	width: 300px;
	height: 300px;
}
</style>

</head>
<body>
	<p>${message}</p>
	<div id="result">
		<table class="table table-hover">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>주소</td>
				<td>전화</td>
				<td>E-mail</td>
				<td>등급</td>
				<td>가입유형</td>
				<td>가입날짜</td>
				<td>가입승인여부</td>
				<td>수정</td>
				<td>강퇴</td>
			</tr>

			<c:forEach items="${list}" var="man">
				<tr>
					<td>${man.id}</td>
					<td>${man.name}</td>
					<td>${man.birth}</td>
					<td>${man.address}</td>
					<td>${man.phone}</td>
					<td>${man.email}</td>
					<td>
						<select class="form-control grade${man.id}select">
							<option selected="selected" value="${man.grade}">현재 : ${man.grade}</option>
							<option value="일반">일반</option>
							<option value="브론즈">브론즈</option>
							<option value="실버">실버</option>
							<option value="골드">골드</option>
							<option value="다이아몬드">다이아몬드</option>
						</select>
					</td>
					<td>${man.kind}</td>
					<td>${man.joinDate}</td>
					<td>
						<select class="form-control state${man.id}select">
							<option selected="selected" value="${man.joinState}">현재 : ${man.joinState}</option>
							<option value="대기">대기</option>
							<option value="승인">승인</option>
						</select>
					</td>
					<td><input type="button" class="grade${man.id} state${man.id} update btn btn-primary" id="${man.id}" value="수정"></td>
					<td><input type="button" class="delete btn btn-danger" id="${man.id}" value="X"></td>
				</tr>
			</c:forEach>
		</table>
		
		<input type="button" class="btn" id="home" value="HOME">
		<input type="button" class="btn btn-success" id="back" value="BACK">
		<input type="button" class="btn btn-warning" id="refreash" value="REFREASH">
		
		<div class="down">
			<div class="search">
				<form action="memberList">
					<select name="kind" class="form-control">
						<option value="id">ID 검색</option>
						<option value="name">NAME 검색</option>
					</select>
					<input type="hidden" name="curPage" value="${curPage}">
					<input type="text" class="form-control" name="search" placeholder="검색">
					<button class="btn btn-info">검색</button>
				</form>
			</div>
		
			<div class="paging btn-group">
				<c:if test="${pageResult.curBlock>1}">
					<input type="button" class="go btn btn-primary" id="${pageResult.startNum-1}" value="[이전]">
				</c:if>
				
				<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
					<input type="button" class="go btn btn-primary" id="${i}" value="${i}">
				</c:forEach>
				
				<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
					<input type="button" class="go btn btn-primary" id="${pageResult.lastNum+1}" value="[다음]">
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>