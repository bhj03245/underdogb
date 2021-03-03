package com.traveler.web.diary.dao;

import java.util.List;
import com.traveler.web.diary.model.DiaryVO;

public interface DiaryDAO {
	public List<DiaryVO> getDiaryList() throws Exception;
	public int insertDiary(DiaryVO diaryVO) throws Exception;
}
