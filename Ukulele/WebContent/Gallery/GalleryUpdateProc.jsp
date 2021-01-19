<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="file.FileDAO"%>
<%@page import="file.FileBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="filebean" class="file.FileBean">
  <jsp:setProperty name="filebean" property="*" />
</jsp:useBean>
<%
String fileName = request.getParameter("file");
System.out.println(fileName);

ServletContext context = getServletContext(); // 어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. (서버의 절대경로를 구하는 데 필요)
String saveDir = context.getRealPath("Upload"); // 절대경로를 가져옴
System.out.println("절대경로 >> " + saveDir);

int maxSize = 3 * 1024 * 1024; // 3MB
String encoding = "UTF-8";

// saveDir: 경로
// maxSize: 크기제한 설정
// encoding: 인코딩타입 설정
// new DefaultFileRenamePolicy(): 동일한 이름일 경우 자동으로 (1),(2)..붙게 해줌

boolean isMulti = ServletFileUpload.isMultipartContent(request);// boolean타입. ??????
if (isMulti) {
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
			new DefaultFileRenamePolicy());
 	FileDAO dao =new FileDAO();
	FileBean bean = new FileBean();
	String pass=dao.getPass(filebean.getNum());
	if(pass.equals(filebean.getPassword())){
		bean.setSubject(multi.getParameter("subject"));
        bean.setContent(multi.getParameter("content"));
        bean.setFileName(multi.getFilesystemName("fileName"));
        bean.setNum(Integer.parseInt(multi.getParameter("num")));
		dao.updateGallery(filebean);
		response.sendRedirect("../selectService");
		
	}
	else{
%>
<script>
	alert("패스워드가 일치 하지 않습니다. 다시 확인 후 수정해주세요.");
	history.go(-1);
</script>
<%
	}
}
%>





