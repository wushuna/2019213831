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

public class show_servlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public show_servlet() {
        super();
    }
	
	public void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		System.out.println("show_servlet��������");
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
   	
   	    privateDao privateDao = new privateDao();
   	    
   	    //�õ����������ĸ�����Ϣ
   	    System.out.println(user.getUsername());
   	    Userprivate userprivate = privateDao.findUserprivate(user.getUsername());
   	    System.out.println(userprivate);
   	    request.getSession().setAttribute("userprivate", userprivate);
   	   
   	    /*
   	    request.getSession().setAttribute("userprivate_sex", userprivate.getSex());
   	    request.getSession().setAttribute("userprivate_name", userprivate.getName());
   	    request.getSession().setAttribute("userprivate_age", userprivate.getAge());
   	    request.getSession().setAttribute("userprivate_phone", userprivate.getPhone());
   	    */
   	 
//   	    request.getRequestDispatcher("profile.jsp").forward(request,
//             response);
	}
}
