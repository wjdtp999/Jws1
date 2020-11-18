window.onload=function(){
	var list=document.querySelector("#dept");
	
	
	var dept_list=['===학과선택===','컴퓨터공학과','국문과','수학과','전기전자과','해양생물학과','정보통신공학과','기계공학과','건축학과',];

	
	for(var i in dept_list){
		list.options.add(new Option(dept_list[i]	));
	}
} 