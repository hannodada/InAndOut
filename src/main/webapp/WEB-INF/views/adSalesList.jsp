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

	<h2 style="color: #708090;">판매글 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
    <!-- 카테고리 선택 -->
    <form>
      <label for="search-word">카테고리 </label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="all">전체</option>
        <option value="nickname">닉네임</option>
      </select>
       <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>  
      &nbsp&nbsp&nbsp
      <label for="search-word"> 판매지역 </label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>
       <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>       
    </form>
    
 		<form>
 			<label>판매상태</label> &nbsp&nbsp
      <input type="checkbox" name="user-state" value="all">전체
      <input type="checkbox" name="user-state" value="waiting">판매중
      <input type="checkbox" name="user-state" value="normal">판매완료
      <input type="checkbox" name="user-state" value="blocked">삭제
    </form>  

    <form>
      <label for="search-word">검색어:</label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">아이디</option>
        <option value="nickname">닉네임</option>
        <option value="nickname">제목</option>
      </select>
      <input type="text" id="search-word" name="search-word">
      <input type="submit" value="검색">
    </form>
     
		<table class = "mokrok">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>판매상태</th>
				<th>등록일자</th>
				<th>히스토리</th>
			</tr>			
		</thead>
		<tbody id="list">
			<c:forEach items="${userlist}" var="user" varStatus="status">
      <tr>
      	<td>${status.count}</td>
        <td>${user.user_id}</td>
        <td>${user.nickname}</td>
        <td>${user.user_div_name}</td>
        <td>${user.user_state}</td>
        <td><button onclick="window.open('detail.do?id=${user.user_id}')">상세보기</button>
				</td>
       </tr>
        </c:forEach>

  </tbody>
	
	</table>


</article>
<script>
</script>

</body>



</html>