package com.kh.danim.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.key.model.service.EmailKeyService;
import com.kh.danim.user.model.service.UserService;
import com.kh.danim.user.model.vo.Chatting;
import com.kh.danim.user.model.vo.User;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private UserService userService;


	@Autowired
	private EmailKeyService key;

	@RequestMapping("enrollForm.do")
	public String enrollFormMethod() {
//		logger.info("회원가입 페이지 접속..");
		return "enroll";
	}

	@RequestMapping("loginForm.do")
	public String loginFormMethod() {
//		logger.info("로그인 페이지 접속..");
		return "login";
	}
	
//	@RequestMapping("myinfomodify.do")
//	public String myInfoModifyMethod() {
//		return "myinfomodify";
//	}

//	@RequestMapping("noticeForm.do")
//	public String noticeFormMethod() {
//		logger.info("공지사항 페이지 접속..");
//		return "notice/Notice";
//	}

	@RequestMapping("contactForm.do")
	public String contactFormMethod() {
//		logger.info("문의하기 페이지 접속..");
		return "contact";
	}

	@RequestMapping("danimChange.do")
	public String danimChangeMethod() {
//		logger.info("다님이 페이지 접속..");
		return "help/danimindex";
	}

	@RequestMapping("userChange.do")
	public String userChangeMethod() {
//		logger.info("이용자 페이지 접속..");
		return "helper/userindex";
	}
	
	@RequestMapping("serviceCenter.do")
	public String serviceCenterMethod() {
		return "helpcenter";
	}

