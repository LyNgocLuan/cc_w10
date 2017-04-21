package cc_w10.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cc_w10.dao.Respository;
import cc_w10.model.Content;

@Service
@Transactional
public class ContentService {
	
	private final Respository contentRespository;

	public ContentService(Respository contentRespository) {
		this.contentRespository = contentRespository;
	}

	public List<Content> findAll(){
		List<Content> contents = new ArrayList<>();
		for(Content content : contentRespository.findAll()){
			contents.add(content);
		}
		return contents;
	}
	
	public Content findContent(int id){
		return contentRespository.findOne(id);
	}
	
	public void save(Content content){
		contentRespository.save(content);
	}
	
	public void delete(int id){
		contentRespository.delete(id);
	}
}
