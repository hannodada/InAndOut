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
    
    #profileUser{
	width: 73px;
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
    	    border: 1px solid black;   
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
    
    
    </style>
<body>

<jsp:include page="realGnb.jsp"/>


	<a href="salesWrite.go">판매글 등록</a>
	<a href="galleryWrite.go">갤러리 등록</a>
	<a href="salesList.do">판매글 보기</a>
	<a href="galleryList.do">갤러리 보기</a>
	<a href="myPage.go">마이페이지 보기</a>
	<a href="riderPage">라이더페이지 보기</a>
	
	
	
	<br>
	<hr>
	<br>
	
	&nbsp;&nbsp;&nbsp;&nbsp; <h2>카테고리</h2>
	<br>
	
	<table>
		<tr>
			<td>
			<!--  onclick="location.href='profile.go?idx'""-->
				<a href="catagory.go?biz_id=b001" id="catagorybox">
				<img src="resources/photo/free-icon-coffee-4062363.png" id="profileUser" >
				<br>
				<a>카페</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b002" id="catagorybox">
				<img src="resources/photo/food.png" id="profileUser" >
				<br>
				<a>음식점</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b003" id="catagorybox">
				<img src="resources/photo/free-icon-park-4299072.png" id="profileUser" >
				<br>
				<a>여가오락</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b004" id="catagorybox">
				<img src="resources/photo/free-icon-teach-4696727.png" id="profileUser" >
				<br>
				<a>교육</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b005" id="catagorybox">
				<img src="resources/photo/free-icon-exercise-2833390.png" id="profileUser" >
				<br>
				<a>운동</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b006" id="catagorybox">
				<img src="resources/photo/free-icon-pet-grooming-6317238.png" id="profileUser" >
				<br>
				<a>미용</a>
				</a>
			</td>
			
		</tr>
		<tr>
			<td>
				<a href="catagory.go?biz_id=b007" id="catagorybox">
				<img src="resources/photo/free-icon-resort-5273329.png" id="profileUser" >
				<br>
				<a>숙박업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b008" id="catagorybox">
				<img src="resources/photo/animal-shelter.png" id="profileUser" >
				<br>
				<a>반려동물</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b009" id="catagorybox">
				<img src="resources/photo/washing-machine.png" id="profileUser" >
				<br>
				<a>세탁업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b010" id="catagorybox">
				<img src="resources/photo/mart.png" id="profileUser" >
				<br>
				<a>도소매</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b011" id="catagorybox">
				<img src="resources/photo/ellipsis.png" id="profileUser" >
				<br>
				<a>기타</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id" id="catagorybox">
				<img src="resources/photo/select-all.png" id="profileUser" >
				<br>
				<a>모든상품</a>
				</a>
			</td>
		</tr>
	
	</table>
