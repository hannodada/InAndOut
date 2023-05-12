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

<form action="userBiz.do" method="post" enctype="multipart/form-data">
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
		<a href="userAuth.go">회원정보수정</a>
		<a href="userBiz.go" style="color:blue; text-decoration: underline;">인증판매자등록</a>
		</nav>
	</header>
	
	<div id="rdidupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 상호명&nbsp;&nbsp;<input type="text" name="user_id" id="user_id" value="${riderSetting.user_id}" readonly/></h4>
	</div>
	<div id="rdnnupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 사업자등록번호&nbsp;&nbsp;<input type="text" id="nickname" name="nickname" value="${riderSetting.nickname}"/>
			<button type="button" id="overlay3" class="test_btn1">중복체크</button>
			</h4>
	</div>
		
		
	<div id="rdphotoupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			사업자등록증&nbsp;&nbsp;</h4>
	<c:if test="${new_photo_name eq null}">
					<img src="resources/photo/프로필 기본.png">
					<input type="file" name="photo" />
				</c:if>
				<c:if test="${new_photo_name ne null}">
					<img src="/photo/${new_photo_name}" style="width: 130px;"/>
					<input type="file" name="photo" />
				</c:if>
	</div>
	
	<div id="riderupdatebutton3">
	<input type="button" onclick="location.href='./riderPage'" value="돌아가기"/>
	<button type="submit" onclick="join()">저장</button>
	</div>
	</form>
	
	<hr>
    <div class="main-box">
        <div class="profile-box">
        <img src="/photo/${new_photo_name}" style="width: 130px;">
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
<!--다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script type="text/javascript">


var pweq = false;
var overlayChk = false;
var overlayChk2 = false;

$('document').ready(function(){
	var elem = $('#nickname').val();
	console.log(elem);
	if(elem!=null){
		overlayChk2 = true;
	}
	
});
function join(){
	
	if(pweq && overlayChk && overlayChk2){
		
		var $user_id = $('#user_id');
		var $newpassword = $('#newpassword');

		var $nickname = $('#nickname');
		var $post_num = $('input[name=post_num]').val();
		var $phone_num = $('#phone_num');
		var $email = $('#email');
		var $interest_biz_id = $('#interest_biz_id');
		
		console.log('post_num : '+ $post_num);
	
		if($newpassword.val()==''){
			alert('비밀번호를 입력해 주세요!');
			$newpassword.focus();
		}else if($confirm_password.val() == ''){
			alert('비밀번호 확인을 해주세요!');
			$confirm_password.focus();
		}else if($nickname.val() == ''){
			alert('닉네임을 입력해 주세요!');
			$nickname.focus();
		}else if($post_num.val() == null){
			alert('우편번호를 입력해 주세요!');
		}else if($phone_num.val() == null){
			alert('전화번호를 입력해 주세요!');
		}else if($email.val() == ''){
			alert('이메일 입력해 주세요!');
			$email.focus();
		}else if($interest_biz_id.val() == '.'){
			alert('관심업종을 선택해 주세요!');
		}else{
			var param = {};
			param.interest_biz_id = $interest_biz_id.val();
			param.newpassword = $newpassword.val();
			param.confirm_password = $confirm_password.val();
			param.nickname = $nickname.val();
			param.post_num = $post_num.val();
			param.phone_num = $phone_num.val();
			param.email = $email.val();
			
			console.log(param);
			
			$.ajax({
				type: 'post',
				url:'update.ajax',
				data:param,
				dataType: 'json',
				success:function(data){
					console.log(data);
					if(data.success == 1){
						alert('수정이 완료되었습니다');
						location.href='./';
					}else{
						alert('수정에 실패했습니다.\r\n 다시 시도해주세요!');
					}
					
				},
				error: function(e){
					console.log(e);
					alert('회원가입에 실패했습니다.\r\n 다시 시도해주세요!');
					
				}
			});
		}
		
		
	}else{
		overlayChk = true;
		alert('overlayChk가 true');
	}	
}


$('#overlay3').on('click',function(e){	
	var chkId2 = $('#nickname').val();	
	var nickname = document.getElementById('nickname').value;
	
	console.log('chkId2 : '+chkId2);
	console.log('nickname : '+nickname);
	
	console.log('닉네임중복체크를 요청한 아이디 : '+chkId2);
	
	$.ajax({
		type:'get',
		url:'overlay3.ajax',
		data:{'nickname':chkId2},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay3 == 0){
				if(nickname == chkId2){
					alert('사용 가능한 닉네임 입니다.');
					overlayChk2 = true;
				}
				
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

$('#confirm_password').on('keyup',function(e){
	console.log('confirm_password: '+$('#confirm_password').val());
	console.log('newpassword: '+$('#newpassword').val());
	if($('#newpassword').val() == $(this).val()){
		$('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
		$('#msg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#msg').css({'font-size': '10px', 'color': 'red'});
		$('#msg').html('비밀번호가 일치 하지 않습니다.');
	}	
});

console.log("${riderSettingdo.new_photo_name}");

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
                  
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
          //승범형커스텀 ㅠㅠ 감사해요 
            document.getElementById("sido").value = data.sido;
            document.getElementById("sigungu").value = data.sigungu;  
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</html>