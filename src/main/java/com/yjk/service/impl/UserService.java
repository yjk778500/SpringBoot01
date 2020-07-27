package com.yjk.service.impl;

import java.util.List;
import java.util.Map;

import com.yjk.pojo.User;
import com.yjk.pojo.Wan;

public interface UserService {

List<User>getlist(Map<String, Object>map);
	
	int deluser(int id);
	
	int updateuser(User user);
	
	User getid(int id);
	
	int adduser(User user);
	
	List<Wan> getWan();
}
