package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDao {  
		
	private static String USER = "root"; 
	private static String PASSWORD = "wsn031229";  
	private static String DB_URL = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";  
	private static String DB_DRIVER = "com.mysql.cj.jdbc.Driver";  
	private static Connection connection = null;  
 
    //连接数据库
    public static Connection getConnection(){  
 
        try {  
        	System.out.println(DB_DRIVER);
        	Class.forName(DB_DRIVER);
            System.out.println("--------");
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);  
        } catch (Exception e) {  
            System.out.println("数据库连接异常");  
            e.printStackTrace();  
        }  
        return connection;  
    }  
    public static void closeConnection(Connection connection){  
 
                    if(connection != null){  
                        try {  
                            connection.close(); // 关闭数据库连接
                        } catch (SQLException e) {  
                            e.printStackTrace();  
                        }  
                    }  
                }
    
    
 
}


