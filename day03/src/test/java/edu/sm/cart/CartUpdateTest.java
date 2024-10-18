package edu.sm.cart;

import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class CartUpdateTest {
    @Autowired
    CartService cartService;

    @Test
    void testUpdateCart() {
        try {
            CartDto cartDto = CartDto.builder()
                    .cartId(1)
                    .userId("user33333")
                    .itemId(2)
                    .count(3)
                    .regDate(LocalDateTime.now())
                    .build();

            cartService.modify(cartDto);
        } catch (Exception e) {
            log.error("Error updating cart item", e);
            throw new RuntimeException(e);
        }
    }
}