package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.Visit;
import cn.edu.sdju.yyh.utils.Page;

import java.util.Date;

public interface VisitService {
	// 查询拜访信息列表
    Page<Visit> findVisitList(Integer page, Integer rows,
                              Integer visit_cust_id, Date start_date,
                              Date end_date);

    // 创建拜访信息
    int createVisit(Visit visit);

    // 通过id查询拜访信息
    Visit getVisitById(Integer id);

    // 更新拜访信息
    int updateVisit(Visit visit);

    // 删除拜访信息
    int deleteVisit(Integer id);

}
