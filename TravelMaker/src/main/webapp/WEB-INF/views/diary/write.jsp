<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<!-- <link rel="stylesheet" href="/resources/css/bootstrap1.min.css"> -->

<style>
.write {
   position: relative;
   width: 70%;
   margin-left: 15%;
}

#box {
   position: relative;
   width: 300px;
}

#Btn {
   position: relative;
    float: left;
    top: 100px;
}
.map_wrap {
    position:relative;
    width:100%; height:350px;
}
#menu_wrap {
	position:absolute;
	top:40; left:0; bottom:0;
	width:230px;
	height:37px;
	margin:10px 0 30px 5px;
	padding:5px;
	overflow-y:auto;
	background:rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size:12px;
	border-radius: 10px;
}
.bg_white {
	background:#fff;
}
#menu_wrap hr {
	display: block; 
	height: 1px;
	border: 0; 
	border-top: 2px solid #5F5F5F;
	margin:3px 0;
}
#menu_wrap .option{
	text-align: center;
}
#menu_wrap .option p {
	margin:10px 0;
}  
#menu_wrap .option button {
	margin-left:5px;
}
.title {
    font-weight:bold;
    font-size:14px;
    display:block;
}
#centerAddr {
    display:block;
    margin-top:2px;
    font-weight: normal;
    font-size: 13px;
}
</style>
</head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ebaa88a9f875faa0b1038d0b6682dfde&libraries=services"></script>
<body>
   <h1>editor check</h1>
   <div class="write">
      <form role="form" id="form" action="${pageContext.request.contextPath}/diary/write" method="post">
      	<input type="hidden" name="journal_no" value="<%=journal_no%>">
         <div>
            <label>Title</label>
            <input name="title" id="box" placeholder="제목을 입력하세요" required="required">
         </div>
         <div>
            <label>Writer</label>
            <input name="writer" id="box" placeholder="작성자를 입력하세요" required="required">
         </div>
         <div class="map_wrap">
       		 <div id="map" style="width:1050px; height:350px; position:relative; overflow:hidden;"></div>
    	 </div>
         <div class="ck">
           <textarea id="summernote" name="diary"></textarea>
         </div>
         <input type="date" id="regdate" name="regdate">
         <input type="hidden" id="smap" name="marker">
         <div id="Btn">
            <button id="btnsave">작성</button>
            <button type="reset">다시쓰기</button>
         </div>
      </form>
      <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="" id="keyword" size="10"> 
                    <button type="submit">검색</button> 
                </form>
            </div>
        </div>
      </div>
   </div>
   <script>
   var sendsmap = '{"markers":[';
   
   $(document).ready(function() {
         //여기 아래 부분
         $('#summernote').summernote({
               height: 300, // 에디터 높이
               minHeight: null, // 최소 높이
               maxHeight: null, // 최대 높이
               focus: true, // 에디터 로딩후 포커스를 맞출지 여부
               lang: "ko-KR",   // 한글 설정
               placeholder: '최대 2048자까지 쓸 수 있습니다',   //placeholder 설정
               callbacks : { 
                      onImageUpload : function(files, editor, welEditable) { // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                    uploadFile(files[i], this);
                           }
                        }
                     }
         });
         $('#summernote').summernote(setting);     
   });
   
   function uploadFile(file, el) {
       data = new FormData();
       data.append("file", file);
       $.ajax({
          data : data,
          type : "POST",
          url : "uploadFile",
          contentType : false,
          enctype : 'multipart/form-data',
          processData : false,
          success : function(data) {
             $(el).summernote('editor.insertImage', data.url);
          }
       });
    }
    
   $(document).on('click', '#btnsave', function(e) {
      sendsmap=sendsmap.substr(0, sendsmap.length -1);
      sendsmap+="]}";
      $("#smap").val(sendsmap);
      
      $("#form").submit();
   });
// 장소 검색 객체를 생성합니다
   var ps = new kakao.maps.services.Places();  
//   searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    for ( var i=0; i<places.length; i++ ) {

        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
    }

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
   mapOption = { 
       center: new kakao.maps.LatLng(37.533934, 126.901143), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
   };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var smap = document.getElementById('smap'); // id값이 일치하는 태그를 읽어들임


//지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
   // 클릭한 위치에 마커를 표시합니다 
   addMarker(mouseEvent.latLng);
   savemarkers(mouseEvent.latLng);
});
function savemarkers(position){
    sendsmap+='{"Ma":"';
    sendsmap+=position.Ma;
    sendsmap+='","La":"';
    sendsmap+=position.La;
    sendsmap+='"},';
}
//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
   
   // 마커를 생성합니다
   var marker = new kakao.maps.Marker({
       position: position
   });

   // 마커가 지도 위에 표시되도록 설정합니다
   marker.setMap(map);
   
   // 생성된 마커를 배열에 추가합니다
   markers.push(marker);
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
   for (var i = 0; i < markers.length; i++) {
       markers[i].setMap(map);
   }            
}

//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
   setMarkers(map)    
}

//"마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
   setMarkers(null);    
}
   

   </script>
</body>
</html>