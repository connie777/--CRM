package cn.edu.sdju.yyh.service;

import cn.edu.sdju.yyh.po.Contract;
import cn.edu.sdju.yyh.utils.Page;

public interface ContractService {
    Page<Contract> findContractList(Integer page,
                                    Integer rows,
                                    String contract_id,
                                    String  contract_cust_name);

    int createContract(Contract contract);

    Contract getContractById(String id);
}
