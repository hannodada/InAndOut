<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/home(경영).css" rel="stylesheet">  
    <style>
        /* @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap'); */
    




   
    
</style>


<body>

<jsp:include page="realGnb.jsp"/>



	<a href="salesWrite.go">판매글 등록</a>
	<a href="galleryWrite.go">갤러리 등록</a>
	<a href="salesList.do">판매글 보기</a>
	<a href="galleryList.do">갤러리 보기</a>
	<a href="myPage.go">마이페이지 보기</a>
	<a href="riderPage">라이더페이지 보기</a>
	<a href="riderList.go">라이더리스트</a>
	
	

	
	<br>
	
	 <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카테고리</h2>
	<br>
	
	<table>
		<tr>
			<td>
			<!--  onclick="location.href='profile.go?idx'""-->
				<a href="catagory.go?biz_id=b001" id="catagorybox">
				<img src="resources/photo/free-icon-coffee-4062363.png" id="topCategery" >
				<br>
				<a>카페</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b002" id="catagorybox">
				<img src="resources/photo/food.png" id="topCategery" >
				<br>
				<a>음식점</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b003" id="catagorybox">
				<img src="resources/photo/free-icon-park-4299072.png" id="topCategery" >
				<br>
				<a>여가오락</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b004" id="catagorybox">
				<img src="resources/photo/free-icon-teach-4696727.png" id="topCategery" >
				<br>
				<a>교육</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b005" id="catagorybox">
				<img src="resources/photo/free-icon-exercise-2833390.png" id="topCategery" >
				<br>
				<a>운동</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b006" id="catagorybox">
				<img src="resources/photo/free-icon-pet-grooming-6317238.png" id="topCategery" >
				<br>
				<a>미용</a>
				</a>
			</td>
			
		</tr>
		<tr>
			<td>
				<a href="catagory.go?biz_id=b007" id="catagorybox">
				<img src="resources/photo/free-icon-resort-5273329.png" id="topCategery" >
				<br>
				<a>숙박업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b008" id="catagorybox">
				<img src="resources/photo/animal-shelter.png" id="topCategery" >
				<br>
				<a>반려동물</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b009" id="catagorybox">
				<img src="resources/photo/washing-machine.png" id="topCategery" >
				<br>
				<a>세탁업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b010" id="catagorybox">
				<img src="resources/photo/mart.png" id="topCategery" >
				<br>
				<a>도소매</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b011" id="catagorybox">
				<img src="resources/photo/ellipsis.png" id="topCategery" >
				<br>
				<a>기타</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id" id="catagorybox">
				<img src="resources/photo/select-all.png" id="topCategery" >
				<br>
				<a>모든상품</a>
				</a>
			</td>
		</tr>
	</table>
	<br>
	<br>
	
	<br>
	
				 
	
