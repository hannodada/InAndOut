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
#paging{
	text-align: center;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>
				판매목록 / 
					<c:if test="${biz_id ne null}">
						<input type="text" id="flag" name="flag" value="${flag}" hidden="true"/>
						<input type="text" id="biz_id" name="biz_id" value="${biz_id}" hidden="true"/>
						<input type="text" id="biz_name" value="${biz_name}" readonly="readonly"/> &gt;
						<select name="goods_id" id="goods_id" onchange="filtering()">
							<c:forEach items="${goodsList}" var="i">
								<option value="${i.goods_id }">${i.goods_name }</option>
							</c:forEach>
						</select>
					</c:if>
					<c:if test="${biz_id eq null}">
						<input type="text" id="flag" name="flag" value="${flag}" hidden="true"/>
						<input type="text" id="biz_id" name="biz_id" value="default" hidden="true"/>
						<input type="text" id="biz_name" value="전체" readonly="readonly"/>
						<input type="text" id="goods_id" name="goods_id" value="default" hidden="true"/>
					</c:if>
				</td>
				<td>
					<select name="filter" id="filter" onchange="filtering()">
						<option value="sales_no">최신 순</option>
						<option value="hit">조회수 순</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				위치 / 
					<select name="sido" id="sido">
					</select> &gt;
					<select name="sigungu" id="sigungu" onchange="filtering()">
					</select>			
				</td>
				<td>
				가격 /
					<input type="text" name="minPrice" id="minPrice" value="" onblur="filtering()"/>원 ~ 
					<input type="text" name="maxPrice" id="maxPrice" value="" onblur="filtering()"/>원
				</td>
			</tr>
		</thead>
		<tbody id="list">

		</tbody>
		<tr>
			<td colspan="13" id="paging">	
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
$('document').ready(function() {
	var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주특별자치시","세종특별자치시"];
	var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
	var area4 = ["전체","광산구","남구","동구","북구","서구"];
	var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["전체","남구","동구","북구","중구","울주군"];
	var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["전체","서귀포시","제주시","남제주군","북제주군"];
	var area17 = ["전체","세종"];
	
	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});

	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		console.log(area);
		var $gugun = $(this).next(); // 선택영역 군구 객체
		console.log($gugun);
		$("option",$gugun).remove(); // 구군 초기화

		if(area == "area0")
			$gugun.append("<option value=''>구/군 선택</option>");
		else {
			$.each(eval(area), function() {
				console.log(this);
				$gugun.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
		filtering(); //시도 체인지할때도 필터링 함수 작동
	});

});

//기본값으로 1번 페이지를 설정한다.
var showPage = 1;

listCall(showPage);

// 게시물 갯수를 5 - 10 - 15 - ... 변경될 때마다 listCall을 해줘야 함.
function filtering(){
	$('#flag').val('second');  
	listCall(showPage);	
	// 페이지 총 갯수가 이미 만들어져 있어서 pagePerNum이 변경되면 수정이 안되는 문제가 있다.
	// 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
	// 밑에 만들어진 paging plugin을 부수기
	$('#pagination').twbsPagination('destroy');
};

function listCall(page){
	var filterName = document.getElementById('filter').value;
	var biz_id = document.getElementById('biz_id').value;
	console.log(biz_id);
	var goods_id = document.getElementById('goods_id').value;
	console.log(goods_id);
	var sido = document.getElementById('sido').value;
	console.log(sido);
	var flag = document.getElementById('flag').value;
	
	if(sido=='시/도 선택'||sido==''){
		sido = 'default';
		console.log(sido);
	}
	var sigungu = document.getElementById('sigungu').value;
	console.log(sigungu);
	if(sigungu=='전체'||sigungu==''){
		sigungu = 'default';
		console.log(sigungu);
	}
	var minPrice = document.getElementById('minPrice').value;
	console.log(minPrice);
	if(minPrice==''){
		minPrice = 'default';
		console.log(minPrice);
	}
	var maxPrice = document.getElementById('maxPrice').value;
	console.log(maxPrice);
	if(maxPrice==''){
		maxPrice = 'default';
		console.log(maxPrice);
	}
	if(flag!='first'){
		flag = 'second';
		console.log(flag);
	}
	
	$.ajax({
		
		type: 'post',
		url: 'salesList.ajax',
		data: {
			'page':page,
			'cnt':15,
			'filterName':filterName,
			'biz_id':biz_id,
			'goods_id':goods_id,
			'sido':sido,
			'sigungu':sigungu,
			'minPrice':minPrice,
			'maxPrice':maxPrice,
			'flag':flag
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
		content += '<th>'+item.sales_no+'</th>';
		content += '<th>'+item.sales_state+'</th>';

		if(item.new_photo_name == null){
			content += '<th><img src="resources/img/defaultIMG.png';
		}else{
			content += '<th><img src="/photo/'+item.new_photo_name;
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