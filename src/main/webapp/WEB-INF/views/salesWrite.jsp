<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style></style>
</head>
<body>
	<form action="salesWrite.do" method="post" enctype="Multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo"/></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<th>거래지역</th>
				<td><input type="text" name="address"/></td>
			</tr>
			<tr>
				<th>1차 카테고리</th>
				<td>
					<select name="biz">
						<option value="요식업"/>
					</select>
				</td>
			</tr>
			<tr>
				<th>2차 카테고리</th>
				<td>
					<select name="goods">
						<option value="가전제품"/>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록"/></th>
			</tr>
		</table>
	</form>
</body>
<script>
</script>
</html>