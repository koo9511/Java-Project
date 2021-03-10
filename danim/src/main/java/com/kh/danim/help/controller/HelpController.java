package com.kh.danim.help.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.help.model.service.HelpService;
import com.kh.danim.help.model.vo.Help;
import com.kh.danim.page.Page;
import com.kh.danim.user.model.vo.User;

@Controller
public class HelpController {
	private static final Logger logger = LoggerFactory.getLogger(HelpController.class);
	
	@Autowired
	private HelpService helpService;

	
	
	
	@RequestMapping("insertview.do")
	public String insertView() {
		return "help/insertview";
	}
		
	//파일저장메소드
	@RequestMapping(value = "insertdanim.do", method = RequestMethod.POST)
	public String insertHelp(Help help, HttpServletRequest request, MultipartHttpServletRequest mtp) throws ParseException, IllegalStateException, IOException {
		List<MultipartFile> list = mtp.getFiles("images[]");
		String path = request.getSession().getServletContext().getRealPath("/resources/upfiles");
		String rfilename = "";
		String ofile = "";
		String rfile = "";
		String[] str1 = help.getRoadaddress().split("\\s");
		help.setLocgroup(str1[0]);
		
		 
		
		
		//제한시간설정
		Date date = new Date();
		Calendar cal = Calendar.getInstance(); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		if(help.getEndtime().equals("예약")) {
			
			Date reserdate = new SimpleDateFormat("yyyy-MM-dd").parse(help.getReserdate());
			Date resertime = new SimpleDateFormat("HH:mm").parse(help.getResertime());
			cal.setTime(reserdate);
			cal.add(Calendar.HOUR, resertime.getHours());
			cal.add(Calendar.MINUTE, resertime.getMinutes());
			help.setTime(format.format(cal.getTime()));
		}else {
			
			cal.setTime(date);
			if(help.getEndtime().equals("오늘 이내")) {
				cal.add(Calendar.DATE, 1);
				cal.set(Calendar.HOUR, 00);
				cal.set(Calendar.MINUTE, 00);
				help.setTime(format.format(cal.getTime()));
				
			}else {
				if(help.getEndtime().equals("3시간 이내")) {
					String settime="03:00";
					Date newdate = new SimpleDateFormat("HH:mm").parse(settime);
					cal.add(Calendar.HOUR, newdate.getHours());
					help.setTime(format.format(cal.getTime()));
				}else if(help.getEndtime().equals("1시간 이내")) {
					String settime="01:00";
					Date newdate = new SimpleDateFormat("HH:mm").parse(settime);
					cal.add(Calendar.HOUR, newdate.getHours());
					help.setTime(format.format(cal.getTime()));
				}
			}
		}
		
		
		for (MultipartFile multipartFile : list) {
			if(!multipartFile.isEmpty()) {
				rfilename=System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
				rfile += rfilename+",";
				ofile += multipartFile.getOriginalFilename() + ",";
				
				
					multipartFile.transferTo(new File(path +"\\" + rfilename));
				
				help.setImage(ofile);
				help.setRenameimage(rfile);
			}
		}
		int result = helpService.insertHelp(help);
		String str="";
		if(result>0) {
			str = "redirect:userChange.do";
		}else {
			str = "common/error";
		}
		
		return str;
	}
	
