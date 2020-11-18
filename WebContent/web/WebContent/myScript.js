
/*window.onload=function(){
	var enter=document.querySelector("#enter");
	enter.addEventListener("click",check)
}

function check() {
      /*var name=document.querySelector('#name');
      var email= document.querySelector("#email");
      var addr=document.querySelector("#addr");
      */
	
     /* var form=document.f;
      if(form.name.value==''){
    	  alert("이름을 입력해주세요");
    	  form.   name.focus();
    	  return;
      }else if(form.pro.value==''){
    	  alert("이메일을 입력해주세요");
    	  form.email.focus();
    	  return;
      }else if(form.addr.value==''){
    	  alert("주소를입력해주세요");
    	  form.addr.focus();
    	  return;
      }
      document.f.submit();
	
}*/
	

window.onload=function(){
	var enter = document.querySelector("#enter");
	enter.addEventListener("click",check);
}

function check(){
	/*
	var name= document.querySelector("#name");
	var email = document.querySelector("#email");
	var addr = document.querySelector("#addr");
	*/
	var form = document.f;
	if(form.name.value==''){
		alert("이름을 입력하세요");
		name.focus();
		return;
	}
	else if(form.dept.value==''){
		alert("학과를 입력하세요");
		email.focus();
		return;
	}
	else if(form.num.value==''){
		alert("학번을 입력하세요");
		addr.focus();
		return;
	}else if(form.cls.value==''){
		alert("학년을 입력하세요");
		addr.focus();
		return;
	}
	make(form.name.value, form.dept.value, form.num.value, form.cls.value);
}

function make(name,dept,num, cls){
	var parent=document.querySelector("#list");
	var child = document.createElement("div");
	var span = document.createElement("span");
	var att = document.createAttribute("style");
	att.value="margin-right:50px;";
	span.setAttributeNode(att);
	var text = document.createTextNode(name);
	span.appendChild(text);
	child.appendChild(span);
	span = document.createElement("span");
	att = document.createAttribute("style");
	att.value="margin-right:50px;";
	span.setAttributeNode(att);
	text = document.createTextNode(dept);
	span.appendChild(text);
	child.appendChild(span);
	span = document.createElement("span");
	att = document.createAttribute("style");
	att.value="margin-right:50px;";
	span.setAttributeNode(att);
	text = document.createTextNode(num);
	span.appendChild(text);
	child.appendChild(span);
	span = document.createElement("span");
	att = document.createAttribute("style");
	att.value="margin-right:50px;";
	span.setAttributeNode(att);
	text = document.createTextNode(cls);
	span.appendChild(text);
	child.appendChild(span);
	parent.appendChild(child);
}


 