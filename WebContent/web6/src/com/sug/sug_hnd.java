package com.sug;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exchange.ex_able;

public class sug_hnd implements ex_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
				String part=request.getParameter("part");
				Map<String,sug_able> sug=null;
				sug = get_Map();
				sug.get(part).service(request);
		return null;
	}

	private Map<String, sug_able> get_Map() {
			Map<String , sug_able> temp=new HashMap<String,sug_able>();
			temp.put("sug",new sug_service());
			temp.put("all",new sug_all());
			temp.put("process",new sug_process());
			return temp;	
	}
}