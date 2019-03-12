package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.dao.*;
import cn.edu.sdju.yyh.po.*;
import cn.edu.sdju.yyh.service.LinkmanService;
import cn.edu.sdju.yyh.utils.ExportToExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName ExcelExportController
 * @Description Excel导出控制层
 * @Author Silence
 * @Date 2019/3/10 22:03
 * @Version 1.0
 **/
@Controller
@RequestMapping("/excelExport")
public class ExcelExportController {
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private LinkmanService linkmanService;
    @Autowired
    private VisitDao visitDao;
    @Autowired
    private MarketPlanDao marketPlanDao;
    @Autowired
    private MarketPerformDao marketPerformDao;

    //客户导出Excel
    @RequestMapping(value = "/exportCustomer.action",method = RequestMethod.GET)
    @ResponseBody
    public String exportCustomer(HttpServletResponse response, HttpSession session){
        List<Customer> list;
        User user=(User)session.getAttribute("USER_SESSION");
        if(user!=null&&user.getUser_level()==3){
            Customer customer=new Customer();
            customer.setCust_user_id(user.getUser_id());
            list=this.customerDao.selectCustomerList(customer);
        }else {
            list=this.customerDao.selectCustomerList(new Customer());
        }
        Boolean result=ExportToExcelUtil.exportCustomer(list,response);

        return "SUCCESS";
    }

    //联系人导出
    @RequestMapping(value = "/exportLinkman.action",method = RequestMethod.GET)
    @ResponseBody
    public String exportLinkman(HttpServletResponse response,HttpSession session){
        List<Linkman> list;
        User user=(User)session.getAttribute("USER_SESSION");
        if(user!=null&&user.getUser_level()==3){
            Customer customer=new Customer();
            customer.setCust_user_id(user.getUser_id());
            List<Customer> customerList=this.customerDao.selectCustomerList(customer);
            list=linkmanService.findLinkmanList(null, null,
                    null, null, null,customerList).getRows();
        }else {
            list=this.linkmanService.findLinkmanList(null, null,
                    null, null, null,null).getRows();
        }

        ExportToExcelUtil.exportLinkman(list,response);
        return "SUCCESS";
    }

    //拜访记录导出
    @RequestMapping(value = "/exportVisit.action",method = RequestMethod.GET)
    @ResponseBody
    public String exportVisit(HttpServletResponse response,HttpSession session){
        List<Visit> list;
        User user=(User)session.getAttribute("USER_SESSION");
        if(user!=null&&user.getUser_level()==3){
            Visit visit=new Visit();
            visit.setVisit_user_id(user.getUser_id());
            list=this.visitDao.selectVisitList(visit);
        }else {
            list=this.visitDao.selectVisitList(new Visit());
        }
        ExportToExcelUtil.exportVisit(list,response);
        return "SUCCESS";
    }

    //营销计划导出
    @RequestMapping(value = "/exportPlan.action",method = RequestMethod.GET)
    @ResponseBody
    public String exportPlan(HttpServletResponse response){
        List<MarketPlan> list=this.marketPlanDao.selectMarketPlanList(new MarketPlan());
        ExportToExcelUtil.exportPlan(list,response);
        return "SUCCESS";
    }

    //营销业绩导出
    @RequestMapping(value = "/exportPerform.action",method = RequestMethod.GET)
    @ResponseBody
    public String exportPerform(HttpServletResponse response,HttpSession session){
        List<MarketPerform> list;
        User user=(User)session.getAttribute("USER_SESSION");
        if(user!=null&&user.getUser_level()==3){
            MarketPerform marketPerform=new MarketPerform();
            marketPerform.setPerform_user_id(user.getUser_id());
            list=this.marketPerformDao.selectMarketPerformList(marketPerform);
        }else {
            list=this.marketPerformDao.selectMarketPerformList(new MarketPerform());
        }
        ExportToExcelUtil.exportPerform(list,response);
        return "SUCCESS";
    }
}
