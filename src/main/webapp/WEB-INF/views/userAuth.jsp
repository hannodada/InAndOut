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

<form action="userAuth.do" method="post">
	
<input type="hidden" name="user_id" value="${riderSetting.user_id}"/>
<input type="hidden" name="user_pw" value="${riderSetting.user_pw}"/>
	<header>
	  <nav id="nav" style="position: fixed;">
	   <a href="myPage.go">모아보기</a>
	   <a href="mySales.go">판매글</a>
	   <a href="myGallery.go">갤러리</a>
	   <a href="mySalesJjim.go">관심판매글</a>
	   <a href="myGalleryJjim.go">찜한갤러리</a>
	   <a href="userAuth.go" style="color:blue; text-decoration: underline;">설정</a>
	   
	   
	  </nav>
	  	<nav id="userauth" style="position: fixed;">
		<a href="userAuth.go" style="color:blue; text-decoration: underline;">회원정보수정</a>
		<a href="userBiz.go">인증판매자등록</a>
		</nav>
	</header>

	
	
	<h2 id="rdupdate" style="color: skyblue; display:block;">비밀번호 인증</h2>
	
	<div style="float:left; margin-right:10px;">
				<h6 id="riderAuth" style="font-size:15px; color: grey; display:inline;">
				현재 비밀번호를 입력해주세요&nbsp;&nbsp;</h6>
				<input type="password" id="oripassword">
				
		</div>
		
	<div id="riderupdatebutton2">
	<input type="button" onclick="location.href='./myPage.go'" value="돌아가기"/>
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
        <div class="content">
        <c:choose>
        	<c:when test="${avg eq 1}">
        	<img src="/photo/dolphin1.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 2}">
        	<img src="/photo/dolphin2.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 3}">
        	<img src="/photo/dolphin3.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 4}">
        	<img src="/photo/dolphin4.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>        
        		
            <p>나의 &돌핀 단계 : ${avg}단계</p>
            <hr>
            <div class="parent">
		        <div class="pfirst">제안요청</div>
		        <div class="psecond">배송 진행</div>
		    </div>
		    <div class="child">
		        <div class="cfirst">4</div>
		        <div class="csecond">2</div>
		    </div>

        </div>
    </div>
</body>  
<script type="text/javascript">
$('#overlay3').on('click',function(e){	
	var chkId2 = $('#nickname').val();	
	
	console.log('닉네임중복체크를 요청한 아이디 : '+chkId2);
	
	$.ajax({
		type:'get',
		url:'overlay3.ajax',
		data:{'nickname':chkId2},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay3 == 0){
				alert('사용 가능한 닉네임 입니다.');
				overlayChk2 = true;
			}else{
				alert('이미 사용중인 닉네임 입니다.');
				$('#nickname').val('');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

$('#confirm-password').on('keyup',function(e){
	if($('#password').val() == $(this).val()){
		$('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
		$('#msg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#msg').css({'font-size': '10px', 'color': 'red'});
		$('#msg').html('비밀번호가 일치 하지 않습니다.');
	}	
});
</script>
</html>