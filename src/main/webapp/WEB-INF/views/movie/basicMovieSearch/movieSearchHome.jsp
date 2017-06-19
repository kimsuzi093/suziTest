<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./bootstrap.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MovieSearch</h2>
	<div id="searchForm">
		<form action="./movieSearch" method="POST">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>장르</td>
					<td>
						<select name="genreList">
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
						<input type="number" min="1950" name="yearMin"> - <input type="number" min="2000" value="2017" name="yearMax" >
					</td>
				</tr>
				<tr>
					<td>감독</td>
					<td><input type="text" name="director"></td>
				</tr>
				<tr>
					<td>배우</td>
					<td><input type="text" name="actor"></td>
				</tr>
			</table>
			<input type="submit" value="검색">
		</form>
	</div>
	<div id="searchResult">
		
	</div>
</body>
</html>