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
		border-radius: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	.button-box{
	}
	#m{
		display: inline-block;
	}
	.tag_top{
		margin-left: 10px;
	}
	img{
		
	}
</style>
</head>
<body>
<%-- <img  width="50" src="resources/photo/${ro.new_photo_name}"/> --%>

	<jsp:include page="realGnb.jsp"/>

	<h2 class="tag_top">총 <div id="m"></div>건의 배송 제안 요청이 있어요.</h2>
	
	<c:forEach items="${riderOffer}" var="ro" varStatus="status">
	<div class="main-box"> 
		<div>
			<a href="riderOfferDetail?delivery_offer_no=${ro.delivery_offer_no}">
				<c:if test="${ro.new_photo_name eq null}">
					<img  width="50" src="resources/photo/프로필 기본.png"/>${ro.nickname}&nbsp;님
				</c:if>
				<c:if test="${ro.new_photo_name ne null}">
					<img  width="50" src="resources/photo/${ro.new_photo_name}"/>${ro.nickname}&nbsp;님
				</c:if>
			</a>
		</div>
		<div>${ro.subject}</div>
		<div>배송제안번호 : ${ro.delivery_offer_no}</div>
	
		<div>IN ${ro.from_addr}</div>
		<div>OUT ${ro.to_addr}</div>
		
		<div class="button-box">	
			<button id="recognize" onclick="location.href='deliveryState.do?idx=${ro.delivery_offer_no}'">승인</button>	
			<div><button class="hide-btn" onclick="location.href='deliveryNone.do?idx=${ro.delivery_offer_no}'">거절</button></div>
		</div>
	</div>
	</c:forEach>
	
</body>

<script>

		var cnt = document.getElementsByClassName("main-box").length;
		document.getElementById( "m" ).innerText = cnt;
		console.log(cnt);
		
</script>
</html>