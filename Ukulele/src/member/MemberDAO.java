package member;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class MemberDAO implements Serializable {
	
	private Connection conn;
	private MemberDTO memberDTO;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	
	
	
	
	public MemberDAO() {
		memberDTO = new MemberDTO();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb","underdogb","khacademy1!");
		return conn;
	}
    
	public MemberDTO memberLogin(String id, String pw)throws SQLException {
		conn = getConnection();
		sql = "select id,pw from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
		}
		return memberDTO;
	}
	public int memberRegister(MemberDTO memberDTO)throws SQLException {
		conn = getConnection();
		sql = "insert into member(id,pw,email) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());
		pstmt.setString(3, memberDTO.getEmail());
		cnt = pstmt.executeUpdate();
		return cnt;
		
	}
	public String memberSearch(String idSearch)throws SQLException {
		conn = getConnection();
		sql = "select id from member where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idSearch);
		rs = pstmt.executeQuery();
		String id =null;
		while(rs.next()) {
			id = rs.getString("id");
		}
		return id;
	}
	
	public String pwSearch(String pwSearch)throws SQLException {
		 conn= getConnection();
		 sql ="select pw from member where email=?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, pwSearch);
		 String pw =null;
		 while(rs.next()) {
			 pw = rs.getString("pw");		 
			 }
		 return pw;
	}


	
	}
	


