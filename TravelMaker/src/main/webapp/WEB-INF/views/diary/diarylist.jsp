 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
#table1 {
position: relative;
width: 70%; margin-left: 15%;
text-align: center;
}

#Btn{
float: right;
}

</style>
<meta charset="UTF-8">
<title>diary</title>
<!--jquery와 4버전부터 지원되는 popper.js를 사용하려면 추가-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<!-- <link rel="stylesheet" href="/resources/css/bootstrap1.min.css"> -->
<style type="text/css">
.thumbnail{
	width: 200px;
	height: 200px;
	background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
</head>
<body>
<div id="table1">
	<table>
	<thead>
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>이미지</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
    <c:forEach items="${diarylist}" var="diary" varStatus="status">
        <tr>
            <td>${diary.diary_no}</td>
            <td><a class='move' href='<c:out value="${diary.diary_no}"/>'>
            	<c:out value="${diary.title}"/></a>
            </td>
            <td><img class="thumbnail"></td>
            <td>${diary.writer}</td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${diary.regdate}"/></td>
        </tr>
    </c:forEach>
    </tbody>
	</table>
	
	<form id="actionForm" action="/diary/diarylist" method='get'></form>
	<button type="button" id="Btn">Write</button>
</div>
<script>
	$(document).ready(function() {
	$('#Btn').on('click',  function(){
	    location.href = "write";
	    
	 });
	
	 var actionForm = $("#actionForm");
	 $(".move").on("click", function(e){
	    	e.preventDefault();
	    	
	    	var targetdiary_no = $(this).attr("href");
	    	console.log(targetdiary_no);
	    	
	    	actionForm.append("<input type='hidden' name='diary_no' value='"+targetdiary_no+"'>'");
	    	actionForm.attr("action", "/diary/info").submit();
	    	
	    });
	 
	 	var arr = new Array(); //imglocs전체 배열 
	 	var imglist = new Array(); //첫번째 사진의 경로를 담은 배열
	    <c:forEach items="${diarylist}" var="diary"> //db를 가져왔어
	  	if('${diary.imglocs}'!='{"imglocs"}]}'){ //사진이 있는경우
	  		arr.push('${diary.imglocs}'); //사진의 경로를 arr에 넣어준다 아직 형태는 json string
	  	}else{ //없는경우
	  		arr.push('{"imglocs":[{"imgloc":"noimage"}]}'); //noimage가 뜬다
	  	}
	  </c:forEach>
	  
	  for(var i=0; i<arr.length; i++){   
		  var jsonimg = JSON.parse(arr[i]); //json string을 json객체로 변환을 하고
		  imglist.push(jsonimg.imglocs[0].imgloc); //변환한 경로들 중 첫번째 경로의 첫번째 사진을 imglist에 넣어준다.
//		  console.log(jsonimg.imglocs[0].imgloc);
	  } // 현재 imglist에는 각 게시글의 첫번째 사진의 경로가 순서대로 저장되어있다.
	  for(var i=0; i<imglist.length; i++){
	  	$('.thumbnail').eq(i).attr("src",imglist[i]); //thumbnail i번째 요소의 src 속성을 첫번째 사진의 경로로 바꿔준다.
	  }
	});
</script>
</body>
</html>