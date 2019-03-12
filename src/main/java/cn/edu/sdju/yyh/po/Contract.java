package cn.edu.sdju.yyh.po;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @ClassName Contract
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/6 16:59
 * @Version 1.0
 **/
public class Contract {
    private String contract_id;
    private String contract_cust_name;
    private Integer contract_cust_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date contract_date;
    private MultipartFile contract_annex;
    private String contract_img;
    private Customer customer;
    /*分页属性*/
    private Integer start_index;            // 起始行
    private Integer rows;             // 所取行数


    public String getContract_id() {
        return contract_id;
    }

    public void setContract_id(String contract_id) {
        this.contract_id = contract_id;
    }

    public String getContract_cust_name() {
        return contract_cust_name;
    }

    public void setContract_cust_name(String contract_cust_name) {
        this.contract_cust_name = contract_cust_name;
    }

    public Integer getContract_cust_id() {
        return contract_cust_id;
    }

    public void setContract_cust_id(Integer contract_cust_id) {
        this.contract_cust_id = contract_cust_id;
    }

    public Date getContract_date() {
        return contract_date;
    }

    public void setContract_date(Date contract_date) {
        this.contract_date = contract_date;
    }

    public MultipartFile getContract_annex() {
        return contract_annex;
    }

    public void setContract_annex(MultipartFile contract_annex) {
        this.contract_annex = contract_annex;
    }

    public String getContract_img() {
        return contract_img;
    }

    public void setContract_img(String contract_img) {
        this.contract_img = contract_img;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Integer getStart_index() {
        return start_index;
    }

    public void setStart_index(Integer start_index) {
        this.start_index = start_index;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
