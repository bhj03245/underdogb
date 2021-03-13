<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행 지도</title>
</head>
<body>
	<div id="journalContentContainer">
		<div id="myJournalList">
			<table>
				<tbody>
					<c:choose>
						<c:when test="${empty myjournalList }">
							<tr>
								<td colspan="4" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty myjournalList}">
							<c:forEach var="list" items="${myjournalList}">
								<tr>
									<td><c:out value="${list.marker}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d625053b0732bfe46e3b6a75cb7c220a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 14
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
// 				kakao.maps.event.addListener(marker,'click',function(){
// 					var url = "${pageContext.request.contextPath}/my/list";
// 				    url = url + "?journal_no="+;
// 					location.href = url;
// 				});
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