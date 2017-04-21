package cc_w10.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cc_w10.model.Content;
import cc_w10.service.ContentService;

@RestController
public class SapmpleRestController {

	@Autowired
	private ContentService contentService;
	
	/*@GetMapping("/hello")
	public String hello(){
		return "Hello";
	}
	@GetMapping("/all-contents")
	public String allContents(){
		return contentService.findAll().toString();
	}
	
	@GetMapping("/save-content")
	public String saveContent(@RequestParam String tittle, @RequestParam String content){
		Content article = new Content(tittle, content);
		contentService.save(article);
		return "Saved";
	}*/
	
	
}

