package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	Connection con = null;
	
	public ProductDAO() {
		// 1. Ŀ����
		// 2. db����
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("ProductDAO�� 1�� Ŀ���� ���� ����");
			
			String url = "jdbc:mysql://localhost:3306/saladream";
			String user = "root";
			String password = "123456";
			con = DriverManager.getConnection(url, user, password);
			
			System.out.println("ProductDAO�� 2�� DB ���� ����");
		} catch (Exception e) {
			System.out.println("db����� �����߻�!!");
			System.out.println("��������>>" + e.getMessage());
		}
	} //ProductDAO() ��!
	
	public ArrayList<ProductDTO> selectAll() {
		// 3. sql ����
		ArrayList<ProductDTO> list = new ArrayList<>(); //return list�� �ν��ϱ� ���� try �ٱ����� ����.
		
		try {
			String sql = "select * from product";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("product��ǰ �ҷ����� �Լ� 3�� sql�� ����");
			
			// 4. sql ����
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
			System.out.println("product��ǰ �ҷ����� �Լ� 4�� sql�� ����");
			
			
		} catch (Exception e) {
			System.out.println("productDTO�� selectAll()�Լ� ���� �߻�!!!");
			e.printStackTrace();
		}
		
		return list;
	} //selectAll() ��! -> ��� ��ǰ �ҷ������ classic.jsp�� ���
	
	public ProductDTO select(ProductDTO dto) {
		// 3. sql ����
		ProductDTO dto2 = new ProductDTO(); //return dto2�� ���� ���� ������ �Ѵ�.
		
		try {
			String sql = "select * from product where pno = ?";
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setString(1, dto.getPno());
			System.out.println("product �� ������ �ҷ����� �Լ� 3�� sql�� ����");
			
			// 4. sql ����
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
			System.out.println("product �� ������ �ҷ����� �Լ� 4�� sql�� ����");
			
		} catch (Exception e) {
			System.out.println("productDTO�� select()�Լ� ���� �߻�!!!");
			e.printStackTrace();
		}
		
		return dto2;
	} //select(ProductDTO dto) ��! -> ��ǰ�� ������ classicViewProduct.jsp�� ���

}
