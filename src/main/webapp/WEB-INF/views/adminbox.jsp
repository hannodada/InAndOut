<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>

	.page-link{
		float : left;
		text-align : center;
	}
	
	th#padding{
	 text-align : center;
	}

	textarea {
	width: 90%;
	height: 150px;
	resize: none;
}
	#aside {
  width:400px;
  height:600px;
  line-height: 44px;
  float: left;
  flex: 1;
  padding: 24px;
}
	article {
   width:1000px;
   margin-left: 450px;
}

a{
	font-size: 16px;
  color: #92a9b2;
	text-decoration-line: none;
	padding: 5px 0 5px 15px

}

a:hover{
	color: #5abbe2;
}

	th{
		background-color:#aec8d3;

	}

	th,td{
  padding: 1em .5em;
  vertical-align: middle;
  text-align: center;
	}
	
	 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
	}

	thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
	
	ul{
   list-style:none;
   }

p{
	font-size:20px;
	text-decoration-line: none;
	font-weight: bold;
 	color: #708090;	
}	

.this{
	border-width: 0 0 0 2px;
  border-style: solid;
  border-color: #b0cbd6;
 	color: #5abbe2;
	
}

table {
	text-align: center;
  width: 850px;
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

form{
	padding: 10px 5px;
}
</style>

<body>
	<aside id = "aside">
	
	<ul>
		
			<td>
				<p>회원관리</p>
			</td>
				<li>
					<a href="/main/ad.userlist.do">회원 목록</a>
				</li>
				<li>
					<a href="/main/ad.riderlist.do">&라이더 승인/반려</a>
				</li>				
				<li>
					<a href="/main/authuserlist.do">인증사용자 승인/반려</a>
				</li>				
			
			<td>
				<p>게시물관리</p>
			
			</td>
				<li>
					<a href="/main/adsaleslist.do">판매글 목록</a>
				</li>
				<li>
					<a href="/main/adgallerylist.do">갤러리 목록</a>
				</li>			
				
			<td>
				<p>항목관리</p>
			</td>
				<li>
					<a href="/main/ad.goodslist.do">카테고리 목록</a>
				</li>
				<li>
					<a href="/main/adstarlist.do">별점 목록</a>
				</li>					
				
			<td>
				<p>신고관리</p>
			</td>
				<li>
					<a href="/main/userreportlist.do">회원 신고 목록</a>
				</li>
				<li>
					<a href="/main/salesreportlist.do">판매글 신고 목록</a>
				</li>				
				<li>
					<a href="/main/galleryreportlist.do">갤러리 신고 목록</a>
				</li>				
		</ul>				
	</aside>
	</body>					
</html>