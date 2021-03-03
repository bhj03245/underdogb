package com.traveler.web.diary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.traveler.web.diary.dao.DiaryDAO;
import com.traveler.web.diary.model.DiaryVO;

@Service
public class DiaryServiceImpl implements DiaryService{
	@Inject
	private DiaryDAO diaryDAO;

	@Override
	public List<DiaryVO> getDiaryList() throws Exception {
		return diaryDAO.getDiaryList();
	}

	@Override
	public void insertDiary(DiaryVO diaryVO) throws Exception {
		diaryDAO.insertDiary(diaryVO);
	}

}
