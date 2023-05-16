<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link href="resources/css/realgnb.css" rel="stylesheet">
<style>

.popup {
  position: absolute;
  display: none;
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 10px;
  font-size: 14px;
}

.popup p {
  margin: 0;
}


#profileUser{
	width: 55px;
	cursor:pointer;
	border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px; 
    margin-right: 9px;     
            
}


</style>
<head>

 <header>

 				
   					  <c:if test="${sessionScope.loginId eq  null}">
						  			<nav>
										<div id="navbar">
										     
										      <div class="logo">
										      	<img src="resources/photo/로고2.png" onclick="location.href='home'">
										      </div>
										      
										      
										     
										      <div id="banner">
													<a href="salesList.do">전체판매목록</a>
													<a href="galleryList.do">갤러리</a>
										      </div>
										       <div class="nbsp">
													 		     
								 		      </div>
										       <div class="loginOutline">
													
											            <input type="text" id="id" class="loginbax">
											            <input type="password" id="pw" class="loginbax">
								           		 	
										      </div>
										     
										      <div class="realLogin">
													 <!-- <a id="login"onclick="login()" class="test_btn1">login</a> -->
													  <button id="login" onclick="login()" class="test_btn1">로그인</button>
													 
													<button id="join" onclick="location.href='join.go'" class="test_btn1">회원가입</button>
											 </div>
										 </div>
												
									</nav>
					     		</c:if>
					     			
					     		 <c:if test="${sessionScope.user_div eq \"a\" }">
									<c:if test="${sessionScope.loginId ne null}">
										 <nav>
											<div id="navbar">
											      <div class="logo">
											      		<img src="resources/photo/로고2.png" onclick="location.href='home'" >
											      </div>
													<div id="banner">
															<a href="salesList.do">전체판매목록</a>
															<a href="galleryList.do">갤러리</a>
											      	</div>
											       <div class="nbsp">		     
									 		      </div>
										 		      <div id="etc">
														       <div id="location">

																				            ${sessionScope.sigungu}
															            <button class="test_btn1" onmouseover="showPopup()" onmouseout="hidePopup()">활동지역 인증</button>

																			<div id="popup" class="popup">
																			  <p>활동지역 인증 후 메인페이지로 이동합니다</p>
																			</div>
																		<button class="test_btn1" onclick="getLocation()">활동지역 인증</button>
  																		<span id="sigungu"></span>	
  																		
																		 
																		
	
														      	</div>
														      
																														      	
													  </div>    	
														     	<div  id="lol">
																	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
																	<img src="resources/photo/free-icon-letter-1250663.png" id="chating" onclick="location.href='chat.go'">
															 
															 		 <c:if test="${sessionScope.new_photo_name eq null}">

														     		 <img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='myPage.go?loginId=${sessionScope.loginId}'">
														     		 </c:if>
														     		 
														     		 <c:if test="${sessionScope.new_photo_name ne null}">
														     		 <img src="/photo/${sessionScope.new_photo_name}" id="profileUser" onclick="location.href='myPage.go?loginId=${sessionScope.loginId}'">
														     		 </c:if>
															 
															 		  <div class="dropdown">
																    <button  class="test_btn1">글쓰기</button>
																    <div class="dropdown-content">
																      <a href="salesWrite.go" id="drop">판매글 등록</a>
																      <a href="galleryWrite.go"  id="drop">갤러리 등록</a>		      
																    </div>
																  </div>													 
															 </div>
			 
													 </div>
													 </nav>
									</c:if>
								</c:if>
								<c:if test="${sessionScope.user_div eq \"b\" }">
									<c:if test="${sessionScope.loginId ne null}">
										 <nav>
											<div id="navbar">
											      <div class="logo">
											      		<img src="resources/photo/로고2.png" onclick="location.href='home'" >
											      </div>
													<div id="banner">
														<a href="salesList.do">전체판매목록</a>
														<a href="galleryList.do">갤러리</a>
											      </div>
											       <div class="nbsp">		     
									 		      </div>
										 		      <div id="etc">
														       <div id="location">
																				            ${sessionScope.sigungu}
															            <button  class="test_btn1">활동지역 인증</button>
												           		 			
														      	</div>
													  </div>    	
														      
														     	<div  id="lol">
														     		
														     		 
														     		  
																	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
																	<img src="resources/photo/free-icon-letter-1250663.png" id="chating" onclick="location.href='chat.go'">
															 
															 		 <c:if test="${sessionScope.new_photo_name eq null}">
														     		 <img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='myPage.go?loginId=${sessionScope.loginId}'">
														     		 </c:if>
														     		 
														     		 <c:if test="${sessionScope.new_photo_name ne null}">
														     		 
														     		 <img src="/photo/${sessionScope.new_photo_name}" id="profileUser" onclick="location.href='myPage.go?loginId=${sessionScope.loginId}'">
														     		 </c:if>
															 
															 		  <div class="dropdown">
																    <button  class="test_btn1">글쓰기</button>
																    <div class="dropdown-content">
																      <a href="salesWrite.go" id="drop">판매글 등록</a>
																      <a href="galleryWrite.go"  id="drop">갤러리 등록</a>
																      
																      
																      
																    </div>
																  </div>
															 
															 
															 
															 </div>
															 
															 			
																    
															 
															 
													 </div>
												
										</nav>
									</c:if>
								</c:if>
								 <c:if test="${sessionScope.user_div eq \"c\" }">
								 		<c:if test="${sessionScope.loginId ne null}">
										 <nav>
											<div id="navbar">
											      <div class="logo">
											      		<img src="resources/photo/로고2.png" onclick="location.href='home'" >
											      </div >
											      <div id="banner">
														<a href="riderOffer.go">제안 확인</a>
														<a href="deliveryState.go">배송상태 관리</a>
														<a href="deliveryHistory.go">배송 이력</a>
													</div>	
											       <div class="nbsp">		     
									 		      </div>
										 		      <div id="etc">
														       <div id="location">
																				         
														      	</div>
													  </div>    	
														      
														     	<div  id="lol">
														     		
														     		 
														     		  
																	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
																	<img src="resources/photo/free-icon-letter-1250663.png" id="chating" onclick="location.href='chat.go'">
															 
															 
															 		 <c:if test="${sessionScope.new_photo_name eq null}">
														     		 <img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='riderPage?loginId=${sessionScope.loginId}'">
														     		 </c:if>
														     		 
														     		 <c:if test="${sessionScope.new_photo_name ne null}">
														     		 <img src="/photo/${sessionScope.new_photo_name}" id="profileUser" onclick="location.href='riderPage?loginId=${sessionScope.loginId}'">
														     		 </c:if>
															 </div>
																      <div class="dropdown">
																   
																      
																      
																      
																    </div>
																  </div>												
										</nav>
									</c:if>
								 
								 </c:if>
								 <c:if test="${sessionScope.user_div eq \"d\" }">
								 
								 	<c:if test="${sessionScope.loginId ne null}">
										 <nav>
											<div id="navbar">
											      <div class="logo">
											      		<img src="resources/photo/로고2.png" onclick="location.href='logout.do'" >
											      </div>
													<div id="banner">
														<a href="ad.userlist.do">회원 관리</a>
														<a href="adsaleslist.do">판매글 관리</a>
														<a href="userreportlist.do">회원 신고 관리</a>
													</div>			
																									       
											       <div class="nbsp">		     
									 		      </div>
										 		      <div id="etc">
														       <div id="location">
																
												           		 	
														      	</div>
													  </div>    	
														      
														     	<div  id="lol">
														     		
														     		  <c:if test="${sessionScope.new_photo_name eq null}">
														     		 <img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
														     		 </c:if>
														     		 
														     		 <c:if test="${sessionScope.new_photo_name ne null}">
														     		 <img src="resources/photo/${sessionScope.new_photo_name}" id="profileUser" onclick="location.href='profile.go'">
														     		 </c:if>
														     		  
																	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
																	<img src="resources/photo/free-icon-letter-1250663.png" id="chating" onclick="location.href='chatlist.go'">
															 </div>
															 
															 
															 
																      <div class="dropdown">
																    
																  </div>
															 
															 
													 </div>
												
										</nav>
									</c:if>
								 
								 </c:if>

