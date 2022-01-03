package dao;

import user.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class privateDao {
	Userprivate userprivate = null;
	private String SQL = "";
	
	public int Update(String username, String sex,String name, String age, String phone) {
		int b = 0;
		SQL = "UPDATE private SET sex=?, name=?,age=?,phone=? WHERE username = ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            
            pstmt.setString(1, sex);
            pstmt.setString(2, name);
            pstmt.setString(3, age);	
            pstmt.setString(4, phone);
            pstmt.setString(5, username);
            
            b=pstmt.executeUpdate();
            
            // ResultSet rSet = (ResultSet) pstmt.executeQuery();//得到数据库的查询结果,一个数据集
            // 判断结果集是否有效
            /* if (rSet.next()) {
            	
            	userprivate = new Userprivate();
            	userprivate.setSex(rSet.getString("sex"));
            	userprivate.setName(rSet.getString("name"));
            	userprivate.setAge(rSet.getString("age"));
            	userprivate.setPhone(rSet.getString("phone"));
            	
            	
            	b=pstmt.executeUpdate();
                System.out.println("---------"+b);
            }*/
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return b;	
	}
	
	public Userprivate findUserprivate(String username) {
		SQL = "select * from private where username = ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // 将用户名和密码填到SQL语句的问号处
            pstmt.setString(1, username);
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//得到数据库的查询结果,一个数据集
            // 判断结果集是否有效
            if (rSet.next()) {
            	userprivate = new Userprivate();
            	userprivate.setSex(rSet.getString("sex"));
            	userprivate.setName(rSet.getString("name"));
            	userprivate.setAge(rSet.getString("age"));
            	userprivate.setPhone(rSet.getString("phone"));
            }
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return userprivate;
	}
	
	
	
}
