package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	Connection con = null;
	
	public ProductDAO() {
		// 1. 커넥터
		// 2. db연결
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("ProductDAO의 1번 커넥터 연결 성공");
			
			String url = "jdbc:mysql://localhost:3306/saladream";
			String user = "root";
			String password = "123456";
			con = DriverManager.getConnection(url, user, password);
			
			System.out.println("ProductDAO의 2번 DB 연결 성공");
		} catch (Exception e) {
			System.out.println("db연결시 에러발생!!");
			System.out.println("에러내용>>" + e.getMessage());
		}
	} //ProductDAO() 끝!
	
	public ArrayList<ProductDTO> selectAll() {
		// 3. sql 결정
		ArrayList<ProductDTO> list = new ArrayList<>(); //return list를 인식하기 위해 try 바깥으로 뺀다.
		
		try {
			String sql = "select * from product";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("product상품 불러오는 함수 3번 sql문 생성");
			
			// 4. sql 전송
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setCtgType(rs.getString(1));
				dto.setPno(rs.getString(2));
				dto.setPname(rs.getString(3));
				dto.setPprice(rs.getInt(4));
				dto.setPstock(rs.getInt(5));
				dto.setPinfo(rs.getString(6));
				dto.setPimage(rs.getString(7));
				dto.setPdescript(rs.getString(8));
				list.add(dto);
			}
			System.out.println("product상품 불러오는 함수 4본 sql문 전송");
			
			
		} catch (Exception e) {
			System.out.println("productDTO의 selectAll()함수 에러 발생!!!");
			e.printStackTrace();
		}
		
		return list;
	} //selectAll() 끝! -> 모든 상품 불러오기로 classic.jsp에 사용
	
	public ProductDTO select(ProductDTO dto) {
		// 3. sql 결정
		ProductDTO dto2 = new ProductDTO(); //return dto2를 위해 새로 재정의 한다.
		
		try {
			String sql = "select * from product where pno = ?";
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setString(1, dto.getPno());
			System.out.println("product 상세 페이지 불러오는 함수 3번 sql문 생성");
			
			// 4. sql 전송
			ResultSet rs2 = ps2.executeQuery();
			
			if (rs2.next()) {
				dto2.setCtgType(rs2.getString(1));
				dto2.setPno(rs2.getString(2));
				dto2.setPname(rs2.getString(3));
				dto2.setPprice(rs2.getInt(4));
				dto2.setPstock(rs2.getInt(5));
				dto2.setPinfo(rs2.getString(6));
				dto2.setPimage(rs2.getString(7));
				dto2.setPdescript(rs2.getString(8));
				dto2.setPdetailimage(rs2.getString(9));
			}
			System.out.println("product 상세 페이지 불러오는 함수 4본 sql문 전송");
			
		} catch (Exception e) {
			System.out.println("productDTO의 select()함수 에러 발생!!!");
			e.printStackTrace();
		}
		
		return dto2;
	} //select(ProductDTO dto) 끝! -> 상품상세 페이지 classicViewProduct.jsp에 사용

}
