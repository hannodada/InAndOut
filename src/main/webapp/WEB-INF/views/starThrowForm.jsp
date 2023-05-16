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
		<tr>
			<th>판매글 번호</th>
			<td>
				<input type="text" name="star_div_no" id="star_div_no" value="${detailData.sales_no}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>판매자</th>
			<td><input type="text" name="user_id" id="user_id" value="${detailData.user_id}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>구매자</th>
			<td><input type="text" name="consumer_id" id="consumer_id" value="${loginId}" readonly="readonly"/></td>
		</tr>
		<c:forEach items="${starList}" var="i">
			<tr>
				<th>	
					<input type="text" name="cate_no" value="${i.cate_no}" hidden="true"/>
					<input type="text" name="cate_name" value="${i.cate_name}" readonly="readonly"/>
				</th>
				<td>
					<input type="radio" name="${i.cate_no}" value="1"/> 1
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${i.cate_no}" value="2"/> 2
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${i.cate_no}" value="3"/> 3
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${i.cate_no}" value="4"/> 4
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${i.cate_no}" value="5"/> 5
					&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</c:forEach>
		 <tr>
			<th colspan="2">
				<input type="button" id="submit" value="제출"/>
				<input type="button" value="닫기" onclick="window.close()"/>
			</th>
		</tr>
	</table>
</body>
<script>
$('#submit').click(function(){
	
	var star_div_no = document.getElementById('star_div_no').value;
	var user_id = document.getElementById('user_id').value;
	var consumer_id = document.getElementById('consumer_id').value;
	var star001 = document.querySelector('input[name="star001"]:checked').value;
	var star002 = document.querySelector('input[name="star002"]:checked').value;
	var star003 = document.querySelector('input[name="star003"]:checked').value;
	
	$.ajax({
		type: 'post',
		url: 'starThrow.ajax',
		data: {
			'star_div_no':star_div_no,
			'user_id':user_id,
			'consumer_id':consumer_id,
			'star001':star001,
			'star002':star002,
			'star003':star003
		},
		dataType: 'json',
		success: function(data){
			console.log(data.row);
			if(data.row==1){
				alert('별점이 등록되었습니다.');
				self.close();
			}
		},
		error: function(e){
			console.log(e);
			alert('실패했습니다. 다시 시도해 주세요.');
			self.close();
		}
	});
	
});
</script>
</html>