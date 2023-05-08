<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- <link href="resources/css/home.css" rel="stylesheet"> -->
    <style>
        /* @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap'); */
    </style>
<body>

<jsp:include page="realGnb.jsp"/>


	<img src="resources/photo/logout.png" id="logout" onclick="location.href='logout.do'">
	<a href="salesWrite.go">판매글 등록</a>
	<a href="galleryWrite.go">갤러리 등록</a>
	<a href="salesList.do">판매글 보기</a>
	<a href="galleryList.do">갤러리 보기</a>
	<a href="myPage.go">마이페이지 보기</a>
	<a href="riderPage">라이더페이지 보기</a>
	
	<hr>
	<hr>
	<hr>
	<h6>가장 많이 판매하는 사람 top 5</h6>
	<table>
		
		<tr>
			<td>
					<c:if test="${findTopPhoto1 eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${findTopPhoto1 ne null}">
		     		 	<img src="resources/photo/${findTopPhoto1}" id="profileUser" onclick="location.href='profile.go'">
		     		 </c:if>
			
			</td>
			<td>
					<c:if test="${findTopPhoto2 eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${findTopPhoto2 ne null}">
		     		 	<img src="resources/photo/${findTopPhoto2}" id="profileUser" onclick="location.href='profile.go'">
		     		 </c:if>
			
			</td>
			<td>
					<c:if test="${findTopPhoto3 eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${findTopPhoto3 ne null}">
		     		 	<img src="resources/photo/${findTopPhoto3}" id="profileUser" onclick="location.href='profile.go'">
		     		 </c:if>
			
			</td>
			<td>
					<c:if test="${findTopPhoto4 eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${findTopPhoto4 ne null}">
		     		 	<img src="resources/photo/${findTopPhoto4}" id="profileUser" onclick="location.href='profile.go'">
		     		 </c:if>
			
			</td>
			<td>
					<c:if test="${findTopPhoto5 eq null}">
		     		 	<img src="resources/photo/프로필 기본.png" id="profileNomal" onclick="location.href='profile.go'">
		     		 </c:if>
		     		 
		     		 <c:if test="${findTopPhoto5 ne null}">
		     		 	<img src="resources/photo/${findTopPhoto5}" id="profileUser" onclick="location.href='profile.go'">
		     		 </c:if>
			
			</td>									
		</tr>
		
	</table>
	
	
	
	
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>

<ul id="gnb1">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
	
	
</body>
<script>
</script>
</html>