package cn.edu.sdju.yyh.controller;
import cn.edu.sdju.yyh.dao.LinkmanDao;
import cn.edu.sdju.yyh.dao.VisitDao;
import cn.edu.sdju.yyh.po.BaseDict;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.BaseDictService;
import cn.edu.sdju.yyh.service.CustomerService;
import cn.edu.sdju.yyh.service.UserService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * 客户管理控制器类
 */
@Controller
public class CustomerController {
	// 依赖注入
	@Autowired
	private CustomerService customerService;
	@Autowired
    private LinkmanDao linkmanDao;
	@Autowired
    private VisitDao visitDao;
	@Autowired
	private BaseDictService baseDictService;
	@Autowired
    private UserService userService;
	// 客户来源
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	// 客户所属行业
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	// 客户级别
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;
	/**
	 *  客户列表
	 */
	@RequestMapping(value = "/customer/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, Integer cust_user_id,
			String custName, String custSource, String custIndustry,
			String custLevel, Model model,HttpSession session) {
	    //获取登陆的用户信息
	    User user=(User)session.getAttribute("USER_SESSION");
		// 条件查询所有客户（user为登陆的用户信息）
		Page<Customer> customers = customerService
				.findCustomerList(page, rows, custName, 
                                        custSource, custIndustry,custLevel,user,cust_user_id);
		model.addAttribute("page", customers);
		//查询所有销售
        List<User> userList=this.userService.selectAllSeller();
        model.addAttribute("users",userList);
		// 客户来源
		List<BaseDict> fromType = baseDictService
				.findBaseDictByTypeCode(FROM_TYPE);
		// 客户所属行业
		List<BaseDict> industryType = baseDictService
				.findBaseDictByTypeCode(INDUSTRY_TYPE);
		// 客户级别
		List<BaseDict> levelType = baseDictService
				.findBaseDictByTypeCode(LEVEL_TYPE);
		// 添加参数
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		model.addAttribute("cust_user_id",cust_user_id);
		return "customer";
	}
	
	/**
	 * 创建客户
	 */
	@RequestMapping("/customer/create.action")
	@ResponseBody
	public String customerCreate(Customer customer,HttpSession session) {
	    // 获取Session中的当前用户信息
	    User user = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在客户对象中
	    customer.setCust_create_id(user.getUser_id());
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = customerService.createCustomer(customer);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取客户信息
	 */
	@RequestMapping("/customer/getCustomerById.action")
	@ResponseBody
	public Customer getCustomerById(Integer id) {
	    return customerService.getCustomerById(id);
	}
	/**
	 * 更新客户
	 */
	@RequestMapping("/customer/update.action")
	@ResponseBody
	public String customerUpdate(Customer customer) {
	    int rows = customerService.updateCustomer(customer);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除客户
     * 这个操作很危险，级联删除对应的联系人、拜访记录
	 */
	@RequestMapping("/customer/delete.action")
	@ResponseBody
	public String customerDelete(Integer id) {
	    try {
            //先删除客户
            customerService.deleteCustomer(id);
            System.out.println("=====客户删除成功=====");
            linkmanDao.deleteByCustId(id);
            System.out.println("=====联系人删除成功=====");
            visitDao.deleteByCustId(id);
            System.out.println("=====拜访记录删除成功=====");
            return "OK";
        }catch (Exception e){
	        e.printStackTrace();
            return "FAIL";
	    }
	}

}
