package com.traveler.web.journal.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.traveler.web.journal.model.JournalVO;



@Repository
public class JournalDAOImpl implements JournalDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<JournalVO> getJournalList() throws Exception {
		return sqlSession.selectList("com.traveler.web.journal.journalMapper.getJournalList");
	}

	@Override
	public JournalVO getJournalContent(int journal_no) throws Exception {
		return sqlSession.selectOne("com.traveler.web.journal.journalMapper.getJournalContent", journal_no);
	}

	@Override
	public int insertJournal(JournalVO JournalVO) throws Exception {
		return sqlSession.insert("com.traveler.web.journal.journalMapper.insertJournal", JournalVO);
	}

	@Override
	public int updateJournal(JournalVO JournalVO) throws Exception {
		return sqlSession.update("com.traveler.web.journal.journalMapper.updateJournal", JournalVO);
	}

	@Override
	public int deleteJournal(int journal_no) throws Exception {
		return sqlSession.insert("com.traveler.web.journal.journalMapper.deleteJournal", journal_no);
	}

	@Override
	public int updateViewCnt(int journal_no) throws Exception {
		return sqlSession.update("com.traveler.web.journal.journalMapper.updateViewCnt", journal_no);
	}


}