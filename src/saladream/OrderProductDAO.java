package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class OrderProductDAO {
	
	
	public void insert(OrderProductDTO dto) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("insert함수 1번 커넥터 성공");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("insert함수 2번 DB연결 성공");
		
		//3. sql설정
		String sql = "insert into orderproduct values (?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getOno());
		ps.setString(2, dto.getPno());
		ps.setInt(3,  dto.getOproductNum());
		
		System.out.println("insert함수 3번 sql문 생성 성공");
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		System.out.println("insert함수 4번 DB로 전송 성공");
		
	}

}
