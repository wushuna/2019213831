package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdk.nashorn.internal.ir.ReturnNode;
import user.Article;



public class articleDao {
	Article article = null;
	private String SQL = "";
	
	//��ѯ����
	
	/*public Article findArticle(String username) {
		SQL = "select * from article where username = ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // �������˼���û����������SQL�����ʺŴ�
            pstmt.setString(1, username);
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//�õ����ݿ�Ĳ�ѯ���,һ�����ݼ�
            // �жϽ�����Ƿ���Ч
            if (rSet.next()) {
                article = new Article();
                article.setusername(rSet.getString("username"));
                article.setTitle(rSet.getString("title"));
                article.set_content(rSet.getString("content"));
            }
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return article;
	}*/
	public ArrayList<Article> findArticle(String username) {
		SQL = "select * from article where username = ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ArrayList<Article> articles = new ArrayList<Article>();
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // ���û����������SQL�����ʺŴ�
            pstmt.setString(1, username);
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//�õ����ݿ�Ĳ�ѯ���,һ�����ݼ�
            // �жϽ�����Ƿ���Ч
            while(rSet.next()) {
                article = new Article();
                article.setId(rSet.getInt("id"));
                article.setusername(rSet.getString("username"));
                article.setTitle(rSet.getString("title"));
                article.set_content(rSet.getString("content"));
                articles.add(article);
            }
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return articles;
	}
	
	public ArrayList<Article> search_Article(String username) {
		SQL = "select * from article where content  like ? or username like ? or title like ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ArrayList<Article> articles = new ArrayList<Article>();
		try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // ���û����������SQL�����ʺŴ�
            pstmt.setString(1, "%"+username+"%");
            pstmt.setString(2, "%"+username+"%");
            pstmt.setString(3, "%"+username+"%");
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//�õ����ݿ�Ĳ�ѯ���,һ�����ݼ�
            // �жϽ�����Ƿ���Ч
            while(rSet.next()) {
                article = new Article();
                article.setId(rSet.getInt("id"));
                article.setusername(rSet.getString("username"));
                article.setTitle(rSet.getString("title"));
                article.set_content(rSet.getString("content"));
                articles.add(article);
            }
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		
		return articles;
	}
	
	
	//�������
	public int addArticle(String title, String username, String content){
		int b=0;
        Connection connection = null;
        PreparedStatement pstmt = null;
		
		SQL = ("insert into article(title,username,content) value(?,?,?);");
		
		try {
            DBDao dbDao = new DBDao();

            connection = dbDao.getConnection();

            pstmt =  connection.prepareStatement(SQL);

            pstmt.setString(1, title);
            pstmt.setString(2, username);
            pstmt.setString(3,content);
            

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
	
	//ɾ������
	public int deleteArticle(int id) {
		int b = 0;
		Connection connection = null;
        PreparedStatement pstmt = null;
		SQL = ("delete from article where id = ?;");
		
		try {
            DBDao dbDao = new DBDao();

            connection = dbDao.getConnection();

            pstmt =  connection.prepareStatement(SQL);
            
            pstmt.setInt(1, id);
           
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
	
	public int countArticle(String username) {
		int count = 0;
		Connection connection = null;
        PreparedStatement pstmt = null;
        
        SQL = ("select * from article where username = ?");
        
        try {
			connection = DBDao.getConnection();
			pstmt = (PreparedStatement) connection.prepareStatement(SQL);
            // ���û����������SQL�����ʺŴ�
            pstmt.setString(1, username);
            ResultSet rSet = (ResultSet) pstmt.executeQuery();//�õ����ݿ�Ĳ�ѯ���,һ�����ݼ�
            // �жϽ�����Ƿ���Ч
            while(rSet.next()) {
            	count++;
            }
            pstmt.close();
            connection.close();
		}catch (Exception e) {

            e.printStackTrace();
        } finally {
            DBDao.closeConnection(connection);
        }
		return count;
	}
    
}
