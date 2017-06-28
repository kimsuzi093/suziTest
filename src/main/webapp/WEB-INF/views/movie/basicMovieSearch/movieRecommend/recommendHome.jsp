<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../bootstrap.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		// 처음 로딩시 recommendSubCriteria display none.
		display_none();
		
		// 장르별 추천영화
		$("#genreRecommend").click(function(){
			display_none();
			$("#genreWrap").css("display","block");
			loadMovieRecommend('genre','all');
			$("#genre").change(function(){
				var subCriteria = $("#genre").val();
				loadMovieRecommend('genre',subCriteria);
			});
		});
		// 연도별 추천영화
		$("#yearRecommend").click(function(){
			display_none();
			$("#yearWrap").css("display","block");
			$(".year").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('year',subCriteria);
			});
		});
		// 감독별 추천영화
		$("#direcotrRecommend").click(function(){
			display_none();
			loadMovieRecommend('director');
		});
		// 나이별 추천영화
		$("#ageRecommend").click(function(){
			display_none();
			$("#ageWrap").css("display","block");
			$(".age").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('age',subCriteria);
			});
		});
		// 날씨별 추천영화
		$("#weatherRecommend").click(function(){
			display_none();
			loadMovieRecommend('weather');
		});
		// 그룹별 추천영화
		$("#groupRecommend").click(function(){
			display_none();
			$("#groupWrap").css("display","block");
			$(".group").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('group',subCriteria);
			});
		});
		// 비슷한 추천영화
		$("#myRecommend").click(function(){
			display_none();
			loadMovieRecommend('my');
		});
		// 리뷰 추천영화
		$("#reviewRecommend").click(function(){
			display_none();
			loadMovieRecommend('review');
		});
		// 찜 추천영화
		$("#jjimRecommend").click(function(){
			display_none();
			loadMovieRecommend('jjim');
		});
		// 최근 추천영화
		$("#recentRecommend").click(function(){
			display_none();
			loadMovieRecommend('recent');
		});
		
		// css - display: none
		function display_none(){
			$("#ageWrap").css("display","none");
			$("#yearWrap").css("display","none");
			$("#groupWrap").css("display","none");
			$("#genreWrap").css("display","none");
		}
		
		// list ajax
		function loadMovieRecommend(criteria, subCriteria){
			$.ajax({
				url : "./recommendList",
				type : "GET",
				data : {
					criteria: criteria,
					subCriteria: subCriteria
				},
				success : function(data) {
					$("#recommendResult").html(data);
				}
			});
		}
		
		// 영화 상세 보기
		$("#recommendResult").on('click','.recommendContents',function(){
			var num = $(this).attr("id");
			location.href="../movieView?num="+num;
		});
	});
</script>
<style>
	#recommendResult{
		width: 1200px;
	}
	.recommendContents{
		width: 220px;
		height: 400px;
		float: left;
		margin: 10px 10px;
		border: 1px solid #cccccc;
	}
	.contents-top{
		width: 100%;
		height: 60%;
		border-bottom: 1px solid #cccccc;
	}
	.contents-middle{
		width: 100%;
		height: 40%;
	}
	.rank{
		position: absolute; 
		background-color: red; 
		width: 25px; 
		height: 25px; 
		color: white; 
		font-weight: bolder;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="recommendCriteria">
		<button id="genreRecommend" class="btn">장르별 추천영화</button>
		<button id="yearRecommend" class="btn">년도별 추천영화</button>
		<button id="direcotrRecommend" class="btn">감독별 추천영화</button>
		<button id="ageRecommend" class="btn">나이별 추천영화</button>
		<button id="weatherRecommend" class="btn">오늘날씨 추천영화</button>
		<button id="groupRecommend" class="btn">커플끼리,가족끼리,혼자</button>
		<button id="myRecommend" class="btn">내가 본 영화와 비슷한 영화</button>
		<button id="reviewRecommend" class="btn">리뷰가 많은 영화</button>
		<button id="jjimRecommend" class="btn">찜하기가 많은 영화</button>
		<button id="recentRecommend" class="btn">개봉 예정 영화</button>
	</div>
	<div id="recommendSubCriteria">
		<div id="ageWrap">
			<button class="btn btn-default age" id="10">10대</button>
			<button class="btn btn-default age" id="20">20대</button>
			<button class="btn btn-default age" id="30">30대</button>
			<button class="btn btn-default age" id="40">40대</button>
			<button class="btn btn-default age" id="50">50대 이상</button>
		</div>
		<div id="yearWrap">
			<button class="btn btn-default year" id="1950">1960년대 이전</button>
			<button class="btn btn-default year" id="1960">1960년대</button>
			<button class="btn btn-default year" id="1970">1970년대</button>
			<button class="btn btn-default year" id="1980">1980년대</button>
			<button class="btn btn-default year" id="1990">1990년대</button>
			<button class="btn btn-default year" id="2000">2000년대</button>
			<button class="btn btn-default year" id="2010">2010년대</button>
		</div>
		<div id="groupWrap">
			<button class="btn btn-default group" id="couple">커플끼리</button>
			<button class="btn btn-default group" id="family">가족끼리</button>
			<button class="btn btn-default group" id="friend">친구끼리</button>
			<button class="btn btn-default group" id="alone">혼자</button>
		</div>
		<div id="genreWrap">
			<select id="genre">
				<option value="all">전체장르</option>
				<option value="판타지">판타지</option>
				<option value="공포">공포</option>
				<option value="로맨스/멜로">로맨스/멜로</option>
				<option value="어드벤처">어드벤처</option>
				<option value="스릴러">스릴러</option>
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
		</div>
	</div>
	<div id="recommendResult"></div>
</body>
</html>