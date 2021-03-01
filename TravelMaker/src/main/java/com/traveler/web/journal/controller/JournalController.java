package com.traveler.web.journal.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.traveler.web.journal.model.JournalVO;
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
	
	@GetMapping("/create")
	public String createJournal() throws Exception{
		return "journal/createJournal";
	}
	
	@PostMapping("/saveJournal")
	public String saveJouarnal(@ModelAttribute("JournalVO") JournalVO journalVO, RedirectAttributes rttr) throws Exception {
		journalService.insertJournal(journalVO);
		return "redirect:/journal/list";
	}
}
