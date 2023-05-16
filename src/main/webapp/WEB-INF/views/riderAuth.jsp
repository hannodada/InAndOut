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
 </head>

<form action="riderAuth.do" method="post">
<input type="hidden" name="user_id" value="${riderSetting.user_id}"/>
<input type="hidden" name="user_pw" value="${riderSetting.user_pw}"/>
	<header>
	  <nav id="nav">
	   <a href="riderPage" >프로필</a>
	   <a href="riderSetting.do" style="color:blue; text-decoration: underline;">회원정보수정</a>
	  </nav>
	</header>
	<h2 id="rdupdate" style="color: skyblue; display:block;">비밀번호 인증</h2>
	
	<div style="float:left; margin-right:10px;">
				<h6 id="riderAuth" style="font-size:15px; color: grey; display:inline;">
				현재 비밀번호를 입력해주세요&nbsp;&nbsp;</h6>
				<input type="password" id="oripassword">
				
		</div>
		
	<div id="riderupdatebutton2">
	<input type="button" onclick="location.href='./riderPage'" value="돌아가기"/>
	<button>저장</button>
	</div>
	</form>
	
	<hr>
    <div class="main-box">
        <div class="profile-box">
        <img src="/photo/${new_photo_name}" style="width: 130px;"/>
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
</html>