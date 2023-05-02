<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	table, th, td{
		border: 1px black solid;
		border-collapse: collapse;
		padding: 5px 10px;	
	}
</style>
</head>
<body>
	<form action="salesWrite.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo"/></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<th>거래지역</th>
				<td>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호">
					<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
					<br>
					<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
					<br>
					<input type="text" id="sido" name="sido" placeholder="시도" hidden="true">
					<br>
					<input type="text" id="sigungu" name="sigungu" placeholder="시군구" hidden="true">
					<br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					<br>
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<th>1차 카테고리</th>
				<td>
					<select name="biz">
						<c:forEach items="${bizList}" var="i">
							<option value="${i.biz_id}">${i.biz_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>2차 카테고리</th>
				<td>
					<select name="goods">
						<c:forEach items="${goodsList}" var="i">
							<option value="${i.goods_id}">${i.goods_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
					<input type="button" onclick="location.href='./Saleslist.do'" value="리스트"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function DaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("roadAddress").value = roadAddr;
	            document.getElementById("jibunAddress").value = data.jibunAddress;
	            
	            //커스텀
	            document.getElementById("sido").value = data.sido;
	            document.getElementById("sigungu").value = data.sigungu;            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
</script>
</html>