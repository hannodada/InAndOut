<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 상태 변경</title>
<jsp:include page="realGnb.jsp"/>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	.main-box {
		border: 1px solid skyblue;
		width: 40%;
		border-radius: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
		padding: 10px;
	}

	.tag_top {
		margin-left: 10px;
		color: skyblue;
	}

	.main-box a {
		text-decoration: none;
		color: inherit;
	}

	.main-box img {
		border-radius: 10px;
		margin-right: 5px;
	}

	.button-box {
		display: flex;
		align-items: center;
		margin-top: 10px;
	}

	.button-box button {
		margin-right: 5px;
	}

	.hide-btn,.recognize  {
		background-color: lightgray;
		border: none;
		padding: 5px 10px;
		border-radius: 5px;
		color: white;
	}

	#list {
		margin-top: 20px;
	}

	.container {
		margin-top: 20px;
	}
</style>
</head>
<body>
	<div id="list"> 
	
	</div>
	<div class="container">                           
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>               
	</div>
</body>
<script>

	var myrouteshowPage = 1;
	var cnt = 5;
	myroutlistCall(myrouteshowPage);
	function myroutlistCall(page){
	   $.ajax({
	      type:'post',
	      url:'deliveryState.ajax',
	      data:{
	         'page':page,
	         'cnt':cnt
	      },
	      dataType:'json',
	      success:function(data){
	         console.log(data);
	         console.log("성공");
	         myroutlistPrint(data.list);
	         console.log(data.total);
	         document.getElementById("total").innerHTML = data.total; 
	         
	         // 총 페이지 수
	         // 현재 페이지
	         
	         //paging plugin
	         $('#pagination').twbsPagination({
	            startPage:data.currPage,      // 시작페이지
	            totalPages:data.pages,   // 총 페이지 수
	            visiblePages:5,   // 보여줄 페이지[1][2][3][4][5]
	            onPageClick:function(event,page){// 페이지 클릭시 동작되는 함수(콜백)
	               console.log(page, myrouteshowPage);
	               if (page != myrouteshowPage) {
	                  myrouteshowPage = page;
	                  myroutlistCall(page);
	                  }               
	            }
	         });
	      },
	      error:function(e){
	         console.log(e);
	         console.log("왜실패>");
	      }
	   });
	}
function myroutlistPrint(list,idx){
var content='';
	content +='<h2 class="tag_top">'+'총 '+'<span id="total">' +'</span>'+'건의 배송을 진행중이에요.'+'</h2>';
// java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
// 해결방법 1. DTO 에서 Date 를 String 으로 반환
// 해결방법 2. js 에서 변환
list.forEach(function(item, idx){
	content += '<div class="main-box" >';
	content += '<div>';
	if (item.new_photo_name == null) {
	  content += '<img  width="50" src="resources/photo/프로필 기본.png"/>' + item.nickname + '&nbsp;님';
	} else {
	  content += '<img  width="50" src="resources/photo/' + item.new_photo_name + '"/>' + item.nickname + '&nbsp;님';
	}
	content += '</div>';
	content += '배송번호 : <span>' + item.delivery_offer_no + '</span>';
	content += '<div>IN ' + item.from_addr + '</div>';
	content += '<div>OUT ' + item.to_addr + '</div>';
	content += '<div>' + item.delivery_state + '</div>';
	content += '<div class="box">';
	content += '<select class="dv-list" id="dv-ln" onchange="myfunction(this)">';
	if(item.delivery_state == '배송접수')
	content += '<option value="배송접수" ' + (item.delivery_state == '배송접수' ? 'selected' : '') + '>배송접수</option>';
	content += '<option value="배송중" ' + (item.delivery_state == '배송중' ? 'selected' : '') + '>배송중</option>';
	content += '<option value="배송완료" ' + (item.delivery_state == '배송완료' ? 'selected' : '') + '>배송완료</option>';
	content += '<option value="배송실패" ' + (item.delivery_state == '배송실패' ? 'selected' : '') + '>배송실패</option>';
	content += '</select>';
	content += '<button class="chatting" onclick="location.href=\'./riderChatOpen.do?offers_no=' + item.delivery_offer_no + '\'">채팅</button>';
	content += '</div>';
	content += '</div>';
	});
	$('#list').empty();
	$('#list').append(content);
	
}
	
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
				console.log("왜실패");
			}
		});
	}
}
</script>
</html>