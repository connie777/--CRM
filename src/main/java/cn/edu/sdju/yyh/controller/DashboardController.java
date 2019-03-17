package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.dao.ContractDao;
import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.dao.VisitDao;
import cn.edu.sdju.yyh.po.*;
import cn.edu.sdju.yyh.service.MarketPerformService;
import cn.edu.sdju.yyh.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName DashboardController
 * @Description Dashboard控制器
 * @Author Silence
 * @Date 2019/3/8 9:54
 * @Version 1.0
 **/
@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    MarketPerformService marketPerformService;
    @Autowired
    CustomerDao customerDao;
    @Autowired
    ContractDao contractDao;
    @Autowired
    VisitDao visitDao;
    @Autowired
    VisitService visitService;

    //跳转到dashboard页面
    @RequestMapping(value ="/show.action",method = RequestMethod.GET)
    public String show(HttpSession session){
        String flag=(String)session.getAttribute("isFirst");
        //如果是第一次进入该页面
        if(flag==null){
            session.setAttribute("isFirst","1");
        }else{
            session.setAttribute("isFirst","0");
        }

        return "dashboard";
    }

    //获取2018-6~2019-3 每个月业绩
    @RequestMapping(value = "/getChartData.action",method = RequestMethod.GET)
    @ResponseBody
    public PerformResult getChartData(PerformResult performResult,
                                 @RequestParam(defaultValue="2018-06")
                                 @DateTimeFormat(pattern = "yyyy-MM")Date start_month,
                                 @RequestParam(defaultValue="2019-03")
                                 @DateTimeFormat(pattern = "yyyy-MM")Date end_month,
                                HttpSession session){
        //按月统计业绩
        List<PerformResult> list;
        User user= (User) session.getAttribute("USER_SESSION");
        if (user!=null&&user.getUser_level()==3){
            list=this.marketPerformService.countByMonth(start_month,end_month,user.getUser_id());
        }else {
            list=this.marketPerformService.countByMonth(start_month,end_month,null);
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
        if (list!=null&&list.size()>0) {
            performResult.setStatus(true);
            List<Map<String ,Object>> list1=new ArrayList<>();
            for (int i=0;i<list.size();i++){
                Map<String,Object> map=new HashMap<>();
                Date month=list.get(i).getMonth();
                Double total_amount=list.get(i).getTotalAmount();
                if (month!=null&&total_amount!=null){
                    String smonth=sdf.format(month);
                    map.put("month",sdf.format(list.get(i).getMonth()));
                    map.put("total_amount",list.get(i).getTotalAmount());
                }
                list1.add(map);
            }
            performResult.setResultList(list1);
        }
        return performResult;
    }

    //统计客户总数、拜访记录总数、合同总数总销售额
    @RequestMapping(value = "/getTotalData.action",method = RequestMethod.GET)
    @ResponseBody
    public PerformResult getTotalData(HttpSession session){
        PerformResult performResult=new PerformResult();
        Integer total_cust;
        Integer total_visit_record;
        Integer total_contract;
        Double total_sell_amount;
        //权限控制
        User user=(User)session.getAttribute("USER_SESSION");
        //如果是销售登陆
        if(user!=null&&user.getUser_level()==3){
            Customer customer=new Customer();
            customer.setCust_user_id(user.getUser_id());
            total_cust=this.customerDao.selectCustomerListCount(customer);
            List<Customer> customerList=this.customerDao.selectCustomerList(customer);
            List<Integer> custIds=new ArrayList<Integer>();
            Visit visit=new Visit();
            visit.setSeller(true);
            if(customerList!=null&&customerList.size()>0){
                for (int i = 0; i < customerList.size(); i++) {
                    custIds.add(customerList.get(i).getCust_id());
                }
                visit.setCustIds(custIds);
            }else {
                visit.setCustIds(null);
            }

            if(customerList==null&&customerList.size()==0){
                total_visit_record=0;
            }else {
                total_visit_record=this.visitDao.selectVisitListCount(visit);
            }
            PerformResult performResult1=this.marketPerformService.getSellAmountByUserId(user.getUser_id());
            if(performResult1!=null){
                total_sell_amount=performResult1.getTotal_sell_amount();
            }else{
                total_sell_amount=0.00;
            }
        }else {
            total_cust= this.customerDao.selectCustomerListCount(new Customer());
            total_visit_record=this.visitDao.selectVisitListCount(new Visit());
            total_sell_amount=this.marketPerformService.getTotalSellAmount().getTotal_sell_amount();
        }
        total_contract=this.contractDao.selectContractListCount(new Contract());

        performResult.setStatus(true);
        performResult.setTotal_cust(total_cust==0?0:total_cust);
        performResult.setTotal_visit_record(total_visit_record==0?0:total_visit_record);
        performResult.setTotal_contract(total_contract==0?0:total_contract);
        performResult.setTotal_sell_amount(total_sell_amount==0?0:total_sell_amount);
        return performResult;
    }

}
