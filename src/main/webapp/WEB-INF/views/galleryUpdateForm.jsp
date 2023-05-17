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
	<form action="galleryUpdate.do" method="post" enctype="Multipart/form-data">
		<input type="text" name="gallery_no" value="${detailData.gallery_no }" hidden="true"/>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" value="${detailData.user_id }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>상호명</th>
				<td><input type="text" name="store_name" value="${detailData.store_name }"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="gallery_subject" value="${detailData.gallery_subject }" maxlength="30"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="gallery_content" maxlength="500">${detailData.gallery_content }</textarea></td>
			</tr>
			<tr>
				<th>새로운 사진</th>
				<td>
					<input type="file" id="btnAtt" multiple="multiple" name="photo" accept="image/*"/>
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
				<th colspan="2">
					<input type="submit" value="등록"/>
					<input type="button" onclick="location.href='./galleryList.do'" value="리스트"/>
				</th>
			</tr>
		</table>
	</form>
</body>
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
</script>
</html>