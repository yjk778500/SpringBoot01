package com.yjk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjk.dao.UserMapper;
import com.yjk.pojo.User;
import com.yjk.pojo.Wan;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Override
	public List<User> getlist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.getlist(map);
	}

	@Override
	public int deluser(int id) {
		// TODO Auto-generated method stub
		return userMapper.deluser(id);
	}

	@Override
	public int updateuser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateuser(user);
	}

	@Override
	public User getid(int id) {
		// TODO Auto-generated method stub
		return userMapper.getid(id);
	}

	@Override
	public int adduser(User user) {
		// TODO Auto-generated method stub
		return userMapper.adduser(user);
	}

	@Override
	public List<Wan> getWan() {
		// TODO Auto-generated method stub
		return userMapper.getWan();
	}


}
