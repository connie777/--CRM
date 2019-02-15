package cn.edu.sdju.yyh.dao;
import cn.edu.sdju.yyh.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
     * @Param注解用于参数绑定
	 */
	public User findUser(@Param("usercode") String usercode,
                         @Param("password") String password);
    /**
     * 通过id查询用户
     */
    public User selectUserById(@Param("id") Integer id);

    public List<User> findAll();

    public User findUserByUsercode(String usercode);

    public int insertUser(User user);

    public int updateUser(User user);
}
