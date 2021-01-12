<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Style -->
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login_.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
   <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.dropotron.min.js"></script>
    <script src="js/jquery.scrolly.min.js"></script>
    <script src="js/browser.min.js"></script>
    <script src="js/breakpoints.min.js"></script>
    <script src="js/util.js"></script>
    <script src="js/main.js"></script>
    <script src="js/flickity-docs.min.js"></script>
    <script src="js/login_.js"></script>
    <script type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<!-- Header -->
    <header id="header">
    </header>

    <!-- Nav -->
    <nav id="nav">
        <a href="index.jsp" id="centerlogo"><img src="images/logo.png"></a>
        <ul>
            <li>
                <a href="no-sidebar.html">우쿠렐레예술협회</a>
                <ul>
                    <li><a href="#">인사말</a></li>
                    <li><a href="#">협회정보&연혁</a></li>
                </ul>
            </li>
            <li>
                <a href="no-sidebar.html">주요사업</a>
                <ul>
                    <li><a href="#">콩쿨(연주회)일정</a></li>
                    <li><a href="#">자격증</a></li>
                    <li><a href="#">교육센터 위치</a></li>
                </ul>

            </li>
            <li><a href="#">커뮤니티</a>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="index.jsp?page=Board/BoardList">자유게시판</a></li>
                    <li><a href="#">갤러리(연주회 영상/악보공유)</a></li>
                </ul>
            </li>
            <li class="current"><a href="index.jsp">쇼핑몰바로가기</a></li>

        </ul>
        <div class="btn-sign">
            <!-- 스타일없음 -->
            <a href ="#login-box" class="login-window" id="login_position">로그인</a>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        <!-- 로그인 팝업 -->
    <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
            <div class="login_main">
                <p class="login_sign" align="center">로그인</p>
                <form class="login_form1" action="memberLogin.mb" method="get">
                     <input class="login_username" type="text" align="center" placeholder="Username">
                    <input class="login_password" type="password" align="center" placeholder="Password">
                    <a class="login_submit" align="center" href="#">로그인</a>
                    <a class="login-window login_submit" align="center" href="#new-box">회원가입</a>
                    <p class="login_forgot" align="center" id="search_id"><a href="#idsearch-box" class="login-window">아이디 찾기</a></p>
                    <p align="center" id="search_pw"><a href="#pwsearch-box" class="login-window">비밀번호 찾기</a></p>
                </form>
            </div>

    </div>
      
         <div id="new-box" class="login-popup">
        <a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
            <div class="login_main">
                <p class="login_sign" align="center">회원가입</p><br>
                <form class="login_form1" action="membernew.mb" method="get">
                     <input class="login_username" type="text" align="center" placeholder="아이디를 입력해주세요.">
                    <input class="login_password" type="password" align="center" placeholder="비밀번호를 입력해주세요.">
                    <input class="login_email" type="email" align="center" placeholder="사용하실 이메일을 입력해주세요.">
                    <a class="login_submit" align="center" href="#">가입하기</a>
                    <p class="login_forgot" align="center" id="search_id"><a href="index.jsp">메인으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                </form>
            </div>
       </div>
       
         <div id="idsearch-box" class="login-popup">
        <a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
            <div class="login_main">
                <p class="login_sign" align="center">아이디 찾기</p><br>
                <form class="login_form1">
                    <input class="login_email" type="email" align="center" placeholder="등록하신 이메일을 작성해주세요.">
                    <a class="login_submit" align="center" href="#">아이디 찾기</a>
                    <p class="login-window login_forgot" align="center" id="search_id"><a href="#new-box">뒤로가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="index.jsp">메인으로</a></p>
                </form>
            </div>
    
         </div>
         
         <div id="pwsearch-box" class="login-popup">
        <a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
            <div class="login_main">
                <p class="login_sign" align="center">비밀번호 찾기</p><br>
                <form class="login_form1">
                    <input class="login_email" type="email" align="center" placeholder="등록하신 이메일을 작성해주세요.">
                    <a class="login_submit" align="center" href="#">아이디 찾기</a>
                    <p class="login-window login_forgot" align="center" id="search_id"><a href="#new-box">뒤로가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="index.jsp">메인으로</a></p>
                           </form>
            </div>
    
         </div>
    </nav>
    
    <!-- 로그인 팝업 -->
</body>
</html>