package com.traveler.web.diary.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.traveler.web.diary.model.DiaryVO;

@Repository
public class DiaryDAOImpl implements DiaryDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<DiaryVO> getDiaryList() throws Exception {
		return sqlSession.selectList("com.traveler.web.diary.diaryMapper.getDiaryList");
	}

	@Override
	public int insertDiary(DiaryVO diaryVO) throws Exception {
		return sqlSession.insert("com.traveler.web.diary.diaryMapper.insertDiary", diaryVO);
	}

}
