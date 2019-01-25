package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.dao.LinkmanDao;
import cn.edu.sdju.yyh.dao.UserDao;
import cn.edu.sdju.yyh.dao.VisitDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.po.Visit;
import cn.edu.sdju.yyh.service.LinkmanService;
import cn.edu.sdju.yyh.service.VisitService;
import cn.edu.sdju.yyh.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public Page<Visit> findVisitList(Integer page, Integer rows, Integer visit_cust_id, Date start_date, Date end_date) {
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
        // 从哪条数据开始查
        visit.setStart_index((page-1) * rows); ;
        // 每页数
        visit.setRows(rows);
        // 查询拜访信息列表
        List<Visit> visits =
                visitDao.selectVisitList(visit);
        //用于拜访信息列表中客户名称、联系人名称、业务员名称的显示(数据表存的字段是id，但页面需要显示名字)
        for (int i = 0; i <visits.size() ; i++) {
            visits.get(i).setCustomer(this.customerDao.getCustomerById(visits.get(i).getVisit_cust_id()));
            visits.get(i).setUser(this.userDao.selectUserById(visits.get(i).getVisit_user_id()));
            visits.get(i).setLinkman(this.linkmanDao.getLinkmanById(visits.get(i).getVisit_lkm_id()));
        }
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
        return this.visitDao.getVisitById(id);
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
