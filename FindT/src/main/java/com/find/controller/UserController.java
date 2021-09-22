package com.find.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.find.service.UserService;
import com.find.vo.Email_cert;
import com.find.vo.GenerateCertCharacter;
import com.find.vo.User_info;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping("login")
	public void Login(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
			HttpServletResponse response) throws IOException {
		

		PrintWriter out = response.getWriter();
		
		User_info userVO = new User_info();
		
		userVO.setUser_id(user_id);
		
		BCryptPasswordEncoder decoder = new BCryptPasswordEncoder(10);
		
		User_info selectUserInfo = userService.selectUserInfo(user_id);
		
		
		if(selectUserInfo != null) {
			
				
				String origin_pwd = selectUserInfo.getUser_pw();
				
				if(decoder.matches(user_pw, origin_pwd) == true) {
					if(selectUserInfo.getIs_active() == 1) {
						out.write("100"); // 비밀번호 일치
					} else {
						out.write("800"); // 계정 비활성화됨
					}
				} else {
					out.write("500"); // 비밀번호 틀림
				}

		} else {
			out.write("900"); // 아이디 없음
			
		}
		
		out.flush();
		out.close();
	}
	
	@RequestMapping("index")
	public ModelAndView IndexMethod(HttpSession session, ModelAndView mv, @RequestParam("login-id") String user_id) throws IOException {

		User_info selectUserInfo = userService.selectUserInfo(user_id);
		
		session.setAttribute("userCode", selectUserInfo.getUser_code());
		session.setAttribute("userId", selectUserInfo.getUser_id());
		session.setAttribute("userCode", selectUserInfo.getUser_code());
		
		
		mv.setViewName("contents/index");
		
		return mv;
	}
	
	@RequestMapping(value = "emailSMTP", method = RequestMethod.POST)
	public void emailSMTP(@RequestParam("email") String to_email, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("이메일 인증이 시작되었습니다.");

		// mail server 설정
		String host = "smtp.naver.com";
		final String user = "rpfpsrjsah"; // 계정
		final String password = "!";// 패스워드
		String resultCd = "100";
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		System.out.println("Response email : " + to_email);
		// TODO DB id Check
		
		int emailValidate = userService.selectUserId(to_email);
		if(emailValidate > 0) {
//			 (중복사용중)
			 resultCd = "200"; 
		}

		if (resultCd.equals("100")) {
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
//			props.put("mail.debug", "true");
			
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
			System.out.println("인증번호 : " + AuthenticationKey);
			
			Email_cert cert_info = new Email_cert(to_email, AuthenticationKey);
			
			userService.insertCertKey(cert_info);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user + "@naver.com", "With U"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email.toString()));

				// 메일 제목
				msg.setSubject("With U 인증번호 입니다.");
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
	
	
	@RequestMapping("certCheck")
	@ResponseBody
	public void CertCheck(@RequestParam("user_email") String user_email, 
			@RequestParam("cert_key") String cert_key, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		String res = "";
		
		Email_cert certVO = new Email_cert(user_email, cert_key);
		
		int ret = userService.selectCertCheck(certVO);
		
		if(ret > 0) {
			res = "100";
		} else {
			res = "900";
		}
		
		out.write(res);
		out.flush();
		out.close();
	}
	
	@RequestMapping("userSignUp")
	public void UserSignUp(HttpServletResponse response, @RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw, @RequestParam("user_nickname") String user_nickname) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		String ret = "";
		
		User_info userVO = new User_info();
		
		userVO.setUser_id(user_id);

		// password 암호화
		BCryptPasswordEncoder enroll_encoder = new BCryptPasswordEncoder(10);
		userVO.setUser_pw(enroll_encoder.encode(user_pw));
		
		userVO.setUser_nickname(user_nickname);
		
		// 시퀀스 폼 생성
		String userCode = new GenerateCertCharacter().excuteGenerate();
			
	      int res = 0;
		      res += userService.selectUserCode(userCode);
	      
	      while(res > 0) {
	    	  res = 0;
	    	  userCode = new GenerateCertCharacter().excuteGenerate();
		      res += userService.selectUserCode(userCode);
	      }
	      
	    userVO.setUser_code(userCode);
	    
	    int addRes = userService.addUserInfo(userVO);
	    
	    if(addRes > 0) {
	    	ret = "100";
	    } else {
	    	ret = "900";
	    }
	    
	    out.write(ret);
	    out.flush();
	    out.close();
		
	}
	
	
}





