<c:if test="${sessionScope.loginId eq null}">
			<c:if test="${list eq null}">
		

						<br>
						<br>
						<hr>
						<h2>(리스트가 null 일 때 나오는) 가장 많이 판매하는 사람 top 5</h2>
						<br>	
			</c:if>
			
			<br>
			<br>
			
   <article class="two">
      <div>
	        <section>
	          <h2>Hot Place</h2>
	        <p>조회수 top10 핫한 판매글 </p>
	          
	          	<!-- 네비게이션 -->
		<div class="swiper-button-next1"> 〉 </div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev1"> 〈 </div><!-- 이전 버튼 -->
	        </section>
		        
		     
		        
		        <section>
		          <div class="swiper-container1">
					<div class="swiper-wrapper">
						<c:forEach items="${attentionTopList }" var="topSeller">
						<c:if test="${topSeller.new_photo_name eq null}">
						
							<div class="swiper-slide"><img src="resources/photo/자전거.png" onclick="location.href='salesDetail.do?sales_no=${topSeller.sales_no}'">
						      	<div class="word">
								        <h5>${topSeller.subject }<h5>
								          <p>${topSeller.price }원</p>
								          <a class="hit">조회수 ${topSeller.hit }</a>
						          </div>
							</div>
						</c:if>
						<c:if test="${topSeller.new_photo_name ne null}">
							<div class="swiper-slide"><img src="resources/photo/${topSeller.new_photo_name}" onclick="location.href='salesDetail.do?sales_no=${topSeller.sales_no}'">
						      	<div class="word">
								        <h5>${topSeller.subject }<h5>
								          <p>${topSeller.price }원</p>
								          <a class="hit">조회수 ${topSeller.hit }</a>
						          </div>
							</div>
						
						</c:if>
						</c:forEach>

					</div>

			<!-- 페이징 -->
					<div class="swiper-pagination1"></div>
				</div>
		        </section>
      </div>      
    </article>		
			
			
				
			
			
			
			<c:if test="${list ne null}">
			<br>
			<br>
			
			<br>
			<h2>가장 많이 판매하는 사람 top 5</h2>
			<br>
					<table>
						<tr>
				   		 <c:forEach items="${list }" var="bbs">
			     		  	<c:if test="${bbs.new_photo_name eq null}">
								<td>
							     		  		<br>
							     		 		<img src="resources/photo/프로필 기본.png" id="sellerProfile" onclick="location.href='myPage.go?user_id=${bbs.user_id}'">
						    					<br>
						    					<a>${bbs.user_id }</a>
				    			</td>
	   						</c:if>
	     		 			<c:if test="${bbs.new_photo_name ne null}">
				    			<td>	
							     		 		<br>
							     		 		<img src="resources/photo/${bbs.new_photo_name}" id="sellerProfile" onclick="location.href='myPage.go?user_id=${bbs.user_id}'">
					    						<br>
						    					<a>${bbs.user_id }</a>
								</td>
	    					</c:if>
						</c:forEach>
						</tr>
					</table>
			</c:if>
			
			
			
			
			
			<c:if test="${hitGallery ne null}">
						<br>
						<hr>
						<br>
						<h2>조회수 순으로 갤러리 호출</h2>
						<br>
		     		 <table>
	     		 		<tr>
		     		 		<c:forEach items="${hitGallery }" var="hGallery">
				     		  	<c:if test="${hGallery.new_photo_name eq null}">
			     		 			<td>
				     		 			<br>
				     		 			<img src="resources/photo/마이프차3.png" id="gallery" onclick="location.href='galleryDetail.do?gallery_no=${hGallery.gallery_no}'">
			    						<br>
			    						<a>${hGallery.gallery_subject }</a>	
			    					</td>
			    				</c:if>
				     		 	<c:if test="${hGallery.new_photo_name ne null}">
					     		 	<td>	
					     		 		<br>
					     		 		<img src="resources/photo/${hGallery.new_photo_name}" id="gallery" onclick="location.href='galleryDetail.do?gallery_no=${hGallery.gallery_no}'">
				    					<br>
			    						<a>${hGallery.gallery_subject }</a>
			    					</td>
			    				</c:if>
							</c:forEach>
							
							
							
							
							
							
							
							
	     		 		</tr>
	     		 	</table>
	   		 </c:if>

</c:if>
	
