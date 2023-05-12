<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 상태 변경</title>
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
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>

	<h2 class="tag_top">총 <div id="m"></div>건의 배송을 진행중이에요.</h2>
	<c:forEach items="${deliveryState}" var="ds" varStatus="status">
	
	<div class="main-box" >
	<%-- ${status.index+1}	 --%>
		<div>
			<img  width="500" src="resources/photo/${ds.new_photo_name}"/>
			${ds.nickname}님
		</div>
		
		배송번호 : <span>${ds.delivery_offer_no}</span>
		
	
		<div>IN ${ds.from_addr}</div>
		<div>OUT ${ds.to_addr}</div>
		
			
		<div class="box">
			<select class="dv-list" id="dv-ln" onchange="myfunction(this)">
				<option value="배송접수"><c:if test="${ds.delivery_state eq '배송접수'}">disabled</c:if>배송접수</option>
				<option value="배송중" ><c:if test="${ds.delivery_state eq '배송중'}">disabled</c:if>배송중</option>
				<option value="배송완료" ><c:if test="${ds.delivery_state eq '배송완료'}">disabled</c:if>배송완료</option>
				<option value="배송실패" ><c:if test="${ds.delivery_state eq '배송실패'}">disabled</c:if>배송실패</option>
			</select>
		<button onclick="location.href='./riderChatOpen.do?offers_no=${ds.delivery_offer_no}'">채팅</button>
		</div>		
	</div>
	
	</c:forEach>
</body>
<script>
	var cnt = document.getElementsByClassName("main-box").length;
	document.getElementById( "m" ).innerText = cnt ;
	console.log(cnt);
	
	function myfunction(e){
		console.log($(e).val());
		var val = $(e).val();
		var val2 = $(e).parents(".main-box").find("span").text();
		console.log(val2);
		if(confirm("변경하시겠습니까?")){
			
			$.ajax({
				type: 'post',
				url: 'select.ajax',
				data: {
					delivery_state:val,
					delivery_offer_no:val2
				},
				dataType: 'json',
				success: function(data){
					console.log("success");
				},
				error: function(e){
					console.log(e);
					console.log("실패");
				}
			});
		}
		
	}
</script>
</html>