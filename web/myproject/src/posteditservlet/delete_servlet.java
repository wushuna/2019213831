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

public class delete_servlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public delete_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("delete_servlet��������");
//    	 response.setCharacterEncoding("utf-8");
         
         int id = Integer.parseInt(request.getParameter("id"));
         System.out.println("id----->" + id);
         
         //String username = request.getParameter("username");\
         
         //���session����
         //HttpSession session = request.getSession();
         //User user=(User) session.getAttribute("user");
         //System.out.println("username----->" + user.getUsername());
         
         //String content = request.getParameter("content");
         //System.out.println("content----->" + content);
        
         
         articleDao articleDao = new articleDao();
         
         int i = articleDao.deleteArticle(id);
//         System.out.println("-----" + i);
         
         if (i != 0) {
             System.out.println("-----------ɾ���ɹ�---------");
             
             request.getRequestDispatcher("profile.jsp").forward(request,
                     response);
            
             
         } else {// ����ʧ�ܣ���Ȼȥ����ҳ�� ����
             System.out.println("000000000000000000000");
             request.getRequestDispatcher("profile.jsp")
                     .forward(request, response);
         }
         
        
    	
    }
}
