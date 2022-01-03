package loginservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import user.User;

public class login_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");

        // 获取用户名和密码
        String username = request.getParameter("username");

        String password = request.getParameter("password");

        // 获取UserDao实例
        UserDao userDao = new UserDao();

        User user = userDao.login(username, password);
        // 判断user是否为空
        if (user != null) {
            // 转发到LoginSuccess.jsp页面
                        // getRequestDispatcher()是请求转发
        	//得到用户信息
        	request.getSession().setAttribute("user", user);
        	
            request.getRequestDispatcher("index.html").forward(request,
                    response);
            
        } else {
            // 登录失败
        	System.out.println("登录失败");
            request.getRequestDispatcher("login.jsp").forward(request,
                    response);
            
        }

        System.out.println("-------******--------");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
