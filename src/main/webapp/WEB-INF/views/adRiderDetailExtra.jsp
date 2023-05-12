<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>
<jsp:include page="adminbox.jsp"/>
<jsp:include page="adModal.jsp"/>
<article>
<h2 style="color: #708090;">&라이더 회원 추가 정보</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
 	<table class = "mokrok">
	
			
			<tr>
				<td>아이디</td>
				<td>${rider.user_id}</td>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${rider.nickname}</td>
			</tr>								
			<tr>
				<td>회원분류</td>
				<td>${rider.user_div_name}</td>
			</tr>	
				<tr>
				<td>상호명</td>
				<td>${rider.store_name}</td>
			</tr>		
			<tr>
				<td>사업자등록번호</td>
				<td>${rider.biz_num}</td>
			</tr>							

			<tr>
				<td>사업자등록증</td>
				<td><img width="500" src="/photo/${user.new_photo_name}"/></td>
			</tr>
			
			<button id="myBtn" onclick ="updateRole(${rider.user_state})">가입승인</button>
			<button id="yourBtn" onclick ="updateRole(${rider.user_state})">가입반려</button>
			
			<div id="myModal" class="modal">
			
			  <div class="modal-content">
			  	<form action="ad.riderlist.do" method = "post">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>처리자 ${rider.admin_id}</h2>
			      <input type = "text" name="admin_id" value="${rider.admin_id}" hidden/>
			    </div>
			    <div class="modal-body">
						<h2>사용자 ${rider.user_id}</h2>
						<input type = "text" name="user_id" value="${rider.user_id}" hidden/>
			    	<p>처리사유</p>
			      <p><textarea name="content">${rider.user_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
			  </div>
				</form>
			</div>	
			
			<div id="yourModal" class="modal">
			  <div class="modal-content">
			  	<form action="ad.riderlist.go" method = "post">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>처리자 <input type = "text" name="admin_id"/>${rider.admin_id}</h2>
			    </div>
			    <div class="modal-body">
			<h2>사용자 <input type = "text" name="user_id"/>${rider.user_id}</h2>
			    	<p>처리사유</p>
			      <p><textarea name="content">${rider.user_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
			  </div>
				</form>
			</div>			

	</table>	
	</article>
	
		<script>

		function updateRole(${rider.user_state}){
			
		}
		
		// Get the modal
		var modal = document.getElementById("myModal");
		var ymodal = document.getElementById("yourModal");
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		var ybtn = document.getElementById("yourBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		ybtn.onclick = function() {
		  ymodal.style.display = "block";
		}		
		btn.onclick = function() {
		  modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal	
		span.onclick = function() {
		  modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
		
    </script>	
	</body>
</html>