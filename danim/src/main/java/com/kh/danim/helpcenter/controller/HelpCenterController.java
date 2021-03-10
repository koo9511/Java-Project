package com.kh.danim.helpcenter.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.helpcenter.model.service.HelpCenterService;
import com.kh.danim.helpcenter.model.vo.HelpCenter;

@Controller
public class HelpCenterController {
	
	@Autowired
	private HelpCenterService helpcenterService;
	
	@RequestMapping(value="helpcenterInsert.do", method=RequestMethod.POST)
	public String helpCenterInsert(@RequestParam("helpcategori") String helpcategori,
			@RequestParam("helpuserid") String helpuserid, @RequestParam("helptitle") String helptitle,
			@RequestParam("helpcontent") String helpcontent) {
		
		HelpCenter helpcenter = new HelpCenter();
		
		helpcenter.setHelpcategory(helpcategori);
		helpcenter.setHelpuserid(helpuserid);
		helpcenter.setHelptitle(helptitle);
		helpcenter.setHelpcontent(helpcontent);
		
		String link = "helper/userindex";
	
		int result = helpcenterService.helpcenterInsert(helpcenter);
		
		if(result <= 0)
			link = "common/error";
		
		return link;
		
	}
	
	@RequestMapping("mycenter.do")
	public ModelAndView MyCenterViewMethod(@RequestParam("userid") String userid, @RequestParam("page") String page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징
		int limit = 10;
		int listCount = helpcenterService.getListCount(userid); // 총 목록 갯수
		
		
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
		map.put("userid", userid);
		
		List<HelpCenter> list = helpcenterService.selectList(map);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("mycenter");
		} else {
			mv.setViewName("common/empty");
		}
 		return mv;
	}
	
	@RequestMapping("helpcenterDetail.do")
	public ModelAndView helpcenterDetailViewmethod(@RequestParam("helpcenterno") int helpcenterno, ModelAndView mv) {
		
		HelpCenter hc = helpcenterService.selectOne(helpcenterno);
		
		mv.addObject("helpcenter", hc);
		mv.setViewName("mycenterDetail");
		
		return mv;
	}
}


















