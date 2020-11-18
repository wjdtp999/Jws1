<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script  type='text/javascript' src="../front_lib/join.js">
 
 </script>
	<form method="post" action="join.do">
	<input type='hidden' name='part' value='join'>
	<fieldset>
    	<legend>필수항목</legend>
    <div>
    <span>이메일</span>
    <span><input type='email' name=email id='email'></span>
    <span><button type='button'>중복확인</button></span>
    </div>
     <div>
    <span>비밀번호</span>
    <span><input type='password' name=pword id='pword'></span>
    </div>
     <div>
    <span>비밀번호확인</span>
    <span><input type='password' name=repword id='repword'></span>
    </div>
     <div>
    <span>연락처</span>
    <span><input type='text' name=tel id='tel'></span>
    </div>
     <div>
    <span>가명</span>
    <span><input type='text' name=name id='name'></span>
    </div>
    </fieldset>
    
    <fieldset>
    	<legend>선택항목</legend>
    	 <div>
	    <span>주소</span>
	    <div>
	    <span><input type='text' name=addr_num id='addr_num'></span>
	    <span><button type='button'>우편번호</button></span>
	    </div>
	    <div>
	    <span><input type='text' name=addr1 id='addr2'></span>
	    </div>
	     <div>상세주소
	    <span><input type='text' name=addr2 id='addr2'></span>
	    </div>
	    </div>
	     <div>
	    <span>관심분야</span>
	    <span>
<input type='checkbox' name='field' id='field' value='fashion'>패션
<input type='checkbox' name='field' id='field' value='furniture'>가구
<input type='checkbox' name='field' id='field' value='digital'>디지털
<input type='checkbox' name='field' id='field' value='buty'>뷰티
<input type='checkbox' name='field' id='field' value='5'>완구
<input type='checkbox' name='field' id='field' value='6'>스포츠
	    </span>
	    </div>
    </fieldset>
    <button>가입</button>
    </form>