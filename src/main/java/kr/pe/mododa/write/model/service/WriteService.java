package kr.pe.mododa.write.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.vo.CallPost;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelatedPost;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

public interface WriteService {
public String currentProName(Project pj); 
	public ArrayList<RelationWriting> relationWritingList(int currentProNo);
	public ArrayList<RelationWriting> searchWriting(RelationSearchKey rsKey);
	public ArrayList<Project> myProject(int memberNo);
	public ArrayList<RelationWriting> loadByProName(RelationWriting rw);
	public int uploadFile(MultipartFile[] files, Upload upload);
	public ArrayList<ProjectMember> projectMember(Project pj);
	public String myPicture(int memberNo);
	public PrivateSpace privateSpace(int memberNo);
	public ArrayList<Partners> myPartners(int memberNo);
	public int insertPostToProject(Post post);
	public int insertSchedules(Schedule sche);
	public int insertRpPost(RelatedPost rpPost);
	public int insertCallMember(CallPost cp);
	public int setPrivateSpace(int memberNo);

	
	
	
}
