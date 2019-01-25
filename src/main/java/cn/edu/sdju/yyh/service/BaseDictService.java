package cn.edu.sdju.yyh.service;
import cn.edu.sdju.yyh.po.BaseDict;

import java.util.List;

/**
 * 数据字典Service接口
 */
public interface BaseDictService {
	//根据类别代码查询数据字典
	public List<BaseDict> findBaseDictByTypeCode(String typecode);
}
