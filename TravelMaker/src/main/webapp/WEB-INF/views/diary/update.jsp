<%@page import="com.traveler.web.diary.mapper.DiaryMapper"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

<style>
#body1{
position: absolute;
width: 60%;
margin-left: 20%;
}
#box{
width: 300px;
}
.ck {
   position: relative;
   width: 700px;
   height: 300px;
}
label{
display:inline-block; 
width:50px; 
line-height:40px;
}
input{
width: 330px;
}
#Btn {
	position: relative;
	float: left;
	top: 15px;
	left: 605px;
}
</style>
</head>
<body>
<div>
	<h1>Diary Update</h1>
	<form role="form" action="/diary/update" method="post">
	<div>
		<label>NO</label>
	    <input name="diary_no" id="box" readonly="readonly" value='<c:out value="${diary.diary_no}"/>'>
	</div>
	<div>
		<label>Title</label>
		<input name="title" id="box" value='<c:out value="${diary.title}"/>'>
	</div>
	<div>
		<label>Writer</label>
		<input name="writer" id="box" readonly="readonly" value='<c:out value="${diary.writer}"/>'>
	</div>
	 <div class="ck">
    	<textarea id="summernote" name="diary"></textarea>
     </div>
	
	<button id="Btn" data-oper='update'>수정하기</button>
	</form>
</div>
<script>
$(document).ready(function() {
    //여기 아래 부분
    $('#summernote').summernote({
				height: 300, // 에디터 높이
				minHeight: null, // 최소 높이
				maxHeight: null, // 최대 높이
				focus: true, // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",	// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
    	});
});
</script>
</body>
</html>