<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/joinform.css" type="text/css">
<style>


</style>
<head>
<jsp:include page="joinGnb.jsp"/>

</head>

<body>


	<br>
	<br>
	<br>
	<br>
	<h2>회원가입</h2>
	<br>
	<br>
	<br>
	<br>
	<a id="essential">* 필수 기입 항목입니다.</a>
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
			<th>*닉네임</th>
			<td>
				<input type="text" name="nickname" id="nickname"/>
				<button type="button" id="overlay2" class="test_btn1">중복체크</button>
			</td>
		</tr>
		
		<tr>
			<th>*주소</th>
			<td>
			
			<!-- <input type="text" name="post_num" id="post_num"/>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
				        }
				    }).open();
				</script> -->
				<input type="text" id="sample6_postcode" name="post_num" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="findPost"><br>
				
				
			
			</td>
		</tr>
		<tr>
		<td></td>
		<td><input type="text" id="sample6_address" placeholder="주소" name="left_addr"><br></td>
		</tr>
		
		
		<tr>
		
			<th>*상세주소</th>
			<td>
			<!-- <input type="text" name="left_addr" id="left_addr"/> -->
			<input type="text" id="sample6_detailAddress"  placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			<input type="hidden" id="sido" name="sido">
			<input type="hidden" id="sigungu" name="sigungu">
			</td>
		</tr>
		
		
		<tr>
			<th>*전화번호</th>
			<td>
			<select name="phone_num" id="phone_num">
				    <option value="010">010</option>
				    <option value="011">011</option>
				    <option value="012">012</option>
		  	</select>
			<input name="phone_num" type="text" id="phone_num"/>
			<input name="phone_num" type="text" id="phone_num"/>
			</td>
		</tr>
		<tr>
			<th>*이메일</th>
			<td><input type="text" name="email" id="email"/> 
			&nbsp; @ &nbsp; 
			<select id="url" name="email">
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
				    <option value="b001">카페</option>
				    <option value="b002">음식점</option>
				    <option value="b003">여가오락</option>
				    <option value="b004">교육</option>
				    <option value="b005">운동</option>
				    <option value="b006">미용</option>
				    <option value="b007">숙박업</option>
				    <option value="b008">반려동물</option>
				    <option value="b009">세탁업</option>
				    <option value="b010">도소매</option>
				    <option value="b011">기타</option>
			  	</select>
			  	
		  	</td>
		</tr>
		</table>
		
		<!--  
		<tr>
			<th colspan="2">
				<button onclick="join()">가입</button>
				<button onclick="location.href='./'">돌아가기</button>
			</th>
		</tr>
		-->
	
		<br>
	
	<br>
	<br>
	<br>
	
	<h4>추가정보</h4> <h6>더 정확한 정보를 원하시면 꼭 기입해주세요:)</h6>
	
	<hr>
	<table>
	
	
	

	
	
	<tr>
			<th>프로필 추가</th>
			<td>

				
				<div class="file-wrapper flie-wrapper-area">
				  <div class="float-left">
				    <span class="label-plus"><i class="fas fa-plus"></i></span>
				    <button type="button">
				    <div id="preview"><img id="preview" src="resources/photo/프로필 기본.png"/></div>
				    
				    <input type="file" name="profile" id="file" class="upload-box upload-plus" accept="image/*">
				    <div class="file-edit-icon">
				    
				      <!-- <a href="#" class="preview-edit">수정</a> -->
				      <br>
				      <br>
				      <img href="#" class="preview-de" src="resources/photo/free-icon-cancel-8532372.png"></img>
				      </button>
				    </div>
				  </div>
				</div>
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
				    <option value="b001">카페</option>
				    <option value="b002">음식점</option>
				    <option value="b003">여가오락</option>
				    <option value="b004">교육</option>
				    <option value="b005">운동</option>
				    <option value="b006">미용</option>
				    <option value="b007">숙박업</option>
				    <option value="b008">반려동물</option>
				    <option value="b009">세탁업</option>
				    <option value="b010">도소매</option>
				    <option value="b011">기타</option>
			  	</select>
		  	</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	
	
	
	
	
	<h4>인증사용자 추가 정보</h4> <h6>*판매를 원하시는 회원은 인증사용자로 등록해주세요:)</h6>
	<hr>
	<br>
	

	
	

	
	<table>
		
		<tr>
			<th>사업자등록번호</th>
			<td>
			<input type="text" name="biz_num" id="biz_num" />
			<button type="button" class="test_btn1">사업자 등록확인</button>
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
		<br>
		<br>
		<br>
		<br>
		
		
		<tr>
			<th colspan="2">
				<button type="button" class="test_btn2" onclick="join()">입력확인</button>
				<button class="test_btn2" >등록</button>
				
				<button type="button" onclick="location.href='./'" class="test_btn2">돌아가기</button>
			</th>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	</form>
</body>
<!--다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

var pweq = false;
var overlayChk = false;
var overlayChk2 = false;

function join(){
	
	if(pweq && overlayChk && overlayChk2){
		
		var $user_id = $('#user_id');
		var $user_pw = $('#user_pw');
		var $user_name = $('#user_name');
		var $nickname = $('#nickname');
		var $post_num = $('#post_num');
		var $phone_num = $('#phone_num');
		var $email = $('#email');
		var $interest_biz_id = $('#interest_biz_id');
		/* var $file = ${'#file'}; */
		
		
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
			/* 이게 뭐지??? 일단은 남겨둠
					
			var param = {};
			param.interest_biz_id = $interest_biz_id.val();
			console.log(param);
			*/
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
			
			var formData = new FormData();
			
			formData.append("photo",file.files[0]);
			
			
			 
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


//파일 미리보기!
console.log()
function handleFileSelect(event) {
    var input = this;
    console.log(input.files)
    if (input.files && input.files.length) {
        var reader = new FileReader();
        this.enabled = false
        reader.onload = (function (e) {
        console.log(e)
            $("#preview").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
        });
        reader.readAsDataURL(input.files[0]);
    }
}
$('#file').change(handleFileSelect);
$('.file-edit-icon').on('click', '.preview-de', function () {
    $("#preview").empty()
    $("#file").val("");
});
$('.preview-edit').click( function() {
  $("#file").click();
} );


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

// 다음 지도 api
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