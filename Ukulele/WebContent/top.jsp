<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Style -->
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login_.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet">
<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/browser.min.js"></script>
<script src="js/breakpoints.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>
<script src="js/login_.js"></script>
<script type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
	<script>
    
	$(function(){
	
    $("form").submit(function(){
    	
    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	var getCheck= RegExp(/^[a-z][a-z0-9]$/);
        var id = document.getElementById("id");
    	       
      
        if(!getCheck.test(id).val().trim()){
        	alert("아이디는 소문자/숫자로만 가능합니다");
        	$('#id').val("");
        	$("#id").focus();
        	return false;
        }
    /*    if($("#pw").val() == ""){
        	alert("패스워드를 입력해주세요");
        	$("#pw").focus();
        	return false;
        }
        if($("#id").val() == $("#pw").val()){
        	alert("아이디와 비밀번호는 달라야 합니다");
        	$("#pw").val("");
        	$("#pw").focus();
        	return false;
        }
        if(!getCheck.test($("#pw").val().trim())){
        	alert("비밀번호는 소문자/숫자로만 가능합니다");
        	$("#pw").val("");
        	$("#pw").focus();
        	return false;
        }
        if($("#pw").val() != $("#pw2").val()){
        	alert("비밀번호가 다릅니다");
        	$("#pw").val("");
        	$("#pw2").val("");
        	$("#pw").focus("");
        	return false;
        }
        if($("#email").val() == ""){
        	alert("이메일을 입력해주세요");
        	$("#email").focus();
        	return false;
        }
        if(!getMail.test($("#email").val())){
        	alert("이메일형식에 맞게 입력해주세요");
        	$("#email").val("");
        	$("#email").focus();
        	return false;
        }     */
        
    });
	});
    
    
    
    
    </script>



