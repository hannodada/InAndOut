<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/chat.css" type="text/css">
<style>
	.modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 300px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
</style>
</head>
<body>
	<div class="modal">
      <div class="modal_body">
      	<h4>새 채팅 만들기</h4>
      	<p></p>
      	<div>새로운 대화를 할 상대의 이름을 입력하세요.</div>
      	<p></p>
      	<form action="newchat.do" method="post">
      	<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">@</span>
		  </div>
		  <input type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
		</div>
      	<hr/>
      
      	<button class="btn btn-primary" type="submit">연결하기!</button>&nbsp;
		<button type="button" class="btn btn-secondary" id="modalClose">취소하기</button>
		</form>
      </div>
    </div>

	<div class="pos-f-t">
	  <nav class="navbar navbar-dark bg-dark">
	    <button class="navbar-toggler" type="button" id="mListToggle">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <a class="navbar-brand" href="afterLogin.do">${loginId}</a>
	  </nav>
	</div>
	
	<div class="container">
	 <!-- 
	 	<h3 class=" text-center">당신의 이름: ${loginId} </h3>
	  -->
	<div class="messaging">
	      <div class="inbox_msg">
	        <div class="inbox_people" id="left_box" style="resize: horizontal">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>대화 목록</h4>
	            </div>
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> </div>
	            </div>
	          </div>
	          <div class="inbox_chat" id="chatlistbox">
	          
	          	<!-- 
	            <div class="chat_list active_chat">
	              <div class="chat_people">
	                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	                <div class="chat_ib">
	                  <h5>SSS <span class="chat_date">Dec 25</span></h5>
	                  <p>Test message</p>
	                </div>
	              </div>
	            </div> -->
	            
	                      
	            
	          </div>
	        </div>
	        <div class="mesgs">
	          <div class="msg_history" id="msglistbox"></div>
	          <div class="type_msg">
	            <div class="input_msg_write">
	              <input type="text" class="write_msg" placeholder="Type a message" id="send_msg" onkeyup="enterkey()"/>
	              <button class="msg_send_btn" type="button" onclick="sendmsg()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
	            </div>
	          </div>
	        </div>
	      </div>
	      <p class="text-center top_spac"> Created by <a target="_blank" href="https://github.com/Mochacina">SSS</a></p>
	    </div>
	</div>
</body>
<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal');

$("#mListToggle").click(function () {
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
      body.style.overflow = 'hidden';
    }
});

$("#modalClose").click(function () {
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
      body.style.overflow = 'hidden';
    }
});

//var selectedDst = "${selectedRoom}";
var selectedDst = "";

function realTime() {
	setInterval(() => {
		list();
	}, 500);
}

realTime();

function list(){
	$.ajax({
		type: 'get',
		url: 'chatList.ajax',
		data: {},
		dataType: 'json',
		success: function(data){
			console.log(data.list);
			listDraw(data.list, data.userlist);
		},
		error: function(e) {
			console.log(e);
		}
	})	
}

function listDraw(list, userlist) {
	var content = '';
	console.log(userlist);
	list.forEach(function(item, index){
		if(selectedDst==item.roomid){
			content += '<div class="chat_list active_chat">';
		}else{
			content += '<div class="chat_list">';
		}
		content += '<div class="chat_people" onclick="select(' + item.roomid + ')">';
		content += '<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>';
		content += '<div class="chat_ib"><h5>';
		content += userlist[index] + ' <span class="chat_date">' + item.recent_time + '</span></h5>';
		content += '<p>'+item.recent_msg+'</p>';
		content += '</div></div></div>';
	});
	$('#chatlistbox').empty();
	$('#chatlistbox').append(content);
	if(selectedDst!=""){
		msgList(selectedDst);
	}
}

function msgList(dst){
	$.ajax({
		type: 'get',
		url: 'msgList.ajax',
		data: {
			id: selectedDst
		},
		dataType: 'json',
		success: function(data){
			console.log(data.list);
			msgDraw(data.list);
		},
		error: function(e) {
		}
	});
}

var enter = false;

function msgDraw(list){
	var content = '';
	list.forEach(function(item, index){
		if(item.from_id == "${loginId}"){
			content += '<div class="outgoing_msg"><div class="sent_msg">';
			content += '<p>' + item.msg_content + '</p>';
			content += '<span class="time_date">' + item.from_time + '</span> </div>';
		}else{
			content += '<div class="incoming_msg"><div class="incoming_msg_img">';
			content += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>';
			content += '<div class="received_msg"><div class="received_withd_msg">';
			content += '<p>' + item.msg_content + '</p>';
			content += '<span class="time_date">' + item.from_time + '</span> </div> </div>';
			
		}
		content += '</div>'
	});
	$('#msglistbox').empty();
	$('#msglistbox').append(content);
	
	
	$("#send_msg").mouseenter(function name() {
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
	});
	if (enter){
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
		enter=false;
	}
}

function select(roomid){
	selectedDst = roomid;
	list();
}

function enterkey(){
    if(window.event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
    	console.log("엔터쳤음");
        sendmsg(); //formname에 사용자가 지정한 form의 name입력
		enter = true;
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
    }
}

function sendmsg(){
	var param = {};
	param.id = "${loginId}";
	param.msg = $("#send_msg").val();
	param.roomid = selectedDst;
	
	$("#send_msg").val('');
	
	$.ajax({
		type: 'post',
		url: 'msgSend.ajax',
		data: param,
		dataType: 'json',
		success: function(){
			list();
			
		},
		error: function(e) {
			console.log(e);
		}
	})	
}
</script>
</html>