package com.kh.danim.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.admin.model.service.AdminService;
import com.kh.danim.admin.model.vo.Admin;
import com.kh.danim.contact.model.service.ContactService;
import com.kh.danim.contact.model.vo.Contact;
import com.kh.danim.helpcenter.model.service.HelpCenterService;
import com.kh.danim.helpcenter.model.vo.HelpCenter;
import com.kh.danim.notice.model.service.NoticeService;
import com.kh.danim.notice.model.vo.Notice;
import com.kh.danim.user.model.service.UserService;
import com.kh.danim.user.model.vo.User;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	HelpCenterService helpcenterService;
	
	@Autowired
	ContactService contactService;
	
	@RequestMapping("admin.do")
	public String AdminIndexMethod() {
		return "admin/adminIndex";
	}
	
	@RequestMapping("adminHome.do")
	public String AdminMainPageMethod() {
		return "admin/adminMainPage";
	}
	
	@RequestMapping("adminLogin.do")
	public String adminLoginMethod(Admin admin, HttpSession session) {
		String link = "admin/adminMainPage";
		
		Admin loginAdmin = adminService.selectAdmin(admin.getAdminid());
		
		if(loginAdmin == null)
			link = "admin/adminIndex";
		else
			session.setAttribute("loginAdmin", loginAdmin);
		return link;
	}
	
