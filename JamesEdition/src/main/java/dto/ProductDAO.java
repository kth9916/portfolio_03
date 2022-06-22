package dto;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnPool;

public class ProductDAO extends DBConnPool{

	private static ProductDAO instance = new ProductDAO();
	
	public ProductDAO() {
		super();
		

	}
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	
	

	
	
	public void closeAll(PreparedStatement pstmt, Connection conn) 
			throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
	//closeAll method 2
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) 
			throws SQLException {
		if (rs != null)
			rs.close();
		//재사용
		this.closeAll(pstmt, conn);
	}
	
	/*
	 * 1번 기능 : 상품 등록
	 * register(Product)
	 */
	public int register(Product vo){

		int result = 0;
		try {
			String sql = "INSERT INTO product4(productId, pname, unitPrice, description, manufacturer, category, ofile1, ofile2, ofile3, ofile4, ofile5, quantity, realpath1, realpath2, realpath3, realpath4, realpath5) "
					+ "VALUES (productId.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getPname());
			pstmt.setInt(2, vo.getUnitPrice());
			pstmt.setString(3, vo.getDescription());
			pstmt.setString(4, vo.getManufacturer());
			pstmt.setString(5, vo.getCategory());
			pstmt.setString(6, vo.getOfile1());
			pstmt.setString(7, vo.getOfile2());
			pstmt.setString(8, vo.getOfile3());
			pstmt.setString(9, vo.getOfile4());
			pstmt.setString(10, vo.getOfile5());
			pstmt.setInt(11, vo.getQuantity());
			pstmt.setString(12, vo.getRealpath1());
			pstmt.setString(13, vo.getRealpath2());
			pstmt.setString(14, vo.getRealpath3());
			pstmt.setString(15, vo.getRealpath4());
			pstmt.setString(16, vo.getRealpath5());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품 등록 중 예외 발생");
			
		}
		return result;
	}
	
	/*
	 * 2번 기능 : 전체 상품 조회 기능
	 * getAllProductList() : ArrayList<Product>
	 */
	public ArrayList<Product> getAllProductList() throws SQLException{
		ArrayList<Product> list = new ArrayList<Product>();
	
		
		try {
			String sql = "SELECT * from product4 order by productId";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product vo = new Product();
				vo.setProductId(rs.getString(1));
				vo.setPname(rs.getString(2));
				vo.setUnitPrice(rs.getInt(3));
				vo.setDescription(rs.getString(4));
				vo.setManufacturer(rs.getString(5));
				vo.setCategory(rs.getString(6));
				vo.setOfile1(rs.getString(7));
				vo.setOfile2(rs.getString(8));
				vo.setOfile3(rs.getString(9));
				vo.setOfile4(rs.getString(10));
				vo.setOfile5(rs.getString(11));
				vo.setQuantity(rs.getInt(12));
				vo.setRealpath1(rs.getString(13));
				vo.setRealpath2(rs.getString(14));
				vo.setRealpath3(rs.getString(15));
				vo.setRealpath4(rs.getString(16));
				vo.setRealpath5(rs.getString(17));
				
				list.add(vo);
			}
			
		} finally {
			
		}
		
		return list;
	}
	
	public ArrayList<Product> getProductList(String category) throws SQLException{
		ArrayList<Product> list2 = new ArrayList<Product>();

		try {
			String sql = "SELECT * from product4 where category=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				Product vo = new Product();

				vo.setProductId(rs.getString(1));
				vo.setPname(rs.getString(2));
				vo.setUnitPrice(rs.getInt(3));
				vo.setDescription(rs.getString(4));
				vo.setManufacturer(rs.getString(5));
				vo.setCategory(rs.getString(6));
				vo.setOfile1(rs.getString(7));
				vo.setOfile2(rs.getString(8));
				vo.setOfile3(rs.getString(9));
				vo.setOfile4(rs.getString(10));
				vo.setOfile5(rs.getString(11));
				vo.setQuantity(rs.getInt(12));
				vo.setRealpath1(rs.getString(13));
				vo.setRealpath2(rs.getString(14));
				vo.setRealpath3(rs.getString(15));
				vo.setRealpath4(rs.getString(16));
				vo.setRealpath5(rs.getString(17));
				
				list2.add(vo);
			}
		}finally {
			
		}
		return list2;
	}
	
	
	/*
	 * 3번 기능 : 아이디로 상품 정보 찾기 기능
	 * findProductById(String id) : Product
	 */
	public Product findProductById(String productId) throws SQLException {
		Product vo = null;
		
		
		try {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM product4 WHERE productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Product();
				
				vo.setProductId(productId);
				vo.setPname(rs.getString("pname"));
				vo.setUnitPrice(rs.getInt("unitprice"));
				vo.setDescription(rs.getString("description"));
				vo.setManufacturer(rs.getString("manufacturer"));
				vo.setCategory(rs.getString("category"));
				vo.setOfile1(rs.getString("ofile1"));
				vo.setOfile2(rs.getString("ofile2"));
				vo.setOfile3(rs.getString("ofile3"));
				vo.setOfile4(rs.getString("ofile4"));
				vo.setOfile5(rs.getString("ofile5"));
				vo.setQuantity(rs.getInt("quantity"));
				vo.setRealpath1(rs.getString("realpath1"));
				vo.setRealpath2(rs.getString("realpath2"));
				vo.setRealpath3(rs.getString("realpath3"));
				vo.setRealpath4(rs.getString("realpath4"));
				vo.setRealpath5(rs.getString("realpath5"));
			}
				
		} finally {
			
		}

		return vo;
	}
	
}//class

