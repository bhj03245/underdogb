package com.traveler.web.journal.model;

import java.sql.Date;

import lombok.Data;

@Data
public class JournalVO {
	private int journal_no;
	private String title;
	private Date start_dt;
	private Date end_dt;
	private String marker;
	private String author;
	private int thumbs;
	private int view_cnt;
}
