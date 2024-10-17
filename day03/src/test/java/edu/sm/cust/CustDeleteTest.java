package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.repository.CustRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@Slf4j
class CustDeleteTest {
    @Autowired
    CustRepository custRepository;

    @Test
    void testUpdateCust() {
        try {

            custRepository.delete("id01");
            log.info("Delete======================"+custRepository.select());
        } catch (Exception e) {
            log.error("테스트 중 오류 발생", e);
            throw new RuntimeException(e);
        }
    }
}