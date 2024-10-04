package edu.sm.cust.app;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMService;
import edu.sm.cust.service.CustService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main {
    public static void main(String[] args) {
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        SMService<String, Cust> service = (SMService<String, Cust>) factory.getBean("custService");
        service.remove(" id-1");
    }
}
