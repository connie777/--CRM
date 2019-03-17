package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.MarketPerformDao;
import cn.edu.sdju.yyh.dao.UserDao;
import cn.edu.sdju.yyh.po.MarketPerform;
import cn.edu.sdju.yyh.po.PerformResult;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.service.MarketPerformService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @ClassName
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/8 17:48
 * @Version 1.0
 **/
@Service("marketPerformService")
public class MarketPerformServiceImpl implements MarketPerformService {
    @Autowired
    private MarketPerformDao marketPerformDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private HttpSession session;

    @Override
    public Page<MarketPerform> findMarketPerformList(Integer page, Integer rows, Date perform_date, Integer perform_user_id) {
        MarketPerform marketPerform=new MarketPerform();
        //获取登陆用户信息,如果是销售登陆
        User user=(User)session.getAttribute("USER_SESSION");
        if(user.getUser_id()!=null&&user.getUser_level()==3){
            marketPerform.setPerform_user_id(user.getUser_id());
        }
        if(perform_date!=null){
            marketPerform.setPerform_date(perform_date);
        }
        if(perform_user_id!=null){
            marketPerform.setPerform_user_id(perform_user_id);
        }
        marketPerform.setRows(rows);
        marketPerform.setStart_index((page-1)*rows);
        List<MarketPerform> marketPerformList=this.marketPerformDao.selectMarketPerformList(marketPerform);
        Integer count=this.marketPerformDao.selectMarketPerformCount(marketPerform);
        Page<MarketPerform> marketPerformPage=new Page<MarketPerform>();
        marketPerformPage.setTotal(count);
        marketPerformPage.setSize(rows);
        marketPerformPage.setPage(page);
        marketPerformPage.setRows(marketPerformList);
        return marketPerformPage;
    }

    @Override
    public int createMarketPerform(MarketPerform marketPerform) {
        return this.marketPerformDao.createMarketPerform(marketPerform);
    }

    @Override
    public MarketPerform getMarketPerformById(Integer id) {
        return this.marketPerformDao.getMarketPerformById(id);
    }

    @Override
    public int updateMarketPerform(MarketPerform marketPerform) {
        return this.marketPerformDao.updateMarketPerform(marketPerform);
    }

    @Override
    public int deleteMarketPerform(Integer id) {
        return this.marketPerformDao.deleteMarketPerform(id);
    }

    //根据月份统计业绩
    @Override
    public List<PerformResult> countByMonth(Date start_month,Date end_month,Integer user_id) {
        return this.marketPerformDao.countByMonth(start_month,end_month,user_id);
    }

    //统计总销售额
    public PerformResult getTotalSellAmount(){
        return this.marketPerformDao.getTotalSellAmount();
    }

    @Override
    public PerformResult getSellAmountByUserId(Integer id) {
        return this.marketPerformDao.getSellAmountByUserId(id);
    }
}
