package file;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class FileDAO {
	
	private Connection con = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int result = 0 ;
	private static FileDAO instance = new FileDAO();
	
	public static FileDAO getInstance() {
		return instance;
	}
	
	//DB연결
	public void getConnection() throws ClassNotFoundException, IOException, SQLException {
		InputStream in = (this.getClass().getResourceAsStream("dd.properties"));
		Properties p = new Properties();
		p.load(in);
		
		String url = p.getProperty("dburl");
		String id = p.getProperty("dbid");
		String pw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		con = DriverManager.getConnection(url, id, pw);
	}
	
	//DB연결 종료
	public void close() throws SQLException {
		if(rs!=null) rs.close();
		if(psmt!=null) psmt.close();
		if(con!=null) con.close();
	}
	
	//파일업로드
	public int uploadFile(String writer, String subject, String email, String password, String fileName,String content) throws SQLException, ClassNotFoundException, IOException {
		getConnection();
		
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		
		String refsql = "select max(ref) from gallery";
		psmt = con.prepareStatement(refsql);
		rs = psmt.executeQuery();
		if(rs.next()) {
			ref = rs.getInt(1)+1;
		}
		
//		psmt = con.prepareStatement("insert into fileboard values(file_num.nextval,?,?,?,to_char(sysdate, 'YYYY-MM-DD'))");
	    psmt = con.prepareStatement("insert into gallery(writer, subject, email, password, fileName, reg_date, ref, re_step, re_level, readcount, content) values(?,?,?,?,?, now(), ?, ?, ?, 0, ?)");
		psmt.setString(1, writer);
		psmt.setString(2, subject);
		psmt.setString(3, email);
		psmt.setString(4, password);
		psmt.setString(5, fileName);
		psmt.setInt(6, ref);
		psmt.setInt(7, re_step);
		psmt.setInt(8, re_level);
		psmt.setString(9, content);
		
		result = psmt.executeUpdate();
		
		close();
		
		return result;
	}

	public ArrayList<FileVO> selectAll() throws ClassNotFoundException, IOException, SQLException {
		getConnection();
		
		ArrayList<FileVO> tempList = new ArrayList<>();
		psmt = con.prepareStatement("Select * from gallery order by num ASC");
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			tempList.add(new FileVO(rs.getInt(1), //NUM
					rs.getString(2), 			  //writer
					rs.getString(3), 			  //subject
					rs.getString(4), 			  //email
					rs.getString(5), 			  //password
					rs.getString(6),			  //fileName
					rs.getString(7),			//reg_date
					rs.getInt(8),				//ref
					rs.getInt(9),				//re_step
					rs.getInt(10),				//re_level
					rs.getInt(11),				//readcount
					rs.getString(12)));			//content
		}
		
		close();
		
		return tempList;
	}

	public FileVO SelectOne(int num) throws ClassNotFoundException, IOException, SQLException {
		getConnection();
		
		psmt = con.prepareStatement("select * from gallery where num=?");
		psmt.setInt(1, num);
		rs = psmt.executeQuery();
		
		FileVO vo = null;
		
		if(rs.next()) {
			vo = new FileVO(rs.getInt(1),
					rs.getString(2), 			  //writer
					rs.getString(3), 			  //subject
					rs.getString(4), 			  //email
					rs.getString(5), 			  //password
					rs.getString(6),			  //fileName
					rs.getString(7),			//reg_date
					rs.getInt(8),				//ref
					rs.getInt(9),				//re_step
					rs.getInt(10),				//re_level
					rs.getInt(11),				//readcount
					rs.getString(12));			//content
		}
		
		close();
		
		return vo;
	}
	
}
