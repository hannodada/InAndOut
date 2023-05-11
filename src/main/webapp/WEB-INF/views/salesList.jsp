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
		<c:if test="${biz_id ne null}">
			<input type="text" id="biz_id" name="biz_id" value="${biz_id}" hidden="true"/>
			<input type="text" id="biz_name" value="${biz_name}" readonly="readonly"/>
			<select name="goods_id" id="goods_id" onchange="filtering()">
				<c:forEach items="${goodsList}" var="i">
					<option value="${i.goods_id }">${i.goods_name }</option>
				</c:forEach>
			</select>
		</c:if>
		<c:if test="${biz_id eq null}">
			<input type="text" id="biz_id" name="biz_id" value="default" hidden="true"/>
			<input type="text" id="biz_name" value="전체" readonly="readonly"/>
			<input type="text" id="goods_id" name="goods_id" value="default" hidden="true"/>
		</c:if>
		<br>
		<select name="sido" id="sido">
		</select>
		<select name="sigungu" id="sigungu" onchange="filtering()">
		</select>
		<br>
		<input type="text" name="minPrice" id="minPrice" value="" onblur="filtering()"/>~
		<input type="text" name="maxPrice" id="maxPrice" value="" onblur="filtering()"/>
		<br>
	<select name="filter" id="filter" onchange="filtering()">
		<option value="sales_no">최신 순</option>
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
$('document').ready(function() {
	var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주특별자치시","세종특별자치시"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["대덕구","동구","서구","유성구","중구"];
	var area4 = ["광산구","남구","동구","북구","서구"];
	var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["남구","동구","북구","중구","울주군"];
	var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	var area17 = ["세종"];
	
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
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });


});

	function filtering(){
		
		console.log('change');

		var filterName = document.getElementById('filter').value;
		console.log(filterName);
		var biz_id = document.getElementById('biz_id').value;
		console.log(biz_id);
		var goods_id = document.getElementById('goods_id').value;
		console.log(goods_id);
		var sido = document.getElementById('sido').value;
		console.log(sido);
		if(sido=='시/도 선택'){
			sido = 'default';
			console.log(sido);
		}
		var sigungu = document.getElementById('sigungu').value;
		console.log(sigungu);
		if(sigungu==''){
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
		
		$.ajax({
			type: 'get',
			url: 'salesFiltering.ajax',
			data: {
				'filterName':filterName,
				'biz_id':biz_id,
				'goods_id':goods_id,
				'sido':sido,
				'sigungu':sigungu,
				'minPrice':minPrice,
				'maxPrice':maxPrice
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