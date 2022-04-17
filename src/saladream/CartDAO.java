package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
	
	
	public List<OrderProductDTO> select(String cno) throws Exception {
		/*boolean flag = false;*/
		
		List<OrderProductDTO> list = new ArrayList<>();
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select * from cart where cno01 = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cno);
		
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			OrderProductDTO opDto = new OrderProductDTO();
			opDto.setOno(rs.getString("cno01"));
			opDto.setPno(rs.getString("product_no01"));
			opDto.setOproductNum(rs.getInt("cproductNum01"));
			
			list.add(opDto);
		}
		
		return list;
	}
	
	public void update(CartDTO dto) throws Exception {
		/*boolean flag = false;*/
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String s_sql = "select * from cart where cno01 = ? and product_no01 = ?";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getCno01());
		ps.setString(2, dto.getProduct_no01());
		
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery(); 
		
		
		//ps.close();
		
		if(rs.next()){
			int r_cproductNum01 = rs.getInt("cproductNum01");
			
			String u_sql = "update cart set cproductNum01=? where cno01=? and product_no01=?"; 
			ps = con.prepareStatement(u_sql);
			
			
			ps.setInt(1, dto.getCproductNum01() + r_cproductNum01);
			ps.setString(2, dto.getCno01());
			ps.setString(3,  dto.getProduct_no01());
			
			ps.executeUpdate();
		} else {
			
			String i_sql = "insert into cart values (?,?,?)";
			ps = con.prepareStatement(i_sql);
			
			ps.setString(1, dto.getCno01());
			ps.setString(2, dto.getProduct_no01());
			ps.setInt(3,  dto.getCproductNum01());
			
			ps.executeUpdate();
		}
	}

	public void delete(CartDTO dto) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("delete함수 1번 커넥터 성공");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("delete함수 2번 DB연결 성공");
		
		//3. sql설정
		String s_sql = "delete from cart where cno01 = ? and product_no01 = ?";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getCno01());
		ps.setString(2, dto.getProduct_no01());
		
		System.out.println("delete함수 3번 sql문 생성 성공");
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		
		System.out.println("delete함수 4번 DB로 전송 성공");
		
	}
}
