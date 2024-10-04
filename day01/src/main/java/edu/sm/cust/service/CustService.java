package edu.sm.cust.service;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMRepository;
import edu.sm.cust.frame.SMService;
import edu.sm.cust.repository.CustRepository;

public class CustService implements SMService<String, Cust> {
    SMRepository<String,Cust> repository;

    public CustService(){
        repository = new CustRepository();
    }
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
