package cn.edu.sdju.yyh.dao;

import cn.edu.sdju.yyh.po.MarketPlan;

import java.util.List;

public interface MarketPlanDao {
    //查询营销计划
    List<MarketPlan> selectMarketPlanList(MarketPlan marketPlan);

    //营销计划总数
    Integer selectMarketPlanCount(MarketPlan marketPlan);

    // 创建营销计划
    int createMarketPlan(MarketPlan MarketPlan);

    // 通过id查询营销计划
    MarketPlan getMarketPlanById(Integer id);

    // 更新营销计划
    int updateMarketPlan(MarketPlan marketPlan);

    // 删除营销计划
    int deleteMarketPlan(Integer id);

}
