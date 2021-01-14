package license;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class LicenseDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public LicenseDAO() throws ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public void getConnection(){
		try{
			conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!");
			//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!"); //cafe24 배포 이후 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void apply(LicenseBean bean){
		getConnection();
		try{
		String sql =" insert into licenseManage (name, tel, license_id, license_email)";
			   sql +=" values(? ,? , ?, ?) ";
			pstmt=conn.prepareStatement(sql);
			//?에 값을 맵핑	  	
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getLicense_id());
			pstmt.setString(4, bean.getLicense_email());
			//쿼리를 실행하시오
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
