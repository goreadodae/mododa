package kr.pe.mododa.post.model.service;

import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.PostLike;
import kr.pe.mododa.project.model.vo.Project;

public interface PostService {

	public Project selectProject(int postNo);
	public Post selectOnePost(int postNo);
	public Bookmark selectBookmark(int postNo, int memberNo);
	public PostLike selectPostLike(int postNo, int memberNo);
	public int selectPostLikeCount(int postNo);
}
