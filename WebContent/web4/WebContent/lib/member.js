window.onload=function(){
	var bt = document.querySelector("#join_bt");
	if(bt!=null){
		document.join_f.join_id.focus();
		bt.addEventListener("click",join_check);
	}
	var bt2 = document.querySelector("#login_bt");
	if(bt2 !=null){
		document.login_f.login_id.focus();
		bt2.addEventListener("click",login_check);
	}
}

function join_check(){
	var form=document.join_f;
	if(form.join_id.value==''){
		alert("아이디를 입력하세여");
		form.join_id.focus();
	}else if(form.join_pw.value==''){
		alert("암호를 입력하세여");
		form.join_pw.focus();
	}else if(form.join_name.value==''){
		alert("이름을 입력하세여");
		form.join_name.focus();
	}else if(form.join_tel.value==''){
		alert("연락처를 입력하세여");
		form.join_tel.focus();
	}else if(form.join_email.value==''){
		alert("이메일을 입력하세여");
		form.join_email.focus();
	}else{
		form.submit();
	}
}
function login_check(){
	var form=document.login_f;
	if(form.login_id.value==''){
		alert("아이디를 입력하세여");
		form.login_id.focus();
	}else if(form.login_pw.value==''){
		alert("암호를 입력하세여");
		form.login_pw.focus();
	}else{
		form.submit();
	}
}