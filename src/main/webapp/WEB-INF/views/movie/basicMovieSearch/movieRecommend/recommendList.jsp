<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="recommendResult">
	<c:forEach begin="1" end="20" var="movie" items="${movie_map.movieList }" varStatus="status">
		<div class="recommendContents">
			<div class="contents-top">
			<div class="rank">${status.count }</div>
				<img src="${movie.thumnail }" width="100%" height="100%">
			</div>
			<div class="contents-middle">
				<p><strong>${movie.title }</strong></p>
				<p>${movie.director }</p>
				<p>${movie.genre }</p>
				<p>${movie.user_rating }</p>
				<p>-찜</p>
			</div>
		</div>
	</c:forEach>
</div>