package saladream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MaterialDAO {
	
	
	public List<MaterialDTO> select(MaterialDTO dto) throws Exception {
		
		List<MaterialDTO> list = new ArrayList<>();
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select * from material where mType = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getmType());
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			MaterialDTO mDto = new MaterialDTO();
			mDto.setmType(rs.getString("mType"));
			mDto.setmNo(rs.getString("mno"));
			mDto.setmName(rs.getString("mname"));
			mDto.setmInfo(rs.getString("minfo"));
			mDto.setmImage(rs.getString("mimage"));
			
			mDto.setmPrice(rs.getInt("mprice"));
			mDto.setmStock(rs.getInt("mstock"));
			list.add(mDto);
		}
		
		return list;
	}
	
	public MaterialDTO selectOne(MaterialDTO dto) throws Exception {
		
		//1. 커넥터
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. sql설정
		String sql = "select * from material where mno = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getmNo());
		//4. DB에 sql 적용
		ResultSet rs = ps.executeQuery();
		MaterialDTO mDto = new MaterialDTO();
		if(rs.next()) {
			
			
			mDto.setmType(rs.getString("mType"));
			mDto.setmNo(rs.getString("mno"));
			mDto.setmName(rs.getString("mname"));
			mDto.setmInfo(rs.getString("minfo"));
			mDto.setmImage(rs.getString("mimage"));
			
			mDto.setmPrice(rs.getInt("mprice"));
			mDto.setmStock(rs.getInt("mstock"));
		}
		
		return mDto;
	}
	
	
}
