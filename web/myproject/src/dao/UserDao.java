package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;


public class UserDao {
	User user = null;
	private String SQL = "";
	
	public User login(String username, String password) {
		SQL = "select * from user where username = ? and password = ?";
		Connection connection = null;
			PreparedStatement pstmt = null;
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // �������˼���û����������SQL�����ʺŴ�
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//�õ����ݿ�Ĳ�ѯ���,һ�����ݼ�
            // �жϽ�����Ƿ���Ч
            if (rSet.next()) {
                user = new User();
                user.setUsername(rSet.getString("username"));
                user.setPassword(rSet.getString("password"));
            }
            pstmt.close(); 
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
        return user;
    }
	
	public int zhuCe(String username, String password) {
        SQL = "insert into user(username,password) values (?,?)";
        int b=0;
        Connection connection = null;
        PreparedStatement pstmt = null;
        try {
            DBDao dbDao = new DBDao();

            connection = dbDao.getConnection();

            pstmt =  connection.prepareStatement(SQL);

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            b=pstmt.executeUpdate();
            System.out.println("---------"+b);
            pstmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
        return b;
        
	}
	public int add(String username){
		int b=0;
        Connection connection = null;
        PreparedStatement pstmt = null;
		
		SQL = ("insert into private(username) value(?);");
		
		try {
            DBDao dbDao = new DBDao();

            connection = dbDao.getConnection();

            pstmt =  connection.prepareStatement(SQL);
        
            pstmt.setString(1, username);

            b=pstmt.executeUpdate();
            System.out.println("---------"+b);
            pstmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return b;
	}
}
