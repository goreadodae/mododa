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
import kr.pe.mododa.write.model.vo.CallPost;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelatedPost;
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
				//1. 원본파일에서 확장자 명만 추출
				String subject = originalFileName.substring(originalFileName.lastIndexOf(".")+1,originalFileName.length());
				//2. 이미지 확장자 명 배열에 추가
				String[] extension = {"pxc","gif","bmp","png","jpg","raw","jpeg"};
				int length = extension.length;
				String exResult="";//결과 담을 변수
				
				//3. for문으로 확장자명 비교에 따라 이미지/파일  구분 
				for(int i=0; i<length; i++)
				{
					if(subject.equals(extension[i]))
					{
						// 확장자 명이 포함되면 중단
						exResult="image";
						break;
					}
					else {
						// 확장자 명 찾을 때 까지 
						exResult="file";
						continue;
					}
					
				}
				
				file.transferTo(new File(uploadPath + saveFileName));
				upload.setUploadSubject(exResult);//uploadSubject에 담기!
				upload.setFileName(originalFileName);
				upload.setUploadPath(saveFileName);
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

	public int insertRpPost(RelatedPost rpPost) {
		
		int result = writeDAO.insertRpPost(sqlSession,rpPost);
				return result;
		
	}

	public int insertCallMember(CallPost cp) {
		int result = writeDAO.insertCallMember(sqlSession,cp);
		return result;
	}

	public int setPrivateSpace(int memberNo) {
		return writeDAO.setPrivateSpace(sqlSession,memberNo);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
