<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurantList</title>

<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

<script type="text/javascript">
	function cancelWaiting() {
		var cancelConfirm = confirm('정말 취소하시겠습니까?');
		if (cancelConfirm) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	<!-- header -->

	<!-- sideMune -->
	<jsp:include page="../inc/sideMenu.jsp" />
	<!-- sideMune -->

	<!-- main -->
	<main>

		<!-- 유저 로그인 제어 -->
		<c:if test="${empty user_id }">
			<c:redirect url="./MemberLogin.foo" />
		</c:if>

		<c:if test="${empty wDto.wait_num }">
		 현재 줄서기 중인 가게가 없습니다!
		</c:if>
		<c:if test="${!empty wDto.wait_num }">
			<table border="1">
				<tr>
					<td>가게명</td>
					<td>나의 대기번호</td>
					<td>남은 팀 수</td>
				</tr>
				<tr>
					<td>${wDto.rest_name}</td>
					<td>${wDto.wait_num}</td>
					<td>${qDto.wait_team}</td>
				</tr>
			</table>
			<form action="MemberCancelWaiting.foo" method="post" onsubmit="return cancelWaiting()">
				<input type="hidden" name="wait_num" value="${wDto.wait_num}">
				<input type="submit" value="대기 취소" >
			</form>
		</c:if>
		<br> <br> <br>
		<hr>
		<c:forEach var="list" items="${queueHistory}">
			<table border="1">
				<tr>
					<td>가게명</td>
					<td>방문일자</td>
				</tr>
				<tr>
					<td>${list.rest_name}</td>
					<td>${list.regdate}</td>
				</tr>
			</table>
			<hr>
		</c:forEach>

	</main>
	<!-- main -->


	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->

</body>
</html>