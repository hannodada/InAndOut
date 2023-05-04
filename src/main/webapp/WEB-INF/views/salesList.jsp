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
	<select name="filter" id="filter" onchange="filtering()">
		<option value="sales_no">등록일 순</option>
		<option value="hit">조회수 순</option>
	</select>
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
		<tbody id="list">
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
						<th>${i.biz_name }</th>
						<th>${i.goods_name }</th>
						<th>${i.hit }</th>
						<th>${i.user_id }</th>
						<th>${i.nickname }</th>
						<th>${i.date }</th>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
<script>
	function filtering(){
		
		console.log('change');
		var elem = document.getElementById('filter');
		console.log(elem);
		var val = elem.value;
		console.log(val);
		
		$.ajax({
			type: 'get',
			url: 'filtering.ajax',
			data: {
				filterName:val
			},
			dataType: 'json',
			success: function(data){
				console.log(data.filteredList);
				if(data!=null){
					filterListDraw(data.filteredList);
				}
			},
			error: function(e){
				console.log(e);
			}
		});
		
	}
	
	function filterListDraw(list){
		
		var content = '';
		
		list.forEach(function(item, index){
			
			content += '<tr>';
			content += '<th>'+item.sales_no+'</th>';
			content += '<th>'+item.sales_state+'</th>';

			content += '<th><img src="/photo/';

			if(item.new_photo_name == null){
				content += 'default.png';
			}else{
				content += item.new_photo_name;
			}
			
			content += '"/></th>';
			
			content += '<th><a href="salesDetail.do?sales_no='+item.sales_no+'">'+item.subject+'</a></th>';
			content += '<th>'+item.price+'</th>';
			content += '<th>'+item.sales_sido+'</th>';
			content += '<th>'+item.sigungu+'</th>';
			content += '<th>'+item.biz_name+'</th>';
			content += '<th>'+item.goods_name+'</th>';
			content += '<th>'+item.hit+'</th>';
			content += '<th>'+item.user_id+'</th>';
			content += '<th>'+item.nickname+'</th>';
			
			let milliseconds = item.date;
			let date = getFormatDate(new Date(milliseconds));

			content += '<th>'+date+'</th>';
			content += '</tr>';
		});
		
		$('#list').empty();
		$('#list').append(content);
		
	}
	
	function getFormatDate(date){
		
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		
		return year + '-' + month + '-' +day;
	}
</script>
</html>