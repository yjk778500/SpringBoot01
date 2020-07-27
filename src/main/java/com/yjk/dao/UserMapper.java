package com.yjk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.yjk.pojo.User;
import com.yjk.pojo.Wan;
@Mapper
public interface UserMapper {
	
	List<User>getlist(Map<String, Object>map);
	
	int deluser(int id);
	
	int updateuser(User user);
	
	User getid(int id);
	
	int adduser(User user);
	
	List<Wan> getWan();
}
