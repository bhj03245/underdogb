<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Style -->
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login_.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<!-- Header -->
    <header id="header">
    </header>

    <!-- Nav -->
    <nav id="nav">
        <a href="index.html" id="centerlogo"><img src="images/logo.png"></a>
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
            <a href="#login-box" class="login-window" id="login_position">로그인</a>
        </div>
    </nav>
    <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
        <form method="post" class="signin" action="#">
            <div class="login_main">
                <p class="login_sign" align="center">sign in</p>
                <form class="login_form1">
                     <input class="login_username" type="text" align="center" placeholder="Username">
                    <input class="login_password" type="password" align="center" placeholder="Password">
                    <a class="login_submit" align="center" href="#">sign in</a>
                    <p class="login_forgot" align="center" id="search_id"><a href="#">searching ID</a></p>
                    <p align="center" id="search_pw"><a href="#">searching PW</a></p>
                </form>
            </div>
        </form>
        
    </div>
    
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
</body>
</html>