package cn.edu.sdju.yyh.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName MarketPlan
 * @Description 营销计划实体类
 * @Author Silence
 * @Date 2019/3/4 17:35
 * @Version 1.0
 **/
public class MarketPlan {
    private Integer plan_id;
    private String plan_name;
    private String plan_content;
    private String plan_cost;
    private String plan_profits;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date plan_start_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date plan_end_date;
    private Integer plan_principal;//负责人
    private String plan_user_name;
    private String plan_remark;
    private User user;
    /*分页属性*/
    private Integer start_index;            // 起始行
    private Integer rows;             // 所取行数

    public Integer getPlan_id() {
        return plan_id;
    }

    public void setPlan_id(Integer plan_id) {
        this.plan_id = plan_id;
    }

    public String getPlan_name() {
        return plan_name;
    }

    public void setPlan_name(String plan_name) {
        this.plan_name = plan_name;
    }

    public String getPlan_content() {
        return plan_content;
    }

    public void setPlan_content(String plan_content) {
        this.plan_content = plan_content;
    }

    public String getPlan_cost() {
        return plan_cost;
    }

    public void setPlan_cost(String plan_cost) {
        this.plan_cost = plan_cost;
    }

    public String getPlan_profits() {
        return plan_profits;
    }

    public void setPlan_profits(String plan_profits) {
        this.plan_profits = plan_profits;
    }

    public Date getPlan_start_date() {
        return plan_start_date;
    }

    public void setPlan_start_date(Date plan_start_date) {
        this.plan_start_date = plan_start_date;
    }

    public Date getPlan_end_date() {
        return plan_end_date;
    }

    public void setPlan_end_date(Date plan_end_date) {
        this.plan_end_date = plan_end_date;
    }

    public Integer getPlan_principal() {
        return plan_principal;
    }

    public void setPlan_principal(Integer plan_principal) {
        this.plan_principal = plan_principal;
    }

    public String getPlan_remark() {
        return plan_remark;
    }

    public void setPlan_remark(String plan_remark) {
        this.plan_remark = plan_remark;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getPlan_user_name() {
        return plan_user_name;
    }

    public void setPlan_user_name(String plan_user_name) {
        this.plan_user_name = plan_user_name;
    }
}
