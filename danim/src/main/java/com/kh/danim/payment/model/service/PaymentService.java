package com.kh.danim.payment.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.payment.model.vo.Payment;
import com.kh.danim.user.model.vo.User;

public interface PaymentService {
		
		int getListCount();
		
		List<Payment> selectList(HashMap<String, Object> map);
		
		Payment selectUser(String userid);

		int insertMoney(Payment users);
		
		Payment selectPay(Payment userid);

		int useCoin(Payment payment);

		//event 값
		List<Payment> eventLsit(String userid);
		



		
		
}
