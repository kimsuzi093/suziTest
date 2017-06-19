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
						<select>
							<option>판타지</option>
							<option>공포</option>
							<option>멜로</option>
							<option>모험</option>
							<option>스릴러</option>
							<option>느와르</option>
							<option>다큐멘터리</option>
							<option>코디미</option>
							<option>가족</option>
							<option>미스터리</option>
							<option>전쟁</option>
							<option>애니메이션</option>
							<option>범죄</option>
							<option>뮤지컬</option>
							<option>SF</option>
							<option>액션</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제작년도</td>
					<td>
						<input type="number" min="1900" name="yearMin"> - <input type="number" min="2000" name="yearMax">
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