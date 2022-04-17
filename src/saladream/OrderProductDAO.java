package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class OrderProductDAO {
	
	
	public void insert(OrderProductDTO dto) throws Exception {
		
		//1. Ŀ����
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("insert�Լ� 1�� Ŀ���� ����");
		
		//2. DB����
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("insert�Լ� 2�� DB���� ����");
		
		//3. sql����
		String sql = "insert into orderproduct values (?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getOno());
		ps.setString(2, dto.getPno());
		ps.setInt(3,  dto.getOproductNum());
		
		System.out.println("insert�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ps.executeUpdate();
		System.out.println("insert�Լ� 4�� DB�� ���� ����");
		
	}

}
