<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- <link href="resources/css/home.css" rel="stylesheet"> -->
    <style>
        /* @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap'); */
    
    #catagorybox{
    
    	/* text-align: center; */
    	color: black;
    /* 	display: flex; */
		/*  align-items: center; */
		/* justify-content: flex-star; */
		font-family: 'Noto Sans KR', sans-serif;
		width: 173px;
		font-weight: bold;
		/* border: 1px solid black; */
    }
    #topSeller{
    
	    text-align: center;
	    	color: black;
	    	display: flex;
			/*  align-items: center; */
			justify-content: flex-star;
			font-family: 'Noto Sans KR', sans-serif;
			width: 420px;
			font-weight: bold;
			border: 1px soild black;
			
			
    }
    #mom{
    	 text-align: center;
	    	color: black;
	    	display: flex;
			/*  align-items: center; */
			justify-content: flex-star;
			font-family: 'Noto Sans KR', sans-serif;
			width: 173px;
			font-weight: bold;
			
    
    }
    
    #topCategery{
	width: 43px;
	cursor:pointer;
	border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px; 
            
    margin-right: 9px;     
            
	}
    
    #hitSeller{
    	width: 250px;
		cursor:pointer;
		border-top-left-radius: 15px;
	            border-bottom-left-radius: 15px;
	            border-top-right-radius: 15px;
	            border-bottom-right-radius: 15px; 
	            
	    margin-right: 9px;     
    
    
    }
    
    #sellerProfile{
    	width: 150px;
		cursor:pointer;
		border-top-left-radius: 75px;
	            border-bottom-left-radius: 75px;
	            border-top-right-radius: 75px;
	            border-bottom-right-radius: 75px; 
	            
	    margin-right: 9px;     
    
    }
    
    #gallery{
    		width: 320px;
			cursor:pointer;
			border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px; 
    		margin-right: 9px; 
    
    }
    
    
    table,tr,td {
    	     /* border: 1px solid black;     */
    	 border-collapse: collapse;
    }
    table{
    	
    	text-align: center;
    	 display: flex;
 		 justify-content: center;
  		align-items: center;
    }
    
    tr,td{
    	padding: 50px;
    
    }
    tr{
    	
    
    }
    td{
    
    
    }
    
    h2{
    	margin-left: 13%;
    	margin-top: 2%;
    
    }
    
    
    button2 {
      font-size: 1rem;
      padding: 10px 30px;
      background: none;
      color: #fff;
      border: 1px solid #fff;
      font-weight: bold;
      transition: 0.3s;
      margin:2rem 0;
    }



    button2:hover {
      background: #222;
      color: #fff;
      border: 1px solid #222;
      font-weight: bold;
      cursor: pointer;
    }
    .hit{
    	color: gray;
    }
    
    
 

    
    
.swiper-container {
    width:100%;
    height:750px;
  overflow: hidden;
}
.swiper-slide {
  width:100%; 
  height:500px;
  
}



.swiper-wrapper>:nth-child(1){
  /* background: url('https://www.giordano.co.kr/_data/banner/fed616381318d0738a6374015d126cd4.jpg') no-repeat;
  */ background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(80%);
}

.swiper-wrapper>:nth-child(2){
 /*  background: url('https://www.giordano.co.kr/_data/banner/98acc476a923f7c4753a3fb0daf6b994.jpg') no-repeat;
  */ background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(80%);
}

.swiper-wrapper>:nth-child(3){
  /* background: url('https://www.giordano.co.kr/_data/banner/5e48273587f8ae1ee45f151f67e9d186.jpg') no-repeat;
  */ background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(90%);
}

.swiper-slide img{
  width:100%;
  height: 255px;
  border-top-left-radius: 15px;
  border-bottom-left-radius: 15px;
  border-top-right-radius: 15px;
  border-bottom-right-radius: 15px; 
}

.mword{
  position: absolute;
  top: 50%;
  left:50%;
  transform: translate(-50%, -50%);
  z-index:10;
   text-align:center;
}




.swiper-container {
    width:100%;
    height:750px;
  overflow: hidden;
}
.swiper-slide {
  width:100%; 
  height:500px;
}

.swiper-wrapper>:nth-child(1){
 /*  background: url('resources/photo/백그2.png') no-repeat; */
  background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(80%);
}

