package edu.sm.cust.service;

import edu.sm.cust.dto.Cust;
import edu.sm.cust.frame.SMRepository;
import edu.sm.cust.frame.SMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("custService")
public class CustService implements SMService<String, Cust> {
    @Autowired
    SMRepository<String,Cust> repository;

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
