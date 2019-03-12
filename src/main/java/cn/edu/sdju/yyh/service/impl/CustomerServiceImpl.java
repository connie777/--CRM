package cn.edu.sdju.yyh.service.impl;
import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.CustomerService;
import cn.edu.sdju.yyh.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 客户管理
 */
@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
	// 声明DAO属性并注入
	@Autowired
	private CustomerDao customerDao;
	// 客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows,
                                           String custName, String custSource, String custIndustry,
                                           String custLevel, User user) {
		// 创建客户对象
         Customer customer = new Customer();
		// 判断客户名称
		if(StringUtils.isNotBlank(custName)){
			customer.setCust_name(custName);
		}
		// 判断客户信息来源
		if(StringUtils.isNotBlank(custSource)){
			customer.setCust_source(custSource);
		}
		// 判断客户所属行业
		if(StringUtils.isNotBlank(custIndustry)){
			customer.setCust_industry(custIndustry);
		}
		// 判断客户级别
		if(StringUtils.isNotBlank(custLevel)){
			customer.setCust_level(custLevel);
		}

		//如果登陆的是销售
		if(user.getUser_level()==3&&user.getUser_id()!=null){
		    //设置查询条件：客户负责人为登陆的用户
            customer.setCust_user_id(user.getUser_id());
        }
		// 开始行
        if(page!=null&&rows!=null){
            customer.setStart((page-1) * rows) ;
        }
        if(rows!=null){
            // 每页数
            customer.setRows(rows);
        }
		// 查询客户列表
		List<Customer> customers =
                            customerDao.selectCustomerList(customer);
		// 查询客户列表总记录数
		Integer count = customerDao.selectCustomerListCount(customer);
		// 创建Page返回对象
		Page<Customer> result = new Page<>();
		if(page!=null){
            result.setPage(page);
        }

		result.setRows(customers);
		if(rows!=null){
            result.setSize(rows);
        }

		result.setTotal(count);
		return result;
	}

    @Override
    public List<Customer> showCustomer(Customer customer) {
        return customerDao.selectCustomerList(customer);
    }

    /**
	 * 创建客户
	 */
	@Override
	public int createCustomer(Customer customer) {
	    return customerDao.createCustomer(customer);
	}
	/**
	 * 通过id查询客户
	 */
	@Override
	public Customer getCustomerById(Integer id) {	
	    Customer customer = customerDao.getCustomerById(id);
	    return customer;		
	}
	/**
	 * 更新客户
	 */
	@Override
	public int updateCustomer(Customer customer) {
	    return customerDao.updateCustomer(customer);
	}
	/**
	 * 删除客户
	 */
	@Override
	public int deleteCustomer(Integer id) {
	    return customerDao.deleteCustomer(id);	
	}

	
}
