package com.traveler.web.journal.dao;

import java.util.List;
import com.traveler.web.journal.model.JournalVO;

public interface JournalDAO {
	public List<JournalVO> getJournalList() throws Exception;
	public JournalVO getJournalContent(int journal_no) throws Exception;
	public int insertJournal(JournalVO JournalVO) throws Exception;
	public int updateJournal(JournalVO JournalVO) throws Exception;
	public int deleteJournal(int journal_no) throws Exception;
	public int updateViewCnt(int journal_no) throws Exception;
}
