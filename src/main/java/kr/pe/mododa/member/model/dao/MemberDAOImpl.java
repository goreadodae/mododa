package kr.pe.mododa.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.ConfirmMailFindPass;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.member.model.vo.Partner;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Override
	public Member selectOneMember(SqlSessionTemplate sqlSession, Member m) {//회원 한명의 정보를 가져오는 메소드
		return sqlSession.selectOne("member.selectOneMember", m);
	}

	public int checkId(SqlSessionTemplate sqlSession, String memberId) {
		int memberNo;
		Integer result = sqlSession.selectOne("member.checkId", memberId);
		if(result!=null) {
			memberNo=result;
		} else {
			memberNo=0;
		}
		System.out.println(result);
		return memberNo;
	}

	public boolean checkPw(SqlSessionTemplate sqlSession, Member vo) {
		String pw = sqlSession.selectOne("member.checkPw", vo);
		if(pw==null) {
			return false;
		} else {
			return true;
		}
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member vo) {
		return sqlSession.insert("member.insertMember", vo);
	}
	
    // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
    public int keepLogin(SqlSessionTemplate sqlSession, AutoLogin al){
        // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
       return sqlSession.insert("member.keepLogin",al);
         
    }
 
    // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
    public Member checkUserWithSessionKey(SqlSessionTemplate sqlSession, String sessionId){
        // 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
    	AutoLogin al = sqlSession.selectOne("member.selectAutoLogin",sessionId);
    	return sqlSession.selectOne("member.selectOneMemberNo", al.getMemberNo());
     
    }

	public int deleteAutoLogin(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.delete("member.deleteAutoLogin", id);
	}

	public void userAuth(SqlSessionTemplate sqlSession, String userEmail) {
		sqlSession.update("member.confirmEmail", userEmail);
	}

	public ConfirmMailFindPass checkConfirmFind(SqlSessionTemplate sqlSession, ConfirmMailFindPass cmfp) {
		return sqlSession.selectOne("member.checkConfirmFind",cmfp);
	}

	public void deleteConfirmFind(SqlSessionTemplate sqlSession, ConfirmMailFindPass cmfp) {
		sqlSession.delete("member.deleteConfirmFind",cmfp);
	}

	public void insertConfirmFind(SqlSessionTemplate sqlSession, ConfirmMailFindPass cmfp) {
		sqlSession.insert("member.insertConfirmFind",cmfp);
	}

	public ConfirmMailFindPass checkConfirmFindKey(SqlSessionTemplate sqlSession, String key) {
		return sqlSession.selectOne("member.checkConfirmFindKey",key);
	}

	public String getMemberIdFromKey(SqlSessionTemplate sqlSession, String key) {
		return sqlSession.selectOne("member.getMemberIdFromKey",key);
	}

	public int changePw(SqlSessionTemplate sqlSession, Member vo) {
		return sqlSession.update("member.changePw", vo);
	}

	public int changeMyInfo(SqlSessionTemplate sqlSession, Member vo) {
		return sqlSession.update("member.changeMyInfo", vo);
	}

	public ArrayList<Partner> selectPartnerList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("member.selectPartnerList", memberNo);
	}

	public int invitePartner(SqlSessionTemplate sqlSession, Partner p) {
		return sqlSession.insert("member.invitePartner", p);
	}

}
