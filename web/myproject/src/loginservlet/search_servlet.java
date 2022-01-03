package loginservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import user.*;


public class search_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setCharacterEncoding("utf-8");

	        // 获取用户名和密码
	        String search = new String(request.getParameter("search").getBytes("ISO-8859-1"),"UTF-8");
	   
	        // 获取实例
	        articleDao articleDao = new articleDao();

	        ArrayList<Article> search_article = new ArrayList<Article>();
	        
	        search_article = articleDao.search_Article(search);
	        
	        
	        
	        if (search_article != null) {
	            // 转发到LoginSuccess.jsp页面
	                        // getRequestDispatcher()是请求转发
	        	//得到用户信息
	        	request.getSession().setAttribute("search_article", search_article);
	        	
	            request.getRequestDispatcher("search.jsp").forward(request,
	                    response);
	            
	        } else {
	            // 登录失败
	        	System.out.println("搜索失败失败");
	            request.getRequestDispatcher("profile.jsp").forward(request,
	                    response);
	            
	        }

	        System.out.println("-------******--------");
	    }

	    public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request, response);
	    }
}
