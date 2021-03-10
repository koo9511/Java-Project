package com.kh.danim.key.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.danim.key.model.service.EmailKeyService;
import com.kh.danim.key.model.vo.EmailKey;

@Controller
public class EmailKeyController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailKeyController.class);
	
	@Autowired
	private EmailKeyService keyService;
	
	@RequestMapping("keyCheck.do")
	public void keyCheckMethod(@RequestParam("key") String key, HttpServletResponse response) throws IOException {
		
		String code = "900";
		
		logger.info("이메일 인증번호 체크중..");
		
		
		String result = "900";
		PrintWriter out = response.getWriter();
		
		if(keyService.keyCheck(key) != null) {
			result = keyService.keyCheck(key).getKey();
			if(result.equals(key))
				code = "100";
		} else {
			code = "200";
		}
		
		out.write(code);
		out.flush();
		out.close();
		
			
	}
	
	@RequestMapping("keyDelete.do")
	public void keyDeleteMethod(@RequestParam("key") String key) {
		keyService.keyDelete(key);
	}
	
	
	
}
