<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="/" method="get">
	<header>
	  <nav>
	  <a href="myPage.go">모아보기</a>
	   <a href="mySales.go">판매글</a>
	   <a href="myGallery.go">갤러리</a>
	   <a href="mySalesJjim.go">관심판매글</a>
	   <a href="myGalleryJjim.go" style="color:blue; text-decoration: underline;">찜한갤러리</a>
	   <a href="userAuth.go">설정</a>
	   
	  </nav>
	</header>

    <div class="main-box">
        <div class="profile-box">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content">
            <p>나의 &돌핀 단계 : 4단계</p>
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