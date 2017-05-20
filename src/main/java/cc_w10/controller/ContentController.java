package cc_w10.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc_w10.dao.Respository;
import cc_w10.model.Content;
import cc_w10.service.StorageFileNotFoundException;
import cc_w10.service.StorageService;
import cc_w10.service.UploadS3;
import cc_w10.service.UploadService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.stream.Collectors;

import javax.websocket.server.PathParam;

@Controller
public class ContentController {

	@Autowired
	private Respository contentDao;

	private final StorageService storageService;

	@Autowired
	public ContentController(StorageService storageService) {
		this.storageService = storageService;
	}

	@GetMapping("/")
	public String listUploadedFiles(Model model) throws IOException {

		model.addAttribute("files",
				storageService.loadAll()
						.map(path -> MvcUriComponentsBuilder
								.fromMethodName(ContentController.class, "serveFile", path.getFileName().toString())
								.build().toString())
						.collect(Collectors.toList()));
		Content content = new Content();
		model.addAttribute("content", content);
		return "index";
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	@PostMapping("/")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException {

		File convFile = storageService.store(file);

		UploadService service = new UploadService();
		String url = service.Upload(convFile);

		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file.getOriginalFilename() + "! And Uploaded to Drive View: " + url);
		return "redirect:/";
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") Integer id, Model model) {
		Content content = contentDao.findOne(id);
		model.addAttribute("content", content);
		return "index";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, @ModelAttribute("content") Content content,
			@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException, InterruptedException {
		System.out.println(content.getTittle());

		File convFile = storageService.store(file);

		UploadS3 service = new UploadS3();
		String url = service.upload(convFile);

		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file.getOriginalFilename() + "! And Uploaded to Drive View: " + url);
		content.setUrl(url);
		contentDao.save(content);
		System.out.println(content.getId());		
		
		return "index";
	}

	@ModelAttribute("contents")
	public List<Content> getContents() {
		return (List<Content>) contentDao.findAll();
	}
}
