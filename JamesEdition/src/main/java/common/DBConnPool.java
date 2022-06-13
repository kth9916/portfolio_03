package common;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnPool {
	
	public  Connection conn;
	public  Statement stmt;
	public  PreparedStatement pstmt;
	public  ResultSet rs; 
	
	//�⺻ ������ 
	public DBConnPool() {
		
        try {
            // JDBC ����̹� �ε�
            Class.forName("oracle.jdbc.OracleDriver");

            // DB�� ����
            String url = "jdbc:oracle:thin:@localhost:1521:xe";  
            String id = "hr2";
            String pwd = "1234"; 
            conn = DriverManager.getConnection(url, id, pwd); 

            System.out.println("DB ���� ����(�⺻ ������)");
        }
        catch (Exception e) {            
            e.printStackTrace();
        }
		
		
/*		
 * System.out.println("DBCP ��ü ��� ");
		try {
			//���Ͽ� ������ Ŀ�ؼ� Ǯ (DBCP) ���� ������
			Context initCtx = new InitialContext(); 
			Context ctx = (Context)initCtx.lookup("java:comp/env"); 
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle"); 
			
			//Ŀ�ؼ� Ǯ�� ���ؼ� ���� ��� 
			con = source.getConnection();
			
			System.out.println("Ŀ�ؼ�Ǯ(DBCP) ���� ����");
			
		}catch (Exception e) {
			System.out.println("Ŀ�ؼ�Ǯ(DBCP) ���� ����");
			e.printStackTrace(); 	//���� �޼��� ��� : �ڼ��� ���� ��� 
			System.out.println(e.getMessage()); //���� �޼��� ��� (���� ����)
		}	
		
			*/
	}
	
	
	
	//�ڿ� ���� ����  (�ڿ� �ݳ�) : close() �޼ҵ� ȣ��� �ڿ��� �ݳ��ϵ��� ���� 
    public  void close() {
        try {            
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();  // �ڵ����� Ŀ�ؼ� Ǯ�� �ݳ���

            System.out.println("DB Ŀ�ؼ� Ǯ �ڿ� �ݳ�");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	

}
