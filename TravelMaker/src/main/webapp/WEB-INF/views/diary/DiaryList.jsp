<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
padding-top: 30px;
padding-bottom: 30px;
}
</style>
</head>
<body>
<h2>board list</h2>
	<table>
	<thead>
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
    <c:forEach items="${diaryList}" var="list">
        <tr>
            <td>${list.diary_no}</td>
            <td><a href='#'><c:out value="${list.title}"/></a></td>
            <td>${list.author}</td>
            <td>${list.diary}</td>  
        </tr>
    </c:forEach>
    </tbody>
	</table>
	<button type="button" id="BtnWrite">글작성</button>
	
<script>
$('#BtnWrite').on('click',  function(){
    location.href = "DiaryWrite";
 });
</script>

</body>
</html>