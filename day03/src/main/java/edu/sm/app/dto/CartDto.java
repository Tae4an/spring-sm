package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private int cartId;
    private String custId;
    private int itemId;
    private int count;
    private LocalDateTime regDate;
    private ItemDto item;
    private int totalPrice;
}