package gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class GalleryDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public GalleryDAO()throws ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public void getconn() {
		try {
//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!"); //cafe24 배포 이후 
			conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertGallery(GalleryBean bean) {
		// 반 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		
		getconn();
		int ref = 0;		// 글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을 가져온 후 +1을 더해주면
		int re_step = 1;	// 새글이기에 = 부모글
		int re_level = 1;
		
		// 가장 큰 ref값을 읽어오는 쿼리 준비
		try {
			String refsql = "select max(ref) from gallery";
			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(refsql);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {	// 결과 값이 였다면
				ref = rs.getInt(1)+1;	// 최대값에 +1을 더해서 글그룹을 설정
			}
			// 실제로 게시글 전체값을 테이블에 저장
			//String sql = "insert into gallery values( gallery_seq.NEXTVAL, ?, ?, ?, ?, ?)";
			
			
			String sql = " insert into gallery(writer, email, subject, password, reg_date, ref, ";
				   sql += " re_step, re_level, readcount, content) ";
				   sql += " values(?, ?, ?, ?, now(), ?, ?, ?, 0, ?)";
				   
				   pstmt = conn.prepareStatement(sql);
				   //?에 값을 매핑
				   pstmt.setString(1, bean.getWriter());
				   pstmt.setString(2, bean.getEmail());
				   pstmt.setString(3, bean.getSubject());
				   pstmt.setString(4, bean.getPassword());
//				   pstmt.setString(5, bean.getFileName1());
//				   pstmt.setString(6, bean.getOriginalfileName1());
				   pstmt.setInt(5, ref);
				   pstmt.setInt(6, re_step);
				   pstmt.setInt(7, re_level);
				   pstmt.setString(8, bean.getContent());
				   // 뭐리를 실행하시오
				   pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//자원 반남
			closed();
		}
		
	}
	
	// 모든 게시글을 리턴해주는 리터널 객체 선언
	public Vector<GalleryBean> getAllgallery(int start, int end) {
		Vector<GalleryBean> v = new Vector<>();
		getconn();
		// 쿼리 준비
		try {
			String sql = "select * from gallery order by ref desc, re_step asc, num desc limit ? , ?";
			// 쿼리를 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			// 쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()) {
				// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
				GalleryBean bean = new GalleryBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
//				bean.setFileName1(rs.getString("fileName1"));
//				bean.setOriginalfileName1(rs.getString("originalfileName1"));
				bean.setReg_date(rs.getDate("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
				//패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//자원 반납
			closed();
		}
		return v;
	}
	
	// 하나의 게시글을 리턴하는 메소드
	public GalleryBean getOneGallery(int num) {
		// 리턴타입 선언
		GalleryBean bean = new GalleryBean();
		getconn();
		
		try {
			String readsql = "update gallery set readcount= readcount+1 where num = ?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 쿼리 준비
			String sql = "select * from gallery where num = ?";
			//쿼리 실행 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 뭐리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getDate("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//자원 반납
			closed();
		}
		return bean;
}
	// 자원 반납 메소드
	private void closed() {
		try {
			if(rs != null)conn.close();
			if(pstmt != null)conn.close();
			if(conn != null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 답변글이 저장되는 메소드
	public void reWriteGallery(GalleryBean bean) {
		// 부모글 그릅과 글 레벨 글스텝을 읽어드림
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getconn();
		// 핵심코드
		// 1. 부모 글보다 큰 re_level의 값을 전부 1씩 증가시켜줌
		try {
			String levelsql = "update gallery set re_level = re_level+1 where ref = ? and re_level > ?";
			// 쿼리실행객체 선언
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// 쿼리 실행
			pstmt.executeUpdate();
			// 답변글 데이터를 저장
			String sql = "insert into gallery (writer, email, subject, password, reg_date, ref, ";
				   sql += " re_step, re_level, readcount, content)";
				   sql += " values(?, ?, ?, ?, now(), ?, ?, ?, 0, ? )";
			pstmt = conn.prepareStatement(sql);
			// ?에 값 대입
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref); // 부모의 ref값을 넣어줌
			pstmt.setInt(6, re_step+1);	// 답글이기에 부모 글 re_step에 1을 더해줌
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closed();
		}
	}
	
	//galleryUpdate용 Delete 시 하나의 게시글을 리턴
		public GalleryBean getOneUpdateGallery(int num){
			//리턴타입 선언
			GalleryBean bean =new GalleryBean();
			getconn();
			
			try{
				
				//쿼리준비
				String sql ="select * from gallery where num=?";
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
				String sql ="select password from gallery where num =?";
				//쿼리실행할 객체 선언
				pstmt =conn.prepareStatement(sql);
				pstmt.setInt(1,  num);
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
		public void updateGallery(GalleryBean bean){
			getconn();
			try{
				//쿼리 준비
				String sql ="update gallery set subject=? , content=? where num=?";
				pstmt =conn.prepareStatement(sql);
				pstmt.setString(1, bean.getSubject());
				pstmt.setString(2, bean.getContent());
				pstmt.setInt(3, bean.getNum());
				pstmt.executeUpdate();
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//자원 반납
				closed();
			}
		}
		
		
		//하나의 게시글을 삭제하는 메소드 입니다.
		public void deleteGallery(int num){
			
			getconn();
			try{
				//쿼리 준비
				String sql ="delete from gallery where num=?";
				pstmt=conn.prepareStatement(sql);
				//?
				pstmt.setInt(1, num);
				//쿼리 실행
				pstmt.executeUpdate();
				//자원 반납
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//자원 반납
				closed();
			}
		}
		
		
		//전체 글의 갯수를 리턴하는 메소드
		public int getAllCount(){
			getconn();
			//게시글 전체수를 저장하는 변수
			int count =0;
			try{
				//쿼리준비
				String sql ="select count(*) from gallery";
				//쿼리를 실행할 객체 선언
				pstmt = conn.prepareStatement(sql);
				//쿼리 실행 후 결과를 리턴
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
