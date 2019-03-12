package cn.edu.sdju.yyh.controller;

import cn.edu.sdju.yyh.po.Contract;
import cn.edu.sdju.yyh.service.ContractService;
import cn.edu.sdju.yyh.utils.Page;
import cn.edu.sdju.yyh.utils.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName ContractController
 * @Description 合同管理控制器
 * @Author Silence
 * @Date 2019/3/6 15:12
 * @Version 1.0
 **/
@Controller
@RequestMapping("/contract")
public class ContractController {
    @Autowired
    private ContractService contractService;

    //查询合同信息
    @RequestMapping(value = "/list.action",method = RequestMethod.GET)
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       String contract_id,
                       String contract_cust_name,
                       Model model){
        Page<Contract> contractPage=contractService.findContractList(page,rows,contract_id,contract_cust_name);
        model.addAttribute("page",contractPage);
        List<Contract> contractList=contractPage.getRows();
        model.addAttribute("contractList",contractList);


        //查询条件回显
        if(contract_id!=null){
            model.addAttribute("contract_id",contract_id);
        }
        if(contract_cust_name!=null){
            model.addAttribute("contract_cust_name",contract_cust_name);
        }
        return "contract";
    }

    //录入合同信息
    @RequestMapping(value = "/createContract.action",method = RequestMethod.POST)
    @ResponseBody
    public String createContract(Contract contract,HttpServletRequest request){
        //设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(request.getSession().getServletContext().getRealPath(""));
        MultipartFile multipartFile=contract.getContract_annex();
        String dbPath=Upload.upload(multipartFile,url);
        contract.setContract_img(dbPath);
        int result=this.contractService.createContract(contract);
        if(result>0){
            return "SUCCESS";
        }else {
            return "FAILURE";
        }
    }

    //根据合同编号查找合同（返回合同图片的地址）
    @RequestMapping(value = "/getContractById.action",method = RequestMethod.GET)
    @ResponseBody
    public String getContractById(String id,HttpServletRequest request){
        /*String localUrl=request.getSession().getServletContext().getRealPath("");
        * String absoUrl=localUrl+"/"+contract.getContract_img();*/
        Contract contract=this.contractService.getContractById(id);
        return contract.getContract_img();
    }
}
