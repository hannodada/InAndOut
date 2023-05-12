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
    
    	text-align: center;
    	color: black;
    	display: flex;
		/*  align-items: center; */
		justify-content: flex-star;
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
			width: 173px;
			font-weight: bold;
    }
    
    </style></head>
<body>

<jsp:include page="realGnb.jsp"/>


	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
	<a href="salesWrite.go">판매글 등록</a>
	<a href="galleryWrite.go">갤러리 등록</a>
	<a href="salesList.do">판매글 보기</a>
	<a href="galleryList.do">갤러리 보기</a>
	<a href="myPage.go">마이페이지 보기</a>
	<a href="riderPage">라이더페이지 보기</a>
	
	
	
	<br>
	<hr>
	<br>
	<h2>카테고리</h2>
	<br>
	
	<table>
		<tr>
			<td>
			<!--  onclick="location.href='profile.go?idx'""-->
				<a href="catagory.go?biz_id=b001" id="catagorybox">
				<img src="resources/photo/free-icon-coffee-4062363.png" id="profileNomal" >
				<br>
				<a>카페</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b002" id="catagorybox">
				<img src="resources/photo/food.png" id="profileNomal" >
				<br>
				<a>음식점</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b003" id="catagorybox">
				<img src="resources/photo/free-icon-park-4299072.png" id="profileNomal" >
				<br>
				<a>여가오락</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b004" id="catagorybox">
				<img src="resources/photo/free-icon-teach-4696727.png" id="profileNomal" >
				<br>
				<a>교육</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b005" id="catagorybox">
				<img src="resources/photo/free-icon-exercise-2833390.png" id="profileNomal" >
				<br>
				<a>운동</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b006" id="catagorybox">
				<img src="resources/photo/free-icon-pet-grooming-6317238.png" id="profileNomal" >
				<br>
				<a>미용</a>
				</a>
			</td>
			
		</tr>
		<tr>
			<td>
				<a href="catagory.go?biz_id=b007" id="catagorybox">
				<img src="resources/photo/free-icon-resort-5273329.png" id="profileNomal" >
				<br>
				<a>숙박업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b008" id="catagorybox">
				<img src="resources/photo/animal-shelter.png" id="profileNomal" >
				<br>
				<a>반려동물</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b009" id="catagorybox">
				<img src="resources/photo/washing-machine.png" id="profileNomal" >
				<br>
				<a>세탁업</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b010" id="catagorybox">
				<img src="resources/photo/mart.png" id="profileNomal" >
				<br>
				<a>도소매</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id=b011" id="catagorybox">
				<img src="resources/photo/ellipsis.png" id="profileNomal" >
				<br>
				<a>기타</a>
				</a>
			</td>
			<td>
				<a href="catagory.go?biz_id" id="catagorybox">
				<img src="resources/photo/select-all.png" id="profileNomal" >
				<br>
				<a>모든상품</a>
				</a>
			</td>
		</tr>
	
	</table>
	
	
	
	<br>
	
	<br>
	<hr>
	<h2>가장 많이 판매하는 사람 top 5</h2>
	<br>
	
	<table id="topSeller">
		
		<tr>
			<td>
					<c:if test="${list eq null}">
					
					</c:if>
		     		 <c:forEach items="${list }" var="bbs">
			     		  <c:if test="${bbs.new_photo_name eq null}">
			     		 		<img src="resources/photo/프로필 기본.png" id="profileUser" onclick="location.href='profile.go'">
	     				</c:if>
			     		 <c:if test="${bbs.new_photo_name ne null}">
			     		 		<img src="resources/photo/${new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
	     				</c:if>
     				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>
					<c:if test="${list eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${list ne null}">
		     		 	<c:forEach items="${list }" var="bbs">
					     	<a>${bbs.user_id }</a>		 
			     		</c:forEach> 
		     		 </c:if>
			</td>
										
		</tr>
		
	</table>
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