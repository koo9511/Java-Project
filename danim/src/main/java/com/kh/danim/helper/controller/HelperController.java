package com.kh.danim.helper.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.helper.model.service.HelperService;
import com.kh.danim.helper.model.vo.Helper;
import com.kh.danim.page.Page;
import com.kh.danim.user.model.vo.User;

@Controller
public class HelperController {
	private static final Logger logger = LoggerFactory.getLogger(HelperController.class);
	
	@Autowired
	private HelperService helperService;
	
	@RequestMapping("inserthelperview")
	public String insertHelperView() {
		return "helper/inserthelper";
	}
	
	@RequestMapping("inserthelper")
	public String insertHelper(Helper helper, HttpServletRequest request, MultipartHttpServletRequest mtp) {
		List<MultipartFile> list = mtp.getFiles("images[]");
		
		String path = request.getSession().getServletContext().getRealPath("/resources/helperupfiles");
		String rfilename="";
		String ofile="";
		String rfile="";
		
		for (MultipartFile multipartFile : list) {
			if(!multipartFile.isEmpty()) {
				rfilename=System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
				rfile+=rfilename+",";
				ofile+=multipartFile.getOriginalFilename()+",";
				try {
					multipartFile.transferTo(new File(path+"\\"+rfilename));
				}catch (Exception e) {
					e.printStackTrace();
				}
				helper.setHelperimage(ofile);
				helper.setHelperrenameimage(rfile);
			}
		}
		int result = helperService.insertHelper(helper);
		String str="";
		if(result>0)
			str="helper/userindex";
		else
			str="common/error";
		return str;
	}
	
	//일정한 거리에 등록된 요청을 리스트 하는 메소드
		@RequestMapping("helperlist.do")
		public ModelAndView selectHelpList(ModelAndView mv, @RequestParam(name="searchname", required=false) String searchname, Help help
				, @RequestParam(name="page", required=false) String page, @RequestParam(name="searchcate",required=false) String searchcate
				, HttpSession session) {
			User loginuser = (User) session.getAttribute("loginUser");
			String loginid = loginuser.getUserid();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("loginid", loginid);
			mv.addObject("allcount",helperService.listCount(map));
			if(searchname!=null)
				map.put("searchname", "%"+searchname+"%");
			if(searchcate!=null)
				map.put("searchcate", searchcate);
			int listcount = helperService.listCount(map);
			
			int currentpage = 1;
			if(page!=null) {
				currentpage = Integer.parseInt(page);
			}
			int limit = 12; //한페이지당 몇개의 게시글을 보여줄것인가
			int pagelimit = 5; //페이지는 몇개씩 표시하여 직접이동이 가능한가
			Page paging = new Page();
			paging.paging(currentpage, listcount, limit, pagelimit);
			logger.info("페이징 : " + paging.toString());
			List<Helper> helperList = helperService.selectHelperList(map);
			for (Helper help2 : helperList) {
				logger.info("helperlist : " + help2.toString());
			}
			map.put("startrow", paging.getStartrow());
			map.put("endrow", paging.getEndrow());
			List<Helper> helperboardlist = helperService.selectHelperList(map);
			Helper helperCount = helperService.helperCount(loginid);
			
			
			String[] tuijian= new String[] {"JAVA","개발자","애완동물","서울","심부름","배달","마동석"};
			
			if(searchname!=null)
			mv.addObject("searchname", searchname);
			if(searchcate!=null)
			mv.addObject("searchcate",searchcate);
			
			int money = helperService.howMuch(loginid);
			mv.addObject("money",money);
			
			mv.addObject("tuijian", tuijian);
			mv.addObject("helperboardlist", helperboardlist);
			mv.addObject("page", paging);
			mv.addObject("helpercount",helperCount);
			mv.addObject("helperlist", helperList);
			mv.setViewName("helper/userindex");
			
			
			return mv;
		}
	
		@RequestMapping("helperdetail.do")
		public ModelAndView helperDetail(@RequestParam("helperno")int helperno, ModelAndView mv, HttpServletRequest request, HttpSession session) {
			
			Helper helper = helperService.helperDetail(helperno);
			
			if(helper.getHelperrenameimage()!=null) {
				String path = request.getSession().getServletContext().getRealPath("resorces/upfiles");
				String renamedfile[] = helper.getHelperrenameimage().split(",");
				
				String ofile[] = helper.getHelperimage().split(",");
				File file[] = new File[renamedfile.length];
				
				for(int i = 0;  i < file.length; i++) {
					String downFilePath = "/danim/resources/helperupfiles\\" + renamedfile[i];
					File downFile = new File(downFilePath);
					file[i] = downFile;
				}
				mv.addObject("rname", file);
				mv.addObject("oname", ofile);
			}
			
			User user = (User)session.getAttribute("loginUser");
			String loginid = user.getUserid();
			
			int money = helperService.howMuch(loginid);
			mv.addObject("money",money);
			
			mv.addObject("helper", helper);
			mv.setViewName("helper/helperdetail");
			
			
			logger.info(helper.toString());
			
			
			
			return mv;
		}
		
		@RequestMapping("helperdelete.do")
		public String helperDelete(@RequestParam("helperno")int helperno) {
			
			int result = helperService.helperDelete(helperno);

			String page="helper/userindex";
			
			if(result<=0) {
				page = "common/error";
			}
			
			return page;
		}
		
		@RequestMapping("helperupdateview.do")
		public ModelAndView helperUpdateView(@RequestParam("helperno") int helperno, ModelAndView mv) {
			
			Helper helper = helperService.helperDetail(helperno);
			logger.info(helper.toString());
			
			int money = helperService.howMuch(helper.getHelperid());
			mv.addObject("money",money);
			
			mv.addObject("helperupdate", helper);
			mv.setViewName("helper/helperupdateview");
		
			return mv;
		}
		
		@RequestMapping("helperupdate.do")
		public String helperUpdate(Helper helper, @RequestParam("helperno")int helperno, MultipartHttpServletRequest mtp, HttpServletRequest request) {
			List<MultipartFile> list = mtp.getFiles("images[]");
			
			String path = request.getSession().getServletContext().getRealPath("/resources/helperupfiles");
			String rfilename="";
			String ofile="";
			String rfile="";
			
			for (MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					rfilename=System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
					rfile+=rfilename+",";
					ofile+=multipartFile.getOriginalFilename()+",";
					try {
						multipartFile.transferTo(new File(path+"\\"+rfilename));
					}catch (Exception e) {
						e.printStackTrace();
					}
					helper.setHelperimage(ofile);
					helper.setHelperrenameimage(rfile);
				}
			}
			
			helper.setHelperno(helperno);
			
			int result = helperService.helperUpdate(helper);
			String str="";
				
			if(result>0)
				str = "redirect:helperdetail.do?helperno=" + helperno;
			else
				str = "common/error";
			
			return str;
		}
	
}
