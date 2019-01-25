package cn.edu.sdju.yyh.service.impl;
import java.util.List;

import cn.edu.sdju.yyh.dao.BaseDictDao;
import cn.edu.sdju.yyh.po.BaseDict;
import cn.edu.sdju.yyh.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 数据字典Service接口实现类
 */
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {
	@Autowired
	private BaseDictDao baseDictDao;
	//根据类别代码查询数据字典
	public List<BaseDict> findBaseDictByTypeCode(String typecode) {
		return baseDictDao.selectBaseDictByTypeCode(typecode);
	}
}
