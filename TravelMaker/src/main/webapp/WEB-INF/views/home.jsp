<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<link href="${path}/resources/css/home.css?v=2" rel="stylesheet" />
<link href="${path}/resources/css/total.css?v=2" rel="stylesheet" />
<link href="${path}/resources/css/ryan.css?v=2" rel="stylesheet" />
<link href="${path}/resources/css/ryan.css?v=1" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js" 
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
crossorigin="anonymous">
</script>

</head>
<body>
   <div id="index_background">
      <div id="index_title">Travel Maker</div>
      <div class="sign">
         <div>
            <div id="sign_in">로그인</div>
         </div>
         <div>
            <div id="sign_up">회원가입</div>
         </div>
      </div>
   </div>
   <div id="login_modal">
      <form id = "login_form" method = "post">
         <div id="modal_close">
            <div id="close_btn">닫기</div>
         </div>
         <svg id="ryan" viewBox="0 0 120 120"
            xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243"
               stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32"
               fill="#e0a243" stroke="#000" stroke-width="2.5"
               stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32"
               fill="#e0a243" stroke="#000" stroke-width="2.5"
               stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000"
               stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000"
               stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000"
               stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path
               d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
               fill="#fff" />
                <path
               d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
               fill="#fff" stroke="#000" stroke-width="2.5"
               stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65"
               fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path
               d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105"
               fill="#fff" />
        </svg>
         <input type="text" class = "login_id" id = "login_id" name = "id" placeholder="email@domain.com"> 
         <input type="password" class = "login_pw" id = "login_pw" name = "password" placeholder="Password">
         <c:if test="${result == 0 }">
         <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하였습니다.</div>
         </c:if>
         <input type="button" class = "login_btn" value="로그인">
      </form>
      <script src="${path}/resources/js/ryan.js?v=1"></script>
      <script src="${path}/resources/js/home.js?v=3"></script>
   </div>


   <div id="signUp_modal">
      <form id = "signUp_form" method = "post">
         <div id="modal_closee">
            <div id="close_btnn">닫기</div>
         </div>
         <svg id="ryan" viewBox="0 0 120 120"
            xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243"
               stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32"
               fill="#e0a243" stroke="#000" stroke-width="2.5"
               stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32"
               fill="#e0a243" stroke="#000" stroke-width="2.5"
               stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000"
               stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000"
               stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000"
               stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path
               d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
               fill="#fff" />
                <path
               d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
               fill="#fff" stroke="#000" stroke-width="2.5"
               stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65"
               fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path
               d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105"
               fill="#fff" />
        </svg>
         <input type="text" name="id" id = "input_id" class = "input_id" placeholder="email@domain.com">
         <span class = "input_id1">사용가능한 아이디 입니다.</span>
         <span class = "input_id2">아이디가 이미 존재합니다.</span>
         <input type="password" name="password" id = "input_pw" class = "input_pw" placeholder="Password">
         <input tpye="text" name="name" placeholder="이름"> 
         <input type="button" class = "sign_btn" value="가입하기">
      </form>
      <script src="${path}/resources/js/ryan.js?v=2"></script>
      <script src="${path}/resources/js/home.js?v=5"></script>
   </div>
   
   <!-- 로그인 버튼 -->
   <script>
   $(".login_btn").click(function(){
	   alert("로그인 버튼 작동");
	$("#login_form").attr("action", "/login");
	$("#login_form").submit();
// 	$.ajax({
// 		type: "POST",
// 		url: "/login",
// 		data: {"id" : $('.login_id').val(),
// 			"password" : $('.login_pw').val()},
// 			success: function() {
// 				alert('로그인 성공');
// 			}, error: function() {
// 				alert('로그인정보가 올바르지 않습니다.');
// 			}
// 	});
   });
   
   </script>
<!--회원가입 js -->
   <script>
   $(document).ready(function() {
	   $(".sign_btn").click(function() {
		   $("#signUp_form").attr("action", "/signUp");
		   $("#signUp_form").submit();
	   });
   });
   </script>
   
<!--아이디 중복검사 -->
   <script>
   $('.input_id').on("propertychange change keyup paste input", function(){
// 		   console.log("ketup 테스트");
	var id = $('.input_id').val();
	var data = {id : id}
   
   $.ajax({
	   type : "post",
	   url : "/userIdCheck",
	   data : data,
	   success : function(result) {
// 		   console.log("성공여부" + result);
		if(result != 'fail') {
			$('.input_id1').css("display", "inline-block");
			$('.input_id2').css("display", "none");
		} else {
			$('.input_id2').css("display", "inline-block");
			$('.input_id1').css("display", "none");
		}
	   }
   
   });	//ajax
   }); //functino
   </script>
</body>
</html>