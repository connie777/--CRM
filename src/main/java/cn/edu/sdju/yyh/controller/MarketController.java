package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.po.MarketPlan;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.MarketPlanService;
import cn.edu.sdju.yyh.service.UserService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName MarketController
 * @Description 营销管理控制器
 * @Author Silence
 * @Date 2019/3/4 17:16
 * @Version 1.0
 **/
@Controller
@RequestMapping("/market")
public class MarketController {
    @Autowired
    private MarketPlanService marketPlanService;
    @Autowired
    private UserService userService;

    /*
    *查询营销计划
    */
    @RequestMapping(value = "/planList.action",method = RequestMethod.GET)
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       String plan_name, Integer plan_principal, Model model
                       ){
        Page<MarketPlan> marketPlanPage=marketPlanService.findMarketPlanList(page,rows,plan_name,plan_principal);
        model.addAttribute("page",marketPlanPage);
        List<MarketPlan> marketPlanList=marketPlanPage.getRows();
        model.addAttribute("planList",marketPlanList);


        //查询条件回显
        if(plan_principal!=null){
            model.addAttribute("seller_id",plan_principal);
        }
        if(plan_name!=null){
            model.addAttribute("plan_name",plan_name);
        }
        //查出所有营销员，存入model
        List<User> sellers=this.userService.selectAllSeller();
        model.addAttribute("sellers",sellers);

        return "market";
    }

    /*
     *创建营销计划
     */
    @RequestMapping(value = "/createPlan.action",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> createPlan(MarketPlan marketPlan){
        int result=this.marketPlanService.createMarketPlan(marketPlan);
        Map<String,String> map=new HashMap<String, String>();
        if(result>0){
            map.put("result","SUCCESS");
        }else{
            map.put("result","FAILURE");
        }
        return map;
    }

    /*
     *删除营销计划
     */
    @RequestMapping(value = "/deletePlan.action",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deletePlan(Integer id){
        int result=this.marketPlanService.deleteMarketPlan(id);
        Map<String,String> map=new HashMap<String, String>();
        if(result>0){
            map.put("result","SUCCESS");
        }else{
            map.put("result","FAILURE");
        }
        return map;
    }

    // 通过id获取营销计划信息
    @RequestMapping(value = "/getPlanById.action",method = RequestMethod.GET)
    @ResponseBody
    public MarketPlan getPlanById(Integer id){
        MarketPlan marketPlan=this.marketPlanService.getMarketPlanById(id);
        return marketPlan;
    }

    // 更新营销计划
    @RequestMapping(value = "/updatePlan.action",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> updatePlan(MarketPlan marketPlan){
        int result=this.marketPlanService.updateMarketPlan(marketPlan);
        Map<String,String> map=new HashMap<String, String>();
        if(result>0){
            map.put("result","SUCCESS");
        }else{
            map.put("result","FAILURE");
        }
        return map;
    }
}
