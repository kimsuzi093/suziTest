<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./bootstrap.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.searchResultWrap{
		width: 800px;
		height: 200px;
		border-bottom: 1px solid #cccccc;
	}
	.searchResultWrap-left{
		width: 20%;
		height: 180px;
		margin-top: 10px;
		margin-left: 10px;
		float: left; 
	}
	.searchResultWrap-left img{
		width: 158px;
		height: 178px;
	}
	.searchResultWrap-right{
		width: 75%;
		height: 180px;
		margin-top: 10px;
		margin-left: 10px;
		float: left; 
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#searchBtn").click(function(){
			var title = $("#title").val();
			var genre = $("#genre").val();
			var yearMin = $("#yearMin").val();
			var yearMax = $("#yearMax").val();
			var director = $("#director").val();
			var actor = $("#actor").val();
			var nation = $("#nation").val();
			$.ajax({
				url : "./movieSearch",
				type : "POST",
				data : {
					title: title,
					genre : genre,
					yearMin : yearMin,
					yearMax : yearMax,
					director : director,
					actor : actor,
					nation : nation
				},
				success : function(data) {
					$(".searchResult").html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>MovieSearch</h2>
	<!-- SEARCH -->
	<div id="searchForm">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title"></td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
					<select id="genre">
						<option value="all">전체장르</option>
						<option value="판타지">판타지</option>
						<option value="공포">공포</option>
						<option value="로맨스/멜로">로맨스/멜로</option>
						<option value="모험">모험</option>
						<option value="스릴러">스릴러</option>
						<option value="느와르">느와르</option>
						<option value="다큐멘터리">다큐멘터리</option>
						<option value="코디미">코디미</option>
						<option value="가족">가족</option>
						<option value="미스터리">미스터리</option>
						<option value="전쟁">전쟁</option>
						<option value="애니메이션">애니메이션</option>
						<option value="범죄">범죄</option>
						<option value="뮤지컬">뮤지컬</option>
						<option value="SF">SF</option>
						<option value="액션">액션</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제작년도</td>
				<td>
					<input type="number" min="1950" id="yearMin" value="1950"> - <input type="number" min="1950" max="2050" id="yearMax" value="2050">
				</td>
			</tr>
			<tr>
				<td>감독</td>
				<td><input type="text" id="director"></td>
			</tr>
			<tr>
				<td>배우</td>
				<td><input type="text" id="actor"></td>
			</tr>
			<tr>
				<td>제작국가</td>
				<td>
					<select id="nation">
						<option value="all">전체국가</option>
						<c:forEach var="list" items="${nationList }">
							<option value="${list }">${list }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<input type="button" value="검색" id="searchBtn">
	</div>
	<!-- RESULT -->
	<div class="searchResult">
		
	</div>
</body>
</html>