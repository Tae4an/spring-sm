package edu.sm.cart;

import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
@Slf4j
class CartSelectTest {
    @Autowired
    CartService cartService;

    @Test
    void testSelectAllCarts() {
        try {
            cartService.get();
        } catch (Exception e) {
            log.error("Error retrieving all cart items", e);
            throw new RuntimeException(e);
        }
    }
}