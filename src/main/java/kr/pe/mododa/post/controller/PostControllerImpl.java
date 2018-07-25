package kr.pe.mododa.post.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.post.model.service.PostServiceImpl;
import kr.pe.mododa.post.model.vo.Post;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		List<Schedule> listSc = postService.selectSchedule(postNo);
		List<Todo> listTodo = postService.selectTodo(postNo);
		
		JSONArray scheduleArray = new JSONArray();
		
		for(Schedule sc : listSc) {
			String start = (sc.getStartDate().getYear()+1900) + "-" + sc.getStartDate().getMonth()+ "-" + sc.getStartDate().getDay() ;
			String end = (sc.getEndDate().getYear()+1900) + "-" + sc.getEndDate().getMonth()+ "-" + sc.getEndDate().getDay() ;
			JSONObject schedule = new JSONObject();
			schedule.put("startDate",start);
			schedule.put("endDate",end);
			schedule.put("scTitle", sc.getScTitle());
			scheduleArray.add(schedule);
		}
		
		JSONArray todoArray = new JSONArray();
		
		for(Todo td : listTodo) {
			JSONObject todo = new JSONObject();
			todo.put("todoContent", td.getTodoContent());
			todo.put("todoMember", td.getTodoMember());
			todoArray.add(todo);
		}
		
		ModelAndView view = new ModelAndView();
		view.addObject("post", p);
		view.addObject("schedule",scheduleArray);
		view.addObject("todo", todoArray);
		view.setViewName("jsonView");
		return view;
	}
	
	@RequestMapping(value="/insertSchedule.do")
	public ModelAndView insertSchedule(int postNo, @RequestParam String scTitle, @RequestParam Date startDate, @RequestParam Date endDate) {
		Schedule vo = new Schedule();
		vo.setPostNo(postNo);
		vo.setScTitle(scTitle);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		int result = postService.insertSchedule(vo);
		ModelAndView view = new ModelAndView();
		if(result>0) {
			view.addObject("result", result);
		}
		view.setViewName("jsonView");
		return view;
	}
	
	@RequestMapping(value="/fileUpload.do")
	 public ModelAndView fileUp(MultipartHttpServletRequest multi) {
        
        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/";
         
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
         
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		return view;
    }
	
}