<c:if test="${sessionScope.loginId ne null}">
	
			
			
			
			
			
			
			
			<c:if test="${sigunguTopList eq null}">
				시군구 지역 프로필 출력 못함
			</c:if>
			

			
			<c:if test="${sigunguTopList ne null}">
			<br>
			<br>
			<hr>
			<br>
			<h2>${sessionScope.loginId }님 주위에 가장 많이 판매하는 사람 top 5</h2>
			<br>
					<table>
						<tr>
				   		 <c:forEach items="${sigunguTopList }" var="sigungu">
				   		 
				   		 <!-- 지금 값이 없는대도 불구하고 group by 구문에서만 이상하게 null 말고 다른 어떤 이상한게 나옴.... 그래서 뭔가 잇는데 null은 아닌상태?? 가 되서
				   		 자꾸 오류가 나는 상황.
				   		 일단 만약 강남구라면 강남구 사람은 나오는데 강북구 이면 오류가 발생하는 상황이 나옴.. 해결방법을 알 수 없음. null 인데 null은 아닌 이상한 상황. 
				   		 일단은 가려놓고, 오류 해결 해야 할듯.
				   		 
			     		  	<c:if test="${sigungu.new_photo_name eq null}">
								<td>
							     		  		<br>
							     		 		<img src="resources/photo/프로필 기본.png" id="sellerProfile" onclick="location.href='myPage.go?user_id=${sigungu.user_id}'">
				    							<br>
						    					<a>${sigungu.user_id }</a>
				    			</td>
	   						</c:if>
	     		 			 <c:if test="${sigungu.new_photo_name ne null}">
				    			<td>	
							     		 		<br>
							     		 		<img src="resources/photo/${sigungu.new_photo_name}" id="sellerProfile" onclick="location.href='myPage.go?user_id=${sigungu.user_id}'">
				    							<br>
						    					<a>${sigungu.user_id }</a>
								</td>
	    					</c:if> 
	    				  -->	
						</c:forEach>
						</tr>
					</table>
			</c:if>
			 
		
			 <c:if test="${memberAttentionTopList eq null}">
					<br>
					<hr>
					<h2>(null나옴) 관심업종 중 조회수 순으로 판매글(4개) 호출된 모습</h2>
					<br>
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
	   		 </c:if>
	   		 

	   		 <c:if test="${memberAttentionTopList ne null}">
						<br>
						<hr>
						<br>
						<h2> ${sessionScope.loginId }님 관심업종 중 조회수 순으로 판매글(4개) 호출</h2>
						<br>
		     		 <table>
	     		 		<tr>
		     		 		<c:forEach items="${memberAttentionTopList }" var="attentiontop">
					     		  	<c:if test="${attentiontop.new_photo_name eq null}">
					     		 		<td>
						     		 		<br>
						     		 		<img src="resources/photo/자전거.png" id="hitSeller" onclick="location.href='profile.go'">
					    					<br>
					    					<a>${attentiontop.subject }</a>
					    					<br>
					    					<a>${attentiontop.price }원</a>
						    			</td>
				    				</c:if>
					     		 	<c:if test="${attentiontop.new_photo_name ne null}">
						    			<td>	
							     		 		<br>
							     		 		<img src="resources/photo/${attentiontop.new_photo_name}" id="hitSeller" onclick="location.href='profile.go'">
						    					<br>
						    					<a>${attentiontop.subject }</a>
						    					<br>
						    					<a>${attentiontop.price }원</a>
					     		 		</td>
			    					</c:if>
							</c:forEach>
	     		 		</tr>
	     		 	</table>
	   		 </c:if>
     		 
     		 
     		 <c:if test="${hitGallery ne null}">
						<br>
						<hr>
						<br>
						<h2>조회수 순으로 갤러리 호출</h2>
						<br>
		     		 <table>
	     		 		<tr>
		     		 		<c:forEach items="${hitGallery }" var="hGallery">
				     		  	<c:if test="${hGallery.new_photo_name eq null}">
			     		 			<td>
				     		 			<br>
				     		 			<img src="resources/photo/오늘의집.png" id="gallery" onclick="location.href='profile.go'">
			    						<br>
			    						<a>${hGallery.gallery_subject }</a>	
			    					</td>
			    				</c:if>
				     		 	<c:if test="${hGallery.new_photo_name ne null}">
					     		 	<td>	
					     		 		<br>
					     		 		<img src="resources/photo/${hGallery.new_photo_name}" id="gallery" onclick="location.href='profile.go'">
				    					<br>
			    						<a>${hGallery.gallery_subject }</a>
			    					</td>
			    				</c:if>
							</c:forEach>
	     		 		</tr>
	     		 	</table>
	   		 </c:if>
     		 
     		 
	
	
	
</c:if>
	
	

	
	   				

	<br>
	
	<br>
	<hr>
	<br>
	
	<br><br>
	
	<br><br>
	
	<br>
	
	 <img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
	
	


<ul id="gnb1">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
	
	
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=03ca3b7a211dd9cbb0616b7b121983de"></script>
	
<script>


var prevScrollpos = window.pageYOffset; 

window.onscroll = function() { 
  

  var currentScrollpos = window.pageYOffset; 
  

  if (prevScrollpos > currentScrollpos) { 

    document.getElementById("navbar").style.top = "0"; 

  } else { 

    document.getElementById("navbar").style.top = "-100px"; 
  }
  

  prevScrollpos = currentScrollpos; 

}


//slider

new Swiper('.swiper', {
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
  
	navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next0', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev0', // 이번 버튼 클래스명
	},
});


///top

$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.top' ).fadeIn();
	} else {
		$( '.top' ).fadeOut();
	}
} );

$( '.top' ).click( function() {
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	return false;
} );


//new slider


new Swiper('.swiper-container1', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination1',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next1', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev1', // 이번 버튼 클래스명
	},
});



//지도 api

var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);







</script>
</html>