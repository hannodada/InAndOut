<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.main-box{
		border: 1px solid black;
		width: 40%;
		margin-bottom: 10px;
		border-radius: 10px;
		margin-left: 10px;
	}
	.button-box{
	}
	.tag_top{
		margin-left: 10px;
	}
	img{
		border-radius: 10px;
	}
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>

	<h2 class="tag_top"> 라이더 리스트</h2>
	<c:forEach items="${riderList}" var="rl">
	<div class="main-box">
		<div>
			<a href="#" onclick="location.href='riderForm'">
				<c:if test="${rl.new_photo_name eq null}">
					<img  width="50" src="resources/photo/프로필 기본.png"/>${rl.nickname}&nbsp;님
				</c:if>
				<c:if test="${rl.new_photo_name ne null}">
					<img  width="50" src="resources/photo/${rl.new_photo_name}"/>${rl.nickname}&nbsp;님
				</c:if>
			</a>
		</div>
		<div>${rl.sido} ${rl.sigungu} / ${rl.store_time}</div>
		<div class="button-box">		
			<button onclick="location.href='userOffer.do?user_id=${rl.user_id}&sales_no=1'">견적신청</button>
		</div>
	</div>
</c:forEach>

</body>
<script>
</script>
</html>