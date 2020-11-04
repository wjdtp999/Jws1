 
    window.onload=function(){
	var id=document.querySelector(".id");
	var name=document.querySelector(".name");
	var phone=document.querySelector(".phone");
	var email=document.querySelector(".email");
	var addr=document.querySelector(".addr");
	var item=document.querySelector(".item");
	var sns=document.querySelector(".sns");
	id.innerHTML=getParam("id")[0];
	name.innerHTML=getParam("name")[0];
	phone.innerHTML=getParam("phone")[0];
	email.innerHTML=getParam("eamil")[0]+"@"+getParam("domain")[0];
	addr.innerHTML=getParam("addr")[0];
	item.innerHTML=getParam("interest");
	sns.innerHTML=getParam("sns")[0];
}

function getParam(name){
	  var url=window.location.href;
       url=url.substr(url.indexOf("?")+1);
       var param=url.split("&");
       var chk_box=[];
       var flag=false;
       for(var i in param){
    	   temp=param[i].split("=");
    	   if(temp[0]==name){
    		   chk_box.push(temp[1]);
    		   flag=true;
    	   }else if(flag){
    		   return chk_box;
    	   }
       }
       return chk_box;
 }
