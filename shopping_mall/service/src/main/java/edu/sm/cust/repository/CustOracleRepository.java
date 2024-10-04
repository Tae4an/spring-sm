package edu.sm.cust.repository;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMRepository;

public class CustOracleRepository implements SMRepository<String, Cust> {

    @Override
    public void insert(Cust cust) {
        System.out.println("Oracle Insert cust" + cust);
    }

    @Override
    public void update(Cust cust) {
        System.out.println("Oracle Update cust " + cust);
    }

    @Override
    public void delete(String id) {
        System.out.println("Oracle Delete cust" + id);
    }
}
