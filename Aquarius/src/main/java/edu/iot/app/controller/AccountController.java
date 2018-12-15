package edu.iot.app.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.iot.common.exception.LoginFailException;
import edu.iot.common.model.Avata;
import edu.iot.common.model.Login;
import edu.iot.common.model.Member;
import edu.iot.common.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginForm(Login login, 
			@ModelAttribute("url") String url,
			@ModelAttribute("reason") String reason) {
			login.setUrl(url);
			login.setReason(reason);
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginSubmit(Login login,
						HttpSession session, Model model) throws Exception{
		try {
			Member member = service.login(login.getUserId(), 
								login.getPassword());
					
			session.setAttribute("USER", member);
			
			String url = login.getUrl();
			if(url!=null && !url.isEmpty()) return "redirect:"+url;
			
			return "redirect:/";
		} catch (LoginFailException e) {
		
			model.addAttribute("error", e.getMessage());			
			return "account/login";
		}	
	}

	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinForm(Member member) {}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinSubmit(@Valid Member member, 
				BindingResult result,
				@RequestParam("avata") MultipartFile mFile,
				RedirectAttributes ra) throws Exception{
		if(result.hasErrors()) {	// �쑀�슚�꽦 寃��궗 �떎�뙣
			return "account/join";
		}		
		service.join(member);		
		// �븘諛뷀� ���옣 
		if(mFile != null && !mFile.isEmpty()) {
			service.insertAvata(new Avata(member.getUserId(), 
										mFile.getBytes()));
		}

		ra.addFlashAttribute("member", member);	
		return "redirect:/account/join_success";			
	}	
	
	// id 以묐났 泥댄겕
	// json �옄�룞 蹂��솚 - gson �쓽議댁꽦 異붽� 
	@RequestMapping(value="/idcheck", method=RequestMethod.GET)
	@ResponseBody
	public String checkUserId(
			@RequestParam("userId") String userId) throws Exception {
		return service.idcheck(userId);
	}
	
	@RequestMapping(value="/join_success", method=RequestMethod.GET)
	public void checkUserId() throws Exception {
	}
	
}





