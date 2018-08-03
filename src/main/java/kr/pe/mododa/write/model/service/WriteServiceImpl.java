package kr.pe.mododa.write.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.pe.mododa.member.model.dao.MemberDAO;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.dao.WriteDAOImpl;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;
import kr.pe.mododa.write.model.vo.Upload;

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

	public void uploadFile(MultipartFile[] files, Upload vo)  {
		
		String root_path = servletContext.getRealPath("/webapp");//상대경로 잡는거 넘 어렵
		root_path = root_path.replaceFirst("webapp", "");
		String attach_path = "/resources/upload/write/";
		String uploadPath = root_path+attach_path;
		File dir = new File(uploadPath);
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
				vo.setUploadPath(uploadPath + saveFileName);
				writeDAO.insertFileUploaded(sqlSession,vo);
				System.out.println(uploadPath+saveFileName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("foreach 서비스"+files);
		}
	}



}
