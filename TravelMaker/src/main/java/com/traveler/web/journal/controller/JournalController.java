package com.traveler.web.journal.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.web.journal.service.JournalService;

@Controller
@RequestMapping("/journal")
public class JournalController {
	@Inject
	private JournalService journalService;
	
	@GetMapping("/list")
	public String getJournalList(Model model) throws Exception{
		model.addAttribute("journalList", journalService.getJournalList());
		return "journal/journalList";
	}
}
