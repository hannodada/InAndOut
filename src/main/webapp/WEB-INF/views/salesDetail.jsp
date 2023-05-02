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
	table, th, td{
		border: 1px black solid;
		border-collapse: collapse;
		padding: 5px 10px;	
	}
</style>
</head>
<body>
	<table>
	
		<tr>
			<th>아이디</th>
			<td>${dto.user_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.subject }</td>
		</tr>
		<tr>
			<th>판매글번호</th>
			<td>${dto.sales_no }</td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="photo"/></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.price }</td>
		</tr>
		<tr>
			<th>거래지역</th>
			<td>
				<input type="text" id="postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				<br>
				<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
				<br>
				<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
				<br>
				<input type="text" id="sido" name="sido" placeholder="시도" hidden="true">
				<br>
				<input type="text" id="sigungu" name="sigungu" placeholder="시군구" hidden="true">
				<br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<br>
				<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
			</td>
		</tr>
		<tr>
			<th>1차 카테고리</th>
			<td>
				${dto.biz_name }
			</td>
		</tr>
		<tr>
			<th>2차 카테고리</th>
			<td>
				${dto.goods_name }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content }</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" onclick="location.href='./salesUpdate.go?sales_no=${dto.sales_no}'" value="수정"/>
				<input type="button" onclick="location.href='./Saleslist.do'" value="리스트"/>
			</th>
		</tr>
	</table>
</body>
<script>
</script>
</html>