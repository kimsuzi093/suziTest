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
		// 검색 
		var title="";
		var genre="";
		var yearMin=0;
		var yearMax=0;
		var director="";
		var actor="";
		var nation="";
		var curPage=1;
		// 첫 로딩
		searchAjax(title, genre, yearMin, yearMax, director, actor, nation, curPage);
		// 검색
		$("#searchBtn").click(function(){
			title = $("#title").val();
			genre = $("#genre").val();
			yearMin = $("#yearMin").val();
			yearMax = $("#yearMax").val();
			director = $("#director").val();
			nation = $("#nation").val();
			actor = $("#actor").val();
			searchAjax(title, genre, yearMin, yearMax, director, actor, nation, curPage);
		});
		// 페이징
		$("#searchResult").on('click','.go',function(){
			var curPage = $(this).attr("id");
			searchAjax(title, genre, yearMin, yearMax, director, actor, nation, curPage);
		});
		// view
		$("#searchResult").on('click','.searchResultWrap',function(){
			var num = $(this).attr("id");
			location.href="./movieView?num="+num;
		});
		// ajax function
		function searchAjax(title, genre, yearMin, yearMax, director, actor, nation, curPage){
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
					nation : nation,
					curPage : curPage
				},
				success : function(data) {
					$("#searchResult").html(data);
				}
			});
		}
	});
</script>
</head>
<body>
<a href="./movieRecommend/recommendHome">RECOMMEND PAGE</a>
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
	<div id="searchResult">
		
	</div>
</body>
</html>