<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>

	<!-- Header -->
	<header id="header"> </header>

	<!-- Nav -->
	<nav id="nav">
		<a href="index.jsp" id="centerlogo"><img src="images/logo.png"></a>
		<ul>
			<li><a href="no-sidebar.html">협회소개</a>
				<ul>
					<li><a href="index.jsp?page=hi">인사말</a></li>
					<li><a href="index.jsp?page=Association/information">연혁</a></li>
				</ul></li>
			<li><a href="no-sidebar.html">주요사업</a>
				<ul>
					<li><a href="index.jsp?page=Bussiness/licenseIndex">자격증</a></li>
					<li><a href="index.jsp?page=Bussiness/wayToCome">교육센터 위치</a></li>
				</ul></li>
			<li><a href="#">커뮤니티</a>
				<ul>
					<li>
						<% 
                    String id = (String)session.getAttribute("id");
                          id = (String)session.getAttribute("id");
                          if(id!=null){
                             out.print("<a href=index.jsp?page=notice/NoticeList>공지사항</a>");
                          } else {
                             out.print("<a href=index.jsp?page=center onclick=alert('로그인&nbsp먼저&nbsp해주세요')>공지사항</a>");
                          }
                    %>
					</li>
					<!-- <a href="index.jsp?page=notice/NoticeList">공지사항</a></li> -->
					<li>
						<%
                       id = (String)session.getAttribute("id");
                       if(id!=null){
                          out.print("<a href=index.jsp?page=Board/BoardList>자유게시판</a>");
                       } else {
                          out.print("<a href=index.jsp?page=center onclick=alert('로그인&nbsp먼저&nbsp해주세요')>자유게시판</a>");
                       }
                    %>
					</li>
					<!-- <a href="index.jsp?page=Board/BoardList">자유게시판</a></li> -->
					<li>
						<%
                    	id = (String)session.getAttribute("id");
                    	if(id!=null){
                    	    out.print("<a href=#>갤러리(연주회 영상/악보공유)</a>");
                        } else {
                           out.print("<a href=index.jsp?page=center onclick=alert('로그인&nbsp먼저&nbsp해주세요')>갤러리(연주회 영상/악보공유)</a>");
                        }
                     %> <!--                     <a href="#">갤러리(연주회 영상/악보공유)</a></li> -->
				</ul></li>
			<li class="current"><a href="index.jsp">쇼핑몰바로가기</a></li>

		</ul>
		<div class="btn-sign">
			<%

        if(id == null) {
            out.print("<a href='#login-box' class='login-window' id='login_position'>로그인</a>");
            
        }else if((session.getAttribute("id")).equals("1111")){
           
              out.print("<a href='index.jsp?page=Member/MasterPageIndex' id='login_position'>관리자</a>");
           out.print("<a href='memberLogout.mb' id='login_position'>로그아웃</a>"); 
           
        }
        else{
           out.print("<a href='index.jsp?page=Member/Mypage' id='login_position'>마이페이지</a>");
           out.print("<a href='memberLogout.mb' id='login_position'>로그아웃</a>"); 
        }
        
        %>
		</div>

		<!-- 로그인 팝업 -->
		<div id="login-box" class="login-popup">
			<a href="#" class="close"><img src="images/close.png"
				class="btn_close" title="Close Window" alt="Close" /></a>
			<div class="login_main">
				<p class="login_sign" align="center">
					<img src="images/logo.png">
				</p>
				<form class="login_form1" action="memberLogin.mb" method="get">
					<input class="login_username" type="text" align="center"
						placeholder="아이디" name="id" id="id" required="required"> <input
						class="login_password" type="password" align="center"
						placeholder="비밀번호" name="pw" id="pw" required="required">

					<p class="login_mid" align="center" id="search_id">
						<a href="#idsearch-box" class="login-window">아이디/비밀번호 찾기</a>
					</p>

					<input type="submit" class="login_submit" align="center"
						value="로그인">

					<div class="loginEnd">
						<div class="loginLine">
							회원이 아니신가요? <a href="#new-box" class="login-window">회원가입</a>
						</div>
					</div>
					<!--    <a class="login-window login_submit" align="center" href="#new-box">회원가입</a> -->

				</form>
			</div>

		</div>

		<div id="new-box" class="login-popup">
			<a href="#" class="close"><img src="images/close.png"
				class="btn_close" title="Close Window" alt="Close" /></a>
			<div class="login_main">
				<p class="login_sign" align="center">회원가입</p>
				<br>
				<form class="login_form1" action="memberRegister.mb" method="get">
					<input class="login_username" type="text" align="center"
						placeholder="아이디를 입력해주세요." name="id" id="id"> <input
						class="login_password" type="password" align="center"
						placeholder="비밀번호를 입력해주세요." name="pw" id="pw" required="required">
					<input class="login_password" type="password" align="center"
						placeholder="비밀번호 확인" name="pw2" id="pw2" required="required">
					<input class="login_email" type="email" align="center"
						placeholder="사용하실 이메일을 입력해주세요." name="email" id="email"
						required="required"> <input type="submit"
						class="login_submit" align="center" value="가입하기">
					<p class="login_submit" align="center" id="search_id">
						<a href="index.jsp">메인으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					
				</form>
			</div>
		</div>

		<div id="idsearch-box" class="login-popup">
			<a href="#" class="close"><img src="images/close.png"
				class="btn_close" title="Close Window" alt="Close" /></a>
			<div class="login_main">
				<p class="login_sign" align="center">아이디 찾기</p>
				<br>
				<form class="login_form1" action="memberSearch.mb" method="get">
					<input class="login_email" type="email" align="center"
						placeholder="등록하신 이메일을 작성해주세요." name="email" id="email"
						required="required"> <input type="submit"
						class="login_submit" align="center" value="아이디찾기">
					<p class="login-window login_submit" align="center" id="search_id">
						<a href="#new-box">뒤로가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="index.jsp" class="login_submit">메인으로</a>
					</p>
				</form>
			</div>

		</div>

		<div id="pwsearch-box" class="login-popup">
			<a href="#" class="close"><img src="images/close.png"
				class="btn_close" title="Close Window" alt="Close" /></a>
			<div class="login_main">
				<p class="login_sign" align="center">비밀번호 찾기</p>
				<br>
				<form class="login_form1" action="pwSearch.mb" method="get">
					<input class="login_email" type="email" align="center"
						placeholder="등록하신 이메일을 작성해주세요." name="email" id="email"> <input
						type="submit" class="login_submit" align="center" value="비밀번호 찾기">
					<p class="login-window login_submit" align="center" id="search_id">
						<a href="#new-box">뒤로가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="index.jsp">메인으로</a>
					</p>
				</form>
			</div>

		</div>

	</nav>

	


</body>
</html>