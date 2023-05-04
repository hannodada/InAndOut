<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    
    }


    .logo{
  padding-top:0px;
	}

	.logo img{
	  width:80px;
	  cursor:pointer;
	  margin: 4px 0px -10px 0px;
	}
	

    body {
      font-family: 'Noto Sans KR', sans-serif;
      
      
 
    }




    a:link {
      text-decoration: none;
      
    }

    a:visited {
      
}

    a:hover {
      color: #21325D;
    }

    a:active {
     
    }



header{
  height:70px;
  
}

#navbar {
  position: fixed;
  top:0;
  width: 100%;
  display: flex;
  transition: top 0.8s;
  line-height: 3rem;
  padding: 0px 8%;
  z-index:2;
  background:white;
  
}

#navbar a {
  float: left;
  display: block;
  color: #333;
  text-decoration: none;
  margin: 4px 10px 10px 20px;
  font-size:1rem;
 
  
}


#navbar a:hover {
  color: #4f54d9;
  font-weight: bold;
  
  
}


.nbsp {
  width:860px;
}


.loginbax{
	width: 27%;
	margin-right: 13px;

}

.loginOutline{
	display: flex;
		justify-content: flex-end;
		align-items: center; 
		justify-content: flex-star;
		
		
}

.realLogin{
	display: flex;
		justify-content: center;
		align-items: center; 
		justify-content: flex-star;
		margin-right: 13px;

}
  
.test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:-4px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 13px;
            
        }
       
        .test_btn1{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 5px 10px 5px 10px;
            font: 'Noto Sans KR', sans-serif;
        }
        
        .test_btn1:hover{
            color:white;
            background-color: #3788fd;
        }
        
       
#id{
	margin-right: 5px;

}
#login{
	margin-right: 3px;

}
#join{
	

}


@media(max-width:1913px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 45%;}
   }
@media(max-width:1750px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 40%;}
   }
@media(max-width:1564px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 35%;}   

@media(max-width:1378px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 30%;}
}
@media(max-width:1280px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 20%;}
}   
@media(max-width:1204px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%;}
}
@media(max-width:980px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%; display: none;}
#navbar a{ visibility: hidden; width: 0%; display: none;}
}
  
 
</style>
<head>

 <header>
 	<
      <nav>
		<div id="navbar">
		     
		      <div class="logo"><img src="resources/photo/로고2.png" onclick="location.href='home'"></div>
		      
		      
		     
		      <div >
					<a href="#">판매글</a>
					<a href="#">갤러리</a>
		      </div>
		       <div class="nbsp">
					 		     
 		      </div>
		       <div class="loginOutline">
					
			            <input type="text" id="id" class="loginbax">
			            <input type="password" id="pw" class="loginbax">
           		 	
		      </div>
		     
		      <div class="realLogin">
					 <!-- <a id="login"onclick="login()" class="test_btn1">login</a> -->
					  <button id="login" onclick="login()" class="test_btn1">로그인</button>
					 
					<button id="join" onclick="location.href='join.go'" class="test_btn1">회원가입</button>
			 </div>
			 
		 </div>
				
	</nav>
	 <hr>
</header>



  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>INaNdOUT</title> 
  <link rel="stylesheet" href="style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  <script type="text/javascript">
</script>
   
 
    
</head>
<body>
<br>
<br>
<br>
<hr>





</body>
<script>
/*
var prevScrollpos = window.pageYOffset; 

window.onscroll = function() { 
  

  var currentScrollpos = window.pageYOffset; 
  

  if (prevScrollpos > currentScrollpos) { 

    document.getElementById("navbar").style.top = "0"; 

  } else { 

    document.getElementById("navbar").style.top = "-100px"; 
  }
  

  prevScrollpos = currentScrollpos; 

}
*/
/*
//slider

new Swiper('.swiper', {
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
  
	navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next0', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev0', // 이번 버튼 클래스명
	},
});




///top

$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.top' ).fadeIn();
	} else {
		$( '.top' ).fadeOut();
	}
} );
*/
//로그인 관련 아작스!!

function login(){
	
	console.log($('#id').val(),$('#pw').val());
	$.ajax({
		type:'post',
		url:'login.ajax',
		data:{
			id:$('#id').val(),
			pw:$('#pw').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('로그인에 성공 했습니다.');
				location.href='afterLogin.go';
			}else{
				alert('아이디 또는 비밀번호를 확인해 주세요!');
			}			
		},
		error:function(e){
			consol.log(e);
			alert('아이디 또는 비밀번호를 확인해 주세요!');
		}		
	});

}



</script>
</html>