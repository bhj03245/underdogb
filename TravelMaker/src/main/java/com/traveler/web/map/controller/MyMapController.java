package com.traveler.web.map.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.traveler.web.map.service.MyMapService;

@Controller
@RequestMapping("/my")
public class MyMapController {
	@Inject
	private MyMapService mymapService;
	
	@GetMapping("/map")
	public String getMyJournalList(Model model, @RequestParam("author") String author)throws Exception{
		model.addAttribute("myjournalList",mymapService.getMyJournalList(author));
		return "mymap/mymap";
	}
	
	@GetMapping("/list")
	public String getMyJournalTitle(Model model, @RequestParam("journal_no") int journal_no) throws Exception{
		model.addAttribute("title", mymapService.getMyJournalTitle(journal_no));
		model.addAttribute("mydiaryList",mymapService.getMyMapDiary(journal_no));
		return "mymap/list";
	}
}
