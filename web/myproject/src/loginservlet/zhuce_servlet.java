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
        System.out.println("zhuCeServlet.java��������");
        response.setCharacterEncoding("utf-8");

        // ��ȡ�û���������
        String username = request.getParameter("username");

        System.out.println("username----->" + username);

        String password = request.getParameter("password");
        System.out.println("password----->" + password);

        // ��ȡUserDaoʵ��
        UserDao userDao = new UserDao();

        int i = userDao.zhuCe(username, password);
        int t = userDao.add(username);
        System.out.println("-----" + i);
        System.out.println("-----" + t);
        // �ж�i��ֵ��Ϊ0��ʾδ���룬Ϊ1��ʾ����һ������
        if (i != 0) {
            System.out.println("-----------ע��ɹ�---------");
            request.getRequestDispatcher("login.jsp").forward(request,
                    response);
        } else {// ע��ʧ�ܣ���Ȼȥע��ҳ�� ����
            System.out.println("000000000000000000000");
            request.getRequestDispatcher("zhuce.jsp")
                    .forward(request, response);
        }
    }
}
