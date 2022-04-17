package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomCartDAO {
	
	
	public SelCustomDTO select(String cno) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select b.* from customcart a, selcustom b where a.product_no03 = b.scno and a.cno03 = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cno);
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		SelCustomDTO scDto = null;
		
		if(rs.next()) {
			
			scDto = new SelCustomDTO();
			scDto.setScNo(rs.getInt("scNo"));
			scDto.setScStep01(rs.getString("scstep01"));
			scDto.setScStep02(rs.getString("scstep02"));
			scDto.setScStep03(rs.getString("scstep03"));
			scDto.setScStep04(rs.getString("scstep04"));
			scDto.setScStep05(rs.getString("scstep05"));
			scDto.setScStep06(rs.getString("scstep06"));
			
		}
		
		return scDto;
	}
	
	public CustomCartDTO selectCustomCart(String cno) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select * from customcart a where a.cno03 = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cno);
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		CustomCartDTO ccDto = null;
		
		if(rs.next()) {
			ccDto = new CustomCartDTO();
			ccDto.setCno03(rs.getString("cno03"));
			ccDto.setCproductNum03(rs.getInt("cproductNum03"));
			ccDto.setProduct_no03(rs.getInt("product_no03"));
		}
		
		return ccDto;
	}

	public void insert(CustomCartDTO dto) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String s_sql = "insert into customcart values (?, ?, 1)";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getCno03());
		ps.setInt(2, dto.getProduct_no03());
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		
	}
	
	public void delete(String cno) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String s_sql = "delete from customcart where cno03 = ?";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, cno);
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		
	}
}
