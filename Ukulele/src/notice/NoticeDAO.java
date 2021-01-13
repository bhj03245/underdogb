package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public NoticeDAO() throws ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public void getconn(){
		try{
			conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!");
			//conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!"); 
			//cafe24 배포 이후 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertNotice(NoticeBean bean) {
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		getconn();
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0; //글 번호 = 쿼리를 실행시켜서 가장큰 ref 값을 가져온 후  +1을 더해주면됨 
		int re_step = 1; //새글이기에 = 부모글
		int re_level = 1; 
		try{
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql ="select max(ref) from notice ";
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(refsql);
			//쿼리실행후 결과를 리턴
			rs = pstmt.executeQuery();
			if(rs.next()){ //결과 값이 였다면
				ref = rs.getInt(1)+1;//최대값에 +1 를 더해서 글그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장	
		String sql =" insert into notice (WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, RE_STEP, RE_LEVEL, READCOUNT, CONTENT) values(? ,? , ?, ?, now(), ?, ?, ? , 0, ? ) ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closed();
		}
	}
	
	//모든 게시글을 리턴해주는 
	public Vector<NoticeBean> getAllNotice(int start, int end){		
		//리넡할 객체 선언
		Vector<NoticeBean> v =new Vector<>();
		getconn();
		try{
			//쿼리 준비
			String sql = "SELECT * FROM notice ORDER BY ref DESC, re_step ASC, num DESC LIMIT ?, ?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()){
				//데이터를 패키징( 가방  = Boardbean 클래스를 이용)해줌
				NoticeBean bean =new NoticeBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closed();
		}
		return v;
	}
	
	//하나의 게시글을 리넡하는 메소드
	public NoticeBean getOneNotice(int num){
		//리턴타입 선언
		NoticeBean bean =new NoticeBean();
		getconn();
		try{
			//조회수 증가쿼리
			String readsql ="update notice set readcount= readcount+1 where num=?";
			pstmt =conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			//쿼리준비
			String sql ="select * from notice where num=?";
			//쿼리실행객체
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리 실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closed();
		}
		return bean;
	}
	
	
	//자원 반납 메소드
	private void closed(){
		try{
			//자원 반납
			if(rs!=null)conn.close();
			if(pstmt!=null)conn.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	
	//boardUpdate용 Delete 시 하나의 게시글을 리턴
	public NoticeBean getOneUpdateNotice(int num){
		//리턴타입 선언
		NoticeBean bean =new NoticeBean();
		getconn();
		try{
			//쿼리준비
			String sql ="select * from notice where num=?";
			//쿼리실행객체
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리 실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closed();
		}
		return bean;
	}
	
	//update 와 delete 시 필요한 패스워드값을 리턴해주는 메소드
	public String getPass(int num){
		//리턴할 변수 객체 선언
		String pass ="";
		getconn();
		System.out.println(num);
		try{
			//쿼리준비
			String sql ="select password from notice where num =?";
			//쿼리실행할 객체 선언
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			//패스워드값을 저장
			if(rs.next()){
				pass=rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closed();
		}
		return pass;
	}
	
	//하나의 게시글을 수정하는 메소드
	public void updateNotice(NoticeBean bean){
		getconn();
		try{
			//쿼리 준비
			String sql ="update notice set subject=?, content=? where num=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			//자원 반납
			closed();
		}
	}
	
	//하나의 게시글을 삭제하는 메소드 입니다.
	public void deleteNotice(int num) {
		getconn();
		try{
			//쿼리 준비
			String sql ="delete from notice where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();
		}
	}
	
	public NoticeBean noticeSearch(String subjectSearch) {
		NoticeBean bean =new NoticeBean();		
		getconn();
		try {
		String sql = "select num, subject, writer, reg_date, readcount from board where num = ? "; //subject like ?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "'%"+subjectSearch+"%'");//앞이든 뒤든 null을 포함한 모든 글자를 검색한다. pstmt.setString(1, "'%"+subjectSearch+"%'");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setReadcount(rs.getInt("READCOUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	
	//전체 글의 갯수를 리턴하는 메소드
	public int getAllCount() {
		getconn();
		//게시글 전체수를 저장하는 변수
		int count =0;
		try{
			//쿼리준비
			String sql ="select count(*) from notice";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count =rs.getInt(1);
			}
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
}