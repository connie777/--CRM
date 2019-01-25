package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.CustomerDao;
import cn.edu.sdju.yyh.dao.LinkmanDao;
import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.service.LinkmanService;
import cn.edu.sdju.yyh.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

/**
 * 联系人管理
 */
@Service("linkmanService")
@Transactional
public class LinkmanServiceImpl implements LinkmanService {
    @Autowired
    private LinkmanDao linkmanDao;
    @Autowired
    private CustomerDao customerDao;

    /**
     * 联系人列表
     * @param page
     * @param rows
     * @param lkm_name
     * @param lkm_gender
     * @param lkm_cust_id
     * @return
     */
    @Override
    public Page<Linkman> findLinkmanList(Integer page,
                                         Integer rows,
                                         String lkm_name,
                                         String lkm_gender,
                                         Integer lkm_cust_id
                                         ) {
        // 创建联系人对象
        Linkman linkman=new Linkman();
        // 判断联系人名称
        if(StringUtils.isNotBlank(lkm_name)){
            linkman.setLkm_name(lkm_name);
        }
        // 判断联系人性别
        if(StringUtils.isNotBlank(lkm_gender)){
            linkman.setLkm_gender(lkm_gender);
        }
        // 判断联系人所属客户
        if(lkm_cust_id!=null){
            linkman.setLkm_cust_id(lkm_cust_id);
        }
        // 从哪条数据开始查
        linkman.setStart_index((page-1) * rows); ;
        // 每页数
        linkman.setRows(rows);
        // 查询客户列表
        List<Linkman> linkmens =
                linkmanDao.selectLinkmanList(linkman);
        //用于联系人列表中所属客户的显示(联系人数据表存的字段是id，但页面需要显示名字)
        for (int i = 0; i < linkmens.size(); i++) {
            Customer customer=new Customer();
            customer=customerDao.getCustomerById(linkmens.get(i).getLkm_cust_id());
            linkmens.get(i).setCustomer(customer);
        }
        /*//用于搜索条件的所属客户显示（需要显示所有客户）
        List<Linkman> linkmanList=linkmanDao.selectLinkmanList(new Linkman());*/
        // 查询客户列表总记录数
        Integer count = linkmanDao.selectLinkmanListCount(linkman);
        // 创建Page返回对象用于分页
        Page<Linkman> result = new Page<>();
        result.setPage(page);
        result.setRows(linkmens);/*存入查询结果*/
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /**
     * 创建联系人
     * @param linkman
     * @return
     */
    @Override
    public int createLinkman(Linkman linkman) {
        return linkmanDao.createLinkman(linkman);
    }

    /**
     * 根据id获取联系人对象
     * @param id
     * @return
     */
    @Override
    public Linkman getLinkmanById(Integer id) {
        return linkmanDao.getLinkmanById(id);
    }

    /**
     * 更新联系人
     * @param linkman
     * @return
     */
    @Override
    public int updateLinkman(Linkman linkman) {
        return linkmanDao.updateLinkman(linkman);
    }

    /**
     * 删除联系人
     * @param id
     * @return
     */
    @Override
    public int deleteLinkman(Integer id) {
        return linkmanDao.deleteLinkman(id);
    }

    @Override
    public List<Linkman> findByCustId(Integer id) {
        return this.linkmanDao.findByCustId(id);
    }
}
