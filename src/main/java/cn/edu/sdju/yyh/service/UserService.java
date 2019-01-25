package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.User;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface UserService {
	// 通过账号和密码查询用户
	public User findUser(String usercode, String password);

	public User selectUserById(Integer id);

	public List<User> findAll();
}
