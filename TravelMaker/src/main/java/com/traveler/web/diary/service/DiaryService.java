package com.traveler.web.diary.service;

import java.util.List;

import com.traveler.web.diary.model.DiaryVO;

public interface DiaryService {
	public List<DiaryVO> getDiaryList() throws Exception;
	
	public void insertDiary(DiaryVO diaryVO) throws Exception;
}
