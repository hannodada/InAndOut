<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Free open source Tailwind CSS Store template">
<meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

<style>
/* 템플릿 */
.work-sans {
    font-family: 'Work Sans', sans-serif;
}
        
#menu-toggle:checked + #menu {
    display: block;
}

.hover\:grow {
    transition: all 0.3s;
    transform: scale(1);
}

.hover\:grow:hover {
    transform: scale(1.02);
}

.carousel-open:checked + .carousel-item {
    position: static;
    opacity: 100;
}

.carousel-item {
    -webkit-transition: opacity 0.6s ease-out;
    transition: opacity 0.6s ease-out;
}

#carousel-1:checked ~ .control-1,
#carousel-2:checked ~ .control-2,
#carousel-3:checked ~ .control-3 {
    display: block;
}

.carousel-indicators {
    list-style: none;
    margin: 0;
    padding: 0;
    position: absolute;
    bottom: 2%;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 10;
}

#carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
#carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
#carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
    color: #000;
    /*Set to match the Tailwind colour you want the active one to be */
}
</style>
</head>
<body>
	<section class="text-gray-600 body-font overflow-hidden">
		<div class="container px-5 py-10 mx-auto">
		    <div class="lg:w-4/5 mx-auto flex flex-wrap">
			    <div class="carousel relative container mx-auto mt-14" style="max-width:400px;">
			       	<div class="carousel-inner relative overflow-hidden w-full">
						<c:if test="${detailPhoto.size() == 0 }">
				   			<input class="carousel-open" type="radio" id="carousel-1" name="carousel" aria-hidden="true" hidden="" checked="checked">
			          			<div class="carousel-item absolute opacity-0" style="height:50vh;">
			          				<div class="block h-full w-full mx-auto flex pt-6 md:pt-0 md:items-center bg-contain bg-center bg-no-repeat" style="background-image: url('resources/img/defaultIMG.png');">
			          				</div>
			          			</div>
						</c:if>
						<c:if test="${detailPhoto.size() > 0 }">
							<c:forEach items="${detailPhoto }" var="i" varStatus="stat">
								<input class="carousel-open" type="radio" id="carousel-${stat.count}" name="carousel" aria-hidden="true" hidden="" checked="checked">
			          				<div class="carousel-item absolute opacity-0" style="height:50vh;">
			          					<div class="block h-full w-full mx-auto flex pt-6 md:pt-0 md:items-center bg-contain bg-center bg-no-repeat" style="background-image: url('/photo/${i }');">
			          					</div>
			          				</div>
							</c:forEach>
						</c:if>
				    	<!-- Add additional indicators for each slide-->
			           	<ol class="carousel-indicators">
			           		<c:forEach items="${detailPhoto }" var="i" varStatus="stat">
			               		<li class="inline-block mr-3">
			                   		<label for="carousel-${stat.count}" class="carousel-bullet cursor-pointer block text-5xl text-indigo-600 hover:text-blue-400">•</label>
			               		</li>
			           		</c:forEach>
			           	</ol>
			    	</div>
			    </div>
				<div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
				<h2 class="mb-4 text-sm title-font text-gray-500t">No. ${detailData.gallery_no }</h2>
					<div class="flex">
						<img class="w-5 h-5" src="resources/img/location.png">
						<h2 class="text-sm title-font text-gray-500 tracking-widest">${detailData.store_name }</h2>
					</div>
			        <h1 class="text-gray-900 text-3xl title-font font-medium mb-1">${detailData.gallery_subject }</h1>
			        <p class="mt-8 mb-4 leading-relaxed text-xl">${detailData.gallery_content }</p>
					<div class="flex mb-2 mt-4">
						<span class="flex items-center">
			            	<span class="text-gray-600">조회수 ${detailData.gallery_hit }회</span>
				            <span class="ml-4 text-gray-600">찜 ${detailData.gallery_jjim }회</span>
						</span>
						<c:if test="${sessionScope.loginId ne null}">
							<input class="ml-4 h-5 w-5" type="checkbox" onclick="attention(this)" <c:if test="${attentionCheck==1 }">checked</c:if>/>
			        	</c:if>
			        </div>
			        <div class="flex mb-4">
			        	<h2 class="text-sm title-font text-gray-500 tracking-widest">${detailData.gallery_date }</h2>
			        </div>
			        <div class="flex mt-6 items-center pb-5">
				        <div class="flex">
							<button class="flex ml-auto text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded" onclick="location.href='./galleryList.do'">리스트</button>
							<c:if test="${sessionScope.loginId != null}">
								<button class="flex ml-4 text-white bg-red-600 border-0 py-2 px-6 focus:outline-none hover:bg-red-700 rounded" onclick="openGalleryReportForm(${detailData.gallery_no})">신고</button>
							</c:if>
				        </div>
			        </div>
			        <div class="flex items-center pb-5">
				        <div class="flex">
				        	<c:if test="${sessionScope.loginId eq detailData.user_id}">
								<button class="flex ml-auto text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded" onclick="location.href='./galleryUpdate.go?gallery_no=${detailData.gallery_no}&user_id=${detailData.user_id }'">수정</button>
								<button class="flex ml-4 text-white bg-gray-500 border-0 py-2 px-6 focus:outline-none hover:bg-gray-600 rounded" onclick="location.href='./galleryDelete.do?gallery_no=${detailData.gallery_no}&user_id=${detailData.user_id }'">삭제</button>
							</c:if>
				        </div>
			        </div>
			    </div>
		    </div>
		</div>
	</section>
</body>
<script>
function attention(box){
	
	var gallery_no = ${detailData.gallery_no };
	
	if(box.checked){
		
		console.log('나 체크됨');
		console.log(gallery_no);
		
		$.ajax({
			type: 'get',
			url: 'addGalleryAttention.ajax',
			data: {
				'gallery_no':gallery_no
			},
			dataType: 'json',
			success: function(data){
				console.log(data);
			},
			error: function(e){
				console.log(e);
			}
		});
		
	}else{
		console.log('나 체크 안됨');
		
		$.ajax({
			type: 'get',
			url: 'removeGalleryAttention.ajax',
			data: {
				'gallery_no':gallery_no
			},
			dataType: 'json',
			success: function(data){
				console.log(data);
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
}

function openGalleryReportForm(gallery_no){
	
	window.name = "galleryDetail";
	openWin = window.open("galleryReport.go?gallery_no=${detailData.gallery_no }", "galleryReportForm", "width=570, height=350, resizable = no, scrollbars = no");
}
</script>
</html>