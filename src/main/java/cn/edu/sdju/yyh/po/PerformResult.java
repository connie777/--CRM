package cn.edu.sdju.yyh.po;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @ClassName PerformResult
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/9 22:50
 * @Version 1.0
 **/
public class PerformResult {
    private boolean status=false;
    private List<Map<String,Object>> resultList;
    private Date month;
    private Double totalAmount;
    private Double total_sell_amount;
    private Integer total_cust;
    private Integer total_contract;
    private Integer total_visit_record;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<Map<String, Object>> getResultList() {
        return resultList;
    }

    public void setResultList(List<Map<String, Object>> resultList) {
        this.resultList = resultList;
    }

    public Date getMonth() {
        return month;
    }

    public void setMonth(Date month) {
        this.month = month;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getTotal_sell_amount() {
        return total_sell_amount;
    }

    public void setTotal_sell_amount(Double total_sell_amount) {
        this.total_sell_amount = total_sell_amount;
    }

    public Integer getTotal_cust() {
        return total_cust;
    }

    public void setTotal_cust(Integer total_cust) {
        this.total_cust = total_cust;
    }

    public Integer getTotal_contract() {
        return total_contract;
    }

    public void setTotal_contract(Integer total_contract) {
        this.total_contract = total_contract;
    }

    public Integer getTotal_visit_record() {
        return total_visit_record;
    }

    public void setTotal_visit_record(Integer total_visit_record) {
        this.total_visit_record = total_visit_record;
    }
}
