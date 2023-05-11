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
*{
    box-sizing: border-box;
}

body.noScroll{ /* 이미지 팝업 시 이중 스크롤 방지 */
    overflow: hidden;
}

.wrap{ /* 이미지 사이즈 */
    overflow: hidden;
    width: 300px;
    height: 200px;
    display: inline-flex;
    align-items: center;
}

.wrap>img{ /* 커서 모양 바꿈 */
    cursor: pointer;
}

img{ /* 이미지 배율 증가 시 부드럽게 */
    width: 200%;
    object-position: center;
    object-fit: contain;
    transition: .3s;
    -webkit-transition: .3s;
    -moz-transition: .3s;
    -ms-transition: .3s;
    -o-transition: .3s;
}

.popup{ /* 팝업 배경 */
    background-color: rgba(0, 0, 0, 0.877);
    width: 100%;
    height: 100vh;
    overflow: auto;
    position: fixed;
    opacity: 0;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 2rem 0;
    transition: .3s;
    -webkit-transition: .3s;
    -moz-transition: .3s;
    -ms-transition: .3s;
    -o-transition: .3s;
    opacity: 0;
    pointer-events: none;
}

.popup.show{ /* 팝업 보이기 */
    opacity: 1;
    pointer-events: unset;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>판매글번호</th>
			<td>${detailData.sales_no }</td>
		</tr>
		<tr>
			<th>판매상태</th>
			<td>${detailData.sales_state }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${detailData.user_id }</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${detailData.nickname }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${detailData.subject }</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<c:if test="${detailPhoto.size() == 0 }">
					<div class="default">
						<span class="wrap">
							<img src="/photo/default.png">
					 	</span>
					</div>
				</c:if>
				<c:if test="${detailPhoto.size() > 0 }">
					<c:forEach items="${detailPhoto }" var="i">
							<div class="container text-center d-flex flex-wrap">
							    <span class="wrap">
							        <img src="/photo/${i }" alt="test">
							    </span>
							</div>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${detailData.price }</td>
		</tr>
		<tr>
			<th>거래지역</th>
			<td>
				${detailData.sales_sido } ${detailData.sigungu }
			</td>
		</tr>
		<tr>
			<th>1차 카테고리</th>
			<td>
				${detailData.biz_name }
			</td>
		</tr>
		<tr>
			<th>2차 카테고리</th>
			<td>
				${detailData.goods_name }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${detailData.content }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${detailData.hit }</td>
		</tr>
		<tr>
			<th>관심수</th>
			<td>${detailData.attention }</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>${detailData.date }</td>
		</tr>
		<tr>
			<th colspan="2">
				<c:if test="${sessionScope.loginId != null}">
					<input type="button" onclick="openSalesReportForm(${detailData.sales_no})" value="신고하기"/>
				</c:if>
				<c:if test="${sessionScope.loginId eq detailData.user_id}">
					<input type="button" onclick="location.href='./salesUpdate.go?sales_no=${detailData.sales_no}&user_id=${detailData.user_id }'" value="수정"/>
				</c:if>
				<c:if test="${sessionScope.loginId eq detailData.user_id}">
					<input type="button" onclick="location.href='./salesDelete.do?sales_no=${detailData.sales_no}&user_id=${detailData.user_id }'" value="삭제"/>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
					<input type="button" onclick="location.href='./chat.go?sales_no=${detailData.sales_no}&user_id=${detailData.user_id }'" value="채팅하기"/>
				</c:if>
				<input type="button" onclick="location.href='./salesList.do'" value="리스트"/>
				<c:if test="${sessionScope.loginId ne null}">
					관심여부 : <input type="checkbox" onclick="attention(this)" <c:if test="${attentionCheck==1 }">checked</c:if>/>
				</c:if>
			</th>
		</tr>
	</table>
</body>
<script>
const imgs = document.querySelectorAll('img');
let click = false; // 클릭 여부
let zoomLayer = 100; // 줌 배율 기본 값
let moved; // 움직임 여부
let moving = false; // 움직이는 중인지 여부
let click_position_X = 0; // 이미지 클릭한 위치
let click_position_Y = 0; // 이미지 클릭한 위치
let originX = 0; // 클릭한 이미지의 현재 left 값
let originY = 0; // 클릭한 이미지의 현재 top 값

let downListener = (ev)=>{ // 클릭 시
    moved = true;
    moving = false;

    originX = parseInt(getComputedStyle(ev.target)['left'].slice(0,-2));
    originY = parseInt(getComputedStyle(ev.target)['top'].slice(0,-2));
    click_position_X = ev.clientX;
    click_position_Y = ev.clientY;
}

let upListener = () => { // 마우스는 떼면 움직임 멈춤
    moved = false;
}

imgs.forEach(img=>{ // 이미지 마다 설정하기
    img.draggable = false; // 이미지 드래그 방지
    img.addEventListener('click', (ev)=>{
        document.body.classList.add("noScroll");
        if(!click){
            let copy = img.cloneNode();
            let pop = document.createElement('div');
            let zoom = document.createElement('div');
            let btn = document.createElement('button');
            copy.classList.add("zoomIn");
            pop.id = "pop";
            pop.classList.add("popup");
            pop.prepend(zoom);
            zoom.classList.add('zoom');
            zoom.prepend(copy);
            zoom.prepend(btn);
            btn.innerHTML = "&times;";
            btn.classList.add('btn','btn-danger', 'close');

            btn.addEventListener('click', ()=>{
                pop.classList.remove("show");
                setTimeout(()=>{
                    pop.remove();
                    click = false;
                    document.body.classList.remove("noScroll");
                }, 300);
            });

            copy.addEventListener('click', (evt)=>{
                if(!moved && !moving){
                    if(copy.classList.contains("zoomOut")){
                        copy.classList.replace("zoomOut","zoomIn");
                    }
                    let zoomIn = evt.target;
                    zoomIn.style.cssText = `
                        width: ${zoomLayer}%;
                        top: ${evt.target.style.top};
                        left: ${evt.target.style.left};
                    `;
                    if(zoomLayer == 150){
                        copy.classList.replace("zoomIn","zoomOut");
                    }
                    if(zoomLayer>150){
                        zoomLayer = 100;
                        zoomIn.style.cssText = `
                            width: ${zoomLayer}%;
                            top: 0;
                            left: 0;
                        `;
                    }
                    zoomLayer+=10;
                }
            });

            copy.addEventListener('mousedown', downListener);
            copy.addEventListener('mousemove', evt=>{
                if (moved) {
                    moving = true;
                    let oX = evt.clientX;
                    let oY = evt.clientY;
                    evt.target.style.cssText = `
                        top: ${originY + (oY-click_position_Y)}px;
                        left: ${originX + (oX-click_position_X)}px;
                        width: ${evt.target.style.width};
                    `;
                } else {
                    moving = false;
                    moved = false;
                }
            });
            window.addEventListener('mouseup', upListener);

            document.body.prepend(pop);
            setTimeout(()=>{
                pop.classList.add('show');
            }, 300);
            click = true;
        }
    });
});

function attention(box){
	
	var sales_no = ${detailData.sales_no };
	
	if(box.checked){
		
		console.log('나 체크됨');
		console.log(sales_no);
		
		$.ajax({
			type: 'get',
			url: 'addSalesAttention.ajax',
			data: {
				'sales_no':sales_no
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
			url: 'removeSalesAttention.ajax',
			data: {
				'sales_no':sales_no
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

function openSalesReportForm(sales_no){
	
	window.name = "salesDetail";
	openWin = window.open("salesReport.go?sales_no=${detailData.sales_no }", "salesReportForm", "width=570, height=350, resizable = no, scrollbars = no");
}
</script>
</html>