	//좌표저장용 메소드
	@RequestMapping("helplistready.do")
	public void helplistready(@RequestParam("lat") String lat, @RequestParam("lng") String lng, HttpSession session, HttpServletResponse response) {
		session.setAttribute("lat", lat);
		session.setAttribute("lng", lng);
		try {
			response.sendRedirect("helplist.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//일정한 거리에 등록된 요청을 리스트 하는 메소드
		@RequestMapping("helplist.do")
		public ModelAndView selectHelpList(ModelAndView mv, @RequestParam(name="searchname", required=false) String searchname, Help help
				, @RequestParam(name="page", required=false) String page, @RequestParam(name="searchcate",required=false) String searchcate
				, HttpSession session) {
			User loginuser = (User) session.getAttribute("loginUser");
			String loginid = loginuser.getUserid();
			String lat = session.getAttribute("lat").toString();
			String lng = session.getAttribute("lng").toString();
			
			logger.info("lat : " + lat + ", lng : " + lng + ", loginid : " + loginid);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("helpid", loginid);
			map.put("lat", lat);
			map.put("lng", lng);
			mv.addObject("allcount", helpService.listCount(map));
			if(searchname!=null)
				map.put("searchname", "%"+searchname+"%");
			if(searchcate!=null)
				map.put("searchcate", searchcate);
			
			List<Help> helplist = helpService.selectHelpList(map);
			
			int money = helpService.howMuch(loginid);
			mv.addObject("money",money);
			
			
			String[] tuijian= new String[] {"JAVA","개발자","애완동물","서울","심부름","배달","마동석"};
			
			Help helpCount = helpService.helpCount(map);
			
			if(searchname!=null)
			mv.addObject("searchname", searchname);
			if(searchcate!=null)
			mv.addObject("searchcate",searchcate);
			mv.addObject("tuijian", tuijian);
			mv.addObject("helpcount",helpCount);
			mv.addObject("helplist",helplist);
			mv.setViewName("help/danimindex");
			
			
			return mv;
		}
		
	

	//help의 상세페이지
	@RequestMapping("helpdetail.do")
	public ModelAndView selectOneHelp(ModelAndView mv, HttpServletRequest request, @RequestParam("helpno") int helpno, HttpSession session) {
		//primarykey인 helpno 로 검색하여 등록되어있는 Help객체를 가져옴
		User user = (User) session.getAttribute("loginUser");
		String userid = user.getUserid();
		
		Help help = helpService.selectOneHelp(helpno);
		
		//매칭이 이뤄진 (현재진행중인 매칭) 카운트
		int matchingCount = helpService.matchingCount(userid);
		
		if(help.getRenameimage()!=null) {
			String path = request.getSession().getServletContext().getRealPath("resorces/upfiles");
			String renamedfile[] = help.getRenameimage().split(",");
			
			String ofile[] = help.getImage().split(",");
			File file[] = new File[renamedfile.length];
			
			for(int i = 0;  i < file.length; i++) {
				String downFilePath = "/danim/resources/upfiles\\" + renamedfile[i];
				File downFile = new File(downFilePath);
				file[i] = downFile;
			}
			
			logger.info(help.toString());
			
			mv.addObject("rname", file);
			mv.addObject("oname", ofile);
		}
		
		if(help.getHelperlist()!=null) {
			String[] helplist = help.getHelperlist().split(",");
			mv.addObject("helplist", helplist);
		}
		
		int money = helpService.howMuch(userid);
		mv.addObject("money",money);
		
		
		mv.addObject("matchingcount", matchingCount);
		mv.addObject("helpdetail", help);
		mv.setViewName("help/helpdetail");
		
		
		return mv;
		
	}
	
			

	@RequestMapping("helpupdateview.do")
	public ModelAndView helpUpdateView(ModelAndView mv, HttpServletRequest request, @RequestParam("helpno") int helpno) {
		
		Help help = helpService.selectOneHelp(helpno);
		
		if(help.getRenameimage()!=null) {
			String path = request.getSession().getServletContext().getRealPath("resorces/upfiles");
			String renamedfile[] = help.getRenameimage().split(",");
			String ofile[] = help.getImage().split(",");
			File file[] = new File[renamedfile.length];
			
			for(int i = 0;  i < file.length; i++) {
				String downFilePath = "/danim/resources/upfiles\\" + renamedfile[i];
				File downFile = new File(downFilePath);
				file[i] = downFile;
			}
			
			
			mv.addObject("rname", file);
			mv.addObject("oname", ofile);
		}
		
		int money = helpService.howMuch(help.getHelpid());
		mv.addObject("money",money);
		
		mv.addObject("helpupdate", help);
		mv.setViewName("help/helpupdateview");
		
		
		return mv;
	}
	
	@RequestMapping("helpupdate.do")
	public String helpUpdate(Help help, HttpServletRequest request, MultipartHttpServletRequest mtp, @RequestParam("helpno") int helpno) throws IllegalStateException, IOException {
		List<MultipartFile> list = mtp.getFiles("images[]");
		String path = request.getSession().getServletContext().getRealPath("/resources/upfiles");
		String fileRename = "";
		String ofile = "";
		String rfile = "";
		String[] str1 = help.getRoadaddress().split("\\s");
		help.setLocgroup(str1[0]);
		/*HashMap<String, Object> map = new HashMap<String, Object>();*/
		help.setHelpno(helpno);
		
		for (MultipartFile multipartFile : list) {
			if(!multipartFile.isEmpty()) {
				fileRename = help.getHelpno()+"_"+ System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
				ofile += multipartFile.getOriginalFilename() + ",";
				rfile += fileRename + ",";
				
					multipartFile.transferTo(new File(path +"\\" + fileRename));
				
				help.setImage(ofile);
				help.setRenameimage(rfile);
			}
		}
		int result = helpService.helpUpdate(help);
		String str="";
		if(result>0) {
			str = "redirect:userChange.do";
		}
		
		return str;
	}
	
	@RequestMapping("helpdelete.do")
	public String helpDelete(@RequestParam("helpno") int helpno) {
		
		int result = helpService.helpDelete(helpno);
		if(result>0) {
			return "redirect:helplist.do";
		}else {
			return "common/error";
		}
		
	}
	
	@RequestMapping("helpmatching.do")
	public String helpMatching(@RequestParam("helpno")int helpno,HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("loginUser");
		String userid = user.getUserid();
		
		map.put("helpno", helpno);
		int result=0;
		
		
		map.put("helperid", userid);
		helpService.openChat(map);
		result = helpService.setHelperId(map);
		
		String returnResult="";
		if(result>0)
			returnResult = "help/matchingcontinue";
		else {
			returnResult = "common/error";
		}
		
		return returnResult;
	}
	
	@RequestMapping("matchingstarthelper.do")
	public ModelAndView matchingStartHelper(ModelAndView mv, @RequestParam("helpno")int helpno, @RequestParam("userid")String userid, HttpServletRequest request) {
		
		Help help = new Help();
		help = helpService.selectOneHelp(helpno);
		
		mv.addObject("help", help);
		
		if(help.getRenameimage()!=null) {
			
			String renamedfile[] = help.getRenameimage().split(",");
			String ofile[] = help.getImage().split(",");
			File file[] = new File[renamedfile.length];
			
			for(int i = 0;  i < file.length; i++) {
				String downFilePath = "/danim/resources/upfiles\\" + renamedfile[i];
				File downFile = new File(downFilePath);
				file[i] = downFile;
			}
			
			int money = helpService.howMuch(help.getHelperid());
			mv.addObject("money",money);
			
			mv.addObject("rname", file);
			mv.addObject("oname", ofile);
		}
		mv.setViewName("help/matchingstarthelper");
		return mv;
	}
	
	@RequestMapping("matchingstarthelp.do")
	public ModelAndView matchingStartHelp(ModelAndView mv, @RequestParam("helpno")int helpno, @RequestParam("userid")String userid, HttpServletRequest request) {
		Help help = new Help();
		help = helpService.selectOneMatching(helpno);
		
		
		
		mv.addObject("help", help);
		
		if(help.getRenameimage()!=null) {
			
			String renamedfile[] = help.getRenameimage().split(",");
			String ofile[] = help.getImage().split(",");
			File file[] = new File[renamedfile.length];
			
			for(int i = 0;  i < file.length; i++) {
				String downFilePath = "/danim/resources/upfiles\\" + renamedfile[i];
				File downFile = new File(downFilePath);
				file[i] = downFile;
			}
			
			int money = helpService.howMuch(userid);
			mv.addObject("money",money);
			
			mv.addObject("rname", file);
			mv.addObject("oname", ofile);
		}
		mv.setViewName("help/matchingstarthelp");
		return mv;
	}
	
	@RequestMapping("helpafterdelete.do")
	public void helpAfterDelete() {
		helpService.helpAfterDelete();
	}
	
	@RequestMapping("cancelstatus.do")
	public void cancelStatus(@RequestParam(name="id",required=false)String id, @RequestParam(name="helpno",required=false)int helpno, HttpServletResponse response) throws IOException {
		String cancelstatus = helpService.cancelStatus(helpno);
		logger.info("cancelstatus에 저장되어있는 값 : " + cancelstatus);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String str ="";
		
		logger.info("내아이디 : " + id);
		if(cancelstatus == null) {
			str+="A";
		}else if(cancelstatus.equals(id)) {
			//본인이들어있을경우
			str+="B";
		}else { 
			//상대방이들어있을경우
			str+="C";
		}
		out.write(str);
		out.flush();
		out.close();

		logger.info("이것이 str : " + str);
	}

	@RequestMapping("cancelstatusupdate.do")
	public void cancelStatusUpdate(@RequestParam(name="id",required=false)String id, @RequestParam(name="helpno",required=false)int helpno, HttpServletResponse response) throws IOException {
		HashMap<String,Object> map = new HashMap<String, Object>();
		String cancelstatus = helpService.cancelStatus(helpno);
		logger.info("cancelstatus에 저장되어있는 값 : " + cancelstatus);
		
		String str ="";
		map.put("helpno", helpno);

		if(cancelstatus == null) {
			map.put("status", id);
		}else { 
			map.put("status",null);
			//상대방이들어있을경우
		}
		helpService.cancelStatusUpdate(map);
		
		logger.info("이것이 str : " + str);
	}
	
	@RequestMapping("matchingstatus.do")
	public void matchingStatus(@RequestParam(name="id",required=false)String id, @RequestParam(name="helpno",required=false)int helpno, HttpServletResponse response) throws IOException {
		String matchingstatus = helpService.matchingStatus(helpno);
		logger.info("matchingstatus에 저장되어있는 값 : " + matchingstatus);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String str ="";
		
		
		if(matchingstatus == null) {
			str+="A";
		}else if(matchingstatus.equals(id)) {
			//본인이들어있을경우
			str+="B";
		}else { 
			//상대방이들어있을경우
			str+="C";
		}
		out.write(str);
		out.flush();
		out.close();
		
		logger.info("이것이 str : " + str);
	}

	
	@RequestMapping("matchingstatusupdate.do")
	public void matchingStatusUpdate(@RequestParam(name="id",required=false)String id, @RequestParam(name="helpno",required=false)int helpno
			, HttpServletResponse response) throws IOException {
		HashMap<String,Object> map = new HashMap<String, Object>();
		String matchingstatus = helpService.matchingStatus(helpno);
		logger.info("matchingstatus에 저장되어있는 값 : " + matchingstatus);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String str ="";
		map.put("helpno", helpno);
		
		//A:null이었다 B:내가이미 완료신청했다 C:상대가이미 완료신청했다
		if(matchingstatus == null) {
			logger.info(id);
			map.put("status", id);
			logger.info("돼..됐냐?!!?");
			helpService.matchingStatusUpdate(map);
			
			str+="A";
			logger.info("널이지만 : " + str);
		}else{
			//cancelstatus의값이 널이아니면
			map.put("status",null);
			helpService.matchingStatusUpdate(map);
			if(matchingstatus.equals(id))
				str+="B";
			else 
				str+="C";
			logger.info("널이아니지만 : " + str);
		}
		logger.info("str : " + str);
		out.write(str);
		out.flush();
		out.close();

		logger.info("이것이 str : " + str);
	}
	
	@RequestMapping("removehelperid.do")
	public String removeHelperId(@RequestParam("helpno")int helpno) {
		
		int result = helpService.removeHelperId(helpno);
		
		return "redirect:helperlist.do";
	}
	
	@RequestMapping("updatestatustofinal")
	public String updateStatusToFinal(@RequestParam("helpno")int helpno) {
		int result = helpService.updateStatusToFinal(helpno);
		
		return "redirect:helperlist.do";
	}
	
	
	//helplist에 있는 대기자들중 한명을 helper로 지정하는메소드
	@RequestMapping("selecthelplist.do")
	public String updateHelpListToHelperId(@RequestParam("id")String id,@RequestParam("helpno")int helpno){
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("helpno", helpno);
		map.put("id", id);
		int result = helpService.updateHelpListToHelperId(map);
		String str ="";
		if (result<=0) {
			str+="common/error";
		}else {
			str+="";
		}
		
		return str;
	}
	
	@RequestMapping("intohelplist.do")
	public void intoHelpList(@RequestParam("helpno")int helpno, HttpSession session, HttpServletResponse response) throws IOException {
		
		User user = (User)session.getAttribute("loginUser");
		String userid = user.getUserid();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String str = helpService.getHelperList(helpno);
		logger.info(str);
		String result="A";
		if(str!=null) {
			String[] helplist = str.split(",");
			for (String string : helplist) {
				if(string.equals(userid)) 
					result="B";
			}
		}
		logger.info("결과 : " + result);
		out.write(result);
		out.flush();
		out.close();
	}
	
	@RequestMapping("updatehelplist.do")
	public void updateHelpList(@RequestParam("helpno")int helpno, HttpSession session, @RequestParam("command")String command, HttpServletResponse response) throws IOException {
		User user = (User)session.getAttribute("loginUser");
		String userid = user.getUserid();
		HashMap<String,Object> map = new HashMap<String, Object>();
		String str = helpService.getHelperList(helpno);
		logger.info("++++++++++++++ : " + str);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HashMap<String,Object> map2 = new HashMap<String,Object>();
		String helplist=null;
		if(command.equals("A")) {
			if(str!=null)
				helplist= str + userid+",";
			else
				helplist=userid+",";
			logger.info("updatehelplist - A : " + helplist);
		}else {
			String[] list;
			list = str.split(",");
			for (String string : list) {
				if(string.equals(userid)) {
					helplist+="";
				}else {
					helplist+=string+",";
				}
			}
			logger.info("updatehelplist - B : " + helplist);
		}
		
		logger.info("꺼낸 helplist : " + helplist);
		
		
		map.put("helpno", helpno);
		map.put("helperlist", helplist);
		helpService.setHelperList(map);
		
		out.flush();
		out.close();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("paginghelp.do")
	@ResponseBody
	public void pagingHelp(@RequestBody String param, HttpServletResponse response, HttpSession session, ModelAndView mv) throws IOException, ParseException, org.json.simple.parser.ParseException {
		User user = (User)session.getAttribute("loginUser");
		String loginid = user.getUserid();
		String lat = session.getAttribute("lat").toString();
		String lng = session.getAttribute("lng").toString();
		
		JSONParser jparser = new JSONParser();
		JSONObject object = (JSONObject)jparser.parse(param);
		String searchname=null;
		String searchcate=null;
		if(object.get("searchname")!=null)
			searchname = object.get("searchname").toString();
		if(object.get("searchcate")!=null)
			searchcate = object.get("searchcate").toString();
		logger.info("page : " + object.get("current")+", cate : " + object.get("searchcate") + ", name : " + object.get("searchname"));
		String page=null;
		if(object.get("current")!=null)
			page =object.get("current").toString();
		
		logger.info("lat : " + lat + ", lng : " + lng + ", loginid : " + loginid);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helpid", loginid);
		map.put("lat", lat);
		map.put("lng", lng);
		if(searchname!=null)
			map.put("searchname", "%"+searchname+"%");
		if(searchcate!=null)
			map.put("searchcate", searchcate);
		
		logger.info(""+map.get("searchname"));
		logger.info(""+map.get("searchcate"));
		//페이징
		int listcount = helpService.listCount(map);
		
		logger.debug("조건에맞는 리스트 갯수 : " + listcount);
		int currentpage = 1;
		if(page!=null) {
			currentpage = Integer.parseInt(page);
		}
		logger.debug("현재 페이지 : " + currentpage);
		int limit = 12; //한페이지당 몇개의 게시글을 보여줄것인가
		int pagelimit = 5; //페이지는 몇개씩 표시하여 직접이동이 가능한가
		Page paging = new Page();
		paging.paging(currentpage, listcount, limit, pagelimit);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		logger.info("페이징 : " + paging.toString());
		
		map.put("startrow", paging.getStartrow());
		map.put("endrow", paging.getEndrow());
		List<Help> helpboardlist = helpService.selectHelpList(map);
		
		for (Help help2 : helpboardlist) {
			logger.debug("help : " + help2.toString());
			help2.setDis(Math.round(help2.getDis()*100)/100.0);
			logger.debug("dis : " + help2.getDis());
		}
		
		JSONObject sendjson = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for (Help help : helpboardlist) {
			JSONObject obj = new JSONObject();

			obj.put("helpno", help.getHelpno());
			obj.put("helptitle", URLEncoder.encode(help.getHelptitle(),"utf-8"));
			obj.put("dis", help.getDis());
			obj.put("category","'"+URLEncoder.encode(help.getCategory(),"utf-8")+"'");
			obj.put("pay", help.getPay());
			
			jarray.add(obj);
		}
		
		sendjson.put("helpboardlist",jarray);
		JSONObject jobj = new JSONObject();
		jobj.put("currentpage",paging.getCurrentpage());
		jobj.put("pagelimit", paging.getPagelimit());
		jobj.put("startpage",paging.getStartpage());
		jobj.put("totalpage", paging.getTotalpage());
		jobj.put("endpage", paging.getEndpage());
		logger.info(paging.getListcount()+"");
		jobj.put("listcount",paging.getListcount());
		
		sendjson.put("page", jobj);
		
		if(searchcate!=null)
		sendjson.put("searchcate", URLEncoder.encode(searchcate,"utf-8"));
		
		if(searchname!=null)
		sendjson.put("searchname", URLEncoder.encode(searchname,"utf-8"));
		
		
		
		out.println(sendjson.toJSONString());
		out.flush();
		out.close();
	
		
	}
	
	
	
}
