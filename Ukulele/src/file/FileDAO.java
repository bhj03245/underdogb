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
import java.util.Vector;

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
	
	public void reWriteGallery(FileVO vo)throws ClassNotFoundException, SQLException, IOException {
		int ref = vo.getRef();
		int re_step = vo.getRe_step();
		int re_level = vo.getRe_level();
		
		
		getConnection();
		
		psmt = con.prepareStatement("update gallery set re_level = re_level+1 where ref=? and re_level >?");
		psmt.setInt(1, ref);
		psmt.setInt(2, re_level);
		psmt.executeUpdate();
		
		
		 psmt = con.prepareStatement("insert into gallery(writer, subject, email, passwoard, fileName, reg_date,"
		 		+ "ref, re_step, re_level, readcount, content");
		 
		 psmt.setString(1, vo.getWriter());
		 psmt.setString(2, vo.getSubject());
		 psmt.setString(3, vo.getEmail());
		 psmt.setString(4, vo.getPassword());
		 psmt.setString(5, vo.getFileName());
		 psmt.setInt(6, ref);
		 psmt.setInt(7, re_step+1);
		 psmt.setInt(8, re_level+1);
		 psmt.setString(9, vo.getContent());
		 psmt.executeUpdate();
		
		 close(); 		 
	}
	// galleryUpdate용 delete시 하나의 게시글을 리턴
	public FileVO getOneUpdateGallery(int num)throws ClassNotFoundException, SQLException, IOException  {
		FileVO vo = null;
		getConnection();
		
	psmt = con.prepareStatement("select * from gallery where num=?");
	psmt.setInt(1, num);
	rs=psmt.executeQuery();
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
	public String getPass(int num)throws ClassNotFoundException, SQLException, IOException   {
		String pass = "";
		getConnection();
		System.out.println(num);
		
		psmt = con.prepareStatement("select password from gallery where num = ?");
		psmt.setInt(1, num);
		rs = psmt.executeQuery();
		if(rs.next()) {
			pass = rs.getString(1);
		}
		close();
		return pass;
	}
	public void updateGallery(FileVO vo)throws ClassNotFoundException, SQLException, IOException {
		getConnection();
		psmt = con.prepareStatement("update gallery set subject = ?, content = ? where num = ?");
		psmt.setString(1, vo.getSubject());
		psmt.setString(2, vo.getContent());
		psmt.setInt(3, vo.getNum());
		psmt.executeUpdate();
		close();
	}
	public void deleteGallery(int num)throws ClassNotFoundException, SQLException, IOException {
		getConnection();
		
		psmt = con.prepareStatement("delete from gallery where num = ?");
		psmt.setInt(1, num);
		psmt.executeUpdate();
		con.close();
	}
	public int getAllCount()throws ClassNotFoundException, SQLException, IOException {
		getConnection();
		int count = 0;
		
		psmt = con.prepareStatement("select count(*) from gallery");
		rs = psmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
			con.close();
		}
		return count;
	}
	public int getCount(String subjectSearch, String keyword)throws ClassNotFoundException, SQLException, IOException  {
		getConnection();
		int count = 0;
		
		psmt = con.prepareStatement("select count(*) from gallery where");
		psmt.setString(1, "%"+subjectSearch+"%");
		rs = psmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
			con.close();
		}
		return count;
	}
	public Vector<FileVO> searchGallery(int pageNum, int pageList, String subjectSearch, String keyword)throws ClassNotFoundException, SQLException, IOException {
		Vector<FileVO> v = new Vector<>();
		getConnection();
		psmt = con.prepareStatement("select num, subject , content, writer, reg_date, readcount from gallery where" +keyword+ "like ? "
				+"order by ref desc, re_step asc, num desc limit ?,?");
		psmt.setString(1, "%"+subjectSearch+"%");
		psmt.setInt(2, pageList*(pageNum-1));
		psmt.setInt(3, pageList);
		rs = psmt.executeQuery();
		while(rs.next()) {
			FileVO vo = new FileVO();
			
		}
	}
}
