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
class CustUpdateTest {
    @Autowired
    CustRepository custRepository;

    @Test
    void testUpdateCust() {
        try {
            CustDto custDto = CustDto.builder()
                    .id("id01")
                    .pwd("pwd999")
                    .name("Taesan111")
                    .build();

            custRepository.update(custDto);
            log.info("Update======================"+custRepository.selectOne(custDto.getId()));
        } catch (Exception e) {
            log.error("테스트 중 오류 발생", e);
            throw new RuntimeException(e);
        }
    }
}