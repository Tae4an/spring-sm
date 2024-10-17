package edu.sm.app.service;

import edu.sm.app.dto.CustDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements SMService<String, CustDto> {

    final CustRepository custRepository;

    @Override
    public void add(CustDto value) throws Exception {
        custRepository.insert(value);
    }

    @Override
    public void modify(CustDto value) throws Exception {
        custRepository.update(value);
    }

    @Override
    public void delete(String key) throws Exception {
        custRepository.delete(key);
    }

    @Override
    public CustDto get(String key) throws Exception {
        return null;
    }

    @Override
    public List<CustDto> get() throws Exception {
        return List.of();
    }
}
