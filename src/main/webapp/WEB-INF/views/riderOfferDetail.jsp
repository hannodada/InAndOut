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
		border : 1px solid black;
		width: 40%;
		border-radius: 10px;
	}
	.left-box{	
		float: left;
		padding-right : 50px;
	}
	.right-box{
		border-left : 1px solid black;
		margin-left : 50%;
		
	}
	.button-box{
		margin-top: 30px;
		margin-left: 40%;
		padding-bottom: 10px;
	}
	.Xbutton{
		float: right;
	}
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>
	
	<div class="main-box">
	
		<div class="Xbutton"> 
		<a href="#" onclick="location.href='riderOffer.do'">
			<img width="30" src="resources/img2/multiply.png"/>
		</a>
	</div>
	
		<div class="left-box">
		
			<div class="rider-img">
				<img  width="50" src="resources/photo/${dto.new_photo_name}"/>
				${dto.nickname}&nbsp;님
				<div id="star001">
            <h2 style="color: skyblue; display:block;">내 리뷰 통계</h2>
            <h5 style="display:inline;">물품 상태 좋아요</h5>
            <c:choose>
              <c:when test="${star001 eq 1}">
              <img src="resources/img/dolphin1.png" style="width: 5px;"/>
              </c:when>
              <c:when test="${star001 eq 2}">
              <img src="resources/img/dolphin2.png" style="width: 5px;"/>
              </c:when>
              <c:when test="${star001 eq 3}">
              <img src="resources/img/dolphin3.png" style="width: 5px;"/>
              </c:when>
              <c:when test="${star001 eq 4}">
              <img src="resources/img/dolphin4.png" style="width: 5px;"/>
              </c:when>
              <c:when test="${star001 eq 5}">
              <img src="resources/img/dolphin5.png" style="width: 5px;"/>
              </c:when>
           </c:choose>
         </div>
         
      <div id="star002">
      <h5 style="display:inline;">시간 잘 지켜요&nbsp;&nbsp;</h5>
         <c:choose>
           <c:when test="${star002 eq 1}">
           <img src="resources/img/dolphin1.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star002 eq 2}">
           <img src="resources/img/dolphin2.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star002 eq 3}">
           <img src="resources/img/dolphin3.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star002 eq 4}">
           <img src="resources/img/dolphin4.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star002 eq 5}">
           <img src="resources/img/dolphin5.png" style="width: 60px;"/>
           </c:when>
        </c:choose>  
      </div>
      <div id="star003">
      <h5 style="display:inline;">친절해요</h5>
         <c:choose>
           <c:when test="${star003 eq 1}">
           <img src="resources/img/dolphin1.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star003 eq 2}">
           <img src="resources/img/dolphin2.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star003 eq 3}">
           <img src="resources/img/dolphin3.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star003 eq 4}">
           <img src="resources/img/dolphin4.png" style="width: 60px;"/>
           </c:when>
           <c:when test="${star003 eq 5}">
           <img src="resources/img/dolphin5.png" style="width: 60px;"/>
           </c:when>
        </c:choose>  
      </div>
				<div><button onclick="location.href='./riderChatOpen.do?offers_no=${dto.delivery_offer_no}'">메세지</button></div>
			</div>
			
			<div> 품목명  ${dto.subject}</div>
			<div>카테고리 ${dto.biz_name} > ${dto.goods_name}</div>
			<div>판매내용 ${dto.content}</div>
			<div><img  width="50" src="/photo/"/>${dto.new_photo_name}</div>
		</div> 
		
		<div class="right-box">
			<div>배송제안번호 : ${dto.delivery_offer_no}</div>
			<div>제안일자 : ${dto.offer_date}</div>
			<div>인수희망주소 : ${dto.from_addr}</div>
			<div>인도희망주소 : ${dto.to_addr}</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>	
			
		<div class="button-box">
			<button onclick="location.href='deliveryState.do?idx=${dto.delivery_offer_no}'">승인</button>	
			<button onclick="location.href='deliveryNone.do?idx=${dto.delivery_offer_no}'">거절</button>
		</div>
	</div>
</body>
<script>
</script>
</html>