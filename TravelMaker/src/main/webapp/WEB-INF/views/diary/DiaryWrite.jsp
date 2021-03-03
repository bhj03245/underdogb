<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
<title>Insert title here</title>
<style>
.ck {
   position: relative;
   width: 700px;
   height: 300px;
}
#Btn {
	position: relative;
	float: left;
	top: 45px;
	left: 540px;
}
</style>
</head>
<body>
<h1>editor check</h1>
   <div>
      <form role="form" action="${pageContext.request.contextPath}/diary/saveDiary" method="post">
         <div>
            <label>Title</label>
            <input name="title" id="box" placeholder="제목을 입력하세요" required="required">
         </div>
         <div class="form-group">
            <label>Writer</label>
            <input name="writer" id="box" placeholder="작성자를 입력하세요" required="required">
         </div>
         <div class="ck">
            <textarea name="content" id="content"></textarea>
         </div>
         <div id="Btn">
            <button type="submit">작성</button>
            <button type="reset">다시쓰기</button>
         </div>
      </form>
   <script src="${pageContext.request.contextPath}/resources/ckEditor/js/ckeditor.js"></script>
   </div>
</body>
</html>