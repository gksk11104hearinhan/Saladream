package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	public boolean login(MemberDTO dto) throws Exception {
		//1. Ŀ����
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("login�Լ� 1�� Ŀ���� ����");
		
		//2. DB����
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("login�Լ� 2�� DB���� ����");
		
		//3. sql����
		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		System.out.println("login�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ResultSet rs = ps.executeQuery();
		System.out.println("login�Լ� 4�� DB�� ���� ����");
		
		boolean result = false;
		if(rs.next()) {
			System.out.println("�α��� ok");
			result = true;
		} else {
			System.out.println("�α��� not");
		}
		return result;
	}
	
	public void insert(MemberDTO dto) throws Exception {
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
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getBirthday01() + dto.getBirthday02() + dto.getBirthday03());
		ps.setString(5, dto.getEmail());
		ps.setString(6, dto.getAddr01() + dto.getAddr02());
		ps.setString(7, dto.getHobby());
		ps.setString(8, dto.getJob());
		ps.setString(9, dto.getPhone01() + dto.getPhone02() + dto.getPhone03());
		ps.setString(10, dto.getGender());
		System.out.println("insert�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ps.executeUpdate();
		System.out.println("insert�Լ� 4�� DB�� ���� ����");
		
	}
	
	public void update(MemberDTO dto, String oriid) throws Exception {
		/*boolean flag = false;*/
		
		//1. Ŀ����
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("update�Լ� 1�� Ŀ���� ����");
		
		//2. DB����
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("update�Լ� 2�� DB���� ����");
		
		//3. sql����
		String sql = "update member set id = ?, name = ?, birthday = ?, email = ?, addr = ?, phone = ? where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getName());
		ps.setString(3, dto.getBirthday01() + dto.getBirthday02() + dto.getBirthday03());
		ps.setString(4, dto.getEmail());
		ps.setString(5, dto.getAddr01());
		ps.setString(6, dto.getPhone01() + dto.getPhone02());
		ps.setString(7, oriid);
		System.out.println("update�Լ� 3�� sql�� ���� ����");
		
		//4. DB�� sql ����
		ps.executeUpdate();
		System.out.println("update�Լ� 4�� DB�� ���� ����");
		
	}
	
	public MemberDTO selectOne(MemberDTO dto) throws Exception {
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
		String sql = "select * from member where id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getId());
		
		//4. DB�� sql ����
		ResultSet rs = ps.executeQuery();
		MemberDTO meDto = new MemberDTO();
		if (rs.next()) {
			meDto.setId(rs.getString("id"));
			meDto.setName(rs.getString("name"));
			meDto.setEmail(rs.getString("email"));
			meDto.setAddr01(rs.getString("addr"));
			meDto.setPhone01(rs.getString("phone").substring(0, 3));
			meDto.setPhone02(rs.getString("phone").substring(3));
			meDto.setBirthday01(rs.getString("birthday"));
		}
		return meDto;
	}

}
