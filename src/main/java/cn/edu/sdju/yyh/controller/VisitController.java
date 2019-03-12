package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.po.Visit;
import cn.edu.sdju.yyh.service.CustomerService;
import cn.edu.sdju.yyh.service.LinkmanService;
import cn.edu.sdju.yyh.service.UserService;
import cn.edu.sdju.yyh.service.VisitService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @ClassName VisitController
 * @Description 客户拜访控制器
 * @Author Silence
 * @Date 2018/12/24 11:51
 * @Version 1.0
 **/
@Controller
@RequestMapping("/visit")
public class VisitController {
    @Autowired
    private VisitService visitService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private LinkmanService linkmanService;

    /**
     * 拜访信息列表
     * @return
     */
    @RequestMapping(value = "/list.action",method = RequestMethod.GET)
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       @DateTimeFormat(pattern = "yyyy-MM-dd")Date start_date,
                       @DateTimeFormat(pattern = "yyyy-MM-dd")Date end_date,
                       Integer visit_cust_id, Model model,
                       HttpSession session){
        //获取登陆的用户信息
        User user=(User)session.getAttribute("USER_SESSION");
        List<Customer> customerList;
        Page<Visit> visitPage;
        //如果是销售登陆
        if(user.getUser_level()==3){
            //查出该销售拥有的客户资源
            Customer customer=new Customer();
            customer.setCust_user_id(user.getUser_id());
            customerList=this.customerDao.selectCustomerList(customer);
            visitPage=visitService.findVisitList(page,rows,visit_cust_id,start_date,end_date,customerList);
        }else{
            //管理登陆
            customerList=this.customerDao.selectCustomerList(new Customer());
            visitPage=visitService.findVisitList(page,rows,visit_cust_id,start_date,end_date,null);
        }
        model.addAttribute("cusList",customerList);
        model.addAttribute("page",visitPage);
        model.addAttribute("cust_id",visit_cust_id);
        if(start_date!=null) {
            String startDate = new SimpleDateFormat("yyyy-MM-dd").format(start_date);
            model.addAttribute("start_date", startDate);
        }
        if(end_date!=null) {
            String endDate = new SimpleDateFormat("yyyy-MM-dd").format(end_date);
            model.addAttribute("end_date", endDate);
        }
        return "visit";
    }

    /**
     * 创建拜访信息
     */
    @RequestMapping(value = "/create.action",method = RequestMethod.POST)
    @ResponseBody
    public String createVisit(Visit visit) {

        // 执行Service层中的创建方法，返回的是受影响的行数
        int rows = this.visitService.createVisit(visit);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    /**
     * 根据id获取拜访信息
     */
    @RequestMapping(value = "/getVisitById.action",method = RequestMethod.GET)
    @ResponseBody
    public Visit getVisitById(Integer id){
        return visitService.getVisitById(id);
    }

    /**
     * 更新拜访信息
     */
    @RequestMapping(value = "/update.action",method = RequestMethod.POST)
    @ResponseBody
    public String updateVisit(Visit visit){
        int rows=visitService.updateVisit(visit);
        if(rows>0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    /**
     * 删除拜访信息
     */
    @RequestMapping(value = "/delete.action",method = RequestMethod.POST)
    @ResponseBody
    public String deleteVisit(Integer id){
        int rows=visitService.deleteVisit(id);
        if(rows>0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/showLinkman.action",method = RequestMethod.POST)
    @ResponseBody
    public List<Linkman> findLkmByCusId(Integer id){
        return this.linkmanService.findByCustId(id);
    }
}
