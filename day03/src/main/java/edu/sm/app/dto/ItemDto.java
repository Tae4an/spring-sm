
package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ItemDto {
    private int itemId;
    private String itemName;
    private int itemPrice;
    private String imgName;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
}
