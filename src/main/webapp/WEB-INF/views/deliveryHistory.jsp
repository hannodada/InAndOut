`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 히스토리</title>
<jsp:include page="realGnb.jsp"/>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
	img{
		border-radius: 10px;	
	}
	select{
		margin-left: 10px;
	}
</style>
</head>
<body>
	
	<select class="dv-list" id="dv-ln" onchange="filtering()">
		<option>==선택==</option>
		<option value="배송접수">배송접수</option>
		<option value="배송중">배송중</option>
		<option value="배송완료">배송완료</option>
		<option value="배송실패">배송실패</option>
	</select>
	
	 <div id="list">
	 	<h2>배송 필터링을 해주세요</h2>
	 	
	 </div>
	 
</body>
<script>
	
	function filtering(){
		console.log($(".dv-list").val());
		var val = $(".dv-list").val();
			$.ajax({
				type: 'post',
				url: 'filtering.ajax',
				data: {
					delivery_state:val
				},
				dataType: 'json',
				success: function(data){
					console.log("success");
					filtering1(data.list);
					document.getElementById("total").innerHTML = data.total; 
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	function filtering1(list,idx){
		var content='';
		content +='<h2 class="tag_top">'+'총 '+'<span id="total">' +'</span>'+'건의 배송 이력이 필터링되었습니다.'+'</h2>';
		// java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
		// 해결방법 1. DTO 에서 Date 를 String 으로 반환
		// 해결방법 2. js 에서 변환
		list.forEach(function(item, idx){
			content += '<div class="main-box">';
			content += '<div>';
			if (item.new_photo_name == null) {
			  content += '<img  width="50" src="resources/photo/프로필 기본.png"/>' + item.nickname + '&nbsp;님';
			} else {
			  content += '<img  width="50" src="resources/photo/' + item.new_photo_name + '"/>' + item.nickname + '&nbsp;님';
			}
			content += '</div>';
			
			content += '<div> ' + item.subject + '</div>';
			content += '배송번호 : <span>' + item.delivery_accept_no + '</span>';
			content += '<div>배송지 ' + item.to_addr + '</div>';
			var date = new Date(item.delivery_time);
		    content += '<div>' + date.toLocaleDateString('ko-KR') + ' ' + date.toLocaleTimeString('ko-KR') + '</div>';
			content += '<span>' + item.delivery_state + '</span>';
			content += '</div>';
			});
			$('#list').empty();
			$('#list').append(content);
	}
</script>
</html>