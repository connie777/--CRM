package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.dao.LinkmanDao;
import cn.edu.sdju.yyh.dao.UserDao;
import cn.edu.sdju.yyh.dao.VisitDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.po.User;
import cn.edu.sdju.yyh.po.Visit;
import cn.edu.sdju.yyh.service.VisitService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 拜访信息管理
 */
@Service("visitService")
@Transactional
public class VisitServiceImpl implements VisitService {
    @Autowired
    private LinkmanDao linkmanDao;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private VisitDao visitDao;
    @Autowired
    private UserDao userDao;
    /**
     * 获取拜访信息用于分页显示
     * @param page
     * @param rows
     * @param visit_cust_id
     * @param start_date
     * @param end_date
     * @return
     */
    @Override
    public Page<Visit> findVisitList(Integer page, Integer rows, Integer visit_cust_id, Date start_date, Date end_date,
                                     List<Customer> list) {
        // 创建拜访信息对象
        Visit visit=new Visit();
        // 判断客户名称不为空
        if(visit_cust_id!=null){
            visit.setVisit_cust_id(visit_cust_id);
        }
        // 判断开始日期不为空
        if(start_date!=null){
            visit.setStart_date(start_date);
        }
        // 判断结束日期不为空
        if(end_date!=null){
            visit.setEnd_date(end_date);
        }
        if(list!=null){
            List<Integer> custIds=new ArrayList<Integer>();
            for (int i = 0; i < list.size(); i++) {
               custIds.add(list.get(i).getCust_id());
            }
            visit.setCustIds(custIds);
        }
        // 从哪条数据开始查
        visit.setStart_index((page-1) * rows); ;
        // 每页数
        visit.setRows(rows);
        // 查询拜访信息列表
        List<Visit> visits =
                visitDao.selectVisitList(visit);
        // 查询拜访信息列表总记录数
        Integer count = visitDao.selectVisitListCount(visit);
        // 创建Page返回对象用于分页
        Page<Visit> result = new Page<>();
        result.setPage(page);
        result.setRows(visits);/*存入查询结果*/
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /**
     * 创建拜访信息
     * @param visit
     * @return
     */
    @Override
    public int createVisit(Visit visit) {
        return this.visitDao.createVisit(visit);
    }

    /**
     * 根据id获取拜访信息
     * @param id
     * @return
     */
    @Override
    public Visit getVisitById(Integer id) {
        Visit visit=this.visitDao.getVisitById(id);
        Integer user_id=visit.getVisit_user_id();
        if(user_id!=null){
            User user=this.userDao.selectUserById(user_id);
            visit.setUser(user);
        }
        Integer visit_lkm_id=visit.getVisit_lkm_id();
        /*Date date=visit.getVisit_time();
        String simpleDate=new SimpleDateFormat("yyyy-MM-dd").format(date);
        System.out.println(date);
        System.out.println(simpleDate);*/
        Linkman linkman=this.linkmanDao.getLinkmanById(visit_lkm_id);
        visit.setVisit_lkm_name(linkman.getLkm_name());
        return visit;

    }

    /**
     * 更新拜访信息
     * @param visit
     * @return
     */
    @Override
    public int updateVisit(Visit visit) {
        return this.visitDao.updateVisit(visit);
    }

    /**
     * 删除拜访信息
     * @param id
     * @return
     */
    @Override
    public int deleteVisit(Integer id) {
        return this.visitDao.deleteVisit(id);
    }
}
