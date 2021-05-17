<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex02_upload.jsp</title>
</head>
<body>
	<%
		/***** 업로드 진행 *****/
		
		// 1. 파일이 업로드 될 디렉터리명을 변수로 저장한다.
		String directory = "archive";
	
		// 2. 파일이 업로드 될 디렉터리의 실제 경로를 변수로 저장한다.
		String realPath = request.getServletContext().getRealPath(directory);
		
		// 3. 디렉터리가 생성되지 않았다면 새로 생성한다.
		if(!new File(realPath).exists())
			new File(realPath).mkdirs();
		
		// 4. 기존 request를 사용하지 않고, MultipartRequest 클래스 타입의 객체를 생성한다.
		//    객체를 만들면 업로드가 된다.
		MultipartRequest multipart = new MultipartRequest(
					request,						// 1. 기존 request
					realPath, 						// 2. 업로드 될 경로
					1024 * 1024 * 10,				// 3. 파일의 최대용량 (BYTE 단위), 10MB
					"utf-8", 						// 4. 인코딩 타입
					new DefaultFileRenamePolicy()	// 5. 기본 파일명 변경 정책 (원래 파일명에 숫자 추가)
				);
		
	%>

	<h3>파일 업로드 결과</h3>
	<ul>
		<li>업로드 경로: <%=realPath%></li>
		<%-- request를 사용할 수 있는가? : NO --%>
		<%-- MultipartRequest를 생성한 이후에는 request를 사용할 수 없다. --%>
		<li>(request)업로더 : <%=request.getParameter("uploader")%></li>
		<li>(request)파일명 : <%=request.getParameter("filename")%></li>
		<%-- request의 대신 Multipartrequest가 request의 역할을 수행하게 된다. --%>
		<li>업로더 : <%=multipart.getParameter("uploader")%></li>
		<li>올릴 때 파일명 : <%=multipart.getOriginalFileName("filename")%></li>
		<li>저장된 파일명 : <%=multipart.getFilesystemName("filename")%></li>
		<%
			// mulitpart 객체에 저장된 첨부 파일을 가져오는 메소드: getFile()
			// getFile() 메소드의 반환 타입을 File이다.
			File file = multipart.getFile("filename");
			String filename = file.getName();
			long size = file.length() / 1024 ; 	// file.length() : BYTE 단위로 반환
			String date = new SimpleDateFormat("yyyy-MM-dd a h:mm").format(new Date(file.lastModified()));
		%>
		<li>filename : <%=filename%></li>
		<li>size : <%=size%>KB</li>
		<li>date : <%=date%></li>
	</ul>

	<%-- 다운로드 링크 --%>
	<a href="Ex03_downlaod.jsp?directory=<%=directory%>&filename=<%=filename%>">다운로드</a>
</body>
</html>