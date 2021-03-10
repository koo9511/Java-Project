package com.kh.danim.contact.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.danim.contact.model.service.ContactService;
import com.kh.danim.contact.model.vo.Contact;

@Controller
public class ContactController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

	
	@Autowired
	private ContactService conService;
	
	@RequestMapping(value="contact.do",method=RequestMethod.POST)
	public String contactMethod(Contact contact, Model model) {
		String link = "contact";
		
		int result = conService.contactSend(contact);
		
		if(result <= 0) {
			model.addAttribute("message","문의전송실패");
			link = "common/error";
		}
		return link;
	}
}