//	@RequestMapping("kakaoEnroll.do")
//	public String KakaoEnrollMethod() {
//		logger.info("추가 정보 입력 페이지로 이동..");
//		return "enroll";
//	}
	
	@RequestMapping("logout.do")
	public String logoutMethod(HttpSession kakaosession, HttpServletRequest request) {
//		HttpSession session = request.getSession(false); // Session이 없으면 null 리턴
//		kakaosession.invalidate();
//			session.invalidate();
		kakaosession.invalidate();
		return "index";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(User user, HttpSession session) {
		logger.info("로그인 시도..");
		
//		User loginUser = userService.loginCheck(user);
		User loginUser = userService.selectUser(user.getUserid());
		
		String link = "redirect:helperlist.do";
			if (loginUser != null && bCryptPasswordEncoder.matches(user.getUserpwd(), loginUser.getUserpwd()) == true) {
				if(session.getAttribute("loginstatus") != null)
					session.invalidate();
				session.setAttribute("loginUser", loginUser);
			}
			else {
				session.setAttribute("loginstatus", "fail");
				link = "login";
				}
		return link;
	}
	
	@RequestMapping(value="originalPassCheck.do", method=RequestMethod.POST)
	public void originalPassCheckMethod(@RequestParam("userid") String userid, @RequestParam("originalpass") String userpwd, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String code = "100";
		
		User user = new User();
		user.setUserid(userid);
		user.setUserpwd(userpwd);
		
		User loginUser = userService.selectUser(user.getUserid());
		
		if(loginUser == null || bCryptPasswordEncoder.matches(user.getUserpwd(), loginUser.getUserpwd()) == false)
			code = "900";
		
		out.write(code);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "kakaoLogin.do", method = RequestMethod.POST)
	public void KakaoLoginMethod(@RequestParam("userid") String userid, HttpSession session, HttpServletResponse response) throws IOException {
		logger.info(userid);
		User user = userService.selectUser(userid);
		
		String result = "100";
		
		PrintWriter out = response.getWriter();
		
		
		if(user == null) {
			result = "900";
		}
	
		logger.info(result);
		out.write(result);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "kakaoLoginSuccess.do", method = {RequestMethod.POST, RequestMethod.GET})
	public void kakaoLoginSuccessMethod(@RequestParam("userid") String userid, HttpSession session, HttpServletResponse response) throws IOException {
		
		User loginUser = userService.selectUser(userid);
		response.setContentType("text/html; charset=utf-8");
		
		session.setAttribute("loginUser", loginUser);
		response.sendRedirect("userChange.do");
		
		
		
	}
	
	@RequestMapping(value = "emailSMTP.do", method = RequestMethod.POST)
	public void emailSMTP(@RequestParam("email") String to_email, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("이메일 인증이 시작되었습니다.");

		// mail server 설정
		String host = "smtp.naver.com";
		final String user = "rpfpsrjsah"; // 계정
		final String password = "dkdrjsahEl1!";// 패스워드
		String resultCd = "100";
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		logger.info("이메일 : " + to_email);
		// TODO DB id Check
		// rescultCd = "200"; (중복사용중)

		if (resultCd.equals("100")) {
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			// 인증 번호 생성기 	
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			logger.info("인증번호 : " + AuthenticationKey);

			key.insertKey(AuthenticationKey);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "Danim"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("Danim 인증번호 입니다.");
				// 메일 내용
				msg.setText("인증 번호 : " + temp);

				Transport.send(msg);
			} catch (Exception e) {
				resultCd = "900";
				e.printStackTrace();// TODO: handle exception
			}
		}

		out.write(resultCd);
		out.flush();
		out.close();
	}

	@RequestMapping("nicknameCheck.do")
	public void nicknameCheckMethod(@RequestParam("nickname") String nickname,HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		String code = "100";
		
		User result = userService.nicknameCheck(nickname);
		
		
		if(result != null) 
			code = "900";
		
		
		out.write(code);
		out.flush();
		out.close();
		
	}

	@RequestMapping("phoneCheck.do")
	public void phoneCheckMethod(@RequestParam("phone") String phone,HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		String code = "100";
		
		User result = userService.phoneCheck(phone);
		
		if(result != null) 
			code = "900";
		
		
		out.write(code);
		out.flush();
		out.close();
		
	}
	

	@RequestMapping("idCheck.do")
	public void idCheckMethod(@RequestParam("userid") String userid, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		String code = "100";
		
		User result = userService.idCheck(userid);
		
		if(result != null)
			code = "900";
		
		out.write(code);
		out.flush();
		out.close();
	}
	
	

	
	@RequestMapping(value = "userInsert.do", method = RequestMethod.POST)
	public String userInsertMethod(HttpServletRequest request, User user, Model model, @RequestParam("userid") String userid) {
		
		logger.info("회원 등록중..");
		logger.info(user.getUserid());
		String link = "login";
		
		user.setUserpwd(bCryptPasswordEncoder.encode(user.getUserpwd()));
		
		logger.info(user.getUserpwd());

		int result = userService.insertUser(user);

		if (result <= 0) {
			link = "common/error";
		}

		return link;
	}
	
	
	@RequestMapping(value = "kakaoUserInsert.do", method = RequestMethod.POST)
	public String kakaoUserInsertMethod(HttpServletRequest request, User user, Model model) {
		String link = "login";
		logger.info("카카오 회원 등록중..");
		
		int result = userService.kinsertUser(user);
		
		if(result <= 0) {
			model.addAttribute("message", "카카오 가입실패");
			link = "common/error";
		}
		return link;
	}
	
	@RequestMapping("myPage.do")
	public ModelAndView myPageMethod(@RequestParam("userid") String userid, ModelAndView mv, HttpSession session) {
		
		User user = userService.selectUser(userid);
		
		if(user != null) {
			mv.addObject("user",user);
			mv.setViewName("mypage");
		}
		
		User sessionUser = (User)session.getAttribute("loginUser");
		String sessionId = sessionUser.getUserid();
		
		logger.info("로그인 세션 아이디 : " + sessionId);
		logger.info("파라미터 아이디 : " + userid);
		if(!sessionId.equals(userid)){
			
			mv.addObject("error","error");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@RequestMapping("myPageModify.do")
	public ModelAndView myPageModifyMethod(@RequestParam("userid") String userid, ModelAndView mv, HttpSession session) {
		
		User user = userService.selectUser(userid);

		User sessionUser = (User)session.getAttribute("loginUser");
		String sessionId = sessionUser.getUserid();
		
		logger.info("로그인 세션 아이디 : " + sessionId);
		logger.info("파라미터 아이디 : " + userid);
		if(!sessionId.equals(userid)){
			
			mv.addObject("error","error");
			mv.setViewName("common/error");
		}
		else{
			mv.addObject("user",user);
			mv.setViewName("myinfomodify");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("userPassUpdateView.do")
	public ModelAndView userPassUpdateViewMethod(@RequestParam("userid") String userid, ModelAndView mv, HttpSession session) {
		User user = userService.selectUser(userid);

		User sessionUser = (User)session.getAttribute("loginUser");
		String sessionId = sessionUser.getUserid();
		
		if(!sessionId.equals(userid)){
			
			mv.addObject("error","error");
			mv.setViewName("common/error");
		}
		else{
			mv.addObject("user",user);
			mv.setViewName("passupdate");
		}
		
		return mv;
	}
	@RequestMapping("kakaoEnroll.do")
	public ModelAndView kakaoEnrollMethod(@RequestParam("userid") String userid, @RequestParam("nickname") String nickname, ModelAndView mv) {
		User user = new User();
		user.setUserid(userid);
		user.setNickname(nickname);
		
		mv.addObject("user",user);
		mv.setViewName("kakaoEnroll");
		
		return mv;
	}
	
	@RequestMapping("userUpdate.do")
	public String updateUserMethod(User user, Model model) {
		int result = userService.updateUser(user);
		String link = "mypage";
		
		if(result <= 0) {
			link = "common/error";
			model.addAttribute("message","수정 실패");
		}
		return link;
	}

	@RequestMapping(value = "userPassUpdate.do", method = RequestMethod.POST)
	public String userPassUpdateMethod(@RequestParam("originalpass") String opass, @RequestParam("renamepass") String pass, @RequestParam("userid") String userid, Model model, HttpSession session) {
		String link = "login";
		
		User loginUser = userService.selectUser(userid);
		
		String rpass = bCryptPasswordEncoder.encode(pass);
		
		User user = new User();
		
		user.setUserid(userid);
		user.setUserpwd(rpass);
		
		if(bCryptPasswordEncoder.matches(opass, loginUser.getUserpwd())) {
			int result = userService.userPassUpdate(user);
			if(result <= 0) {
				link = "common/error";
				model.addAttribute("message","비밀번호 변경 실패");
			}
		}else
			session.invalidate();
		return link;
	}
	
	@RequestMapping("serviceStatus.do")
	public ModelAndView seviceStatusViewMethod(@RequestParam("page") String page, @RequestParam("userid") String userid, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		//페이징
		int limit = 10;
		int listCount = userService.getListCount(userid); // 총 목록 갯수
//		int successCount = userService.getsuccessCount(userid);
		
//		logger.info("listCount : " + listCount + ", currentPage : " + currentPage);
		
		//페이지 수 계산
//		int maxPage = (int)((double)listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
//		int startPage = (int)((double)currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
//		int endPage = startPage + limit - 1;
//		
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
		
		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
//		int startRow = (currentPage - 1) * limit + 1;
//		int endRow = startRow + limit - 1;
		
//		System.out.println(startRow + ", " + endRow);
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		map.put("userid", userid);
		
		List<Help> list = userService.selectList1(userid);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
//			mv.addObject("successCount", successCount);
			mv.addObject("listCount",listCount);
//			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
//			mv.addObject("startPage",startPage);
//			mv.addObject("endPage",endPage);
//			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("serviceStatus");
		} 

		
 		return mv;
	}
	
	@RequestMapping("myServiceMore.do")
	public ModelAndView myServiceMoreMethod(@RequestParam("page") String page, @RequestParam("userid") String userid, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		//페이징
		int limit = 10;
		int listCount = userService.getListCount(userid); // 총 목록 갯수
		int successCount = userService.getsuccessCount(userid);
		
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
		map.put("userid", userid);
		
		List<Help> list = userService.selectList(map);
	
		if(list != null && list.size() > 0) {
			mv.addObject("list",list);
			mv.addObject("successCount", successCount);
			mv.addObject("listCount",listCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("limit",limit);
			mv.addObject("page", page);
			mv.setViewName("serviceStatusWaiting");
		} 
		
		return mv;
	}
	
	@RequestMapping("chatting.do")
	public ModelAndView chattingMethod(@RequestParam("helpno") int helpno, ModelAndView mv) {
		
		Help help = userService.selectHelp(helpno);
		Chatting chat = userService.selectChat(helpno);
		
		String lastDate = chat.getchatdate();
//		SimpleDateFormat format = new SimpleDateFormat("ddHH:mm:ss");
		
//		String lastDate = format.format(chat.getChatdate());
		
		
		if(help != null) {
			mv.addObject("help",help);
			mv.addObject("chat",chat);
			mv.addObject("lastDate",lastDate);
			mv.setViewName("chat");
		}
		
		return mv;
	}
	
	@RequestMapping("chatInput.do")
	public void chattingInputMethod(@RequestParam("text") String text,@RequestParam("userid") String userid, @RequestParam("status") String status, 
			@RequestParam("chatno") int chatno, HttpServletResponse response) throws IOException {
		logger.info(userid + " : " + status + " : " + text);
		
		int result=0;
		String reText="";
		
		Chatting originalChat = userService.selectChat(chatno);
		
		if(originalChat.getChatcontent() == null) {
			Chatting chat = new Chatting();
			
			if(status.equals("help")) {
				reText = "1," + text;
			} else if(status.equals("helper")) {
				reText = "2," + text;
			}
			
			chat.setChatcontent(reText);
			chat.setChatno(chatno);
			
			result = userService.inputText(chat);
		}
		else if(originalChat.getChatcontent() != null) {
			
			Chatting reChat = originalChat;
			
			if(status.equals("help")) {
				reText = "1," + text;
				reChat.setChatcontent(reChat.getChatcontent()+","+reText);
			} else if(status.equals("helper")) {
				reText = "2," + text;
				reChat.setChatcontent(reChat.getChatcontent()+","+reText);
			}
			
			result = userService.updateText(reChat);
			
			
		}
		
		PrintWriter out = response.getWriter();
		String code = "100";
		
		if(result <= 0)
			code = "900";
		
		out.write(code);
		out.flush();
		out.close();		
		
	}
	
	@RequestMapping("contentCheck.do")
	public void contentCheckMethod(@RequestParam("chatno") int chatno, @RequestParam("lastdate") String lastdate, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		String code = "";
		
		Chatting chat = new Chatting();
		
		
		
//		SimpleDateFormat format = new SimpleDateFormat("dd/HH:mi:ss") ;
		
		
		chat.setChatno(chatno);
		chat.setChatcontent(lastdate);
		
		System.out.println(lastdate);
		
		int result = userService.contentCheck(chat);
		
		if(result <= 0)
			code = "900";
		else if(result > 0)
			code = "100";
		
		out.write(code);
		out.flush();
		out.close();	
		
	}
	
//	@ResponseBody
//	@RequestMapping(value = "read.do", method = {RequestMethod.POST, RequestMethod.GET})
//	public String chatting(String lastDate){
//	    Gson gson = new Gson();
//	     
//	    ArrayList<Emp> chatList = empService.chatList(lastDate);
//	     
//	    return gson.toJson(chatList);
//	}
	
	//남규쓰  nkevent 로 event컬럼 값 보내주기
	   @RequestMapping("nkevent.do")
	   public ModelAndView momo(@RequestParam("userid")String userid, ModelAndView mv) {
	      /*ArrayList<String>list = new ArrayList<String>();*/
	      System.out.println("UserController.nkevent.do userid : " + userid);
	      User user = userService.searchevent(userid);
	      String a = user.getEvent();
	      logger.info("UserController.nkevent.do a : " + a);
	      List<String> list = new ArrayList<String>();
	      logger.info("UserController.nkevent.do list : " + list.toString());
	      if(a != null) {
	      String[] b = a.split(",");
	      list = Arrays.asList(b);
	      logger.info("UserController.nkevent.do list : " + list.toString());
	      }
	      
	      
	      
	      String temp = null;
	      if(!list.isEmpty()) {
	         temp = list.get(list.size() -1);
	      }
	      System.out.println("UserController.nkevent.do temp : " + temp);
	      mv.addObject("list", a);
	      mv.addObject("temp", temp);
	      mv.setViewName("nkevent");
	      
	      return mv;
	   }
	   
	   //남규쓰 nkevent 에서 event컬럼으로 값 보내주기
	   @RequestMapping("updateEvent.do")
	   public void updateEvent(@RequestParam("userid")String userid,@RequestParam("day")String day) {
	      System.out.println("UserController.updateEvent.do userid : " + userid + ", day : " + day);
	      String event = day + ",";
	      logger.info("UserController.updateEvent.do " + event);   
	      User user = new User();
	      user.setUserid(userid);
	      user.setEvent(event);
	      userService.updateEvent(user);
	      logger.info("UserController.updateEvent.do db에 저장완료!");
	      
	   }
	   
	   //남규쓰 change view 이동
	   @RequestMapping("change.do")
	   public ModelAndView moveChangeView(@RequestParam("userid")String userid,
	                              /*@RequestParam(value="userid", required=false)String userid,*/ 
	                              HttpSession session, ModelAndView mv) {
	      logger.info("UserController.change.do 실행됨");
	      User user = userService.searchmoney(userid);
	      logger.info("UserController.change.do userid : " + userid);
	      System.out.println("UserController.change.do 수정된 money : " + user.getMoney());
	      logger.info("UserController.change.do userid : " + userid);
	      session.setAttribute("loginUser", user);
	      logger.info("UserController.change.do userid : " + userid);
	      mv.addObject("userid", userid);
	      logger.info("UserController.change.do userid : " + userid);
	      mv.setViewName("change");
	      logger.info("UserController.change.do userid : " + userid);
	      
	      return mv;
	   }
	
	
	
}
