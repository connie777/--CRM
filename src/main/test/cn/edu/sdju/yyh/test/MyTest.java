package cn.edu.sdju.yyh.test;

import cn.edu.sdju.yyh.po.Customer;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class MyTest {

    @Test
    public void instanceTest() {
        Customer customer=new Customer();
        List<Customer> customers=new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            customer.setCust_id(i);
            customers.add(customer);
        }
        for (int i = 0; i < 5; i++) {
            System.out.println(customers.get(i));
        }
    }
}