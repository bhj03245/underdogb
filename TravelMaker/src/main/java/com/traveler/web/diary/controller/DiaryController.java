package com.traveler.web.diary.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.traveler.web.diary.model.DiaryVO;
import com.traveler.web.diary.service.DiaryService;

@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	@Inject
	private DiaryService diaryService;
	
	@GetMapping("DiaryList")
	public String getDiaryList(Model model) throws Exception{
		model.addAttribute("diaryList", diaryService.getDiaryList());
		return "diary/DiaryList";
	}
	
	@GetMapping("DiaryWrite")
	public void DiaryWrite() throws Exception{
	}
	
	@PostMapping("saveDiary")
	public String saveDiary(@ModelAttribute("diaryVO") DiaryVO diaryVO, RedirectAttributes rttr) throws Exception{
		diaryService.insertDiary(diaryVO);
		return "redirect:/diary/DiaryList";
	}

}
