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
	public void register(Product vo) throws SQLException {

		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO product(productId, pname, unitPrice, description, manufacturer, category, filename, quantity) ");
			sql.append("VALUES (productId.nextval, ?, ?, ?, ?,?,?,?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getPname());
			pstmt.setInt(2, vo.getUnitPrice());
			pstmt.setString(3, vo.getDescription());
			pstmt.setString(4, vo.getManufacturer());
			pstmt.setString(5, vo.getCategory());
			pstmt.setString(6, vo.getFilename());
			pstmt.setInt(7, vo.getQuantity());
			
			pstmt.executeUpdate();
			
		} finally {
			
		}
	}
	
	/*
	 * 2번 기능 : 전체 상품 조회 기능
	 * getAllProductList() : ArrayList<Product>
	 */
	public ArrayList<Product> getAllProductList() throws SQLException{
		ArrayList<Product> list = new ArrayList<Product>();
	
		
		try {
			String sql = "SELECT * from product order by productId";
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
				vo.setFilename(rs.getString(7));
				vo.setQuantity(rs.getInt(8));
				
				list.add(vo);
			}
			
		} finally {
			
		}
		
		return list;
	}
	
	public ArrayList<Product> getProductList(String category) throws SQLException{
		ArrayList<Product> list2 = new ArrayList<Product>();

		try {
			String sql = "SELECT * from product where category=?";
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
				vo.setFilename(rs.getString(7));
				vo.setQuantity(rs.getInt(8));
				
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
			
			String sql = "SELECT * FROM product WHERE productId=?";
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
				vo.setFilename(rs.getString("filename"));
				vo.setQuantity(rs.getInt("quantity"));
			}
				
		} finally {
			
		}

		return vo;
	}
	
}//class

