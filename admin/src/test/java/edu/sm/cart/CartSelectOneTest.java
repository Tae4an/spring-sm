package edu.sm.cart;

import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class CartSelectOneTest {
    @Autowired
    CartService cartService;

    @Test
    void testSelectOneCart() {
        CartDto cartDto = CartDto.builder().custId("user1").itemId(1).build();
        try {
            cartService.get(cartDto);
        } catch (Exception e) {
            log.error("Error retrieving cart item", e);
            throw new RuntimeException(e);
        }
    }
}