</header>



  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>INaNdOUT</title> 
  <link rel="stylesheet" href="style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  <script type="text/javascript">
</script>
   
 
    
</head>
<body>

<hr>





</body>


<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e434e3b05b4f1c7f078a8511ceaaab79&libraries=services"></script>


<script>


/*

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
*/
/*
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


/*

///top

$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.top' ).fadeIn();
	} else {
		$( '.top' ).fadeOut();
	}
} );
*/
//로그인 관련 아작스!!

function login(){
	
	console.log($('#id').val(),$('#pw').val());
	$.ajax({
		type:'post',
		url:'login.ajax',
		data:{
			id:$('#id').val(),
			pw:$('#pw').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('로그인에 성공 했습니다.');
				location.href='afterLogin.go';
			}else{
				alert('아이디 또는 비밀번호를 확인해 주세요!');
			}			
		},
		error:function(e){
			consol.log(e);
			alert('아이디 또는 비밀번호를 확인해 주세요!');
		}		
	});

}

//활동지역  팝업
function showPopup() {
  var popup = document.getElementById("popup");
  popup.style.display = "block";
}

function hidePopup() {
  var popup = document.getElementById("popup");
  popup.style.display = "none";
}





//버튼 클릭 이벤트 핸들러
$(".test_btn1").on("click", function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      // 위치 정보 가져오기에 성공했을 때 호출되는 success 콜백 함수
      function (position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        $("#location").html("현재 위치: " + latitude + ", " + longitude);
      },
      // 위치 정보 가져오기에 실패했을 때 호출되는 error 콜백 함수
      function (error) {
        console.log(error);
        $("#location").html("위치 정보를 가져올 수 없습니다.");
      }
    );
  } else {
    $("#location").html("위치 정보를 지원하지 않는 브라우저입니다.");
  }
});




