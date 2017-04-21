package cc_w10.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc_w10.model.Content;
import cc_w10.service.ContentService;

@Controller
public class ContentController {
	
	@Autowired
	private ContentService contentService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-contents")
	public String allContents(HttpServletRequest request){
		request.setAttribute("contents", contentService.findAll());
		request.setAttribute("mode", "MODE_CONTENTS");
		return "index";
	}
	
	@GetMapping("/new-content")
	public String newContent(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-content")
	public String saveContent(@ModelAttribute Content content, BindingResult bindingResult, HttpServletRequest request){
		contentService.save(content);
		request.setAttribute("contents", contentService.findAll());
		request.setAttribute("mode", "MODE_CONTENTS");
		return "index";
	}
	
	@GetMapping("/update-content")
	public String updateContent(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("content", contentService.findContent(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-content")
	public String deleteContent(@RequestParam int id, HttpServletRequest request){
		contentService.delete(id);
		request.setAttribute("contents", contentService.findAll());
		request.setAttribute("mode", "MODE_CONTENTS");
		return "index";
	}
	
}
