package com.main;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.member_service;

/**
 * Servlet implementation class main_control
 */
@WebServlet("/main_control")
public class main_control extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String,main_hnd> map = new HashMap<>();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public main_control() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) {
    	String iparam = config.getInitParameter("ConfigFile");
    	Properties prop = new Properties();
    	try (FileReader fs = new FileReader(iparam)){
    		prop.load(fs);
    	}catch(IOException e) {
    		e.printStackTrace();
    		System.out.println("properties 파일 읽기 실패");
    	}
    	Iterator key = prop.keySet().iterator();
    	while(key.hasNext()) {
    		String cmd = (String)key.next();
    		String value = prop.getProperty(cmd);
    		try {
    			Class<?> hclass = Class.forName(value);
    			main_hnd hinst =(main_hnd)hclass.newInstance();
    			map.put(cmd, hinst);
    		}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
    			System.out.println("핸들러 클래스 문제있다.");
    		}
    	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path="http://localhost:8080/jsp1/";
		request.setAttribute("path", path);
		
		String uri= request.getRequestURI();
		String p= request.getContextPath();
		String cmd = uri.substring(p.length()+1);
		main_hnd hd = map.get(cmd);
		
		hd.action(request, response);		
		
		RequestDispatcher dsp = request.getRequestDispatcher("index.jsp");
		dsp.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}