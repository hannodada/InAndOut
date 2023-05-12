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
			<td><input type="text" name="report_whom" id="report_whom" value="${sales_no}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>신고자</th>
			<td><input type="text" name="user_id" id="user_id" value="${loginId}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>신고사유</th>
			<td>
				<textarea name="report_reason" id="report_reason" maxlength="199" onkeyup="counter(event, '200')"></textarea>
				<div>
				<span id="reCount">0 / 200</span>
			</div>
			</td>
		</tr>
		 <tr>
			<th colspan="2">
				<input type="button" id="submit" value="제출"/>
				<input type="button" value="닫기" onclick="window.close()"/>
			</th>
		</tr>
	</table>
</body>
<script>
function counter(event, limit){
	var val = event.target.value.length;
	var elem = $(event.target).siblings().find('span');
	console.log(val);
	console.log(limit);
	console.log(elem);
	if(val<=limit){
		elem.html(val + " / " + limit);
	}
}

$('#submit').click(function(){
	
	var report_whom = document.getElementById('report_whom').value;
	var user_id = document.getElementById('user_id').value;
	var report_reason = document.getElementById('report_reason').value;
	
	$.ajax({
		type: 'post',
		url: 'salesReportWrite.ajax',
		data: {
			'report_whom':report_whom,
			'user_id':user_id,
			'report_reason':report_reason,
		},
		dataType: 'json',
		success: function(data){
			console.log(data.row);
			if(data.row==1){
				alert('신고되었습니다.');
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