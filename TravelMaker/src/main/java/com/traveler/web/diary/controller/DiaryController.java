package com.traveler.web.diary.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.traveler.web.diary.model.DiaryVO;
import com.traveler.web.diary.service.DiaryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@AllArgsConstructor
@RequestMapping("/diary/*")
public class DiaryController {
	
	private final DiaryService service;
	
	@GetMapping("diarylist")
	public void list(Model model) { 	
		model.addAttribute("diarylist", service.getList());
		/* model.addAttribute("pageMaker", new pageDTO(cri, 123)); */
		
	}
	
	@GetMapping("write")
	public void write() { //등록 작업은 post방식으로 처리하지만, 화면에서 입력을 받아야 하므로 get방식으로 페이지를 볼수 있도록 해야함.
		
	}
	
	@PostMapping("write")
	public String write(DiaryVO diary, RedirectAttributes rtr) {
		service.write(diary);
		rtr.addFlashAttribute("result", diary.getDiary_no());
		
		return "redirect:/diary/diarylist";
	}
	
	@GetMapping({"info", "update"})
	public void info(@RequestParam("diary_no") int diary_no, Model model) { //requestParam을 이용해서 tno 값을 좀 더 명시적으로 처리. 
		
		model.addAttribute("diary", service.info(diary_no)); //해당 번호의 게시물을 전달해야 하므로 model을 파라미터로 지정한다.
	}
	
	@PostMapping("update")
	public String update(DiaryVO diary, RedirectAttributes rtr) {
		
		int count = service.update(diary);
		
		if(count == 1) {
			rtr.addFlashAttribute("result", "success");
		}
		return "redirect:/diary/diarylist";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("diary_no") int diary_no, RedirectAttributes rtr) {
		
		int count = service.delete(diary_no);
		
		if(count == 1) {
			rtr.addFlashAttribute("result", "delSuccess");
		}
		return "redirect:/diary/diarylist";
	}
	
	@RequestMapping(value="/uploadFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	

}
