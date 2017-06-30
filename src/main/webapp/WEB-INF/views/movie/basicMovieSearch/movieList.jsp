<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>MOVIE LIST</h2>
<div id="searchResult">
<c:forEach var="list" items="${movieList }">
	<div class="searchResultWrap" id="${list.num }">
		<div class="searchResultWrap-left">
			<c:if test="${list.thumnail == null }">
				<img src="../../resources/images/directorBoard/sample_img.jpg">
			</c:if>
			<c:if test="${list.thumnail != null }">
				<img src="${list.thumnail }">
			</c:if>
		</div>
		<div class="searchResultWrap-right">
			<p>${list.title }</p>
			<p>${list.user_rating }</p>
			<p>${list.genre }| ${list.pub_date } | ${list.play_time } |	${list.nation } | ${list.watching_rate}</p>
			<p>감독 ${list.director }</p>
		</div>
	</div>
</c:forEach>
<!-- PAGING -->
<div class="paging">
	<c:if test="${pageResult.curBlock>1}">
		<span class="go" id="${pageResult.startNum-1}">[이전]</span>
	</c:if>
	<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
		<span class="go" id="${i}">${i}</span>
	</c:forEach>
	<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
		<span class="go" id="${pageResult.lastNum+1}">[다음]</span>
	</c:if>
</div>
</div>
