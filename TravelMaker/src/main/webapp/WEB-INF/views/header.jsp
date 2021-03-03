<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="Header">
	<div id="logo">Travel Maker</div>
	<!-- 로그인한 상태 -->
	<c:if test = "${vo != null }">
	<div id="header_right">
		<div id="mypage">My Travel</div>
		<a href = "/logout.do" id = logout>&nbsp&nbsp로그아웃</a>
	</div>
	</c:if>
	<div id="main_search">
		<div id="main_searchbar">
			<input type="text" id="search_title" placeholder="제목">
			<input type="text" id="search_date" placeholder="날짜">
			<input type="text" id="search_author" placeholder="작성자">
			<div id="search_btn"><i class="fas fa-search"></i></div>
		</div>
	</div>
</div>
