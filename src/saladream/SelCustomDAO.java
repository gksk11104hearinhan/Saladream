package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SelCustomDAO {
	
	
	public SelCustomDTO	select(int scNo) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select * from selcustom where scno = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, scNo);
		
		SelCustomDTO scDto = new SelCustomDTO();
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			
			scDto.setScStep01(rs.getString("scstep01"));
			scDto.setScStep02(rs.getString("scstep02"));
			scDto.setScStep03(rs.getString("scstep03"));
			scDto.setScStep04(rs.getString("scstep04"));
			scDto.setScStep05(rs.getString("scstep05"));
			scDto.setScStep06(rs.getString("scstep06"));
		}
		
		return scDto;
	}
	
	public int selectId() throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'selcustom' AND table_schema = DATABASE()";
		PreparedStatement ps = con.prepareStatement(sql);
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		int id = 0;
		
		if(rs.next()) {
			id = rs.getInt(1);
		}
		
		return id;
	}
	
	public void insert(SelCustomDTO dto) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String s_sql = "insert into selcustom (scstep01, scstep02,scstep03,scstep04,scstep05, scstep06 )  values (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getScStep01());
		ps.setString(2, dto.getScStep02());
		ps.setString(3, dto.getScStep03());
		ps.setString(4, dto.getScStep04());
		ps.setString(5, dto.getScStep05());
		ps.setString(6, dto.getScStep06());
		//4. DB에 sql 적용
		ps.executeUpdate();
		
		
	}
}
