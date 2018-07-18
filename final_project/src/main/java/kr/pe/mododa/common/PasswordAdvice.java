package kr.pe.mododa.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.member.model.vo.Member;

@Service
@Aspect
public class PasswordAdvice {
	@Autowired
	private SHA256Util sha256;
	
	@Pointcut("execution(* kr.pe.mododa.member.model.service..*ServiceImpl.*SHA(..))")
	public void passwordCut() {}
	
	@Before("passwordCut()")
	public void MemberEncryption(JoinPoint jp) {
		Member vo = (Member)jp.getArgs()[0];
		String memberPw = vo.getMemberPw();
		try {
			String encryPw = sha256.encryData(memberPw);
			System.out.println("회원 비밀번호 : " + memberPw);
			System.out.println("암호 비밀번호 : " + encryPw);
			vo.setMemberPw(encryPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
