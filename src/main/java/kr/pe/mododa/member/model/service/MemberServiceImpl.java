package kr.pe.mododa.member.model.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.pe.mododa.common.MailHandler;
import kr.pe.mododa.common.TempKey;
import kr.pe.mododa.member.model.dao.MemberDAOImpl;
import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.ConfirmMailFindPass;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.member.model.vo.Partner;
import kr.pe.mododa.member.model.vo.SearchPartner;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDAO")
	private MemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ServletContext servletContext;

	@Override
	public Member loginSHA(Member vo) {
		Member m = memberDAO.selectOneMember(sqlSession, vo);
		return m;
	}

	public boolean checkId(String memberId) {
		boolean result = false;
		int memberNo = memberDAO.checkId(sqlSession, memberId);
		if(memberNo!=0) {
			result = true; 
		} else {
			result = false;
		}
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

	public boolean userAuth(String key) {
		ConfirmMailFindPass cmfp = memberDAO.checkConfirmFindKey(sqlSession, key);
		Timestamp curTime = new Timestamp(System.currentTimeMillis());
		if(cmfp.getCfTime().compareTo(curTime)>0) {
			memberDAO.userAuth(sqlSession, cmfp.getEmail());
			memberDAO.deleteConfirmFind(sqlSession, cmfp);
			return true;
		} else {
			memberDAO.deleteConfirmFind(sqlSession, cmfp);
			return false;
		}
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

	public boolean passwordFind(String key) {
		ConfirmMailFindPass cmfp = memberDAO.checkConfirmFindKey(sqlSession, key);
		Timestamp curTime = new Timestamp(System.currentTimeMillis());
		if(cmfp.getCfTime().compareTo(curTime)>0) {
			return true;
		} else {
			return false;
		}
	}

	public String getMemberIdFromKey(String key) {
		String memberId = memberDAO.getMemberIdFromKey(sqlSession, key);
		ConfirmMailFindPass cmfp = new ConfirmMailFindPass();
		cmfp.setCfKey(key);
		memberDAO.deleteConfirmFind(sqlSession, cmfp);
		return memberId;
	}

	public int changePwSHA(Member vo) {
		return memberDAO.changePw(sqlSession, vo);
	}

	public int changeMyInfo(Member vo) {
		return memberDAO.changeMyInfo(sqlSession, vo);
	}

	public boolean changeMemberPic(MultipartHttpServletRequest request, Member vo) {
		boolean isSuccess = false;
		String root_path = servletContext.getRealPath("/webapp");//상대경로 잡는거 넘 어렵
		root_path = root_path.replaceFirst("webapp", "");
		String attach_path = "/resources/upload/member/";
		String uploadPath = root_path+attach_path;
		File dir = new File(uploadPath);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		Iterator<String> iter = request.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			MultipartFile mFile = request.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {//중복 파일명 변경
					saveFileName = System.currentTimeMillis()+"_"+saveFileName;
				}
				if(vo.getMemberPicture()!=null) {
					if(!vo.getMemberPicture().equals("defaultUserImg.png")) {
						File delFile = new File(uploadPath+vo.getMemberPicture());
						delFile.delete();
					}
				}
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					vo.setMemberPicture(saveFileName);
					memberDAO.changeMyInfo(sqlSession, vo);
					isSuccess = true;
				} catch (IllegalStateException e) {
					e.printStackTrace();
					isSuccess = false;
				} catch (IOException e) {
					e.printStackTrace();
					isSuccess = false;
				}
			} // if end
		} // while end
		return isSuccess;
	}

	public ArrayList<Partner> selectPartnerList(int memberNo) {
		return memberDAO.selectPartnerList(sqlSession, memberNo);
	}

	public String invitePartner(int memberNo, String parId) {
		String result="";
		int parNo = memberDAO.checkId(sqlSession, parId);
		if(parNo!=0) {
			Partner p = new Partner();
			p.setMemberNo(memberNo);
			p.setParNo(parNo);
			p.setParYN('N');
			if(memberDAO.checkParNo(sqlSession, p)) {
				result = "having";
			} else {
				int inviteRes = memberDAO.invitePartner(sqlSession, p);
				if(inviteRes>0) {
					result = "success";
				}
				else {
					result = "failed";
				}
			}
		} else {
			result = "nothing";
		}
		return result;
	}

	public int inviteCancel(int memberNo, int parNo) {
		Partner p = new Partner();
		p.setMemberNo(memberNo);
		p.setParNo(parNo);
		return memberDAO.inviteCancel(sqlSession, p);
	}

	public ArrayList<Partner> selectInvitingPartnerList(int memberNo) {
		return memberDAO.selectInvitingPartnerList(sqlSession, memberNo);
	}

	public int acceptPartner(int memberNo, int parNo) {
		Partner p = new Partner();
		p.setMemberNo(memberNo);
		p.setParNo(parNo);
		p.setParYN('Y');
		memberDAO.invitePartner(sqlSession, p);
		return memberDAO.acceptPartner(sqlSession, p);
	}

	public ArrayList<Partner> searchPartner(int memberNo, String searchPartnerText) {
		SearchPartner sp = new SearchPartner();
		sp.setMemberNo(memberNo);
		sp.setSearchPartnerText(searchPartnerText);
		return memberDAO.searchPartner(sqlSession, sp);
	}
}
