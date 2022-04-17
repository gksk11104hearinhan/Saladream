package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class OrderInfoDAO {
	
	
	public void insert(OrderInfoDTO dto) throws Exception {
		/*boolean flag = false;*/
		
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
		System.out.println("insert�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ps.executeUpdate();
		System.out.println("insert�Լ� 4�� DB�� ���� ����");
		
	}
	
	public void delete(OrderInfoDTO dto) throws Exception {
		
		//1. Ŀ����
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("delete�Լ� 1�� Ŀ���� ����");
		
		//2. DB����
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("delete�Լ� 2�� DB���� ����");
		
		//3. sql����
		String s_sql = "delete from orderinfo where ono = ? and id =?";
		PreparedStatement ps = con.prepareStatement(s_sql);
		
		ps.setString(1, dto.getOno());
		ps.setString(2, dto.getId());
		
		System.out.println("delete�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ps.executeUpdate();
		
		System.out.println("delete�Լ� 4�� DB�� ���� ����");
		
	}

}
