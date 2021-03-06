package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.utils.Page;

import java.util.List;
public interface CustomerService {
	// 查询客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows,
                                           String custName, String custSource, String custIndustry,
                                           String custLevel, User user,Integer cust_user_id);


	public List<Customer> showCustomer(Customer customer);

	//创建客户
	public int createCustomer(Customer customer);
	
	// 通过id查询客户
	public Customer getCustomerById(Integer id);
	// 更新客户
	public int updateCustomer(Customer customer);
	// 删除客户
	public int deleteCustomer(Integer id);

}
