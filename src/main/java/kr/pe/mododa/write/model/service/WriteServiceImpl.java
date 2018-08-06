package kr.pe.mododa.write.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.dao.WriteDAOImpl;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

@Service("writeService")
public class WriteServiceImpl implements WriteService{
	@Resource(name="writeDAO")
	private WriteDAOImpl writeDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ServletContext servletContext;

	public ArrayList<Project> autoComplete(int memberNo) {
		return (ArrayList)writeDAO.autoComplete(sqlSession,memberNo);
		
		
	}

	public String currentProName(Project pj) {
		
		return writeDAO.currentProName(sqlSession,pj);
	}

	public ArrayList<RelationWriting> relationWritingList(int currentProNo) {
		
		return (ArrayList)writeDAO.relationWritingList(sqlSession,currentProNo);
	}

	public ArrayList<RelationWriting> searchWriting(RelationSearchKey rsKey) {
		
		return (ArrayList)writeDAO.searchWriting(sqlSession,rsKey);
	}

	public ArrayList<Project> myProject(int memberNo) {
		return (ArrayList)writeDAO.myProject(sqlSession,memberNo);
		
	}

	public ArrayList<RelationWriting> loadByProName(RelationWriting rw) {
		return (ArrayList)writeDAO.loadByProName(sqlSession,rw);
		
	}

	public int uploadFile(MultipartFile[] files, Upload upload)  {
		String root_path = servletContext.getRealPath("/webapp");//상대경로 잡는거 넘 어렵
		root_path = root_path.replaceFirst("webapp", "");
		String attach_path = "/resources/upload/write/";
		String uploadPath = root_path+attach_path;
		File dir = new File(uploadPath);
		int result = 0;
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		for(MultipartFile file : files) {
			String originalFileName = file.getOriginalFilename();
			String saveFileName = originalFileName;
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = System.currentTimeMillis()+"_"+saveFileName;
				}
				
				
			}
			try {
				file.transferTo(new File(uploadPath + saveFileName));
				upload.setUploadSubject(originalFileName);
				upload.setUploadPath(uploadPath + saveFileName);
				System.out.println(uploadPath+saveFileName);
				result = writeDAO.insertFileUploaded(sqlSession,upload);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("foreach 서비스"+files);
		}
		return result;
		
	}

	public ArrayList<ProjectMember> projectMember(Project pj) {
		
		
		
		return writeDAO.projectMember(sqlSession,pj);
		
	
	}

	public String myPicture(int memberNo) {
		
		return writeDAO.myPicture(sqlSession,memberNo);
	}

	public PrivateSpace privateSpace(int memberNo) {
		
		return writeDAO.privateSpace(sqlSession,memberNo);
	}

	public ArrayList<Partners> myPartners(int memberNo) {
		return writeDAO.myPartners(sqlSession,memberNo);
		
	}

	public int insertPostToProject(Post post) {
		return writeDAO.insertPostToProject(sqlSession,post);		
	}

	public int insertSchedules(Schedule sche) {
		int result =0;

			result =  writeDAO.insertSchedules(sqlSession,sche); 
		
		
		
		return result;
	}



}
