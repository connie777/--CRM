package cn.edu.sdju.yyh.dao;

import cn.edu.sdju.yyh.po.Visit;

import java.util.List;
public interface VisitDao {

    // 拜访信息列表
    List<Visit> selectVisitList(Visit visit);

    //拜访信息总数
    Integer selectVisitListCount(Visit visit);

    // 创建拜访信息
    int createVisit(Visit visit);

    // 通过id查询拜访信息
    Visit getVisitById(Integer id);

    // 更新拜访信息
    int updateVisit(Visit visit);

    // 删除拜访信息
    int deleteVisit(Integer id);

}