//두번째

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      reverseGeocoding(lat, lng);  // 좌표를 이용하여 sigungu 정보를 찾아 출력합니다
    });
  } else {
    document.getElementById("location").innerHTML = "Geolocation is not supported by this browser.";
  }
}

function reverseGeocoding(lat, lng) {
	  const geocoder = new daum.maps.services.Geocoder();
	  let sigungu = '';

	  // 좌표로 행정동 주소 정보를 요청합니다
	  geocoder.coord2RegionCode(lng, lat, function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	      for (let i = 0; i < result.length; i++) {
	        // 행정동 주소 중 구와 동 정보만 추출합니다
	        if (result[i].regionType === 'H' || result[i].regionType === 'B') {
	          sigungu += result[i].regionName;
	        }
	      }
	      console.log(sigungu);
	      // 추출한 구와 동 정보를 출력합니다
	      document.getElementById("location").innerHTML = `현재 위치: ${lat}, ${lng}, ${sigungu}`;
	    }
	  });
	}
	
//버튼 클릭 이벤트 핸들러
$(".test_btn1").on("click", function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      // 위치 정보 가져오기에 성공했을 때 호출되는 success 콜백 함수
      function (position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        reverseGeocoding(latitude, longitude); // 좌표를 이용하여 sigungu 정보를 찾아 출력합니다
      },
      // 위치 정보 가져오기에 실패했을 때 호출되는 error 콜백 함수
      function (error) {
        console.log(error);
        $("#location").html("위치 정보를 가져올 수 없습니다.");
      }
    );
  } else {
    $("#location").html("위치 정보를 지원하지 않는 브라우저입니다.");
  }
});



//새로 넣으래
function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      daum.maps.load(function() {
        reverseGeocoding(lat, lng);  // 좌표를 이용하여 sigungu 정보를 찾아 출력합니다
      });
    });
  } else {
    document.getElementById("location").innerHTML = "Geolocation is not supported by this browser.";
  }
}

function reverseGeocoding(lat, lng) {
  const geocoder = new daum.maps.services.Geocoder();
  let sigungu = '';

  // 좌표로 행정동 주소 정보를 요청합니다
  geocoder.coord2RegionCode(lng, lat, function(result, status) {
    if (status === daum.maps.services.Status.OK) {
      for (let i = 0; i < result.length; i++) {
        // 행정동 주소 중 구와 동 정보만 추출합니다
        if (result[i].regionType === 'H' || result[i].regionType === 'B') {
          sigungu += result[i].regionName;
        }
      }
      // 추출한 구와 동 정보를 출력합니다
      document.getElementById("location").innerHTML = `현재 위치: ${lat}, ${lng}, ${sigungu}`;
    }
  });
}




</script>
</html>