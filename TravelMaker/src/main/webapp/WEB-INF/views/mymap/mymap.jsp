<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행 지도</title>
<style type="text/css">
html, body{
	height:100%;
}
body{
	margin: 0px;
}
#journalContentContainer{
	height: 100%;
}

#myJournalList{
	height: 100%;
	display: flex;
}
#diaryList{
	height: 100%;
	width: 30%;
}
#blank{
	height: 60px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${CONTEXT_PATH}/resources/css/headerStatic.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/395fa77f9c.js" crossorigin="anonymous"></script>

</head>
<body>
	<div id="journalContentContainer">
		<tiles:insertAttribute name="header" />
		<div id="blank"></div>
		<div id="myJournalList">
			<div id="diaryList">
			</div>
			<div id="map" style="width: 70%; height: 100%;"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d625053b0732bfe46e3b6a75cb7c220a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 12
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var arr = new Array();
		// 주소로 좌표를 검색합니다

		<c:forEach var="my" items="${myjournalList}">
		geocoder.addressSearch('${my.marker}', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : coords
				// 마커의 위치
				});
				map.setCenter(coords);
				// 마커에 표시할 인포윈도우를 생성합니다 
				var infowindow = new kakao.maps.InfoWindow({
					content : '${my.marker}'
				// 인포윈도우에 표시할 내용
				});
				
				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
				kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
						marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout',
						makeOutListener(infowindow));
				kakao.maps.event.addListener(marker,'click',function(){
					var params={
							journal_no : '${my.journal_no}'
					}
					 $.ajax({
			                type : "POST",            // HTTP method type(GET, POST) 형식이다.
			                url : "/my/list",      // 컨트롤러에서 대기중인 URL 주소이다.
			                data : params,            // Json 형식의 데이터이다.
			                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			                    // 응답코드 > 0000
			                    for(var i = 0; i<res.mydiaryList.length; i++){
			                    	$('#diaryList').append('<div>'+res.mydiaryList[i].title+'</div>');
			                    }
//			                    $('#journaltitle').text(res.mydiaryList[0].title);
			                    console.log(res.mydiaryList.length);
			                },
			                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
			                    alert("통신 실패.")
			                }
			            });
// 					var url = "${pageContext.request.contextPath}/my/list";
// 				    url = url + "?journal_no="+'${my.journal_no}';
// 					location.href = url;
				});
			}
		});
		</c:forEach>
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		
	</script>
</body>
</html>