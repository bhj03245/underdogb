package com.traveler.web.journal.service;

import java.util.List;
import java.util.Map;

import com.traveler.web.journal.model.JournalVO;

public interface JournalService {
	public List<JournalVO> getJournalList() throws Exception;
	public void insertJournal(JournalVO journalVO) throws Exception;
	public JournalVO getJournalContent(int journal_no) throws Exception;
	public void updateJournal(JournalVO journalVO) throws Exception;
	public void deleteJournal(int journal_no) throws Exception;
}
