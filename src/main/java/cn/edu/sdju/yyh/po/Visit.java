package cn.edu.sdju.yyh.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @ClassName Visit
 * @Description 拜访信息pojo
 * @Author Silence
 * @Date 2018/12/24 10:15
 * @Version 1.0
 **/
public class Visit {
    private Integer visit_id;
    private Integer visit_cust_id;//拜访客户id
    private String visit_cust_name;
    private Integer visit_user_id;//业务员id
    private String visit_user_name;
    private Integer visit_lkm_id;//客户联系人id
    private String visit_lkm_name; //name
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date visit_time;//拜访时间
    private String visit_addr;//拜访地点
    private String visit_detail;//拜访细节
    private Date visit_nexttime;//下次拜访时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end_date;
    private User user;
    private Customer customer;
    private Linkman linkman;
    private List<Integer> custIds;

    /*分页属性*/
    private Integer start_index;            // 起始行
    private Integer rows;             // 所取行数

    public String getVisit_lkm_name() {
        return visit_lkm_name;
    }

    public void setVisit_lkm_name(String visit_lkm_name) {
        this.visit_lkm_name = visit_lkm_name;
    }

    public List<Integer> getCustIds() {
        return custIds;
    }

    public void setCustIds(List<Integer> custIds) {
        this.custIds = custIds;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Linkman getLinkman() {
        return linkman;
    }

    public void setLinkman(Linkman linkman) {
        this.linkman = linkman;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
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

    public Integer getVisit_id() {
        return visit_id;
    }

    public void setVisit_id(Integer visit_id) {
        this.visit_id = visit_id;
    }

    public Integer getVisit_cust_id() {
        return visit_cust_id;
    }

    public void setVisit_cust_id(Integer visit_cust_id) {
        this.visit_cust_id = visit_cust_id;
    }

    public Integer getVisit_user_id() {
        return visit_user_id;
    }

    public void setVisit_user_id(Integer visit_user_id) {
        this.visit_user_id = visit_user_id;
    }

    public Integer getVisit_lkm_id() {
        return visit_lkm_id;
    }

    public void setVisit_lkm_id(Integer visit_lkm_id) {
        this.visit_lkm_id = visit_lkm_id;
    }

    public Date getVisit_time() {
        return visit_time;
    }

    public void setVisit_time(Date visit_time) {
        this.visit_time = visit_time;
    }

    public String getVisit_addr() {
        return visit_addr;
    }

    public void setVisit_addr(String visit_addr) {
        this.visit_addr = visit_addr;
    }

    public String getVisit_detail() {
        return visit_detail;
    }

    public void setVisit_detail(String visit_detail) {
        this.visit_detail = visit_detail;
    }

    public Date getVisit_nexttime() {
        return visit_nexttime;
    }

    public void setVisit_nexttime(Date visit_nexttime) {
        this.visit_nexttime = visit_nexttime;
    }

    public String getVisit_cust_name() {
        return visit_cust_name;
    }

    public void setVisit_cust_name(String visit_cust_name) {
        this.visit_cust_name = visit_cust_name;
    }

    public String getVisit_user_name() {
        return visit_user_name;
    }

    public void setVisit_user_name(String visit_user_name) {
        this.visit_user_name = visit_user_name;
    }
}
