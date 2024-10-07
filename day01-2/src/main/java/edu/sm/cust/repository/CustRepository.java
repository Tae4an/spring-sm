package edu.sm.cust.repository;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMRepository;
import org.springframework.stereotype.Repository;

@Repository
public class CustRepository implements SMRepository<String, Cust> {

    @Override
    public void insert(Cust cust) {
        System.out.println("Insert cust" + cust);
    }

    @Override
    public void update(Cust cust) {
        System.out.println("Update cust " + cust);
    }

    @Override
    public void delete(String id) {
        System.out.println("Delete cust" + id);
    }
}
