<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
   	}
    body {
    	
      font-family: 'Noto Sans KR', sans-serif;

    }
#user_id{
	width: 69%;}
#email{
	width: 35%;
}
#url{
	width: 40%;
}

#workNumber{
	width: 40%;
}
#nickName{
	width: 40%;

}
#phone2{
	width: 40%;
}
#biz_num{
	width: 60%;
}
table{
	margin: 0 auto;

}

table, th, td{
	border: 0px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

h2{
text-align: center;

}
h4{
	padding: 0% 0% 0% 25%;
	color: blue;
}
h6{
	padding: 0% 0% 0% 25%;
	color: gray;
}
#des{
	padding: 0%;
	color: gray;
}
#profile{
	width: 120px;
}

/*버튼꾸미기!!!  */
  .test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:-4px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 13px;
            
        }
       
        .test_btn1{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 5px 10px 5px 10px;
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn1:hover{
            color:white;
            background-color: #3788fd;
        }
  .test_btn2{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:-4px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 15px;
            
        }
       
        .test_btn2{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 6px 22px 6px 22px;
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn2:hover{
            color:white;
            background-color: #3788fd;
        }
        
  


</style>
<head>
<jsp:include page="joinGnb.jsp"/>

</head>

<body>
	<br>
	<br>
	<br>
	<br>
	
	<h2> 라이더 회원가입</h2>
	<br>
	<br>
	<form action="userRegist.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>*아이디</th>
			<td>
				<input type="text" name="user_id" id="user_id"/>
				<button type="button" id="overlay" class="test_btn1">중복체크</button>
			</td>
		</tr>
		<tr>
			<th>*비밀번호</th>
			<td><input type="text" name="user_pw" id="user_pw"/></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="text" name="confirm" id="confirm"/>
				<span id="msg"></span>
			</td>
		</tr>
		<tr>
			<th>*이름</th>
			<td><input type="text" name="user_name" id="user_name"/></td>
		</tr>
		<tr>
			<th>*닉네임(상호명)</th>
			<td>
				<input type="text" name="nickname" id="nickname"/>
				<button type="button" id="overlay2" class="test_btn1">중복체크</button>
			</td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td>
			<input type="text" name="biz_num" id="biz_num" />
			<button type="button" class="test_btn1">사업자 등록확인</button>
			</td>
		</tr>
		
		<tr>
			<th>*주소</th>
			<td><input type="text" name="post_num" id="post_num"/></td>
		</tr>
		<tr>
			<th>*상세주소</th>
			<td><input type="text" name="left_addr" id="left_addr"/></td>
		</tr>
		
		
		<tr>
			<th>전화번호</th>
			<td>
			<select name="phone_num" id="phone_num">
				    <option value="010">010</option>
				    <option value="011">011</option>
				    <option value="012">012</option>
		  	</select>
			<input name="phone_num" type="text" id="phone2"/>
			<input name="phone_num" type="text" id="phone2"/>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" id="email"/> 
			&nbsp; @ &nbsp; 
			<select id="url">
			<option value="naver">naver</option>
			<option value="gmail">gmail</option>
			<option value="daum">daum</option>
			</select>
			</td>
		</tr>
		<input type="hidden" id="user_state" name="user_state" value="정상" />
		<tr>
			<th>*관심업종</th>
			<td>	
				<select name="interest_biz_id" id="interest_biz_id">
					<option value=".">==선택==</option>
				    <option value="1">카페</option>
				    <option value="2">음식점</option>
				    <option value="3">여가오락</option>
				    <option value="4">교육</option>
				    <option value="5">운동</option>
				    <option value="6">미용</option>
				    <option value="7">숙박업</option>
				    <option value="8">반려동물</option>
				    <option value="9">세탁업</option>
				    <option value="10">도소매</option>
				    <option value="11">기타</option>
			  	</select>
		  	</td>
		</tr>

		
		<!--  
		<tr>
			<th colspan="2">
				<button onclick="join()">가입</button>
				<button onclick="location.href='./'">돌아가기</button>
			</th>
		</tr>
		-->
	</table>
	<br>
	<h4>인증사용자 추가 정보</h4> <h6>*판매를 원하시는 회원은 인증사용자로 등록해주세요:)</h6>
	<hr>
	<br>
	
	<table>
		<tr>
			<th>프로필 추가</th>
			<td>
			<!-- 
			<form action="profile.do" method="post" enctype="multipart/form-data">
				<button >
					
					<img id="profile" src="resources/photo/프로필 기본.png">
					<input type="file" name="photo" id="inputPhoto">
					<img id="profile" src="resources/photo/${dto.newFileName}"/>
					
				</button>
				<button>저장</button>
			
			</form>	
			 -->
			
			<button type="button" >
				<img id="preview" src="resources/photo/프로필 기본.png"/>
				 <input type="file" name="profile" onchange="readURL(this);" >
			</button>
			
			<button >
					삭제
			</button>
			<br>
					<h6 id="des">
						※ 프로필 사진은 10MB 용량 이하의 이미지만 첨부 가능합니다
					</h6>
			</td>
		</tr>
		
		<tr>
			<th>업종</th>
			<td>
			<select name="biz" id="interest_biz_id" id="interest_biz_id">
					<option value=".">==선택==</option>
				    <option value="1">카페</option>
				    <option value="2">음식점</option>
				    <option value="3">여가오락</option>
				    <option value="4">교육</option>
				    <option value="5">운동</option>
				    <option value="6">미용</option>
				    <option value="7">숙박업</option>
				    <option value="8">반려동물</option>
				    <option value="9">세탁업</option>
				    <option value="10">도소매</option>
				    <option value="11">기타</option>
			  	</select>
		  	</td>
		</tr>
		<tr>
			<th>상호명</th>
			<td>
				<input type="text" name="store_name" id="store_name"/>
				
			</td>
		</tr>
		
		<tr>
				<th>사업자등록증</th>
				<td>
					
				 	<input type="file" onchange="workURL(this);" name="bizprofile"  >
				 	<br>
				 	<img id="previeww" />		
			
					<h6 id="des">※ 참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.
					<br>
					첨부파일 관련 URL주소가 있다면 상품 소개 입력창에 남겨주세요.
					</h6>
				</td>
		</tr>
		<tr>
			<td><br><br></td>

		</tr>

		
		
		<tr>
			<th colspan="2">
				<!--  <button type="button" onclick="join()">등록</button>-->
				<button class="test_btn2">등록</button>
				
				<button onclick="location.href='./'" class="test_btn2">돌아가기</button>
			</th>
		</tr>
	</table>
	</form>
</body>
<script>

var pweq = false;
var overlayChk = false;
var overlayChk2 = false;

function join(){
	
	if(pweq && overlayChk){
		
		var $user_id = $('#user_id');
		var $user_pw = $('#user_pw');
		var $user_name = $('#user_name');
		var $nickname = $('nickname');
		var $post_num = $('post_num');
		var $phone_num = $('#phone_num');
		var $email = $('#email');
		var $interest_biz_id = $('interest_biz_id');
		console.log($user_id.val())
		console.log($user_pw.val())
		console.log($user_name.val())
		console.log($nickname.val())
		console.log($post_num.val())
		console.log($phone_num.val())
		console.log($email.val())
		console.log($interest_biz_id.val())
		
		
				
		if($user_id.val()==''){
			alert('아이디를 입력해 주세요!');
			$user_id.focus();
		}else if($user_pw.val()==''){
			alert('비밀번호를 입력해 주세요!');
			$user_pw.focus();
		}else if($user_name.val() == ''){
			alert('이름을 입력해 주세요!');
			$user_name.focus();
		}else if($nickname.val() == ''){
			alert('이름을 입력해 주세요!');
			$nickname.focus();
		}else if($post_num.val() == ''){
			alert('주소를 입력해 주세요!');
			$post_num.focus();
		}else if($phone_num.val() == ''){
			alert('전화번호을 입력해 주세요!');
			$phone_num.focus();
		}else if($email.val() == ''){
			alert('이메일 입력해 주세요!');
			$email.focus();
		}else if($interest_biz_id.val() == ''){
			alert('관심업종을 선택해 주세요!');
			$interest_biz_id.focus();
		}else{
			/*
			var param = {};
			param.user_id = $user_id.val();
			param.user_pw = $user_pw.val();
			param.user_name = $user_name.val();
			param.nickname = $nickname.val();
			param.post_num = $post_num.val();
			param.phone_num = $phone_num.val();
			param.email = $email.val();
			param.interest_biz_id = $interest_biz_id.val();
			
			console.log(param);
			
			 
			$.ajax({
				type:'post',
				url:'join.ajax',
				data:param,
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success == 1){
						alert('회원가입이 완료 되었습니다.');
						location.href = './';
					}else{
						alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요!');
					}
				},
				error:function(e){
					console.log(e);
					alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요!');
				}
			});
			*/
		}
		
		
	}else{
		alert('아이디 중복 체크와 비밀번호 확인을 해 주세요');
	}	
}


$('#overlay').on('click',function(e){	
	var chkId = $('#user_id').val();	
	console.log('중복체크 요청 : '+chkId);
	
	$.ajax({
		type:'get',
		url:'overlay.ajax',
		data:{'user_id':chkId},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay == 0){
				alert('사용 가능한 아이디 입니다.');
				overlayChk = true;
			}else{
				alert('이미 사용중인 아이디 입니다.');
				$('#user_id').val('');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
});
$('#overlay2').on('click',function(e){	
	var chkId2 = $('#nickname').val();	
	console.log('닉네임중복체크 요청 : '+chkId2);
	
	$.ajax({
		type:'get',
		url:'overlay2.ajax',
		data:{'nickname':chkId2},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay2 == 0){
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

$('#confirm').on('keyup',function(e){
	if($('#user_pw').val() == $(this).val()){
		$('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
		$('#msg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#msg').css({'font-size': '10px', 'color': 'red'});
		$('#msg').html('비밀번호가 일치 하지 않습니다.');
	}	
});


//파일 미리보기!!
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
// 사업자 등록증!	
function workURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('previeww').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('previeww').src = "";
	  }
	}







</script>
</html>