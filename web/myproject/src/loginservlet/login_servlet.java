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

        // ��ȡ�û���������
        String username = request.getParameter("username");

        String password = request.getParameter("password");

        // ��ȡUserDaoʵ��
        UserDao userDao = new UserDao();

        User user = userDao.login(username, password);
        // �ж�user�Ƿ�Ϊ��
        if (user != null) {
            // ת����LoginSuccess.jspҳ��
                        // getRequestDispatcher()������ת��
        	//�õ��û���Ϣ
        	request.getSession().setAttribute("user", user);
        	
            request.getRequestDispatcher("index.html").forward(request,
                    response);
            
        } else {
            // ��¼ʧ��
        	System.out.println("��¼ʧ��");
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
