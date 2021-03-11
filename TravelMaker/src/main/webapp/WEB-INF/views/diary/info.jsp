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
<link rel="stylesheet" href="/resources/css/bootstrap1.min.css">
<style>
#body1{
position: absolute;
width: 60%;
margin-left: 20%;
}

label{
display:inline-block; 
width:50px; 
line-height:40px;
}

input{
width: 330px;
}

.map_wrap {
    position:relative;
    width:100%; height:350px;
}
.title {
    font-weight:bold;
    font-size:14px;
    display:block;
}

.addr {
   font-size: 12px;
}

</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebaa88a9f875faa0b1038d0b6682dfde&libraries=services"></script>
<body>
<div id="body1">
   <h1>Diary View</h1>
   <div>
      <label>NO</label>
       <input name="title" readonly="readonly" value='<c:out value="${diary.diary_no}"/>'>
   </div>
   <div>
      <label>Title</label>
      <input name="title" readonly="readonly" value='<c:out value="${diary.title}"/>'>
   </div>
   <div>
      <label>Writer</label><input name="writer" readonly="readonly" value='<c:out value="${diary.writer}"/>'>
   </div>
   <div class="map_wrap">
        <div id="map" style="width:400px; height:300px; position:relative; overflow:hidden; background-color: blue;">
   </div>
    <input type="hidden" id="marker" value='<c:out value="${diary.marker}"/>'>
   <div>
   <c:out escapeXml="false" value="${diary.diary}"/>
   </div>
   
      <button type="button"><a href='/diary/diarylist?journal_no=<%=journal_no%>'>목록으로</a></button>
      <button type="button"><a href='/diary/update?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>수정하기</a></button>
      <button type="button"><a href='/diary/delete?diary_no=<c:out value="${diary.diary_no}"/>&journal_no=<%=journal_no%>'>삭제하기</a></button>
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
</script>
</div>
</body>
</html>