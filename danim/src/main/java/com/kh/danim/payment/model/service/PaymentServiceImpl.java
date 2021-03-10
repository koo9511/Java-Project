package com.kh.danim.payment.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.payment.model.dao.PaymentDao;
import com.kh.danim.payment.model.vo.Payment;
/*import com.kh.danim.user.model.vo.User;*/

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public int getListCount() {
		return paymentDao.getListCount();
	}

	@Override
	public List<Payment> selectList(HashMap<String, Object> map) {
		return paymentDao.selectList(map);
	}

	@Override
	public Payment selectUser(String userid) {
		return paymentDao.selectUser(userid);
	}

	@Override
	public Payment selectPay(Payment userid) {
		return paymentDao.selectPay(userid);
	}
	
	//코인 충전
   @Override
   public int insertMoney(Payment users) {
   	return paymentDao.insertMoney(users);
   }

   @Override
   public int useCoin(Payment payment) {
	return paymentDao.useCoin(payment);
}
    //event 값
	@Override
	public List<Payment> eventLsit(String userid) {
	return paymentDao.eventLsit(userid);
}





	

}