.swiper-wrapper>:nth-child(2){
  /* background: url('resources/photo/백그3.png') no-repeat; */
  background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(80%);
}

.swiper-wrapper>:nth-child(3){
  /* background: url('resources/photo/오늘의집백그라운드1.png') no-repeat; */
  background-size: cover;
  background-position: center;
  position: relative;
  filter:brightness(90%);
}

.swiper-slide img{
  width:100%;
}

.mword{
  position: absolute;
  top: 50%;
  left:50%;
  transform: translate(-50%, -50%);
  z-index:10;
   text-align:center;
}


main p{
  font-size: 1rem;
   color: #fff;
  line-height: 2rem;
  padding-top:1rem;
  
}

.swiper-button-next0{
  color:#fff;
  font-size: 5rem;
  position: absolute;
  top: 50%;
  right: 5%;
  z-index:99;
  font-weight:200;
}

.swiper-button-prev0{
  color:#fff;
  font-size: 5rem;
  position: absolute;
  top: 50%;
  left: 5%;
  z-index:99;
  font-weight:200;
}


  .top {
  position: fixed;
  right: 3%;
  bottom: 8%;
  cursor:pointer;
  z-index:20;
    color:#fff;
padding:10px;
    background:#444;
    
}



.one{
  clear:both;
  width:1000px;
  padding: 9rem 0;
  margin:0 auto;
}

.one p {
  text-align:center;
}

.one>:nth-child(3){
  display:flex;
  justify-content:space-between;
  margin-top: 2rem;
}

.one section{
  width:48.5%;
  height:300px;
  cursor:pointer;
}

.one>:nth-child(3)>:first-child{
  /*  background: url('https://www.giordano.co.kr/_data/attach/202005/04/91d016c37b5ed809a3b70e92b4c62a58.jpg#addimg') no-repeat;
  */ background-size: cover;
  background-position: top center;
  position: relative;
}

.one>:nth-child(3)>:last-child{
  /*  background: url('https://www.giordano.co.kr/_data/attach/202003/24/8306a84bc34b06be90b2dcbd5c3f3a3e.jpg#addimg') no-repeat;
   */background-size: cover;
  background-position: top center;
  position: relative;
}

.one section div{
  width:100%;
  height:300px;
  opacity:0;
}

.one section div:hover{
  opacity:0.9;
  background:rgba(0,0,0,0.5)
}

.one h3{
  text-align:center;
  line-height: 17rem;
  color:#fff;
  font-size: 2rem;
}

.two{
  clear:both;
   background:#eee; 
}

.two>:first-child{
  width:1600px;
  margin:0 auto;
  height:650px;
  display:flex;
  padding: 9rem 2rem 50px 0rem;
  
  
}

.two>:first-child>:first-child{
  width:18%;
  padding: 2rem 1rem;
  text-align:center;
  position:relative;
}

.two>:first-child>:last-child{
  width:75%;
  
}

.swiper-container1 {
	height:360px;
  overflow:hidden;
}
.swiper-slide {
	text-align:center;
	display:flex; 
	justify-content:center; /* 좌우 기준 중앙정렬 */
  cursor:pointer;
  height:85%;
  
}

.swiper-slide:hover{
  opacity:1;
}

.swiper-slide img {
	width:77%;
  height:280px;
  position:relative;
}



.word{
  width:200px;
  position:absolute;
  left:50%;
  transform: translate(-50%, 0%);
  bottom: 5%;
  padding:0 5px;
  text-align:center;
}



.swiper-button-next1{
  color:#333;
  font-size:1.8rem;
  border:1px solid silver;
  width:60px;
  height:60px;
  line-height:3.3rem;
  position:absolute;
  top:40%;
  right:25.5%;
  cursor:pointer;
}

.swiper-button-prev1{
  color:#333;
  font-size:1.8rem;
  border:1px solid silver;
  width:60px;
  height:60px;
  line-height:3.3rem;
  position:absolute;
  top:40%;
  left:25.5%;
  cursor:pointer;
}

#topCategery:hover {
  animation: moveUp 0.3s ease-in-out;
}

@keyframes moveUp {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-5px);
  }
  100% {
    transform: translateY(0);
  }
}


    
    
</style>

<body>

<jsp:include page="realGnb.jsp"/>


	
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









</script>
</html>