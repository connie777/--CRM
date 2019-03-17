package cn.edu.sdju.yyh.dao;

import cn.edu.sdju.yyh.po.MarketPerform;
import cn.edu.sdju.yyh.po.PerformResult;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface MarketPerformDao {
    //查询营销业绩
    List<MarketPerform> selectMarketPerformList(MarketPerform marketPerform);

    //营销业绩总数
    Integer selectMarketPerformCount(MarketPerform marketPerform);

    // 创建营销业绩
    int createMarketPerform(MarketPerform marketPerform);

    // 通过id查询营销业绩
    MarketPerform getMarketPerformById(Integer id);

    // 更新营销业绩
    int updateMarketPerform(MarketPerform marketPerform);

    // 删除营销业绩
    int deleteMarketPerform(Integer id);

    //按月份统计业绩
    List<PerformResult> countByMonth(@Param("start_month") Date start_month,
                                     @Param("end_month")Date end_month,
                                     @Param("user_id")Integer user_id);
    //统计销售总额
    PerformResult getTotalSellAmount();

    //统计某个销售的业绩
    PerformResult getSellAmountByUserId(@Param("user_id") Integer id);
}
