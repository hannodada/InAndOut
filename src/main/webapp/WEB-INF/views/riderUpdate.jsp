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
<jsp:include page="realGnb.jsp"/>
	<header>
	  <nav id="nav">
	   <a href="riderPage" style="color:blue; text-decoration: underline;">프로필</a>
	   <a href="riderSetting.do">회원정보수정</a>
	  </nav>
	</header>
	<form action="riderUpdate.do" method="post">
		<input type="hidden" name="user_id" value="${extra.user_id}"/>
	<div id="riderdetail">
		<div id="runtime" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			영업시간<h5 style="display:inline;">&nbsp;&nbsp;<input type="text" name="store_time" value="${extra.store_time}"/></h5></h4>
		</div>
		<div id="location" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			위치<h5 style="display:inline;">&nbsp;&nbsp;
			<input type="text" name="sido" value="${extra.sido}"/>&nbsp;
			<input type="text" name="sigungu" value="${extra.sigungu}"/></h5></h4>
		</div>
		<div id="intro" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			소개<h5 style="display:inline;">&nbsp;&nbsp;<input type="text" name="intro" value="${extra.intro}"/></h5></h4>
		</div>
		<div id="news" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			소식<h5 style="display:inline;">&nbsp;&nbsp;<input type="text" name="news" value="${extra.news}"/></h5></h4>
		</div>
	</div>
	
	<div id="riderupdatebutton">
	<input type="button" onclick="location.href='./riderPage'" value="돌아가기"/>
	<button>저장</button>
	</div>
	</form>
	
    <div class="main-box">
        <div class="profile-box">
        <c:if test="${new_photo_name eq null}">
        	<img src="resources/photo/프로필 기본.png" width="150px">
        </c:if>
        <img src="/photo/${new_photo_name}" width="150px">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content2">
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
        	<c:when test="${avg eq 5}">
        	<img src="resources/img/dolphin5.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>
                </div>  
            <div id="avgdolphin">&nbsp;&nbsp;나의 &돌핀 단계 : ${avg}단계&nbsp;&nbsp;</div>
            <div class="parent">
		        <div class="pfirst">제안요청</div>
		        <div class="psecond">배송 진행</div>
		    		</div>
		    <div class="child">
		        <div class="cfirst">${rideroffer}</div>
		        <div class="csecond">${riderdelivery}</div>
		    </div>
    </div>


</body>    
</head>
</html>