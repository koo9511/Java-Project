package com.kh.danim.notice.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.notice.model.service.NoticeService;
import com.kh.danim.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("noticeForm.do")
	public ModelAndView noticeListMethod(@RequestParam(name="page", required=false) String page, ModelAndView mv) {
		
		logger.info("page : " + page);
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징
		int limit = 10;
		int listCount = noticeService.getListCount(); // 총 목록 갯수
		
		logger.info("listCount : " + listCount + ", currentPage : " + currentPage);
		
		//페이지 수 계산
		int maxPage = (int)((double)listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int)((double)currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		System.out.println(startRow + ", " + endRow);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Notice> list = noticeService.selectList(map);
	
		System.out.println("공지 갯수 : " + list.size());
		
		
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("notice/Notice");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}
		
 		return mv;
		
	}
	
	
	@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView noticeDetailMethod(@RequestParam("noticenum") int noticeno, ModelAndView mv) {
		
		
		
		Notice notice = noticeService.noticeDtail(noticeno);
		
		if(notice != null) {
			mv.addObject("notice",notice);
			mv.setViewName("notice/NoticeDetail");
		} else {
			mv.setViewName("common/error");
		}
		
		return mv;
	}
}
