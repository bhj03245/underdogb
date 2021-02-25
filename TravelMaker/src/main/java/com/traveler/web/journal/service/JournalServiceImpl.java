package com.traveler.web.journal.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.traveler.web.journal.dao.JournalDAO;
import com.traveler.web.journal.model.JournalVO;

@Service
public class JournalServiceImpl implements JournalService{
	@Inject
	private JournalDAO journalDAO;
	
	public List<JournalVO> getJournalList() throws Exception{
		return journalDAO.getJournalList();
	}
}
