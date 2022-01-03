package posteditservlet;

import user.*;
import dao.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class private_servlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public private_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("private_servlet 访问我了");
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        System.out.println("username----->" + user.getUsername());
    	
    	String sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"UTF-8");
        System.out.println("sex----->" + sex);
        
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
        System.out.println("name----->" + name);
        
        String age = request.getParameter("age");
        System.out.println("age----->" + age);
        
        String phone = request.getParameter("phone");
        System.out.println("phone----->" + phone);
        
        privateDao privateDao = new privateDao();
        int i = privateDao.Update(user.getUsername(), sex, name, age, phone);
        
        if (i != 0) {
            System.out.println("-----------保存成功---------");
            
            request.getRequestDispatcher("profile.jsp").forward(request,
                    response);
           
            
        } else {// 发布失败，仍然去发布页面 操作
            System.out.println("000000000000000000000");
            request.getRequestDispatcher("profile.jsp")
                    .forward(request, response);
        }
        
        
    }
}
