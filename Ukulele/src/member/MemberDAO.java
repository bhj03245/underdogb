package member;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class MemberDAO implements Serializable {
	
	private Connection conn;
	private MemberDTO memberDTO;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	private ArrayList<MemberDTO> memberList;
	
	
	
	//DB연결1
	public MemberDAO() {
		memberDTO = new MemberDTO();
		memberList = new ArrayList<MemberDTO>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//DB연결2
	public Connection getConnection()throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb","underdogb","khacademy1!");
		return conn;
	}
    //로그인
	public MemberDTO memberLogin(String id, String pw)throws SQLException {
		conn = getConnection();
		sql = "select id,pw from memberUK where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
		}
		return memberDTO;
	}
	//회원가입
	public int memberRegister(MemberDTO memberDTO)throws SQLException {
		conn = getConnection();
		sql = "insert into memberUK(id,pw,email) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());
		pstmt.setString(3, memberDTO.getEmail());
		cnt = pstmt.executeUpdate();
		return cnt;
		
	}
	//아이디찾기
	public String memberSearch(String idSearch)throws SQLException {
		conn = getConnection();
		sql = "select id from memberUK where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idSearch);
		rs = pstmt.executeQuery();
		String id =null;
		while(rs.next()) {
			id = rs.getString("id");
		}
		return id;
	}
	//비밀번호 찾기
	public String pwSearch(String pwSearch)throws SQLException {
		 conn= getConnection();
		 sql ="select pw from memberUK where email=?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, pwSearch);
		 String pw =null;
		 while(rs.next()) {
			 pw = rs.getString("pw");		 
			 }
		 return pw;
	}
	//회원목록
	public ArrayList<MemberDTO> memberList()throws SQLException{
		conn= getConnection();
		sql="select id,email from memberUK";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setEmail(rs.getString("email"));
			memberList.add(memberDTO);
		}
		return memberList;
		
	}
	//회원탈퇴
	public int memberDelete(String idDelete, String pwDelete)throws SQLException{
		conn = getConnection();
		sql = "delete from memberUK where id=? and pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idDelete);
		pstmt.setString(2, pwDelete);
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	//회원수정
	public int memberUpdate(MemberDTO memberDTO, String memberUpdate)throws SQLException {
		conn = getConnection();
		sql = "update memberUK set id=?, pw=?, email=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());
		pstmt.setString(3, memberDTO.getEmail());
		pstmt.setString(4, memberUpdate);
		cnt = pstmt.executeUpdate();
		return cnt;
		
	}
	//아이디중복체크
	public ResultSet doubleIDcheck(String id)throws SQLException{
		conn = getConnection();
		sql="select id from memberUK where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		return rs;
	}


	
	}
	


