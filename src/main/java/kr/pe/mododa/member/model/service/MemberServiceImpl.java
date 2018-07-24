package kr.pe.mododa.member.model.service;

import java.sql.Timestamp;

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
import kr.pe.mododa.member.model.vo.ConfirmMailFindPass;
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
		sendMail.setSubject("[MODODA 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<table align='center' width='620' style='margin: 0px auto; border-collapse: collapse; border: 1px solid #e7e7e7;' border='0' cellspacing='0' cellpadding='0'>\r\n" + 
						"<tbody><tr><td align='center' height='54' colspan='3'><a href='localhost' style='display: block; : 54px; margin-top: 35px; text-align: center;' rel='noreferrer noopener' target='_blank'><img src='../resources/images/layout-img/main_logo_rec.png' width='134' height='42'></a></td></tr><tr><td width='60'></td><td align='left' width='500'>\r\n" + 
						"<p style='font-size: 24px; line-height: 36px; color: #888; font-family: AppleSDGothicNeo-Regular; margin: 0; padding: 24px 0 21px;'>\r\n" + 
						"<strong style='color: #4a4a4a; font-family: AppleSDGothicNeo-Bold'>메일인증만 하신다면 협업은 쉬워집니다!</strong>\r\n" + 
						"</p>\r\n" + 
						"</td><td width='60'></td></tr><tr><td width='60'></td><td align='left' width='509'>\r\n" + 
						"<p style='font-size: 16px; line-height: 26px; color: #4a4a4a; padding: 0; margin: 0; font-family: AppleSDGothicNeo-Regular'>모두다 가입을 위한 인증을 진행해 주세요.\r\n" + 
						"<br>메일 인증하기 버튼을 눌러주세요.</p>\r\n" + 
						"</td><td width='60'></td></tr><tr><td align='center' colspan='3'>").append("<a href='http://localhost/emailConfirm?").append("key=").append(key).append("' style='display: block; width: 200px; height: 40px; font-size: 16px; margin: 60px 0; color: #fff; text-decoration: none; line-: 46px; background-color: #339966; border-radius: 20px; -webkit-border-radius: 20px; text-align: center;' rel='noreferrer noopener' target='_blank'>" + 
						"메일 인증하기</a></td></tr><tr><td align='center' height='83' colspan='3' style='background-color: #f5f5f5;'>\r\n" + 
						"<p style='font-size: 13px; line-height: 22px; color: #6c6c6c; padding: 0; margin: 0;'>본\r\n" + 
						"메일은 발신전용입니다.</p>\r\n" + 
						"<p style='font-size: 13px; line-height: 22px; color: #6c6c6c; padding: 0; margin: 0;'><!-- localhost -->\r\n" + 
						"Copyright © <a style='color: #6c6c6c; font-family: applesdgothicneo-regular; text-decoration: none;' href='localhost' target='_blank' rel='noreferrer noopener'>mododa</a> All Right Reserved\r\n" + 
						"</p>\r\n" + 
						"</td></tr></tbody>\r\n" + 
						"</table>").toString());
		sendMail.setFrom("mododa0130@gmail.com", "모두다");
		sendMail.setTo(email);
		sendMail.send();
		ConfirmMailFindPass cmfp = new ConfirmMailFindPass();
		cmfp.setCfKey(key);
		cmfp.setEmail(email);
		Timestamp ts = new Timestamp(System.currentTimeMillis()+30*60*1000);
		cmfp.setCfTime(ts);
		cmfp.setCfCategory("Email");
		ConfirmMailFindPass result = memberDAO.checkConfirmFind(sqlSession, cmfp);
		if(result!=null) {
			memberDAO.deleteConfirmFind(sqlSession, result);
		}
		memberDAO.insertConfirmFind(sqlSession, cmfp);
	}

	public void userAuth(String key) {
		ConfirmMailFindPass cmfp = memberDAO.checkConfirmFindKey(sqlSession, key);
		memberDAO.userAuth(sqlSession, cmfp.getEmail());
		memberDAO.deleteConfirmFind(sqlSession, cmfp);
	}

	public void findPassword(String email) throws Exception {
		String key = new TempKey().getKey(50, false);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[MODODA 비밀번호 변경]");
		sendMail.setText(
				new StringBuffer().append("<table align='center' width='620' style='margin: 0px auto; border-collapse: collapse; border: 1px solid #e7e7e7;' border='0' cellspacing='0' cellpadding='0'>\r\n" + 
						"<tbody><tr><td align='center' height='54' colspan='3'><a href='localhost' style='display: block; : 54px; margin-top: 35px; text-align: center;' rel='noreferrer noopener' target='_blank'><img src='../resources/images/layout-img/main_logo_rec.png' width='134' height='42'></a></td></tr><tr><td width='60'></td><td align='left' width='500'>\r\n" + 
						"<p style='font-size: 24px; line-height: 36px; color: #888; font-family: AppleSDGothicNeo-Regular; margin: 0; padding: 24px 0 21px;'>\r\n" + 
						"<strong style='color: #4a4a4a; font-family: AppleSDGothicNeo-Bold'>비밀번호를 잊어버리셨나요?</strong>\r\n" + 
						"</p>\r\n" + 
						"</td><td width='60'></td></tr><tr><td width='60'></td><td align='left' width='509'>\r\n" + 
						"<p style='font-size: 16px; line-height: 26px; color: #4a4a4a; padding: 0; margin: 0; font-family: AppleSDGothicNeo-Regular'>메일\r\n" + 
						"수신 후 1시간 이내에 아래 비밀번호 변경 버튼을 눌러 새 비밀번호를 입력하면, 변경된 비밀번호로 로그인할 수\r\n" + 
						"있습니다.</p>\r\n" + 
						"</td><td width='60'></td></tr><tr><td align='center' colspan='3'>").append("<a href='http://localhost/passwordFind?key=").append(key).append("' style='display: block; width: 200px; height: 40px; font-size: 16px; margin: 60px 0; color: #fff; text-decoration: none; line-: 46px; background-color: #339966; border-radius: 20px; -webkit-border-radius: 20px; text-align: center;' rel='noreferrer noopener' target='_blank'>" + 
						"비밀번호 변경하기</a></td></tr><tr><td align='center' height='83' colspan='3' style='background-color: #f5f5f5;'>" + 
						"<p style='font-size: 13px; line-height: 22px; color: #6c6c6c; padding: 0; margin: 0;'>본" + 
						"메일은 발신전용입니다.</p>" + 
						"<p style='font-size: 13px; line-height: 22px; color: #6c6c6c; padding: 0; margin: 0;'><!-- localhost -->" + 
						"Copyright © <a style='color: #6c6c6c; font-family: applesdgothicneo-regular; text-decoration: none;' href='localhost' target='_blank' rel='noreferrer noopener'>mododa</a> All Right Reserved" + 
						"</p>"+ 
						"</td></tr></tbody>" + 
						"</table>").toString());
		sendMail.setFrom("mododa0130@gmail.com", "모두다");
		sendMail.setTo(email);
		sendMail.send();
		
		ConfirmMailFindPass cmfp = new ConfirmMailFindPass();
		cmfp.setCfKey(key);
		cmfp.setEmail(email);
		Timestamp ts = new Timestamp(System.currentTimeMillis()+60*60*1000);
		cmfp.setCfTime(ts);
		cmfp.setCfCategory("Password");
		ConfirmMailFindPass result = memberDAO.checkConfirmFind(sqlSession, cmfp);
		if(result!=null) {
			memberDAO.deleteConfirmFind(sqlSession, result);
		}
		memberDAO.insertConfirmFind(sqlSession, cmfp);
	}

}
