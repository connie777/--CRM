package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.MarketPerform;
import cn.edu.sdju.yyh.po.MarketPlan;
import cn.edu.sdju.yyh.po.PerformResult;
import cn.edu.sdju.yyh.utils.Page;

import java.util.Date;
import java.util.List;

public interface MarketPerformService {
    //按条件查询营销业绩
    Page<MarketPerform> findMarketPerformList(Integer page,
                                              Integer rows,
                                              Date perform_date,
                                              Integer perform_user_id);

    //创建营销业绩
    int createMarketPerform(MarketPerform marketPerform);

    // 通过id查询营销业绩
    MarketPlan getMarketPerformById(Integer id);

    // 更新营销业绩
    int updateMarketPerform(MarketPerform marketPerform);

    // 删除营销业绩
    int deleteMarketPerform(Integer id);

    //按月份统计业绩
    List<PerformResult> countByMonth(Date start_month,Date end_month);

    //统计总销售额
    PerformResult getTotalSellAmount();

    //统计某个销售的业绩
    PerformResult getSellAmountByUserId(Integer id);
}
