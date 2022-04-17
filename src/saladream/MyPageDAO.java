package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MyPageDAO {
	
	
	public List<MyPageDTO> selectClassicAll(String id) throws Exception {
		
		List<MyPageDTO> list = new ArrayList<>();
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select a.odate, a.opay, c.pname, b.oproductNum  from orderinfo a, orderproduct b, product c  where a.id = ? and a.ono = b.ono and b.pno = c.pno ";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, id);
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			MyPageDTO dto = new MyPageDTO();
			dto.setOdate(rs.getString("odate"));
			dto.setOpay(rs.getInt("opay"));
			dto.setOproductNum(rs.getInt("oproductNum"));
			dto.setPname(rs.getString("pname"));
			
			list.add(dto);
		}
		
		return list;
	}
	
	public List<MyPageDTO> selectCustomAll(String id) throws Exception {
		
		List<MyPageDTO> list = new ArrayList<>();
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select a.odate, a.opay, CONCAT_WS('-', d.mname, e.mname, f.mname, g.mname, h.mname, i.mname) as pname,  b.oproductNum  from orderinfo a, orderproduct b, selcustom c, material d, material e, material f, material g, material h, material i";
		   sql += " where a.id = ? and a.ono = b.ono and  b.pno =  c.scno and LENGTH(b.pno) = LENGTH(c.scno) and c.scstep01 = d.mno and c.scstep02 = e.mno";
		   sql += " and c.scstep03 = f.mno and c.scstep04 = g.mno and c.scstep05 = h.mno and c.scstep06 = i.mno";
				
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, id);
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			MyPageDTO dto = new MyPageDTO();
			dto.setOdate(rs.getString("odate"));
			dto.setOpay(rs.getInt("opay"));
			dto.setOproductNum(rs.getInt("oproductNum"));
			dto.setPname(rs.getString("pname"));
			
			list.add(dto);
		}
		
		return list;
	}
	
	public List<CartDTO> selectCartAll(String cno) throws Exception {
		
		List<CartDTO> list = new ArrayList<>();
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select b.pname, a.cproductNum01, b.pprice * a.cproductNum01 opay from cart a, product b where a.product_no01 = b.pno and a.cno01 = ?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cno);
		
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			CartDTO cdto = new CartDTO();
			
			cdto.setCproductNum01(rs.getInt("cproductNum01"));
			cdto.setPname(rs.getString("pname"));
			cdto.setOpay(rs.getInt("opay"));
			list.add(cdto);
		}
		
		return list;
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
