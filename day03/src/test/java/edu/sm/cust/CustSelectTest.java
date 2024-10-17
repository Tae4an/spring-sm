package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.repository.CustRepository;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class CustSelectTest {
    @Autowired
    CustRepository custRepository;
    @Test
    void contextLoads() {
        try {
            List<CustDto> list = custRepository.select();
            log.info("CustSelectTest================"+list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
