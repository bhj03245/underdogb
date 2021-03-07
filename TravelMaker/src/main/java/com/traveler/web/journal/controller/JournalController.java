package com.traveler.web.journal.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String createJournal(@ModelAttribute("journalVO") JournalVO journalVO, Model model) throws Exception{
		return "journal/createJournal";
	}
	
	@GetMapping("/update")
	public String updateJournal(@RequestParam("journal_no") int journal_no, @RequestParam("mode") String mode, Model model) throws Exception {
		model.addAttribute("journalContent", journalService.getJournalContent(journal_no));
		model.addAttribute("mode", mode);
		model.addAttribute("journalVO", new JournalVO());
		return "journal/updateJournal";
	}
	
	@GetMapping("/delete")
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("journal_no") int journal_no) throws Exception {
		journalService.deleteJournal(journal_no);
		return "redirect:/journal/list";
	}
	
	@PostMapping("/saveJournal")
	public String saveJouarnal(@ModelAttribute("JournalVO") JournalVO journalVO, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {
		if (mode.equals("edit")) {
			journalService.updateJournal(journalVO);
		} else {
			journalService.insertJournal(journalVO);
		}
		return "redirect:/journal/list";
	}
}
