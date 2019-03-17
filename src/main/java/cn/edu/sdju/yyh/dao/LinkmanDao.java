package cn.edu.sdju.yyh.dao;

import cn.edu.sdju.yyh.po.Linkman;

import java.util.List;
public interface LinkmanDao {

    // 联系人列表
    List<Linkman> selectLinkmanList(Linkman linkman);

    //联系人总数
    Integer selectLinkmanListCount(Linkman linkman);

    // 创建客户联系人
    int createLinkman(Linkman linkman);

    // 通过id查询联系人
    Linkman getLinkmanById(Integer id);

    // 更新联系人信息
    int updateLinkman(Linkman linkman);

    // 删除联系人
    int deleteLinkman(Integer id);

    //通过客户id查联系人
    List<Linkman> findByCustId(Integer custId);

    //根据客户id删除联系人
    int deleteByCustId(Integer id);

}
