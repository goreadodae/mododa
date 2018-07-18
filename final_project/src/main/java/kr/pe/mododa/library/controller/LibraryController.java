package kr.pe.mododa.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LibraryController {
	
	// 자료실 메인 페이지로 이동
	@Autowired
	@RequestMapping(value="/libraryMain.do")
	public String libraryMainView () {
		return "library/libraryMain";
	}
	
	// 할 일 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryTodoContent.do")
	public String libraryTodoView () {
		return "library/libraryTodoContent";
	}
	
	// 의사결정 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryDecisionContent.do")
	public String libraryDecisionView () {
		return "library/libraryDecisionContent";
	}
		
	// 이미지 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryImageContent.do")
	public String libraryImageView () {
		return "library/libraryImageContent";
	}
		
	// 파일 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryFileContent.do")
	public String libraryFileView () {
		return "library/libraryFileContent";
	}
		
	// 링크 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryLinkContent.do")
	public String libraryLinkView () {
		return "library/libraryLinkContent";
	}
	

}
