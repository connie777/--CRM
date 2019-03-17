package cn.edu.sdju.yyh.po;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName Linkman
 * @Description TODO
 * @Author Silence
 * @Date 2018/12/18 14:53
 * @Version 1.0
 **/
public class Linkman implements Serializable{

    private Integer lkm_id;
    private String lkm_name;  /*联系人名称*/
    private String lkm_gender;  /*联系人性别*/
    private String lkm_phone;  /*办公电话*/
    private String lkm_mobile;  /*手机*/
    private String lkm_email;   /*邮箱*/
    private String lkm_qq;  /* QQ*/
    private String lkm_position; /* 职位*/
    private String lkm_memo;   /*备注*/
    private Integer lkm_cust_id;/* 客户id*/
    private String lkm_cust_name; /*所属客户姓名*/
    private Customer customer; /*一个联系人对应一个客户*/
    private List<Integer> cust_ids;
    private Boolean isSeller;

    public List<Integer> getCust_ids() {
        return cust_ids;
    }

    public void setCust_ids(List<Integer> cust_ids) {
        this.cust_ids = cust_ids;
    }

    /*分页属性*/
    private Integer start_index;            // 起始行
    private Integer rows;             // 所取行数
    public Integer getLkm_cust_id() {
        return lkm_cust_id;
    }

    public void setLkm_cust_id(Integer lkm_cust_id) {
        this.lkm_cust_id = lkm_cust_id;
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

    public Integer getLkm_id() {
        return lkm_id;
    }

    public void setLkm_id(Integer lkm_id) {
        this.lkm_id = lkm_id;
    }

    public String getLkm_name() {
        return lkm_name;
    }

    public void setLkm_name(String lkm_name) {
        this.lkm_name = lkm_name;
    }

    public String getLkm_gender() {
        return lkm_gender;
    }

    public void setLkm_gender(String lkm_gender) {
        this.lkm_gender = lkm_gender;
    }

    public String getLkm_phone() {
        return lkm_phone;
    }

    public void setLkm_phone(String lkm_phone) {
        this.lkm_phone = lkm_phone;
    }

    public String getLkm_mobile() {
        return lkm_mobile;
    }

    public void setLkm_mobile(String lkm_mobile) {
        this.lkm_mobile = lkm_mobile;
    }

    public String getLkm_email() {
        return lkm_email;
    }

    public void setLkm_email(String lkm_email) {
        this.lkm_email = lkm_email;
    }

    public String getLkm_qq() {
        return lkm_qq;
    }

    public void setLkm_qq(String lkm_qq) {
        this.lkm_qq = lkm_qq;
    }

    public String getLkm_position() {
        return lkm_position;
    }

    public void setLkm_position(String lkm_position) {
        this.lkm_position = lkm_position;
    }

    public String getLkm_memo() {
        return lkm_memo;
    }

    public void setLkm_memo(String lkm_memo) {
        this.lkm_memo = lkm_memo;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getLkm_cust_name() {
        return lkm_cust_name;
    }

    public void setLkm_cust_name(String lkm_cust_name) {
        this.lkm_cust_name = lkm_cust_name;
    }

    public Boolean getSeller() {
        return isSeller;
    }

    public void setSeller(Boolean seller) {
        isSeller = seller;
    }
}
