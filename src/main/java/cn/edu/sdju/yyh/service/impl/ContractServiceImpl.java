package cn.edu.sdju.yyh.service.impl;

import cn.edu.sdju.yyh.dao.ContractDao;
import cn.edu.sdju.yyh.po.Contract;
import cn.edu.sdju.yyh.service.ContractService;
import cn.edu.sdju.yyh.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/7 10:27
 * @Version 1.0
 **/
@Service("contractService")
@Transactional
public class ContractServiceImpl implements ContractService {
    @Autowired
    private ContractDao contractDao;

    @Override
    public Page<Contract> findContractList(Integer page,
                                           Integer rows,
                                           String contract_id,
                                           String contract_cust_name) {
        Contract contract=new Contract();
        if(contract_id!=null&&contract_id!=""){
            contract.setContract_id(contract_id);
        }
        if(contract_cust_name!=null&&contract_cust_name!=""){
            contract.setContract_cust_name(contract_cust_name);
        }
        contract.setRows(rows);
        contract.setStart_index((page-1)*rows);
        List<Contract> contractList=this.contractDao.selectContractList(contract);
        Integer count=this.contractDao.selectContractListCount(contract);
        Page<Contract> contractPage=new Page<Contract>();
        contractPage.setRows(contractList);
        contractPage.setPage(page);
        contractPage.setSize(rows);
        contractPage.setTotal(count);
        return contractPage;
    }

    @Override
    public int createContract(Contract contract) {
        return this.contractDao.createContract(contract);
    }

    @Override
    public Contract getContractById(String id) {
        return this.contractDao.getContractById(id);
    }

    @Override
    public int deleteContract(String id) {
        return this.contractDao.deleteContract(id);
    }
}
