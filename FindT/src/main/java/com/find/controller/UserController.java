package com.find.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.find.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping("login")
	public ModelAndView Login(HttpSession session, ModelAndView mv) {
		
		
		return mv;
	}
	
	@RequestMapping("index")
	public ModelAndView IndexMethod(HttpSession session, ModelAndView mv) {

		mv.setViewName("contents/index");
		
		return mv;
	}
	
	
}





















