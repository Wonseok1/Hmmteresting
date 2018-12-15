package edu.iot.app.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;


@Component
public class LoginInterceptor extends BaseInterceptor {

	@Override
	public String check(HttpServletRequest request) {
		if(getUser(request) == null) {
			return "먼저 로그인하세요.";
		}
		return null;
	}	
}
