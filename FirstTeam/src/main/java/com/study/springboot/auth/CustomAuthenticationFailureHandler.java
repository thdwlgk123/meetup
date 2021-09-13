package com.study.springboot.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
		throws IOException, ServletException
	{
		String loginid=request.getParameter("j_username"); 
		String errormsg="";
		
		if(exception instanceof InternalAuthenticationServiceException) {
			loginFailureCount(loginid);
			errormsg="아이디나 비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof BadCredentialsException) {
			loginFailureCount(loginid);
			errormsg="아이디나 비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof DisabledException) {
			loginFailureCount(loginid);
			errormsg="계정이 비활성화 되었습니다. 관리자에게 문의하세요.";
		}else if(exception instanceof CredentialsExpiredException) {
			loginFailureCount(loginid);
			errormsg="비밀번호 유효기간이 만료되었습니다. 관리자에게 문의하세요.";
		}
		
		System.out.println("auth: username= "+loginid+", error_message: "+errormsg);
		request.setAttribute("username", loginid);
		request.setAttribute("error_message", errormsg);
		
		request.getRequestDispatcher("/security/loginpage?error=true").forward(request, response);
	}
	
	protected void loginFailureCount(String username) {
		
	}
}
