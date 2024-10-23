package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class CustUpdateTest {
    @Autowired
    CustService custService;

    @Test
    void testUpdateCust() {
        try {
            CustDto custDto = CustDto.builder()
                    .custId("id01")
                    .custPwd("pwd999")
                    .custName("Taesan111")
                    .build();

            custService.modify(custDto);
        } catch (Exception e) {
            log.error("테스트 중 오류 발생", e);
            throw new RuntimeException(e);
        }
    }
}