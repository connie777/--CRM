package cn.edu.sdju.yyh.dao;
import cn.edu.sdju.yyh.po.BaseDict;
import java.util.List;

/**
 * 数据字典
 */
public interface BaseDictDao {
	// 根据类别代码查询数据字典
    public List<BaseDict> selectBaseDictByTypeCode(String typecode);
}
