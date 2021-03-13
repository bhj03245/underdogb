<%@page import="com.traveler.web.diary.mapper.DiaryMapper"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<% int journal_no = Integer.parseInt(request.getParameter("journal_no")); %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--jquery와 4버전부터 지원되는 popper.js를 사용하려면 추가-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>

<style>
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

<<<<<<< HEAD
#diaryPage{
position: absolute;
width: 60%;
margin-left: 20%;
=======
.diaryPageContainer{
	position: absolute;
	width: 70%;
	margin-left: 20%;
}

h1 {
	font-size: 35px;
}

.info {
   position: relative;
   width: 70%;
   margin-left: 5%;
>>>>>>> d6678bc8de38f548d4b5d55ce4542ba39e45f480
}

h1 {
   font-size: 35px;
}

.info {
   position: relative;
   width: 70%;
   margin-left: 15%;
}

label{
<<<<<<< HEAD
   font-family: 'NanumBarunGothic';
   font-size: 17px;
   width: 50px;
   float: left;
   margin-right: 10px;
   font-weight: bold;
=======
	font-family: 'NanumBarunGothic';
	font-size: 17px;
	width: 50px;
	float: left;
	margin-right: 10px;
	font-weight: bold;
>>>>>>> d6678bc8de38f548d4b5d55ce4542ba39e45f480
}

#box {
   font-family: 'NanumBarunGothic';
    position: relative;
    width: 340px;
    border: 0px;
    border-bottom: 2px solid rgb(198, 198, 199);
    margin-bottom: 10px;
    padding: 5px;
    font-size: 16px;
}

.map_wrap {
    position:relative;
    width:100%; 
    height:100%;
    margin-top: 20px;
}

#map {
<<<<<<< HEAD
    width:100%; 
    height:300px; 
    position:relative; 
    overflow:hidden; 
    background-color: blue;
=======
 	width:100%; 
 	height:300px; 
 	position:relative; 
 	overflow:hidden; 
 	background-color: blue;
>>>>>>> d6678bc8de38f548d4b5d55ce4542ba39e45f480
}
.title {
    font-weight:bold;
    font-size:14px;
    display:block;
}

.diary {
	margin-bottom: 70px;
}

hr {
	width: 100%;
	border: none;
	border-top: 4px double #bbb;
	text-align: center;
	margin-bottom: 50px;
}

#btn {
	border: 2px solid rgb(198, 198, 199);
    background-color: white;
    border-radius: 5px;
    padding: 7px;
    margin-bottom: 10px;
    margin-top: 20px;
    font-family: 'NanumBarunGothic';
    font-size: 15px;
    font-weight: bold;
    letter-spacing: 1px;
}

.btn {
	margin-bottom: 30px;
}
.btn a {
text-decoration: none;
color: black;
}



</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebaa88a9f875faa0b1038d0b6682dfde&libraries=services"></script>
<body>
<<<<<<< HEAD
<div id="diaryPage">
   <h1>내 여행페이지</h1>
   <div class="info">
   <div>
      <label>번호</label>
       <input name="title" id="box" readonly="readonly" value='<c:out value="${diary.diary_no}"/>'>
   </div>
   <div>
      <label>제목</label>
      <input name="title" id="box" readonly="readonly" value='<c:out value="${diary.title}"/>'>
   </div>
   <div>
      <label>아이디</label>
      <input name="writer" id="box" readonly="readonly" value='<c:out value="${diary.writer}"/>'>
   </div>
   <div class="map_wrap">
        <div id="map">
   </div>
    <input type="hidden" id="marker" value='<c:out value="${diary.marker}"/>'>
   <div>
   <c:out escapeXml="false" value="${diary.diary}"/>
   </div>
   
      <button type="button"><a href='/diary/diarylist?journal_no=<%=journal_no%>'>목록으로</a></button>
      <button type="button"><a href='/diary/update?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>수정하기</a></button>
      <button type="button"><a href='/diary/delete?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>삭제하기</a></button>
   </div>
 
   
   <!-- 댓글 -->
