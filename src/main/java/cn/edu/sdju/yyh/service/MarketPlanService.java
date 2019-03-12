package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.MarketPlan;
import cn.edu.sdju.yyh.utils.Page;

public interface MarketPlanService {
    //按条件查询营销计划
    Page<MarketPlan> findMarketPlanList(Integer page,
                                        Integer rows,
                                        String plan_name,
                                        Integer plan_principal);

    //创建营销计划
    int createMarketPlan(MarketPlan marketPlan);

    // 通过id查询营销计划
    MarketPlan getMarketPlanById(Integer id);

    // 更新营销计划
    int updateMarketPlan(MarketPlan marketPlan);

    // 删除营销计划
    int deleteMarketPlan(Integer id);
}
