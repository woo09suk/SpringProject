package com.example.spring05.controller.main;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring05.model.member.dto.MemberDTO;
import com.example.spring05.service.member.MemberService;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("main/*") //공통적인 url 매핑
public class MainController {
	//로깅을 위한 변수
	private static final Logger logger=
			LoggerFactory.getLogger(MainController.class);
	@Inject
	MemberService memberService;
	
	@RequestMapping("main.do") //세부적인 url 매핑
	public String login() {
		return "main/main"; //login.jsp로 이동
	}//login()

}