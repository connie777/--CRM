package cn.edu.sdju.yyh.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName MarketPerform
 * @Description 营销业绩实体类
 * @Author Silence
 * @Date 2019/3/8 17:28
 * @Version 1.0
 **/
public class MarketPerform {
    private Integer perform_id;
    private Integer perform_user_id;//销售
    private String  perform_user_name;
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date perform_date;
    private Double perform_total_amount;
    private User user;

    /*分页属性*/
    private Integer start_index;            // 起始行
    private Integer rows;             // 所取行数

    public Integer getPerform_id() {
        return perform_id;
    }

    public void setPerform_id(Integer perform_id) {
        this.perform_id = perform_id;
    }

    public Integer getPerform_user_id() {
        return perform_user_id;
    }

    public void setPerform_user_id(Integer perform_user_id) {
        this.perform_user_id = perform_user_id;
    }

    public Date getPerform_date() {
        return perform_date;
    }

    public void setPerform_date(Date perform_date) {
        this.perform_date = perform_date;
    }

    public Double getPerform_total_amount() {
        return perform_total_amount;
    }

    public void setPerform_total_amount(Double perform_total_amount) {
        this.perform_total_amount = perform_total_amount;
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

    public String getPerform_user_name() {
        return perform_user_name;
    }

    public void setPerform_user_name(String perform_user_name) {
        this.perform_user_name = perform_user_name;
    }
}
