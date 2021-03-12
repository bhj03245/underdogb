package com.traveler.web.diary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.traveler.web.diary.mapper.DiaryMapper;
import com.traveler.web.diary.mapper.ReplyMapper;
import com.traveler.web.diary.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	
	@Inject
	private ReplyMapper mapper;
	
	
	
	@Override
	public List<ReplyVO> viewReply(int diary_no) {
		return mapper.viewReply(diary_no);
		
		
	}

}
