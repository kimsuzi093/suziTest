<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Certication</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/member/printCertification.css">
<script type="text/javascript">
	function printPage() {
		window.print();
	}
</script>
</head>
<body>
	<section id="Cert-wrapper">
		<div id="print-wrapper">
			<button type="button" class="btn btn-default btn-sm" id="printCert"
				onclick="printPage()">
				<span class="glyphicon glyphicon-print"></span> Print
			</button>
		</div>
		<div id="contents-wrapper">
			<div id="top">
				<p style="margin-top: 10px;">온라인확인번호 : 012-345-678-9</p>
				<p>발&nbsp; &nbsp;급&nbsp; &nbsp;번&nbsp; &nbsp; 호 : 012-345-678-9</p>
				<h1 style="text-align: center;">봉사활동 실적 인증서</h1>
			</div>
			<div id="middle">
				<p style="margin-top: 10px;">성 명 : ${teacher.name }</p>
				<p>소 속 : ${teacher.school }</p>
				<br><br><br>
				<p>[자원봉사활동 실적]</p>
				<p>● 활 동 기 간 : ${firstDate } - ${lastDate }</p>
				<p>● 활 동 시 간 : <c:set var="totalHour">${(playTime-playTime%3600)/3600}</c:set>
								<c:if test="${totalHour >0.0 }">
									<fmt:formatNumber pattern="##" value="${totalHour }"></fmt:formatNumber>시간</c:if>
									<c:set var="totalMin">${(playTime%3600 - playTime%60)/60 }</c:set>
									<fmt:formatNumber pattern="##" value="${totalMin }"></fmt:formatNumber>분
				<p>● 활 동 내 용 : 교과목 학습 지도</p>
				<p>● 비 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 고 : 교육 기관 봉사활동</p>
				<br><br><br><br><br>
				<h4 style="text-align: center;">사회복지봉사활동 인증관리규정 제9조 제3항에 따라 위와</h4>
				<h4 style="text-align: center;">같이 자원봉사 활동실적이 있음을 인증합니다.</h4>
				<br><br>
				<jsp:useBean id="toDay" class="java.util.Date"></jsp:useBean>
				<fmt:formatDate value="${toDay }" var="sysdate" pattern="yyyy-MM-dd"/>
				<p style="text-align: center;">${sysdate }</p>
				<div style="width: 410px; margin: 0 auto;"><h3 style="text-align: center; display: inline;">사회복지법인 끼리끼리</h3>
				<img src="/semiProject/resources/images/stamp.jpg" width="150px" height="112px">
				</div>
			</div>
		</div>
	</section>
</body>
</html>