<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">

	<!-- viewCheck를 아직 안하였고 로그인 되어있을 때 -->
	<c:if test="${!viewCheck && memberDTO != null}">
		<tr>
			<td colspan="5"><span>${memberDTO.id} 님! 영화를 보셨다면 우측 버튼을 클릭해 주세요! &nbsp;&nbsp;</span><button class="btn" id="viewCheckButton">봤어요!</button></td>
		</tr>
	</c:if>
	<!-- viewCheck, 현재 로그인 되어있다면, 리뷰 쓰기가 가능 -->
	<c:if test="${viewCheck && memberDTO != null}">
		<tr>
			<td>
				<select id="myRating" class="form-control">
					<option value="5">★★★★★ 5점</option>
					<option value="4">★★★★☆ 4점</option>
					<option value="3">★★★☆☆ 3점</option>
					<option value="2">★★☆☆☆ 2점</option>
					<option value="1">★☆☆☆☆ 1점</option>
				</select>
			</td>
			<td><input type="text" value="${memberDTO.id}" readonly="readonly" id="reviewWriter"></td>
			<td><textarea id="reviewContents" style="width: 400px; height: 50px;"></textarea></td>
			<td colspan="2"><button id="reviewWrite" class="btn">Write</button></td>
		</tr>
	</c:if>
	<!-- 리뷰가 1개라도 있다면 -->
	<c:if test="${totalCount > 0}">			
		<c:forEach items="${reviewList}" var="review">
			<tr>
				<c:if test="${review.num != reviewDTO.num}">
					<td>
						<c:choose>
							<c:when test="${review.myRating == 1}">
								<span class="star">★☆☆☆☆ 1점</span>
							</c:when>
							<c:when test="${review.myRating == 2}">
								<span class="star">★★☆☆☆ 2점</span>
							</c:when>
							<c:when test="${review.myRating == 3}">
								<span class="star">★★★☆☆ 3점</span>
							</c:when>
							<c:when test="${review.myRating == 4}">
								<span class="star">★★★★☆ 4점</span>
							</c:when>
							<c:when test="${review.myRating == 5}">
								<span class="star">★★★★★ 5점</span>
							</c:when>
						</c:choose>
					</td>
					<td><input type="text" readonly="readonly" value="${review.writer}" style="border:none;"></td>
					<td>
						<textarea rows="" cols="" readonly="readonly" style="width: 400px; height: 50px; border:none;">${review.contents}</textarea>
					</td>													
				</c:if>
				<c:if test="${review.num == reviewDTO.num}">
					<td>
						<select id="reviewUpdateMyRating" class="form-control">
							<option value="5">★★★★★ 5점</option>
							<option value="4">★★★★☆ 4점</option>
							<option value="3">★★★☆☆ 3점</option>
							<option value="2">★★☆☆☆ 2점</option>
							<option value="1">★☆☆☆☆ 1점</option>
						</select>
					</td>
					<td>
						<input type="text" readonly="readonly" value="${reviewDTO.writer}" id="reviewUpdateWriter">
						<input type="hidden" id="reviewUpdateNum" value="${reviewDTO.num }">
					</td>
					<td>
						<textarea rows="" cols="" id="reviewUpdateContents" style="width: 400px; height: 50px;">${reviewDTO.contents}</textarea>
					</td>
				</c:if>
				<!-- BTN -->
				<c:if test="${memberDTO.id == review.writer && reviewDTO.num != review.num}">
					<td><button id="${review.num}" class="btn reviewUpdate">수정</button></td>
					<td><span id="${review.num}" class="reviewDelete" style="cursor: pointer;">X</span></td>
				</c:if>
				<c:if test="${memberDTO.id == review.writer && reviewDTO.num == review.num}">
					<td><button id="reviewUpdate" class="btn">수정 완료</button></td>
					<td><button class="btn" id="reviewUpdateCancel">취소</button></td>
				</c:if>
				<c:if test="${memberDTO.id != review.writer}">
					<td></td>
					<td></td>
				</c:if>
			</tr>
		</c:forEach>
	</c:if>
	<!-- 아직 리뷰가 없다면 -->
	<c:if test="${totalCount == 0}">
		<tr>
			<td colspan="5">아직 작성된 후기가 없습니다. ${memberDTO.id } 님의 소중한 후기를 부탁드립니다! </td>
		</tr>
	</c:if>
</table>
<br>

<!-- 페이징 처리 -->
	<div class="paging" style="text-align: center;">
		<c:if test="${pageResult.curBlock>1}">
			<button class="btn"><span class="go" id="${pageResult.startNum-1}">[이전]</span></button>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
			<button class="btn"><span class="go" id="${i}">${i}</span></button>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<button class="btn"><span class="go" id="${pageResult.lastNum+1}">[다음]</span></button>
		</c:if>
	</div>