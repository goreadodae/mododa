package kr.pe.mododa.member.model.service;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.pe.mododa.common.MailHandler;
import kr.pe.mododa.common.TempKey;
import kr.pe.mododa.member.model.dao.MemberDAOImpl;
import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDAO")
	private MemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginSHA(Member vo) {
		Member m = memberDAO.selectOneMember(sqlSession, vo);
		
		return m;
	}

	public boolean checkId(String memberId) {
		boolean result = false;
		result = memberDAO.checkId(sqlSession, memberId);
		return result;
	}

	public boolean checkPwSHA(Member vo) {
		boolean result = false;
		result = memberDAO.checkPw(sqlSession, vo);
		return result;
	}

	public int insertMemberSHA(Member vo) {
		int result = memberDAO.insertMember(sqlSession, vo);
		return result;
	}
	
	public int keepLogin(AutoLogin al) {
		return memberDAO.keepLogin(sqlSession, al);
	}
	
	public Member checkUserWithSessionKey(String sessionId) {
		return memberDAO.checkUserWithSessionKey(sqlSession, sessionId);
	}

	public int deleteAutoLogin(String id) {
		return memberDAO.deleteAutoLogin(sqlSession, id);
	}
	@Inject
	private JavaMailSender mailSender;
	public void confirmEmail(String email) throws Exception {
		String key = new TempKey().getKey(50, false);
		MailHandler sendMail = new MailHandler(mailSender);
		System.out.println("인증키 : " + key);
		System.out.println("아이디 : " + email);
		sendMail.setSubject("[ALMOM 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost/emailConfirm?user_email=").append(email).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("mododa0130@gmail.com", "모두다");
		sendMail.setTo(email);
		sendMail.send();
	}

	public void userAuth(String userEmail) {
		memberDAO.userAuth(sqlSession, userEmail);		
	}

}
