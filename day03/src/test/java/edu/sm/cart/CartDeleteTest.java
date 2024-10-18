package edu.sm.cart;

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
    void testDeleteCart() {
        try {
            cartService.delete(1);
        } catch (Exception e) {
            log.error("Error deleting cart item", e);
            throw new RuntimeException(e);
        }
    }
}