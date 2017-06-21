<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./bootstrap.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var num = $("#movieInfo").attr("title");
		// 처음 줄거리 로딩
		loadStory(num);
		// 예고편
		function loadTrailer(num){
			$.ajax({
				url : "./movieView_trailer",
				type : "GET",
				data : {
					num: num
				},
				success : function(data) {
					$("#middleWrap").html(data);
				}
			});
		}
		// 줄거리
		function loadStory(num){
			$.ajax({
				url : "./movieView_story",
				type : "GET",
				data : {
					num: num
				},
				success : function(data) {
					$("#middleWrap").html(data);
				}
			});
		}
		
	});
</script>
<style type="text/css">
	#topWrap{
		width: 900px;
		height: 300px;
		border-top: 1px solid #cccccc;
		border-bottom: 1px solid #cccccc;
		margin-bottom: 20px;
	}
	#middleWrap{
		width: 900px;
		height: 400px;
		border-bottom: 1px solid #cccccc;
	}
	#thumnailImg{
		width: 25%;
		height: 280px;
		margin-top: 10px;
		margin-left: 10px;
		float: left;
	}
	#thumnailImg img{
		width: 100%;
		height: 280px;
	}
	#movieInfo{
		width: 70%;
		height: 280px;
		margin-top: 10px;
		margin-left: 10px;
		float: left;
	}
	.middle{
		height: 350px;
	}
</style>
</head>
<body>
	<h2>MovieView</h2>
	<div id="topWrap">
		<div id="thumnailImg">
			<img src="${movieDTO.thumnail }">
		</div>
		<div id="movieInfo" title="${movieDTO.num }">
			<p>${movieDTO.title }</p>
			<p>${movieDTO.eng_title }</p>
			<p>${movieDTO.user_rating }/10 (-명 참여)</p>
			<p><strong>개요</strong> ${movieDTO.genre } | ${movieDTO.nation } | ${movieDTO.play_time } | ${movieDTO.pub_date }개봉</p>
			<p><strong>감독</strong> ${movieDTO.director }</p>
			<p><strong>주연</strong> ${movieDTO.actor }</p>
			<p><strong>등급</strong> ${movieDTO.watching_rate }</p>
		</div>
	</div>
	<div id="middleWrap"></div>
</body>
</html>