<c:if test="${sessionScope.loginId eq null}">
			<c:if test="${list eq null}">
		
						<br>
						<br>
						<hr>
						<h2>(리스트가 null 일 때 나오는) 가장 많이 판매하는 사람 top 5</h2>
						<br>	
			</c:if>
			
			<c:if test="${attentionTopList ne null}">
						<br>
						<hr>
						<br>
						<h2> 조회수 순으로 판매글(4개) 호출</h2>
						<br>
		     		 <table>
	     		 		<tr>
		     		 		<c:forEach items="${attentionTopList }" var="topSeller">
					     		  	<c:if test="${topSeller.new_photo_name eq null}">
					     		 		<td>
						     		 		<br>
						     		 		<img src="resources/photo/자전거.png" id="hitSeller" onclick="location.href='profile.go'">
					    					<br>
					    					<a>${topSeller.subject }</a>
					    					<br>
					    					<a>${topSeller.price }원</a>
						    			</td>
				    				</c:if>
					     		 	<c:if test="${topSeller.new_photo_name ne null}">
						    			<td>	
							     		 		<br>
							     		 		<img src="resources/photo/${attentiontop.new_photo_name}" id="hitSeller" onclick="location.href='profile.go'">
						    					<br>
						    					<a>${topSeller.subject }</a>
						    					<br>
						    					<a>${topSeller.price }원</a>
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
	   		 
	   		 
	   		 
	   		 
	   		 
			
			
			
			
			<c:if test="${list ne null}">
			<br>
			<br>
			<hr>
			<br>
			<h2>가장 많이 판매하는 사람 top 5</h2>
			<br>
					<table>
						<tr>
				   		 <c:forEach items="${list }" var="bbs">
			     		  	<c:if test="${bbs.new_photo_name eq null}">
								<td>
							     		  		<br>
							     		 		<img src="resources/photo/프로필 기본.png" id="sellerProfile" onclick="location.href='profile.go'">
						    					<br>
						    					<a>${bbs.user_id }</a>
				    			</td>
	   						</c:if>
	     		 			<c:if test="${bbs.new_photo_name ne null}">
				    			<td>	
							     		 		<br>
							     		 		<img src="resources/photo/${bbs.new_photo_name}" id="sellerProfile" onclick="location.href='profile.go'">
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
				     		 			<img src="resources/photo/오늘의집.png" id="gallery" onclick="location.href='profile.go'">
			    						<br>
			    						<a>${hGallery.gallery_subject }</a>	
			    					</td>
			    				</c:if>
				     		 	<c:if test="${hGallery.new_photo_name ne null}">
					     		 	<td>	
					     		 		<br>
					     		 		<img src="resources/photo/${hGallery.new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
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
			<h2>${sessionScope.loginId }님 주위에 가장 많이 판매하는 사람 top 5</h2>
			<br>
	
					
					<div id="topSeller">
			   		 <c:forEach items="${sigunguTopList }" var="sigungu">
					     		  	<c:if test="${sigungu.new_photo_name eq null}">
					     		 		<img src="resources/photo/프로필 기본.png" id="profileUser" onclick="location.href='profile.go'">
				    				</c:if>
					     		 	<c:if test="${sigungu.new_photo_name ne null}">
					     		 		<img src="resources/photo/${sigungu.new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
				    				</c:if>
					</c:forEach>
					</div>
					
					
					<div id="topSeller">
					<c:forEach items="${sigunguTopList }" var="sigungu">
							     	<a>${sigungu.user_id }</a>		 
					</c:forEach>
					</div>
					
					
					<div>
							<c:if test="${sigunguTopList eq null}">
				     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
				     		 </c:if>
				     		 
				     		 <c:if test="${sigunguTopList ne null}">
				     		 	
				     		 </c:if>
					</div>
			</c:if>
		
		
			<c:if test="${memberAttentionTopList eq null}">
					<br>
					<hr>
					<h2>(null나옴) 관심업종 중 조회수 순으로 판매글(4개) 호출된 모습</h2>
					<br>
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
	   		 </c:if>
     		 			<br>
	     		 
     		 <c:if test="${memberAttentionTopList ne null}">
					<br>
					<hr>
					<h2>${sessionScope.loginId }님 관심업종 중 조회수 순으로 판매글(4개) 호출</h2>
					<br>
	     		 <table>
     		 		<tr>
	     		 		<td>
		     		 		<c:forEach items="${memberAttentionTopList }" var="attentiontop">
				     		  	<c:if test="${attentiontop.new_photo_name eq null}">
				     		 		<img src="resources/photo/1682833860491.png" id="profileUser" onclick="location.href='profile.go'">
			    				</c:if>
				     		 	<c:if test="${attentiontop.new_photo_name ne null}">
				     		 		<img src="resources/photo/${attentiontop.new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
			    				</c:if>
							</c:forEach>
	     		 		<td>
     		 		</tr>
     		 		<tr>
     		 			<td>
     		 				<c:forEach items="${memberAttentionTopList }" var="attentiontop">
				     		  	
				     		 	<c:if test="${attentiontop.subject ne null}">
				     		 			${attentiontop.subject }
			     		 		</c:if>
							</c:forEach>
     		 			</td>
     		 		</tr>
     		 		<tr>
     		 			<td>
     		 				<c:forEach items="${memberAttentionTopList }" var="attentiontop">
				     		  	
				     		 	<c:if test="${attentiontop.price ne null}">
				     		 		${attentiontop.price }
			     		 		</c:if>
							</c:forEach>
     		 			</td>
     		 		</tr>
     		 	</table>
     		 </c:if>
     		 
     		 
     		 <c:if test="${hitGallery eq null}">
					<br>
					<hr>
					<h2>(null나옴) 조회수 순으로 갤러리 호출</h2>
					<br>
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
	   		 </c:if>
     		 			<br>
	     		 
     		 <c:if test="${hitGallery ne null}">
					<br>
					<hr>
					<h2>조회수 순으로 갤러리 호출</h2>
					<br>
	     		 <table>
     		 		<tr>
	     		 		<td>
		     		 		<c:forEach items="${hitGallery }" var="hGallery">
				     		  	<c:if test="${hGallery.new_photo_name eq null}">
				     		 		<img src="resources/photo/1682833860491.png" id="profileUser" onclick="location.href='profile.go'">
			    				</c:if>
				     		 	<c:if test="${hGallery.new_photo_name ne null}">
				     		 		<img src="resources/photo/${hGallery.new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
			    				</c:if>
							</c:forEach>
	     		 		<td>
     		 		</tr>
     		 		<tr>
     		 			<td>
     		 				<c:forEach items="${hitGallery }" var="hGallery">
				     		  	
				     		 	<c:if test="${hGallery.gallery_subject ne null}">
				     		 			${hGallery.gallery_subject }
			     		 		</c:if>
							</c:forEach>
     		 			</td>
     		 		</tr>
     		 		
     		 	</table>
     		 </c:if>
     		 
     		 
	
	
	
</c:if>
	
	

	
	   				
	<br>
	
	<br>
	<hr>
	
	
	 
	
	
	
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>

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
</script>
</html>