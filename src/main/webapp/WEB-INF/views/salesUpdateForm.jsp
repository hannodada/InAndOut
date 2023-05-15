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
#att_zone{
	width: 660px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}
</style>
</head>
<body>
	<jsp:include page="realGnb.jsp"/>
	<form action="salesUpdate.do" method="post" enctype="Multipart/form-data">
		<input type="text" name="sales_no" value="${detailData.sales_no }" hidden="true"/>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" value="${detailData.user_id }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" value="${detailData.nickname }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${detailData.subject }" maxlength="30"/></td>
			</tr>
			<tr>
				<th>새로운 사진</th>
				<td>
					<input type="file" id="btnAtt" multiple="multiple" name="photo"/>
					<div id="att_zone" data-placeholder="파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요"></div>
				</td>
			</tr>
			<tr>
				<th>기존 사진</th>
				<td>
					<div hidden="true" id="list">
						<input type="text" name="removeFileName" value="default"/>
					</div>
					<c:if test="${detailPhoto.size() > 0}">
						<c:forEach items="${detailPhoto}" var="i">
							<div style="display:inline-block;position:relative;width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1">
								<img style="width:100%;height:100%;z-index:none" src="/photo/${i}"/>
								<div hidden="true">${i}</div>
								<input type="button" value="x" style="width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00" onclick="remove(event, this)">
							</div>
						</c:forEach>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" value="${detailData.price }"/></td>
			</tr>
			<tr>
				<th>거래지역</th>
				<td>
					<div id="oldAddr">
					${detailData.sales_sido } ${detailData.sigungu } ${detailData.left_addr }
						<input type="button" id="change" value="변경" onclick="addrChange()">
					</div>
					<div id="newAddr"></div>
				</td>
			</tr>
			<tr>
				<th>1차 카테고리</th>
				<td>
					<div id="oldBiz">
					${detailData.biz_name }
						<input type="button" value="변경" onclick="bizChange()">
					</div>
					<div id="newBiz"></div>
				</td>
			</tr>
			<tr>
				<th>2차 카테고리</th>
				<td>
					<div id="oldGoods">
					${detailData.goods_name }
					</div>
					<div id="newGoods"></div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" maxlength="500">${detailData.content }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
					<input type="button" onclick="location.href='./salesList.do'" value="리스트"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
		  
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
		      for(f of fileArr){
		        imageLoader(f);
		      }
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      for(f of files){
		        imageLoader(f);
		      }
		      
		    }, false)
		    
		    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		      }
		      
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');
		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		      }
		      div.appendChild(img)
		      div.appendChild(btn)
		      return div
		    }
		  }
		)('att_zone', 'btnAtt')
		
function remove(evt, elem){
	
	console.log(elem);
	
	var fileName = $(elem).siblings('div').html();
	console.log(fileName);

	var content = '';
	content = '<input type="text" name="removeFileName" value="'+fileName+'"/>';
	$('#list').append(content);
	$(elem).closest('div').remove();
}

function addrChange(){

	$('#oldAddr').empty();
	
	var content = '';
	
	content += '<input type="text" id="postcode" name="postcode" placeholder="우편번호">';
	content += '<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><input type="button" id="back" value="취소" onclick="addrBack()">';
	content += '<br>';
	content += '<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">';
	content += '<br>';
	content += '<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">';
	content += '<br>';
	content += '<input type="text" id="sido" name="sido" placeholder="시도" hidden="true">';
	content += '<br>';
	content += '<input type="text" id="sigungu" name="sigungu" placeholder="시군구" hidden="true">';
	content += '<br>';
	content += '<span id="guide" style="color:#999;display:none"></span>';
	content += '<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">';
	content += '<br>';
	content += '<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">';
		
	$('#newAddr').append(content);
}

function addrBack(){
	
	$('#newAddr').empty();
	
	var content = '';
	content += '${detailData.sales_sido } ${detailData.sigungu } ${detailData.left_addr }';
	content += '<input type="button" id="change" value="변경" onclick="addrChange()">';
	
	$('#oldAddr').append(content);
}

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
            document.getElementById('roadAddress').value = roadAddr;
            document.getElementById('jibunAddress').value = data.jibunAddress;
            
            //커스텀
            document.getElementById('sido').value = data.sido;
            document.getElementById('sigungu').value = data.sigungu;            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById('extraAddress').value = extraRoadAddr;
            } else {
                document.getElementById('extraAddress').value = '';
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

function bizChange(){
	$('#oldBiz').empty();
	$('#oldGoods').empty();
	
	$.ajax({
		type: 'get',
		url: 'bizCall.ajax',
		data: {},
		dataType: 'json',
		success: function(data){
			console.log(data.bizList);
			if(data!=null){
				bizListDraw(data.bizList);
			}
		},
		error: function(e){
			console.log(e);
		}
	});

}

function bizListDraw(bizList){
	
	var content = '';
	var content = '';
	

	content += '<select name="biz" id="biz" onchange="goodsCall()">';
	content += '<option value="default">--</option>';
	
	bizList.forEach(function(item, index){
		content += '<option value="'+item.biz_id+'">'+item.biz_name+'</option>';
	});
	
	content += '</select>';
	content += '<input type="button" id="back" value="취소" onclick="bizBack()">';
	
	$('#newBiz').append(content);
}

function goodsCall(){
	console.log('change');
	$('#newGoods').empty();
	
	var elem = document.getElementById('biz');
	console.log(elem);
	var val = elem.value;
	console.log(val);
	
	$.ajax({
		type: 'get',
		url: 'goodsCall.ajax',
		data: {
			biz_id:val
		},
		dataType: 'json',
		success: function(data){
			console.log(data.goodsList);
			if(data!=null){
				goodsListDraw(data.goodsList);
			}
		},
		error: function(e){
			console.log(e);
		}
	});
}

function goodsListDraw(goodsList){
	
	var content = '';
	
	content += '<select name="goods" id="goods">';

	goodsList.forEach(function(item, index){
		content += '<option value="'+item.goods_id+'">'+item.goods_name+'</option>';
	});

	content += '</select>';
	
	$('#newGoods').append(content);
	
}

function bizBack(){
	$('#newBiz').empty();
	$('#newGoods').empty();
	
	var bizContent = '';
	bizContent += '${detailData.biz_name }';
	bizContent += '<input type="button" value="변경" onclick="bizChange()">';
	
	var goodsContent = '';
	goodsContent += '${detailData.goods_name }';
	
	$('#oldBiz').append(bizContent);
	$('#oldGoods').append(goodsContent);
}
</script>
</html>