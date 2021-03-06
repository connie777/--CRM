package cn.edu.sdju.yyh.service.impl;
import cn.edu.sdju.yyh.dao.UserDao;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;
	// 通过账号和密码查询用户
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}

    @Override
    public User selectUserById(Integer id) {
        return this.userDao.selectUserById(id);
    }

    @Override
    public List<User> findAll() {
        return this.userDao.findAll();
    }

    @Override
    public User findUserByUsercode(String usercode) {
	    return this.userDao.findUserByUsercode(usercode);
    }

    @Override
    public int insertUser(User user) {
	    //此处给新注册的用户一个默认头像
        user.setUser_avatar("avatar/default_avatar_male.jpg");
        user.setUser_state(1);
        user.setUser_level(3);
        user.setUser_position("销售");
        user.setUser_department("销售部");
        return this.userDao.insertUser(user);
    }

    @Override
    public int updateUser(User user) {
        return this.userDao.updateUser(user);
    }

    @Override
    public List<User> selectAllSeller() {
        return this.userDao.selectAllSeller();
    }
}
