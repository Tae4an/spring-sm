package edu.sm.app;

import edu.sm.dto.Cust;
import edu.sm.frame.SMService;
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
