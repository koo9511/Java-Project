package com.kh.danim.payment.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.payment.model.vo.Payment;
import com.kh.danim.user.model.vo.User;

@Repository("paymentDao")
public class PaymentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("paymentMapper.listCount");
	}
	
	public List<Payment> selectList(HashMap<String, Object> map) {
		return sqlSession.selectList("paymentMapper.paymentList", map);
	}

	public Payment selectUser(String userid) {
		return sqlSession.selectOne("paymentMapper.userSelect", userid);
	}


	public Payment selectPay(Payment userid) {
		return sqlSession.selectOne("paymentMapper.paySelect", userid);
	}

	//코인 충전
	public int insertMoney(Payment users) {
		return sqlSession.insert("paymentMapper.insertMoney", users);
	}

	public int useCoin(Payment payment) {
		return sqlSession.insert("paymentMapper.useCoin", payment);
	}

	//이벤트 데이트 출력찾기
	public List<Payment> eventLsit(String userid) {
		return sqlSession.selectList("paymentMapper.eventLsit", userid);
	}
	

	
}
