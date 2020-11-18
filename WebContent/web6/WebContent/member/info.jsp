<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${user==null }">
		<script>
			alert("로그인을 먼저 해주세요");
			location.href="member/login.jsp";
		</script>
</c:if>

<script  type='text/javascript' src="../front_lib/join.js">

</script>
<form method="post" action="join.do">
	<input type='hidden' name='part' value='update'>
	<fieldset>
    	<legend>필수항목</legend>
    <div>
    <span>이메일</span>
    <span><input type='email' value="${user.getEmail() }" readonly></span>
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
    <span><input type='text' value="${user.getTel() }" name="tel" id="tel"></span>
    </div>
     <div>
    <span>가명</span>
    <span><input type='text' value="${user.getName() }" readonly></span>
    </div>
    </fieldset>
    
    <fieldset>
    	 <div>
	    <span>주소</span>
	    <div>
	    <span><input type='text' name=addr_num id='addr_num' value="${user.getAddr_num()!=0 ? user.getAddr_num() : '' }"></span>
	    <span><button type='button'>우편번호</button></span>
	    </div>
	    <div>
	    <span><input type='text' name=addr1 id='addr2' value="${user.getAddr_full()!=null ? user.getAddr_full() : ''}"></span>
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
    <button>수정</button>
    <button type="button" onclick="pre()">취소</button>
    </form>
    <script>
     function pre(){
    	 location.href="index.jsp";
     }
    	var chk =document.querySelectorAll(".field");
		var mychk ='${user.getInterest()}';
		mychk = mychk.split("-");
		for(i in chk){
			for(k in mychk){
			if(chk[i].value == mychk[k]){
				chk[i].checked=true;
			}
		  }
		}
    </script>
    