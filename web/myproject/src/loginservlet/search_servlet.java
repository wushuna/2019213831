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

	        // ��ȡ�û���������
	        String search = new String(request.getParameter("search").getBytes("ISO-8859-1"),"UTF-8");
	   
	        // ��ȡʵ��
	        articleDao articleDao = new articleDao();

	        ArrayList<Article> search_article = new ArrayList<Article>();
	        
	        search_article = articleDao.search_Article(search);
	        
	        
	        
	        if (search_article != null) {
	            // ת����LoginSuccess.jspҳ��
	                        // getRequestDispatcher()������ת��
	        	//�õ��û���Ϣ
	        	request.getSession().setAttribute("search_article", search_article);
	        	
	            request.getRequestDispatcher("search.jsp").forward(request,
	                    response);
	            
	        } else {
	            // ��¼ʧ��
	        	System.out.println("����ʧ��ʧ��");
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
