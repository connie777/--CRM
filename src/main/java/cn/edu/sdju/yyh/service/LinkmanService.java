package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.Customer;
import cn.edu.sdju.yyh.po.Linkman;
import cn.edu.sdju.yyh.utils.Page;

import java.util.List;
public interface LinkmanService {
	// 查询联系人列表
    Page<Linkman> findLinkmanList(Integer page, Integer rows,
                                  String lkm_name, String lkm_gender,
                                  Integer lkm_cust_id, List<Customer> list);

    // 创建客户联系人
    int createLinkman(Linkman linkman);

    // 通过id查询联系人
    Linkman getLinkmanById(Integer id);

    // 更新联系人信息
    int updateLinkman(Linkman linkman);

    // 删除联系人
    int deleteLinkman(Integer id);

    List<Linkman> findByCustId(Integer id);

}
