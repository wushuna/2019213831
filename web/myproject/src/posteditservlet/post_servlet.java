package posteditservlet; 



import dao.articleDao;
import user.Article;
import user.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class post_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public post_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("post_servlet访问我了");
    	 response.setCharacterEncoding("utf-8");
    	 response.setContentType("text/html; charset=UTF-8");
         
         String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
         System.out.println("title----->" + title);
         
         //String username = request.getParameter("username");\
         
         //获得session对象
         HttpSession session = request.getSession();
         User user=(User) session.getAttribute("user");
         System.out.println("username----->" + user.getUsername());
         
         String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
         System.out.println("content----->" + content);
        
         
         articleDao articleDao = new articleDao();
         
         int i = articleDao.addArticle(title, user.getUsername(), content);
//         System.out.println("-----" + i);
         
         if (i != 0) {
             System.out.println("-----------发布成功---------");
             
             request.getRequestDispatcher("profile.jsp").forward(request,
                     response);
            
             
         } else {// 发布失败，仍然去发布页面 操作
             System.out.println("000000000000000000000");
             request.getRequestDispatcher("profile.jsp")
                     .forward(request, response);
         }
         
        
    	
    }
     
}
