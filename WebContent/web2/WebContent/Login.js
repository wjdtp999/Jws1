window.onload=function(){
	var list = document.querySelector("#domain");
	
	var mail_list=["===메일선택===","naver.com","gmail.com","hanmail.net"];
	
	for(i in mail_list){
		list.options.add(new Option(mail_list[i],mail_list[i]));
	}
	var join = document.querySelector("#jn");
	join.addEventListener("click",chk);
}
function chk(){
	var f = document.join_f;
	if(f.id.value==''){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}else if(f.pw.value==''){
		alert("비밀번호를 입력하세요");
		f.pw.focus();
		return;
	}else if(f.pwre.value!=f.pw.value){
		alert("비밀번호 틀렸습니다.");
		f.pwre.value='';
		f.pwre.focus();
		return;
	}else if(f.name.value==''){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}else if(f.phone.value==''){
		alert("연락처를 입력하세요");
		f.phone.focus();
		return;
	}else if(f.email.value==''){
		alert("이메일을 입력하세요");
		f.email.focus();
		return;
	}else if(f.addr.value==''){
		alert("주소를 입력하세요");
		f.addr.focus();
		return;
	}
	f.submit();
}