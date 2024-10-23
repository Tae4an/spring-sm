package edu.sm.cart;

import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class CartDeleteTest {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {

        CartDto cartDto = CartDto.builder()
                .custId("id01")
                .itemId(1)
                .build();
        try {
            cartService.delete(cartDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}