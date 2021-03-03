package com.traveler.web.diary.model;

import java.util.Date;

import lombok.Data;

@Data
public class DiaryVO {
	public int diary_no;
	public String title;
	public String author;
	public String diary;
	public Date regDate;

}
