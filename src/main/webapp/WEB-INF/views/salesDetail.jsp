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
			<th>판매글번호</th>
			<td>${detailData.sales_no }</td>
		</tr>
		<tr>
			<th>판매상태</th>
			<td>${detailData.sales_state }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${detailData.user_id }</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${detailData.nickname }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${detailData.subject }</td>
		</tr>
		<tr>
			<th>사진</th>
			<td></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${detailData.price }</td>
		</tr>
		<tr>
			<th>거래지역</th>
			<td>
				<input type="text" id="postcode" name="postcode" value="${detailData.post_num }" placeholder="우편번호">
				<br>
				<input type="text" id="roadAddress" name="roadAddress" value="${detailData.sales_sido } ${detailData.sigungu }" placeholder="도로명주소">
				<br>
			</td>
		</tr>
		<tr>
			<th>1차 카테고리</th>
			<td>
				${detailData.biz_name }
			</td>
		</tr>
		<tr>
			<th>2차 카테고리</th>
			<td>
				${detailData.goods_name }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${detailData.content }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${detailData.hit }</td>
		</tr>
		<tr>
			<th>관심수</th>
			<td>${detailData.attention }</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" onclick="location.href='./salesReport.go?sales_no=${detailData.sales_no}'" value="신고하기"/>
				<input type="button" onclick="location.href='./salesUpdate.go?sales_no=${detailData.sales_no}'" value="수정"/>
				<input type="button" onclick="location.href='./salesList.do'" value="리스트"/>
			</th>
		</tr>
	</table>
</body>
<script>
</script>
</html>