package com.traveler.web.journal.service;

import java.util.List;
import com.traveler.web.journal.model.JournalVO;

public interface JournalService {
	public List<JournalVO> getJournalList() throws Exception;
}