=======
<div class="diaryPageContainer">
<h1>내 여행페이지</h1>
    <div class="info">
    <div>
		<label>번호</label>
		<input name="title" id="box" readonly="readonly" value='<c:out value="${diary.diary_no}"/>'>
    </div>
    <div>
		<label>제목</label>
		<input name="title" id="box" readonly="readonly" value='<c:out value="${diary.title}"/>'>
    </div>
    <div>
		<label>아이디</label>
		<input name="writer" id="box" readonly="readonly" value='<c:out value="${diary.writer}"/>'>
    </div>
    <div class="map_wrap">
        <div id="map">
    </div>
	<input type="hidden" id="marker" value='<c:out value="${diary.marker}"/>'>
	<div class="diary">
		<c:out escapeXml="false" value="${diary.diary}"/>
	</div>
	<hr>
	<div class="btn">
      <button type="button" id="btn"><a href='/diary/diarylist?journal_no=<%=journal_no%>'>목록으로</a></button>
      <button type="button" id="btn"><a href='/diary/update?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>수정하기</a></button>
      <button type="button" id="btn"><a href='/diary/delete?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>삭제하기</a></button>
    </div>
    </div>
 
     <!-- 댓글 -->
>>>>>>> d6678bc8de38f548d4b5d55ce4542ba39e45f480

<form name="replyForm" method="get">
  <input type="hidden" id="diary_no" name="diary_no" value="${diary.diary_no}" />
  <input type="hidden" id="journal_no" name="journal_no" value="${diary.journal_no }"/>
  <div style="width:650px; text-align: center;">
    <label for="writer">작성자</label><input type="text" id="writer" name="writer" />
    <br/>
    <textarea rows="3" cols="80" id="content" name="content" placeholder="댓글을 작성해주세요"></textarea>
     <button type="button" class="replyWriteBtn">작성완료</button>
  </div>
</form>
<div id="reply" style="width:700px">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
      <div hr style="border-bottom: dotted 1px black; margin-bottom: 20px;">
        <h3>${replyList.writer}</h3>  
        <p>${replyList.content}</p>
<<<<<<< HEAD
         <p>
         <fmt:formatDate value="${replyList.regdate}"/> 
         </p>
=======
         <p>${replyList.regdate}</p>
>>>>>>> d6678bc8de38f548d4b5d55ce4542ba39e45f480
        <div style="margin-bottom: 20px;">
         <button type="button" class="replyUpdateBtn" data-reply="${replyList.reply }">수정</button>
         <button type="button" class="replyDeleteBtn" data-reply="${replyList.reply }">삭제</button>
        </div>
           </div>
      </li>
    </c:forEach>   
  </ol>
</div>
</div>
</div>  
      <script>
      var actionForm = $("#actionForm");
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
           level: 4 // 지도의 확대 레벨
       };  

   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 

   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();
   
   var marker1 = $("#marker").val();
   var jsonmarker = JSON.parse(marker1);
   console.log(marker);
   
   for(var num=0; num<jsonmarker.markers.length; num++) {
      var coords = new kakao.maps.LatLng(jsonmarker.markers[num].Ma, jsonmarker.markers[num].La);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({ map: map, position: coords });
        map.setCenter(coords);
   }
   
   $(".replyWriteBtn").on("click", function(){
      var formObj = $("form[name='replyForm']");
      formObj.attr("action", "/diary/replyWrite"); 
      var today = new Date();
      formObj.attr(today);
      
      formObj.submit();
    });
   
 //댓글 수정 View
   $(".replyUpdateBtn").on("click", function(){
      location.href = "/diary/replyUpdateView?diary_no=${diary.diary_no}"
                  + "&reply="+$(this).attr("data-reply")
                       + "&journal_no="+${diary.journal_no};
   });
         
//댓글 삭제 View
   $(".replyDeleteBtn").on("click", function(){
      location.href = "/diary/replyDeleteView?diary_no=${diary.diary_no}"
         + "&reply="+$(this).attr("data-reply")
          + "&journal_no="+${diary.journal_no};
   });   
</script>
</body>
</html>