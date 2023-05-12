<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.main-box{
		border : 1px solid black;
		width: 60%;
		border-radius: 10px;
	}
	
	.Xbutton{
		float: right;
	}
	
	.left-box{
		float: left;	
		padding-right : 50px;
	}

	.right-box{
		border-left : 1px solid black;
		margin-left :350px;
		padding-left : 20px;
	}
	
	.button-box{
		margin-top: 30px;
		margin-left: 40%;
		padding-bottom: 10px;
	}
	
	.profile-box .left_profile-box{
		float: left;
	}
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>

	<form action="write.do"> 
		<div class="main-box">
		
			<div class="Xbutton"> 
				<a href="#" onclick="location.href='riderOffer.do'">
					<img width="20" src="resources/img2/multiply.png"/>
				</a>
			</div>
			
			<div class="profile-box">
				<div class="left_profile-box">
					<c:if test="${dto.new_photo_name eq null}">
						<img  width="50" src="resources/photo/프로필 기본.png"/>${dto.nickname}&nbsp;님
					</c:if>
					<c:if test="${dto.new_photo_name ne null}">
						<img  width="50" src="resources/photo/${dto.new_photo_name}"/>${dto.nickname}&nbsp;님
					</c:if>
				</div>
			</div>

			<div class="left-box">			
				<div>판매번호 : <span>${dtoS.sales_no}</span></div>
				<div> 품목명
					<select>
						<option value="">${dtoS.subject}</option>
					</select>
				</div>
				<div>카테고리  ${dtoS.biz_name} > ${dtoS.goods_name}</div>
				<div>판매내용 ${dtoS.content}</div>
				<div>
					<c:if test="${dto.new_photo_name eq null}">
						<img  width="50" src="resources/photo/defaultIMG.png"/>
					</c:if>
					<c:if test="${dto.new_photo_name ne null}">
						<img  width="50" src="resources/photo/${dto.new_photo_name}"/>
					</c:if>
				</div>
			</div> 
			
			<div class="right-box">
				<div>인수희망주소</div>
				<div>
					<textarea name="from_addr" >${dtoS.from_addr}</textarea>			<!-- insert from_addr  -->
				</div>																		
				<div>인도희망주소</div>
				<div>
					<textarea name="to_addr"></textarea>											<!-- insert to_addr  -->
				</div>									
			</div>	
			<input style="display:none" name="rider_id" value="${dto.user_id}"/>		<!-- insert id rider_id -->
			<input style="display:none" name="user_id" value="${dtoS.user_id}"/>		<!-- insert id rider_id -->
			<input style="display:none" name="sales_no" value="${dtoS.sales_no}"/>	<!-- insert id rider_id -->
			<div class="button-box">
				<button>제안요청하기</button>
				<button type="button" onclick="location.href='riderList.go'">취소하기</button>
			</div>
		</div>
	</form>
</body>
<script>
</script>
</html>