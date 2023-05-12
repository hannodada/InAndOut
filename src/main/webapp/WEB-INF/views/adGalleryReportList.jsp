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

	<h2 style="color: #708090;">갤러리 신고 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
		<form>
			<label for="myCheck">처리상태</label> &nbsp
      <input type="checkbox" id="myCheck" value="all" onclick="myFunction()">전체
      <input type="checkbox" id="myCheck" value="normal" onclick="myFunction()">처리대기
      <input type="checkbox" id="myCheck" value="verified" onclick="myFunction()">처리완료
    </form>
    
    <form>
      <label for="search-word">조회 </label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">아이디</option>
        <option value="nickname">닉네임</option>
        <option value="subject">제목</option>
        <option value="store-name">상호명</option>
      </select>
      <input type="text" id="search-word" name="search-word">
      <input type="submit" value="검색">
    </form>
		<table class = "mokrok">
		<thead>
			<tr>
				<th>신고번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>신고자</th>
				<th>신고일자</th>
				<th>신고내용</th>
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