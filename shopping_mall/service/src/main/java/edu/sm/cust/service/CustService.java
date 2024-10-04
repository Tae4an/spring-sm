package edu.sm.cust.service;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMRepository;
import edu.sm.cust.frame.SMService;

public class CustService implements SMService<String, Cust> {
    SMRepository<String,Cust> repository;
    public void setRepository(SMRepository<String,Cust> repository) {
        this.repository = repository;

        System.out.println("Create Connection Pool ...");
    }

//    public CustService() {}
//    public CustService(SMRepository<String,Cust> repository) {
//        this.repository = repository;
//    }
    @Override
    public void register(Cust cust) {
        repository.insert(cust);
    }

    @Override
    public void modify(Cust cust) {
        repository.update(cust);
    }

    @Override
    public void remove(String id) {
        repository.delete(id);
    }
}
