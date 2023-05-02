<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	table, th, td{
		border: 1px black solid;
		border-collapse: collapse;
		padding: 5px 10px;	
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>판매글번호</th>
				<th>판매상태</th>
				<th>사진</th>
				<th>제목</th>
				<th>가격</th>
				<th>시도</th>
				<th>시군구</th>
				<th>업종별</th>
				<th>물품별</th>
				<th>조회수</th>
				<th>작성자 아이디</th>
				<th>작성자 닉네임</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<c:if test="${list.size() == 0 }">
			<tr>
				<th colspan="13">판매글이 없습니다.</th>
			</tr>
		</c:if>
		<c:if test="${list.size() > 0 }">
			<c:forEach items="${list }" var="i">
				<tr>
					<th>${i.sales_no }</th>
					<th>${i.sales_state }</th>
					<c:if test="${i.new_photo_name ne null }">
						<th><img src="/photo/${i.new_photo_name }"/></th>
					</c:if>
					<c:if test="${i.new_photo_name eq null }">
						<th><img src="/photo/default.png"/></th>
					</c:if>
					<th><a href="salesDetail.do?sales_no=${i.sales_no}">${i.subject }</a></th>
					<th>${i.price }</th>
					<th>${i.sales_sido }</th>
					<th>${i.sigungu }</th>
					<th>${i.biz_id }</th>
					<th>${i.goods_id }</th>
					<th>${i.hit }</th>
					<th>${i.user_id }</th>
					<th>${i.nickname }</th>
					<th>${i.date }</th>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
<script></script>
</html>