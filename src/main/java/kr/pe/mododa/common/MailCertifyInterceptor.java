package kr.pe.mododa.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.pe.mododa.member.model.vo.Member;

public class MailCertifyInterceptor  extends HandlerInterceptorAdapter {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		
		boolean result = true;
        HttpSession session = request.getSession();

        Member member = (Member)session.getAttribute("member");
        int i=0;
        if(member!=null) {
        	if ( member.getMemberEmailCertify().equals("N") ){ 
                response.sendRedirect("/views/main/mailCertify.jsp");
                result = false;
            }
        } else {
        	result = true;
        }
        return result;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
}
