<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.member" %>
<%request.setCharacterEncoding("UTF-8"); %>


 <div id='join_write'>
 <form name='join_f' method='post' action='member/resave.jsp'>
 <div class='join_list'>
 	<span class='join_title'>아이디</span>
 	<span class='join_input'>
 		<input value='${login.getJoin_id() }' readonly type='text' id='join_id' name='join_id'>
 	</span>
 </div>
 <div class='join_list'>
 	<span class='join_title'>암호</span>
 	<span class='join_input'>
 		<input type='password' id='join_pw' name='join_pw'>
 	</span>
 </div>
 <div class='join_list'>
 	<span class='join_title'>이름</span>
 	<span class='join_input'>
 		<input value='${login.getJoin_name()} ' readonly type='text' id='join_name' name='join_name'>
 	</span>
 </div>
 <div class='join_list'>
 	<span class='join_title'>연락처</span>
 	<span class='join_input'>
 		<input value='${login.getJoin_tel() }' type='text' id='join_tel' name='join_tel' placeholder='-없이 입력하세요'>
 	</span>
 </div>
 <div class='join_list'>
 	<span class='join_title'>이메일</span>
 	<span class='join_input'>
 		<input value='${login.getJoin_email() }' type='text' id='join_email' name='join_email'>
 	</span>
 </div>
 <div>
 	<button type='button' id='join_bt'>수정</button>
 </div>
 </form>
 </div>