//	@RequestMapping("countUsers.do")
//	public int countAllUsersMethod() {
//		int result = userService.selectAllUsers();
//	
//		System.out.println(result);
//		return result;
//		 
//	}
	
	@RequestMapping("countUsers.do")
	public void countAllUsersMethod(HttpServletResponse response) throws IOException {
		String result = Integer.toString(userService.selectAllUsers());
		PrintWriter out = response.getWriter();
		
		out.write(result);
		out.flush();
		out.close();
	}
	
	@RequestMapping("adminUsers.do")
	public ModelAndView AdminUsersMethod(@RequestParam(name="page", required=false) String page, ModelAndView mv){
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징
		int limit = 10;
		int listCount = adminService.getListCount(); // 총 목록 갯수
		
//		logger.info("listCount : " + listCount + ", currentPage : " + currentPage);
		
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
		
//		System.out.println(startRow + ", " + endRow);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Notice> list = adminService.selectList(map);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("admin/adminUsers");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}
		
 		return mv;
		
	}
	
	@RequestMapping("userDetail.do")
	public ModelAndView AdminUserDetailMethod(@RequestParam("userid") String userid, ModelAndView mv) {
		User user = userService.selectUser(userid);
		
		mv.addObject("user",user);
		mv.setViewName("admin/adminUserDetail");
		
		return mv;
	}
	
	@RequestMapping("addBlack.do")
	public String AdminAddBlackMethod(@RequestParam("userid") String userid) {
		String link = "redirect:adminUsers.do";
		
		int result = userService.addBlack(userid);
		
//		System.out.println(result);
		
		if(result <= 0)	
			link = "common/error";
		
		return link;
	}
	
	@RequestMapping("delBlack.do")
	public String AdminDelBlackMethod(@RequestParam("userid") String userid) {
		String link = "redirect:adminUsers.do";
		
		int result = userService.delBlack(userid);
		
		if(result <= 0)
			link = "common/error";
		
		return link;
	}
	
	
	@RequestMapping("adminNotice.do")
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
			mv.setViewName("admin/adminNotice");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}
		
 		return mv;
		
	}
	
	@RequestMapping(value="adminNoticeDetail.do", method=RequestMethod.GET)
	public ModelAndView adminNoticeDetailMethod(@RequestParam("noticenum") int noticeno, ModelAndView mv) {
		
		Notice notice = noticeService.noticeDtail(noticeno);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.setViewName("admin/adminNoticeDetail");
		} else {
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@RequestMapping("adminNoticeDelete.do")
	public void adminNoticeDeleteMethod(@RequestParam("noticeno") int noticeno, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		String code = "100"; // success
		
		int result = noticeService.deleteNotice(noticeno);
		
		if(result <= 0)
			code = "900";
		
		out.write(code);
		out.flush();
		out.close();
	}
	
	@RequestMapping("adminNoticeInsertView.do")
	public String adminNoticeInsertViewMethod() {
		String link = "admin/adminNoticeInsert";
		
		return link;
	}
	
	@RequestMapping("adminNoticeInsert.do")
	public String adminNoticeInsertMethod(@RequestParam("noticetitle") String noticetitle, @RequestParam("noticecontent") String noticecontent){
		
		String link = "redirect:adminNotice.do";
		
		Notice notice = new Notice();
		
		notice.setNoticetitle(noticetitle);
		notice.setNoticecontent(noticecontent);
		
		int result = noticeService.insertNotice(notice);
		
		if(result <= 0)
			link = "common/error";
		
		return link;
		
	}
	
	@RequestMapping("adminNoticeUpdateView.do")
	public ModelAndView adminNoticeUpdateViewMethod(@RequestParam("noticeno") int noticeno, ModelAndView mv) {
		
		Notice notice = noticeService.noticeDtail(noticeno);
		
		mv.addObject("notice", notice);
		mv.setViewName("admin/adminNoticeUpdate");
		
		return mv;
	}
	
	@RequestMapping("adminNoticeUpdate.do")
	public String adminNoticeUpdateMethod(@RequestParam("noticeno") int noticeno, @RequestParam("noticetitle") String noticetitle, @RequestParam("noticecontent") String noticecontent) {
		String link = "redirect:adminNotice.do";
		
		Notice notice = new Notice();
		
		notice.setNoticeno(noticeno);
		notice.setNoticecontent(noticecontent);
		notice.setNoticetitle(noticetitle);
		
		
		
		int result = noticeService.updateNotice(notice);
		
		if(result <= 0)
			link = "common/error";
		
		
		return link;
	}
	
	@RequestMapping("adminHelpCenter.do")
	public ModelAndView MyCenterViewMethod(@RequestParam("page") String page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징
		int limit = 10;
		int listCount = helpcenterService.getAdminListCount(); // 총 목록 갯수
		
		
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
		
		List<HelpCenter> list = helpcenterService.adminSelectList(map);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("admin/adminHelpCenter");
		} else {
			mv.setViewName("common/empty");
		}
 		return mv;
	}
	
	@RequestMapping("adminContact.do")
	public ModelAndView adminContactListMethod(@RequestParam("page") String page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징
		int limit = 10;
		int listCount = contactService.getAdminListCount(); // 총 목록 갯수
		
		
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
		
		List<HelpCenter> list = contactService.adminSelectList(map);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("admin/adminContact");
		} else {
			mv.setViewName("common/empty");
		}
 		return mv;
	}
	
	@RequestMapping("adminHelpCenterDetail.do")
	public ModelAndView adminHelpCenterDetailMethod(@RequestParam("helpcenterno") int helpcenterno, ModelAndView mv) {
		HelpCenter hc = helpcenterService.selectOne(helpcenterno);
		
		mv.addObject("helpcenter",hc);
		mv.setViewName("admin/adminHelpCenterDetail");
		
		return mv;
	}
	
	@RequestMapping("adminContactDetail.do")
	public ModelAndView adminContactDetailMethod(@RequestParam("contactno") int contactno, ModelAndView mv) {
		Contact con = contactService.selectOne(contactno);
		
		mv.addObject("contact",con);
		mv.setViewName("admin/adminContactDetail");
		
		return mv;
	}
	
	@RequestMapping("adminHelpCenterAnswer.do")
	public String adminHelpCenterAnswerMethod(@RequestParam("helpcenterno") int helpcenterno) {
		String link = "redirect:adminHelpCenter.do?page=1";
		
		int result = helpcenterService.adminAnswer(helpcenterno);
		
		if(result <= 0)
			link = "common/error";
		
		return link;
	}
	
	@RequestMapping("adminContactAnswer.do")
	public String adminContactAnswerMethod(@RequestParam("contactno") int contactno) {
		String link = "redirect:adminContact.do?page=1";
		
		int result = contactService.adminAnswer(contactno);
		
		if(result <= 0)
			link = "common/error";
		
		return link;
	}
}





















