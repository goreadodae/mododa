package kr.pe.mododa.post.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.post.dao.PostDAOImpl;
import kr.pe.mododa.post.model.vo.Comment;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.PostLike;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.vo.RelatedPost;


@Service("postService")
public class PostServiceImpl implements PostService{
	@Resource(name="postDAO")
	private PostDAOImpl postDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ServletContext servletContext;
	
	public Project selectProject(int postNo) {
		return postDAO.selectOneProject(sqlSession, postNo);
	}
	
	public Post selectOnePost(int postNo) {
		return postDAO.selectOnePost(sqlSession, postNo);
	}
	
	public Bookmark selectBookmark(int postNo, int memberNo) {
		Bookmark vo = new Bookmark();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		return postDAO.selectBookmark(sqlSession, vo);
	}
	
	public PostLike selectPostLike(int postNo, int memberNo) {
		PostLike vo = new PostLike();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		return postDAO.selectPostLike(sqlSession, vo);
	}
	
	public int selectPostLikeCount(int postNo) {	//0801 아름 추가
		return postDAO.selectPostLikeCount(sqlSession, postNo);
	}
	
	public List<Schedule> selectSchedule(int postNo) {
		return postDAO.selectSchedule(sqlSession, postNo);
	}
	
	public List<Todo> selectTodo(int postNo){
		return postDAO.selectTodo(sqlSession, postNo);
	}
	
	public List<Decision> selectDecision(int postNo){
		return postDAO.selectDecision(sqlSession, postNo);
	}
	
	public List<Upload> selectUpload(int postNo){
		return postDAO.selectUpload(sqlSession, postNo);
	}
	
	public Decision selectOneDecision(int dcNo) {
		return postDAO.selectOneDecision(sqlSession, dcNo);
	}
	
	public List<RelatedPost> selectRelatedPost(int postNo){
		return postDAO.selectRelatedPost(sqlSession, postNo);
	}
	
	public List<Member> selectMembers(int postNo){
		return postDAO.selectMembers(sqlSession, postNo);
	}
	
	public Member selectMemberInfo(int memberNo) {
		return postDAO.selectMemberInfo(sqlSession, memberNo);
	}

	public int insertTodo(Todo vo) {
		return postDAO.insertTodo(sqlSession, vo);
	}
	
	public int insertSchedule(Schedule vo) {
		return postDAO.insertSchedule(sqlSession, vo);
	}
	
	public int insertDecision(Decision vo) {
		return postDAO.insertDecision(sqlSession,vo);
	}
	
	public int deleteTodo(int todoNo) {
		return postDAO.deleteTodo(sqlSession, todoNo);
	}

	public int deleteSchedule(int scNo) {
		return postDAO.deleteSchedule(sqlSession, scNo);
	}
	
	public int deleteDecision(int dcNo) {
		return postDAO.deleteDecision(sqlSession,dcNo);
	}
	
	public int updatePost(Post vo) {
		return postDAO.updatePost(sqlSession, vo);
	}
	
	public int updateTodo(Todo vo) {
		return postDAO.updateTodo(sqlSession, vo);
	}
	
	public int updateSchedule(Schedule vo) {	//0801 아름 추가
		return postDAO.updateSchedule(sqlSession, vo);
	}

	public int updateDecision(Decision vo) {
		return postDAO.updateDecision(sqlSession,vo);
	}
	
	public int updatePostProgress(Post vo) {
		return postDAO.updatePostProgress(sqlSession,vo);
	}
	
	public int updateTodoProgress(Todo vo) {
		return postDAO.updateTodoProgress(sqlSession, vo);
	}
	
	public int insertBookmark(Bookmark vo) {
		return postDAO.insertBookmark(sqlSession, vo);
	}
	
	public int deleteBookmark(Bookmark vo) {
		return postDAO.deleteBookmark(sqlSession, vo);
	}
  
	public ArrayList<Comment> selectComment(int postNo) { //댓글 읽어오기 (준석 수정)
		return postDAO.selectComment(sqlSession, postNo);
	}
	
	public int insertPostLike(PostLike vo) {	//0801 아름 추가
		return postDAO.insertPostLike(sqlSession, vo);
	}
	
	public int deletePostLike(PostLike vo) {	//0801 아름 추가
		return postDAO.deletePostLike(sqlSession, vo);
	}
	
	

	public int insertComment(Post vo) { //댓글 입력(준석추가)
		return postDAO.insertComment(sqlSession,vo);
	}

	public int deleteComment(int commentNo) { //댓글 삭제(준석추가)
		return postDAO.deleteComment(sqlSession,commentNo);
	}
	
	public int deletePost(int postNo) {
		return postDAO.deletePost(sqlSession, postNo);
	}
	
	public int insertFile(MultipartFile[] files, Upload vo)  {
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
				vo.setUploadSubject(exResult);
				vo.setFileName(originalFileName);
				vo.setUploadPath(saveFileName);
				
				result = postDAO.insertFile(sqlSession,vo);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
		
	}

}

