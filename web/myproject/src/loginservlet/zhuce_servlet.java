 package loginservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;




public class zhuce_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public zhuce_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        System.out.println("zhuCeServlet.java访问我啦");
        response.setCharacterEncoding("utf-8");

        // 获取用户名和密码
        String username = request.getParameter("username");

        System.out.println("username----->" + username);

        String password = request.getParameter("password");
        System.out.println("password----->" + password);

        // 获取UserDao实例
        UserDao userDao = new UserDao();

        int i = userDao.zhuCe(username, password);
        int t = userDao.add(username);
        System.out.println("-----" + i);
        System.out.println("-----" + t);
        // 判断i的值，为0表示未插入，为1表示插入一条数据
        if (i != 0) {
            System.out.println("-----------注册成功---------");
            request.getRequestDispatcher("login.jsp").forward(request,
                    response);
        } else {// 注册失败，仍然去注册页面 操作
            System.out.println("000000000000000000000");
            request.getRequestDispatcher("zhuce.jsp")
                    .forward(request, response);
        }
    }
}
