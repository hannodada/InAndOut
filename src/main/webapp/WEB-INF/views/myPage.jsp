<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/home.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap');
    </style>
<body>
<form action="/myPage.go" method="get">
	<header>
	  <nav>
	   <a href="myPage.go" style="color:blue; text-decoration: underline;">모아보기</a>
	   <a href="mySales">판매글</a>
	   <a href="myGallery">갤러리</a>
	   <a href="mySalesJjim">관심판매글</a>
	   <a href="myGalleryJjim">찜한갤러리</a>
	   <a href="mySetting">설정</a>
	   
	  </nav>
	  
	</header>
	<div id="userdetailsales">
	<h4 style="font-size:15px; color:skyblue;line-height: 300%;">내가 올린 판매글</h4>
	<c:forEach items="${saleslist}" var="sl">
	<div style="float:left; margin-right:10px; display:inline;">
		<img width="500" src="/photo/${sl.new_photo_name}"/>
		<h5>${sl.subject}</h5>
		<h5 align="center">${sl.price}</h5>
	</div>
	<div id="userdetailgallery">
	<h4 style="font-size:15px; color:skyblue;line-height: 300%;">내가 올린 갤러리</h4>
	<c:forEach items="${saleslist}" var="sl">
	<div style="float:left; margin-right:10px; display:inline;">
		<img width="500" src="/photo/${sl.new_photo_name}"/>
		<h5>${sl.subject}</h5>
		<h5 align="center">${sl.price}</h5>
	</div>
	</c:forEach>
	</div>
	<hr>
    <div class="main-box">
        <div class="profile-box">
        <img src="resources/img/default profile.jpg" style="width: 130px;">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content">
        <c:choose>
        	<c:when test="${avg eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 2}">
        	<img src="resources/img/dolphin2.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 3}">
        	<img src="resources/img/dolphin3.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 4}">
        	<img src="resources/img/dolphin4.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>        
        		
            <p>나의 &돌핀 단계 : ${avg}단계</p>
            <hr>
            <div class="parent">
		        <div class="pfirst">판매글</div>
		        <div class="psecond">갤러리</div>
		        <div class="pthird">나의 관심</div>
		    </div>
		    <div class="child">
		        <div class="cfirst">5</div>
		        <div class="csecond">3</div>
		        <div class="cthird">1</div>
		    </div>

        </div>
    </div>

</form>
</body>    
</head>
</html>