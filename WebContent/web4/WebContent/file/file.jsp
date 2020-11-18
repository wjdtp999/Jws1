<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			                                               <!--파일업로드가있는 form을 만들떄사용 -->
			<form method='post' action='file_save.jsp' enctype='multipart/form-data'>
			  <!--  파일업로드 input 태그 -->
			 <input type="file" name="filename">
			 <button>업로드</button>
			</form>