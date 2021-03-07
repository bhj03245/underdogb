package com.traveler.web.diary.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DiaryVO {
	private int diary_no;
	private String title;
	private String diary;
	private String writer;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String marker;
	

}
