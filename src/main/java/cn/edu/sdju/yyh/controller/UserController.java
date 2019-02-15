package cn.edu.sdju.yyh.controller;
import javax.servlet.http.HttpSession;

import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public Map login(String usercode, String password, HttpSession session) {
		// 通过账号和密码查询用户
 		User user = userService.findUser(usercode, password);
 		Map<String,String> map=new HashMap<String, String>();
		if(user != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
            map.put("status","1");
		}else{
            map.put("status","0");
        }
		return map;
	}
	
	/**
	 * 模拟其他类中跳转到客户管理页面的方法（验证拦截器是否生效）
	 */
	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
	    return "customer";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}

    /**
     * 检查用户名是否存在
     */
    @ResponseBody
    @RequestMapping(value = "/codeCheck.action",method = RequestMethod.POST)
    public Map codeCheck(String usercode){
        Map map=new HashMap();
        User user=this.userService.findUserByUsercode(usercode);
        if(user!=null){
            map.put("status","1");
            return map;
        } else{
            map.put("status","0");
            return map;
        }
    }

    /**
     * 用户注册
     */
    @ResponseBody
    @RequestMapping(value = "/register.action",method = RequestMethod.POST)
    public Map register(User user){
        Map map=new HashMap();
        if(this.userService.insertUser(user)>0){
            map.put("status","1");
            return map;
        }else {
            map.put("status","0 ");
            return map;
        }
    }

    /**
     * 检查用户的手机号
     */
    @ResponseBody
    @RequestMapping(value = "/phoneCheck",method = RequestMethod.POST)
    public Map phoneCheck(User user){
        Map map=new HashMap();
        String usercode=user.getUser_code();
        String phone=user.getUser_phone();
        User user1=this.userService.findUserByUsercode(usercode);
        //手机号正确
        if(phone.equals(user1.getUser_phone())){
            map.put("status","1");
            return map;
        }else{
            map.put("status","0");
            return map;
        }
    }

    /**
     * 密码重置
     */
    @ResponseBody
    @RequestMapping(value = "/pwdReset",method = RequestMethod.POST)
    public Map pwdReset(User user){
        Map map=new HashMap();
        String usercode=user.getUser_code();
        String pwd=user.getUser_password();
        if(this.userService.updateUser(user)>0){
            map.put("status","1");
            return map;
        }else{
            map.put("status","0");
            return map;
        }
    }
}
