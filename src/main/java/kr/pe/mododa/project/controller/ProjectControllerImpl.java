package kr.pe.mododa.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;



@Controller
public class ProjectControllerImpl implements ProjectController {
	
	
	@Autowired
	@Qualifier(value="projectService")
	private ProjectServiceImpl projectService;
	

	@Override
	@RequestMapping(value="gotoProTitle.do")
	public String gotoProTitle() { // 이동
		return "project/createProject";
	}

	@Override
	@RequestMapping(value="createProject.do")
	public String createProject(HttpSession session, Project project) { // 새 프로젝트 생성 기능
		
		//System.out.println(project.toString());

		// memberNo 정보를 가지고 와야하는데 DB를 한번 갔다올지 그냥 세션으로 할 지 이거는 로그인 연동 후 고민~!
		if(session.getAttribute("member")!=null) { // 세션으로 로그인 정보 가져오기
			
			
			
		} else {
			
			// 로그인이랑 합쳐지면 if문 안으로 옮기기
			int proResult = projectService.insertProject(project);
			if(proResult>0) { // 프로젝트 생성이 성공하면 insertWorkOn 진행하기
				
				/*WorkOn workOnInfo = new WorkOn();
				int wonResult = projectService.insertWorkOn(workOnInfo);*/
				
			} else {
				
			}
			
		}
		
		// 프로젝트 생성이 성공하면 leftbar에 프로젝트 항목 새로 뜨게...
		return null;
		
	}

}
