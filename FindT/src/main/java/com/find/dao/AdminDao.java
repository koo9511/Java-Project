package com.find.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.find.vo.Admin;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;


}
