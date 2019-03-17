package cn.edu.sdju.yyh.dao;

import cn.edu.sdju.yyh.po.Contract;

import java.util.List;

public interface ContractDao {
    //查询合同
    List<Contract> selectContractList(Contract contract);
    //合同总数
    Integer selectContractListCount(Contract contract);

    Contract getContractById(String id);

    Integer deleteContract(String id);

    //创建合同
    int createContract(Contract contract);
}
