package kr.pe.mododa.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.post.model.service.PostServiceImpl;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.Schedule;

@Controller
public class PostControllerImpl {
	@Autowired
	@Qualifier(value="postService")
	private PostServiceImpl postService;

	@Autowired
	@RequestMapping(value="/testareum.do")
	public String postView () {
		return "post/test";
	}
	
	@RequestMapping(value="/viewPost.do")
	public ModelAndView viewPost(@RequestParam int postNo) {
		Post p = postService.selectOnePost(postNo);
		ModelAndView view = new ModelAndView();
		view.addObject("post", p);
		view.setViewName("jsonView");
		return view;
	}

	@RequestMapping(value="/insertSchedule.do")
	public ModelAndView insertSchedule(Schedule sc) {
		int result = postService.insertSchedule(sc);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}
	
	
	
	
	
	
	
}
