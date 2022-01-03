package posteditservlet;

import user.*;
import dao.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class readPost_servlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public readPost_servlet() {
        super();
    }
	
	public void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		System.out.println("readpost_servlet��������");
   	    response.setCharacterEncoding("utf-8");
   	    
   	    //����session�������û���Ϣ
   	    HttpSession session = request.getSession();
//   	    System.out.println(session);
   	    User user=(User) session.getAttribute("user");
   	    System.out.println(user);
//   	    User user = new User();
//   	    user.setUsername("123456789@qq.com");
//   	    user.setPassword("W12345");
//   	    System.out.println(user);
   	    //����article����
   	    articleDao articleDao = new articleDao();
   	    
   	    //�õ�����������������Ϣ
   	    System.out.println(user.getUsername());
   	    int count = articleDao.countArticle(user.getUsername());
   	    ArrayList<Article> article = articleDao.findArticle(user.getUsername());
   	    request.getSession().setAttribute("article", article);
   	    request.getRequestDispatcher("profile.jsp").forward(request,
             response);
	}
}
