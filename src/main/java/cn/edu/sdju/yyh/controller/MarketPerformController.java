package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.po.MarketPerform;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.MarketPerformService;
import cn.edu.sdju.yyh.service.UserService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @ClassName MarketPerformController
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/5 17:20
 * @Version 1.0
 **/
@Controller
@RequestMapping("/marketPerform")
public class MarketPerformController {
    @Autowired
    private MarketPerformService marketPerformService;
    @Autowired
    private UserService userService;

    /*
     * 营销业绩查询
     */
    @RequestMapping(value = "/list.action",method = RequestMethod.GET)
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       @DateTimeFormat(pattern = "yyyy-MM")Date perform_date,
                       Integer perform_user_id, Model model){

        Page<MarketPerform> marketPerformPage=this.marketPerformService.findMarketPerformList(page,rows,perform_date,perform_user_id);
        model.addAttribute("page",marketPerformPage);
        /*查询条件回显*/
        if(perform_date!=null){
            String simple_date=new SimpleDateFormat("yyyy-MM").format(perform_date);
            model.addAttribute("perform_date",simple_date);
        }
        if (perform_user_id!=null){
            model.addAttribute("perform_user_id",perform_user_id);
        }
        //查出所有销售
        List<User> userList=this.userService.selectAllSeller();
        model.addAttribute("sellers",userList);
        return "marketPerform";
    }

    /*
     * 业绩录入
     */
    @RequestMapping(value = "/createPerform.action",method = RequestMethod.POST)
    @ResponseBody
    public String create(MarketPerform marketPerform){
        if (this.marketPerformService.createMarketPerform(marketPerform)>0){
            return "SUCCESS";
        }else {
            return "FAILURE";
        }
    }

    /**
     * 业绩删除
     */
    @RequestMapping(value = "/deletePerform.action",method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id){
        if (this.marketPerformService.deleteMarketPerform(id)>0){
            return "SUCCESS";
        }else {
            return "FAILURE";
        }
    }

    /**
     * 根据id获取业绩
     */
    @RequestMapping(value = "/getPerformById.action",method = RequestMethod.GET)
    @ResponseBody
    public MarketPerform getPerformById(Integer id){
        return this.marketPerformService.getMarketPerformById(id);
    }

    /**
     * 更新业绩
     */
    @RequestMapping(value = "/updatePerform.action",method = RequestMethod.GET)
    @ResponseBody
    public String updatePerform(MarketPerform marketPerform){
        if(this.marketPerformService.updateMarketPerform(marketPerform)>0){
            return "SUCCESS";
        }else {
            return "FAILURE";
        }
    }
}
