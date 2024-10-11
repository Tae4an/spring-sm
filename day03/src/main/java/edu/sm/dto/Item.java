
package edu.sm.dto;

import lombok.Builder;
import lombok.Data;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Data
@Builder
@RequestMapping()
public class Item {
    private int id;
    private String name;
    private int price;
    private String imgName;
    private Date regDate;
}
