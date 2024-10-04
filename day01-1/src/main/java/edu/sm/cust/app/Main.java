package edu.sm.cust.app;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMService;
import edu.sm.cust.service.CustService;


public class Main {
    public static void main(String[] args) {
        SMService<String, Cust> service = new CustService();
        service.remove("id01");
    }
}
