package com.kh.danim.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.danim.page.Page;
import com.kh.danim.payment.model.service.PaymentService;
import com.kh.danim.payment.model.vo.Payment;
import com.kh.danim.user.controller.UserController;
import com.kh.danim.user.model.service.UserService;
import com.kh.danim.user.model.vo.User;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private UserService userService;
	private static ArrayList<String> list;
	
	
	
	
	
	@RequestMapping("coupon.do")
	public String moveCouponPage(HttpSession session) {
		
		return "coupon";
	}
	
	// 결제페이지 이동
	@RequestMapping("payment2.do")
	public String movePaymentWriter(HttpSession session) {
		/*Payment payment = new Payment();
		Payment paylist = paymentService.selectPay(payment);
		logger.info("paylist 값은 : " + paylist);
		session.setAttribute("paylist", paylist);*/
		return "payment2";
	}

	// 코인 환전 페이지 이동
	/*@RequestMapping("change.do")
	public ModelAndView moveChangeWriter(ModelAndView mv,HttpSession session) {
		session.setAttribute("loginUser", value);
		
		mv.setViewName("change");
		return mv;
	}*/
	

	// 결제내역 조회
	@RequestMapping("paylist.do")
	public ModelAndView paymentListMethod(@RequestParam("userid") String userid,
			@RequestParam(name = "page", required = false) String page, ModelAndView mv, Payment payment) {


		int listcount = paymentService.getListCount();
		logger.info("리스트카운트 : " + listcount);
		int currentpage = 1;
		logger.info("page : " + page);
		if(page != null) {
			currentpage = Integer.parseInt(page);
		}
		logger.info("현재 페이지 : " + currentpage);
		
		int limit = 10;
		int pagelimit = 10;
		Page paging = new Page();
		paging.paging(currentpage, listcount, limit, pagelimit);
		logger.info("페이징 : " + paging.toString());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", paging.getStartrow());
		map.put("endRow", paging.getEndrow());
		map.put("userid", userid);
		logger.info("map 의 값 : " + map.toString());
		
		List<Payment> list = paymentService.selectList(map);
		logger.info("list 의 값 : " + list);
		
		if (list != null && list.size() > 0) {
			mv.addObject("paging", paging);
			mv.addObject("paymentboardlist", list);
			mv.setViewName("paylist");
		} else {
			mv.addObject("message", currentpage + "결제 목록 조회 실패했다아");
			mv.setViewName("common/error");
			mv.setViewName("paylist");
		}
		
		
		
		/*logger.info("PaymentController.paylist.do page : " + page); 
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		// 페이징
		int limit = 10;
		int listCount = paymentService.getListCount();
		
		logger.info("PaymentController.paylist.do listCount : " + listCount + ", currentPage : " + currentPage);
		
		// 페이지 수 계산
		int maxPage = (int) ((double)listCount / limit + 0.9); // 목록 페이지 2개로 나눔.
		// 현제 페이지가 포홤된 페이지 그룹값
		int startPage = (int) ((double)currentPage / limit + 0.9);
		// 현제 페이지가 포함된 마지막 페이지 그룹값
		int endPage = startPage + limit - 1;
		logger.info("PaymentController.paylist.do maxPage" + maxPage);
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		//쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		logger.info("PaymentController.paylist.do startRow : " + startRow + ", endRow : " + endRow + ", userid : " + userid);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userid", userid);

		List<Payment> list = paymentService.selectList(map);

		logger.info("PaymentController.paylist.do 결제내역 갯수 : " + list.size());
		
		//금액 천단위 콤마 생성
		for (Payment payment2 : list) {
			payment2.setPaymoney(String.format("%,d",Integer.parseInt(payment2.getPaymoney())));
		}
		logger.info("PaymentController.paylist.do list : " + list);
		
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("page", page);
			mv.setViewName("paylist");
		} else {
			mv.addObject("message", currentPage + "결제 목록 조회 실패했다아");
			mv.setViewName("common/error");
			mv.setViewName("paylist");
		}
*/
		return mv;
	}
	//코인 결제완료시 충전 메소드
	@RequestMapping("paySuccess.do")
	public void paySuccessMethod(@RequestParam("userid") String userid, @RequestParam("money")String money, @RequestParam("scharge")String scharge,
			@RequestParam("division")String division,@RequestParam("category")String category,
			HttpServletResponse response) throws IOException {

		System.out.println("PaymentController.paySuccess.do paySuccess.do 들어옴");
		PrintWriter pwt = response.getWriter();

		String code = "100";
		Payment users = new Payment();
		User user2 = userService.selectUser(userid);

		logger.info("PaymentController.paySuccess.do userid : " + userid + "money : " + money + "scharge : " + scharge + "division : " + division + "category : " + category);

		users.setUserid(userid);
		users.setPaymoney(money);
		users.setScharge(scharge);
		users.setDivision(division);
		users.setCategory(category);
		
		user2.setUserid(userid);
		user2.setMoney(user2.getMoney() + Integer.parseInt(money));
		
		logger.info("PaymentController.paySuccess.do user2 id : " + user2.getUserid());
		logger.info("PaymentController.paySuccess.do user2 money : " + user2.getMoney());
		
		int result = paymentService.insertMoney(users);
		int result2 = userService.updateMoney(user2);
		logger.info("PaymentController.paySuccess.do result 의 값은? : " + result);
		
		if (result > 0) {
			logger.info("PaymentController.paySuccess.do result 통과 " + result);
			logger.info("PaymentController.paySuccess.do result2 의 값은? : " + result2);
			logger.info("PaymentController.paySuccess.do 결제 성공!!!!");
			if (result2 <= 0)
				code = "900";
		}
		pwt.write(code);
		pwt.flush();
		pwt.close();

	}
	
	//코인 전환시 차감 메소드
	@RequestMapping("coinSuccess.do")
	public void coinSuccessMethod(@RequestParam(value="userid", required=false)String userid, @RequestParam("money")String money,@RequestParam("paymoney")String paymoney,@RequestParam("category")String category,
			HttpServletResponse response) throws IOException {
		
		System.out.println("coinSuccess.do 에 들어옴");
		PrintWriter pwt = response.getWriter(); //이거 질문예정, 에러때문인가
		
		String code = "100"; //성공한 값 ajax 보내기 위함
		User users = new User();
		User user2 = userService.selectUser(userid);
		Payment payment = new Payment();
		
		logger.info("PaymentController.coinSuccess.do userid : " + userid);
		logger.info("PaymentController.coinSuccess.do coinSuccess money : " + money);
		logger.info("PaymentController.coinSuccess.do coinSuccess paymoney : " + paymoney);
		logger.info("PaymentController.coinSuccess.do coinSuccess category : " + category);
		payment.setUserid(userid);
		payment.setPaymoney(paymoney);
		payment.setCategory(category);
		
		/*users.setUserid(userid);
		users.setMoney(money);*/
		user2.setUserid(userid);
		user2.setMoney(Integer.parseInt(money));
		System.out.println("PaymentController.coinSuccess.do getUserid 잘 왔니? " + user2.getUserid());
		System.out.println("PaymentController.coinSuccess.do getMoney 잘 왔니? " + user2.getMoney());
		
		int result = userService.useCoin(user2);
		int result2 = paymentService.useCoin(payment);
		logger.info("PaymentController.coinSuccess.do result 값은 : " + result);
		
		logger.info("PaymentController.coinSuccess.do result2 값은 : " + result2);
		
		if(result > 0) {
			logger.info("PaymentController.coinSuccess.do users result 가 if문 들어옴." + result);
			logger.info("PaymentController.coinSuccess.do payment result2 가 if문 들어옴." + result2);
			logger.info("PaymentController.coinSuccess.do 코인 전환 성공!!");
			}
			/*if(result <= 0) {
				code = "900";
			}
			pwt.write(code);
			pwt.flush();
			pwt.close();*/
		}
		
	}
	
	
	
	
	
	
