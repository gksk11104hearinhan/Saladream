package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class OrderInfoDAO {
	
	
	public void insert(OrderInfoDTO dto) throws Exception {
		/*boolean flag = false;*/
		
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
		String sql = "insert into orderinfo values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		
		ps.setString(1, dto.getOno());
		ps.setString(2, dto.getId());
		ps.setString(3, new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime()));
		ps.setString(4, dto.getOrdrecv());
		ps.setString(5, dto.getOrdrecvaddr());
		ps.setString(6, dto.getOrdrecvtel01() + dto.getOrdrecvtel02());
		ps.setInt(7,  dto.getOpay());
		ps.setString(8, dto.getObank());
		ps.setString(9, dto.getOcardNum());
		ps.setString(10, dto.getOcardPassword());
		System.out.println("insert함수 3번 sql문 생성 성공");
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		System.out.println("insert함수 4번 DB로 전송 성공");
		
	}
	
	public void delete(OrderInfoDTO dto) throws Exception {
		
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
		String s_sql = "delete from orderinfo where ono = ? and id =?";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getOno());
		ps.setString(2, dto.getId());
		
		System.out.println("delete함수 3번 sql문 생성 성공");
		
		//4. DB에 sql 적용
		ps.executeUpdate();
		
		System.out.println("delete함수 4번 DB로 전송 성공");
		
	}

}
