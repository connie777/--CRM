package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.MarketPlanDao;
import cn.edu.sdju.yyh.dao.UserDao;
import cn.edu.sdju.yyh.po.MarketPlan;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.MarketPlanService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName MarketPlanServiceImpl
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/5 9:45
 * @Version 1.0
 **/
@Service("marketService")
@Transactional
public class MarketPlanServiceImpl implements MarketPlanService {
    @Autowired
    private MarketPlanDao marketPlanDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private HttpSession session;
    @Override
    public Page<MarketPlan> findMarketPlanList(Integer page,
                                               Integer rows,
                                               String plan_name,
                                               Integer plan_principal) {
        MarketPlan marketPlan=new MarketPlan();
        //获取登陆用户信息,如果是销售登陆
        User user=(User)session.getAttribute("USER_SESSION");
        if(user.getUser_id()!=null&&user.getUser_level()==3){
            marketPlan.setPlan_principal(user.getUser_id());
        }
        if(plan_name!=null&&plan_name!=""){
            marketPlan.setPlan_name(plan_name);
        }
        if(plan_principal!=null){
            marketPlan.setPlan_principal(plan_principal);
        }
        //从哪条数据开始查
        if(page!=null&&rows!=null){
            marketPlan.setStart_index((page-1)*rows);
        }

        // 每页数据数量
        if(rows!=null){
            marketPlan.setRows(rows);
        }

        //营销计划结果集
        List<MarketPlan> marketPlanList=marketPlanDao.selectMarketPlanList(marketPlan);
        // 查询营销计划总记录数
        Integer count = marketPlanDao.selectMarketPlanCount(marketPlan);
        // 创建Page返回对象用于分页
        Page<MarketPlan> marketPlanPage = new Page<>();
        //当前页
        marketPlanPage.setPage(page);
        //结果集
        marketPlanPage.setRows(marketPlanList);
        // 每页数
        marketPlanPage.setSize(rows);
        // 总条数
        marketPlanPage.setTotal(count);
        return marketPlanPage;
    }

    @Override
    public int createMarketPlan(MarketPlan marketPlan) {
        return this.marketPlanDao.createMarketPlan(marketPlan);
    }

    @Override
    public MarketPlan getMarketPlanById(Integer id) {
        return this.marketPlanDao.getMarketPlanById(id);
    }

    @Override
    public int updateMarketPlan(MarketPlan marketPlan) {
        return this.marketPlanDao.updateMarketPlan(marketPlan);
    }

    @Override
    public int deleteMarketPlan(Integer id) {
        return this.marketPlanDao.deleteMarketPlan(id);
    }
}
