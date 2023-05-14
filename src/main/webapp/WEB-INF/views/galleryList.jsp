<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.min.js" type="text/javascript"></script>

<style>
table, th, td{
	border: 1px black solid;
	border-collapse: collapse;
	padding: 5px 10px;	
}
b{
	color:red;
}
#paging{
	text-align: center;
}
</style>
</head>
<body>
	<select name="filter" id="filter">
		<option value="gallery_no">최신 순</option>
		<option value="gallery_hit">조회수 순</option>
	</select>
	<table>
		<thead>
			<tr>
				<th>갤러리번호</th>
				<th>사진</th>
				<th>제목</th>
				<th>조회수</th>
				<th>관심수</th>
				<th>작성자 아이디</th>
				<th>작성자 닉네임</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody id="list">
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="8">갤러리 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${list.size() > 0 }">
				<c:forEach items="${list }" var="i">
					<tr>
						<th>${i.gallery_no }</th>
						<c:if test="${i.new_photo_name ne null }">
							<th><img src="/photo/${i.new_photo_name }"/></th>
						</c:if>
						<c:if test="${i.new_photo_name eq null }">
							<th><img src="resources/img/defaultIMG.png"/></th>
						</c:if>
						<th><a href="galleryDetail.do?gallery_no=${i.gallery_no}">${i.gallery_subject }</a></th>
						<th>${i.gallery_hit }</th>
						<th>${i.gallery_jjim }</th>
						<th>${i.user_id }</th>
						<th>${i.nickname }</th>
						<th>${i.gallery_date }</th>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tr>
			<td colspan="8" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	-->
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>
	</table>
</body>
<script>
/*
function filtering(){
	
	console.log('change');

	var filterName = document.getElementById('filter').value;

	console.log(filterName);
	
	$.ajax({
		type: 'get',
		url: 'galleryFiltering.ajax',
		data: {
			'filterName':filterName
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
		content += '<th>'+item.gallery_no+'</th>';


		
		if(item.new_photo_name == null){
			content += '<th><img src="resources/img/defaultIMG.png';
		}else{
			content += '<th><img src="/photo/'+item.new_photo_name;
		}
		
		content += '"/></th>';
		
		content += '<th><a href="galleryDetail.do?gallery_no='+item.gallery_no+'">'+item.gallery_subject+'</a></th>';
		content += '<th>'+item.gallery_hit+'</th>';
		content += '<th>'+item.gallery_jjim+'</th>';
		content += '<th>'+item.user_id+'</th>';
		content += '<th>'+item.nickname+'</th>';
		
 		let milliseconds = item.gallery_date;
		let date = getFormatDate(new Date(milliseconds));

		content += '<th>'+date+'</th>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
	
}
*/

//기본값으로 1번 페이지를 설정한다.
var showPage = 1;

listCall(showPage);

// 게시물 갯수를 5 - 10 - 15 - ... 변경될 때마다 listCall을 해줘야 함.
$('#filter').change(function(){
	listCall(showPage);	
	// 페이지 총 갯수가 이미 만들어져 있어서 pagePerNum이 변경되면 수정이 안되는 문제가 있다.
	// 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
	// 밑에 만들어진 paging plugin을 부수기
//	$('#pagination').twbsPagination('destroy');
});

function listCall(page){
	var filterName = document.getElementById('filter').value;
	$.ajax({
		
		type: 'post',
		url: 'galleryList.ajax',
		data: {
			'page':page,
			'cnt':15,
			'filterName':filterName
		},
		dataType: 'json',
		success:function(data){
			console.log(data);
			listPrint(data.filteredList);
			
			// 페이징을 구현하기 위해 알아야 되는 것(단순 플러그인만 쓰면 페이징 제대로 안됨)
			// 총 페이지 수, 현재 페이지
			
			//paging plugin
			$('#pagination').twbsPagination({
				startPage:data.currPage,		//시작페이지
				totalPages:data.pages,	//총 페이지 수
				visiblePages:5,		//보여줄 페이지 [1][2][3][4][5]
				onPageClick:function(event,page){//페이지 클릭 시 동작되는 콜백함수
					console.log(event,showPage);
					//중간정도 페이지에서 게시물 갯수를 변경하면 1페이지로 초기화되는 문제가 있다.
					//listCall 시에 초기값 1로 설정해 둔 showPage를 현재 페이지로 변경한다.
					
					if(page != showPage){
						showPage = page;
						listCall(page);
					}
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}
function listPrint(list){
	// 제이쿼리 셀렉터는 each를 쓰고, JS는 forEach 씀
	// JS는 인덱스 생략이 가능하기 때문에 item, idx 중에 안받을 수도 있는데
	// each는 다 받아야 됨.
	var content = '';
	
	//java.sql.Date는 js에서 읽지 못해 밀리세컨드로 반환한다.
	//해결방법 1. DTO에서 Date를 toString으로 변환하는 방법(JAVA)
	//해결방법 2. JS에서 변환하는 방법
	list.forEach(function(item, idx){
		
		content += '<tr>';
		content += '<th>'+item.gallery_no+'</th>';
		
		if(item.new_photo_name == null){
			content += '<th><img src="resources/img/defaultIMG.png';
		}else{
			content += '<th><img src="/photo/'+item.new_photo_name;
		}
		
		content += '"/></th>';
		
		content += '<th><a href="galleryDetail.do?gallery_no='+item.gallery_no+'">'+item.gallery_subject+'</a></th>';
		content += '<th>'+item.gallery_hit+'</th>';
		content += '<th>'+item.gallery_jjim+'</th>';
		content += '<th>'+item.user_id+'</th>';
		content += '<th>'+item.nickname+'</th>';
		
 		let milliseconds = item.gallery_date;
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