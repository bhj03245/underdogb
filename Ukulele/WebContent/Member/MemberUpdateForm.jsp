
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>회원수정</title>
        <link rel="stylesheet" href="css/Mypage.css"> 
    </head>
    <body>
    
    
        <!-- header -->
        <div id="Mypage_header">
            <img src="images/logo.png" id="logo"><a href="index.jsp"></a>
        </div>


        <!-- wrapper -->
        <div id="Mypage_wrapper">

            <!-- content-->
            <div id="Mypage_content">
           
               <form action="memberUpdate.mb" method="get">
               
                 <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">수정 할 아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id">
                        </span>
                        <input type="hidden" name="MemberUpdate" value="<%=session.getAttribute("id")%>"> 
                 <!--    <span class="error_next_box"></span>
                </div>   --> 
                
                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">수정 할 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pswd1" class="int" maxlength="20" name="pw">
                        <span id="alertTxt">사용불가</span>
                        <img src="m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                 <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">수정 할 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="email" id="email" class="int" maxlength="100" placeholder="선택입력" name="email">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>
               
              

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <input type="submit" id="btnJoin" name="" value="수정완료">
                     
                </div>
                  </form>
                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
    <script src="main.js"></script>
    </body>
</html>