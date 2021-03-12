package com.traveler.web.diary.service;

import java.util.List;

import com.traveler.web.diary.model.ReplyVO;

public interface ReplyService {
	
	
	public List<ReplyVO> viewReply(int diary_no);
	
	public void writeReply(ReplyVO vo);
	

}
