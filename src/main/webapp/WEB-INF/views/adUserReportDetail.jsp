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
<article>
<h2 style="color: #708090;">신고 회원 상세보기</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
 	<table class = "mokrok">
	
			
			<tr>
				<td>아이디</td>
				<td>${dto.user_id}</td>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${dto.nickname}</td>
			</tr>	
			<tr>
				<td>신고자</td>
				<td>${dto.user_id}</td>
			</tr>	
			<tr>
				<td>신고일자</td>
				<td>${dto.report_date}</td>
			</tr>	
			<tr>
				<td>신고사유</td>
				<td>${dto.report_reason}</td>
			</tr>	
			<tr>
				<td>첨부사진</td>
				<td><img width="500" src="/photo/${dto.new_photo_name}"/></td>
			</tr>				
			<tr>
				<td colspan="3" align="right">
					<button onclick="history.back()">닫기</button>
				</td>
			</tr>
		
	</table>	
	
</article>
</body>
</html>