package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.CustomerService;
import cn.edu.sdju.yyh.service.LinkmanService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @ClassName LinkmanController
 * @Description 联系人管理控制器
 * @Author Silence
 * @Date 2018/12/18 15:21
 * @Version 1.0
 **/
@Controller
@RequestMapping("/linkman")
public class LinkmanController {
    @Autowired
    private LinkmanService linkmanService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerDao customerDao;
    /**
     *  联系人列表
     */
    @RequestMapping(value = "/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       String lkm_name, String lkm_gender,
                       Integer lkm_cust_id, Model model, HttpSession session) {
        //获取登陆的用户信息
        User user=(User)session.getAttribute("USER_SESSION");
        List<Customer> customerList;
        Page<Linkman> linkmans;
        //如果是销售登陆
        if(user.getUser_level()==3){
            //查出该销售拥有的客户资源
            Customer customer=new Customer();
            customer.setCust_user_id(user.getUser_id());
            customerList=this.customerDao.selectCustomerList(customer);
            linkmans=linkmanService.findLinkmanList(page, rows,
                    lkm_name, lkm_gender, lkm_cust_id,customerList);
        }else{
            //管理登陆
            customerList=this.customerDao.selectCustomerList(new Customer());
            linkmans=linkmanService.findLinkmanList(page, rows,
                    lkm_name, lkm_gender, lkm_cust_id,null);
        }
        /*List<Customer> customerList=customerService.showCustomer(new Customer());*/
        model.addAttribute("page",linkmans);
        model.addAttribute("cusList",customerList);
        model.addAttribute("lkm_name",lkm_name);
        model.addAttribute("lkm_gender",lkm_gender);
        model.addAttribute("lkm_cust_id",lkm_cust_id);
        return "linkman";
    }

    /**
     * 创建联系人
     */
    @RequestMapping("/create.action")
    @ResponseBody
    public String createLinkman(Linkman linkman) {

        // 执行Service层中的创建方法，返回的是受影响的行数
        int rows = this.linkmanService.createLinkman(linkman);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    /**
     * 根据id获取联系人
     */
    @RequestMapping(value = "/getLinkmanById.action",method = RequestMethod.GET)
    @ResponseBody
    public Linkman getLinkmanById(Integer id){
        return linkmanService.getLinkmanById(id);
    }

    /**
     * 更新联系人信息
     */
    @RequestMapping(value = "/update.action",method = RequestMethod.POST)
    @ResponseBody
    public String updateLinkman(Linkman linkman){
        int rows=linkmanService.updateLinkman(linkman);
        if(rows>0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    /**
     * 删除联系人
     */
    @RequestMapping(value = "/delete.action",method = RequestMethod.POST)
    @ResponseBody
    public String deleteLinkman(Integer id){
        int rows=linkmanService.deleteLinkman(id);
        if(rows>0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

}
