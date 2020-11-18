package com.exchange;

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


/**
 * Servlet implementation class ex_control
 */
@WebServlet("/ex_control")
public class ex_control extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String,ex_able> map = new HashMap<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ex_control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
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
    			ex_able hinst =(ex_able)hclass.newInstance();
    			map.put(cmd, hinst);
    		}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
    			e.printStackTrace();
    			System.out.println("ex_control 핸들러 클래스 문제있다.");
    		}
    	}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request,response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request,response);
	}
	protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri= request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		
		ex_able able = map.get(cmd);
		String view=null;
		if(able ==null)
			view="index.jsp";
		else {
			view = able.active(request, response);
		}
		System.out.println("dddd");
		if(view!=null) {
			RequestDispatcher ds = request.getRequestDispatcher(view);
			ds.forward(request, response);
		}
	}
}
